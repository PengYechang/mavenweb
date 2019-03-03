package org.seckill.dao;

import org.apache.ibatis.annotations.Param;
import org.seckill.entity.Page;
import org.seckill.entity.Seckill;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface SeckillDao {

    /**
     * 减库存
     *
     * @param seckillId 秒杀ID
     * @param killTime  减库存的时间
     * @return 更新记录的行数 如果是0则没有成功
     */
    int reduceNumber(@Param("seckillId") long seckillId, @Param("killTime") Date killTime);

    /**
     * 查询通过ID
     *
     * @param seckillId
     * @return Seckill
     */
    Seckill queryById(long seckillId);

    /**
     * 查询所有通过偏移量
     * @param map key:名称 value:页面
     * @return 返回秒杀列表
     */
    List<Seckill> queryAll(Map<String,Object> map);

    /**
     * 查询所有通过偏移量
     * @param map key:名称 value:页面
     * @return 返回秒杀列表
     */
    List<Seckill> queryAllByPage(Map<String,Object> map);

    /**
     * 删除一行数据
     * @param seckillId
     */
    void deleteById(long seckillId);


    /**
     * 增加一条数据
     * @param seckill 秒杀
     */
    void addOneSeckill(@Param("seckill")Seckill seckill);

    /**
     * 使用存储过程执行秒杀
     * @param map
     */
    void killByProcedure(Map<String,Object> map);
}
