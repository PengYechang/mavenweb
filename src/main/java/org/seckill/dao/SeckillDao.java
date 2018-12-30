package org.seckill.dao;

import org.apache.ibatis.annotations.Param;
import org.seckill.entity.Seckill;

import java.util.Date;
import java.util.List;

public interface SeckillDao {

    /**
     * 减库存
     *
     * @param seckillId
     * @param killTime  减库存的时间
     * @return 更新记录的行数 如果是0则没有成功
     */
    int reduceNumber(@Param("seckillId") long seckillId, @Param("killTime") Date killTime);

    /**
     * 查询通过ID
     *
     * @param seckillId
     * @return
     */
    Seckill queryById(long seckillId);

    /**
     * 查询所有通过偏移量
     * @param offset 偏移量
     * @param limit 限制数
     * @return
     */
    List<Seckill> queryAll(@Param("offset") int offset, @Param("limit") int limit);

    /**
     * 删除一行数据
     * @param seckillId
     */
    void deleteById(long seckillId);

    /**
     * 查询记录了多少条数据
     * @return int
     */
    int findAllCount();

}
