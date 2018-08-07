package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.Advertisement;
import org.springframework.stereotype.Repository;

/**
 * AdvertisementDAO继承基类
 */
@Repository
public interface AdvertisementDAO extends MyBatisBaseDao<Advertisement, Integer> {
}