package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.GoodsinfoDAO;
import cn.edu.jxufe.entity.Goodsinfo;
import cn.edu.jxufe.service.GoodsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 程 on 2018/8/7.
 */
@Service
public class GoodsInfoServiceImpl implements GoodsInfoService{
    @Autowired
    private GoodsinfoDAO goodsinfoDAO;
    @Override
    public List<Goodsinfo> findAll(){
        return  goodsinfoDAO.findAll();
    }
}
