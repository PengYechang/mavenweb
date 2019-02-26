package org.seckill.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.exception.SeckillException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml"})
public class SeckillServiceTest {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SeckillService seckillService;

    @Test
    public void testGetSeckillList() {
        List<Seckill> list = seckillService.getSeckillList();
        logger.info("list={}", list);
    }

    @Test
    public void testGetById() {
        Seckill seckill = seckillService.getById(1000);
        logger.info("seckill={}", seckill);
    }

    @Test
    public void testSeckillLogic() {
        long id = 1000;
        long phone = 123456789;
        Exposer exposer = seckillService.exportSeckillUrl(id);
        if (exposer.isExposed()) {
            logger.info("exposer={}", exposer);
            try {
                SeckillExecution seckillExecution = seckillService.executeSeckill(id, phone, exposer.getMd5());
                logger.info("result={}", seckillExecution);
            } catch (SeckillException e) {
                logger.error(e.getMessage());
            }
        } else {
            logger.warn("exposer={}", exposer);
        }
    }

    @Test
    public void testGetSeckillListByFenye(){
        List<Seckill> list = seckillService.getSeckillListByFenye(1,8);
        System.out.println("hello");

    }

    @Test
    public void testAddOneSeckill(){
        Seckill seckill = new Seckill();
        seckill.setName("123");
        seckill.setNumber(12);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String startTime = "2018-12-09 12:12:12";
        String endTime = "2018-12-09 12:12:12";
        try {
            Date startDate = simpleDateFormat.parse(startTime);
            Date endDate = simpleDateFormat.parse(endTime);
            seckill.setStartTime(startDate);
            seckill.setEndTime(endDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        seckillService.addOneSeckill(seckill);
    }

}