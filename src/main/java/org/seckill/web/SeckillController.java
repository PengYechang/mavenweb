package org.seckill.web;

import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.dto.SeckillResult;
import org.seckill.entity.Page;
import org.seckill.entity.Seckill;
import org.seckill.enums.SeckillStateEnum;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillCloseException;
import org.seckill.service.SeckillService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/seckill")// url:/模块/资源/{id}/细分
public class SeckillController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SeckillService seckillService;

    @RequestMapping(value = "/list")
    public String list(String currentPage, String search,Model model) {
        Page page = new Page();
        Pattern pattern = Pattern.compile("[0-9]{1,9}");
        if(currentPage == null ||  !pattern.matcher(currentPage).matches()) {
            page.setCurrentPage(1);
        } else {
            page.setCurrentPage(Integer.valueOf(currentPage));
        }
        List<Seckill> list = seckillService.getSeckillListByFenye(search,page);
        model.addAttribute("list", list);
        model.addAttribute("page",page);
        model.addAttribute("search",search);
        return "list";///WEB-INF/jsp/list.jsp   (参考spring-web.xml)
    }

    //管理秒杀页
    @RequestMapping(value = "/manager")
    public String manager(@ModelAttribute("currentPage") String currentPage,
                          @ModelAttribute("seckillId") String seckillId,
                          @ModelAttribute("search") String search,Model model) {
        if(!seckillId.isEmpty()){
            seckillService.deleteById(Long.parseLong(seckillId));
        }
        list(currentPage,search,model);
        return "manager";
    }

    @RequestMapping(value = "/{seckillId}/detail", method = RequestMethod.GET)
    //也可以不写@PathVariable("seckillId") 默认识别出来
    //定义为Long 不是long
    public String detail(@PathVariable("seckillId") Long seckillId, Model model) {
        if (seckillId == null) {
            return "redirect:/seckill/list";
        }
        Seckill seckill = seckillService.getById(seckillId);
        if (seckill == null) {
            return "forward:/seckill/list";
        }
        model.addAttribute("seckill", seckill);
        return "detail";
    }

    //ajax json
    @RequestMapping(value = "/{seckillId}/exposer", method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public SeckillResult<Exposer> exposer(@PathVariable("seckillId") Long seckillId) {
        SeckillResult<Exposer> result;
        try {
            Exposer exposer = seckillService.exportSeckillUrl(seckillId);
            result = new SeckillResult<>(true, exposer);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            result = new SeckillResult<>(false, e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/{seckillId}/{md5}/execution", method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public SeckillResult<SeckillExecution> execute(@PathVariable("seckillId") Long seckillId,
                                                   @PathVariable("md5") String md5,
                                                   @CookieValue(value = "killPhone", required = false) Long phone) {
        if (phone == null) {
            return new SeckillResult<>(false, "未注册");
        }
        try {
            SeckillExecution execution = seckillService.executeSeckillProcedure(seckillId, phone, md5);
            return new SeckillResult<>(true, execution);
        } catch (SeckillCloseException e) {
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStateEnum.END);
            return new SeckillResult<>(true, execution);
        } catch (RepeatKillException e) {
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStateEnum.REPEAT_KILL);
            return new SeckillResult<>(true, execution);
        } catch (Exception e) {
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStateEnum.INNER_ERROR);
            return new SeckillResult<>(true, execution);
        }
    }

    @RequestMapping(value = "/time/now", method = RequestMethod.GET)
    @ResponseBody
    public SeckillResult<Long> time() {
        Date now = new Date();
        return new SeckillResult<>(true, now.getTime());
    }

    @RequestMapping(value = "/commitSeckill", method = RequestMethod.POST)
    @ResponseBody
    public void commitSeckill(String name,String number,String startTime,String endTime) throws Exception{
        Seckill seckill = new Seckill();
        seckill.setName(name);
        seckill.setNumber(Integer.parseInt(number));
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        seckill.setStartTime(format.parse(startTime));
        seckill.setEndTime(format.parse(endTime));
        seckillService.addOneSeckill(seckill);
    }
}
