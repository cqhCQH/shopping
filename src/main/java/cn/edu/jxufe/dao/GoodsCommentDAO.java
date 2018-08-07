package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.GoodsComment;
import org.springframework.stereotype.Repository;

/**
 * GoodsCommentDAO继承基类
 */
@Repository
public interface GoodsCommentDAO extends MyBatisBaseDao<GoodsComment, Integer> {
}