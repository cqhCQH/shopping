package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.Goodsinfo;
import cn.edu.jxufe.entity.Memberinfo;
import cn.edu.jxufe.service.GoodsInfoService;
import cn.edu.jxufe.service.MemberinfoServer;
import cn.edu.jxufe.service.impl.MemberinfoServerimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * Created by 程 on 2018/8/7.
 */
@Controller
public class GoodsController {
    @Autowired
    private GoodsInfoService goodsInfoService;
    @Autowired
    private MemberinfoServer memberinfoServer;
    @RequestMapping("goodsinfo{gid}")
    public String toGoods(@PathVariable("gid")int goodid,ModelMap map){
        Goodsinfo goodsinfo=goodsInfoService.findGoodsById(goodid);
        System.out.println(goodsinfo.getMemberId());
        Memberinfo memberinfo=memberinfoServer.selectByPrimaryKey(goodsinfo.getMemberId());
        map.put("g",goodsinfo);
        map.put("u",memberinfo.getMemberName());
        return "product";
    }

    @RequestMapping("get")
    @ResponseBody
    public Object getColum(HttpSession httpSession){

        return httpSession.getAttribute("cart");
    }

    @RequestMapping("login")
    public String login(){
        return "login";
    }
    @RequestMapping("upload_file")
    public String uploadfile(){
        return "upload_file";
    }

    @RequestMapping("search")
    public String register(){
        return "search";
    }
}
