package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.Goodsinfo;
import cn.edu.jxufe.service.GoodsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 程 on 2018/8/7.
 */
@Controller
public class GoodsController {
    @Autowired
    private GoodsInfoService goodsInfoService;
    @RequestMapping("test")
    @ResponseBody
    public Object test(){
        return  goodsInfoService.findAll();
    }

}
