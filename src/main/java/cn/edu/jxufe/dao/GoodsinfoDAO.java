package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.Goodsinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * GoodsinfoDAO继承基类
 */
@Repository
public interface GoodsinfoDAO extends MyBatisBaseDao<Goodsinfo, Integer> {
   public List<Goodsinfo> findAll();
}