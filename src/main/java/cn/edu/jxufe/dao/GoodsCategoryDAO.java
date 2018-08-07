package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.GoodsCategory;
import org.springframework.stereotype.Repository;

/**
 * GoodsCategoryDAO继承基类
 */
@Repository
public interface GoodsCategoryDAO extends MyBatisBaseDao<GoodsCategory, Integer> {
}