package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.Admin;
import cn.edu.jxufe.entity.GoodsComment;
import cn.edu.jxufe.entity.Memberinfo;
import cn.edu.jxufe.service.GoodsCommentService;
import cn.edu.jxufe.service.MemberinfoServer;
import cn.edu.jxufe.service.impl.MemberinfoServerimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by 程 on 2018/8/7.
 */
@Controller
public class CommentController {
    @Autowired
    private GoodsCommentService goodsCommentService;
    @ResponseBody
    @RequestMapping("comment_list/{gid}")
    public List<GoodsComment> listCommand(@PathVariable("gid")int gid){
        return goodsCommentService.findByGoodsId(gid);
    }
    @RequestMapping("commentTest")
    @ResponseBody
    public String putComment(@RequestBody GoodsComment goodsComment,ModelMap modelMap){
        goodsCommentService.insertComment(goodsComment);
        List<GoodsComment> goodsComments=goodsCommentService.findByGoodsId(goodsComment.getGoodisId());
        modelMap.put("comment",goodsComments);
        return "comment";
    }

    @RequestMapping("commentinfo{gid}")
    public String toComment(@PathVariable("gid")int goodid,ModelMap map,HttpSession session){
        List<GoodsComment> goodsComment=goodsCommentService.findByGoodsId(goodid);
        Object userName=session.getAttribute("userName");
        Object pwd=session.getAttribute("password");
        session.getAttribute("password");
        map.put("comments",goodsComment);
        map.put("gid",goodid);
        map.put("userName",userName);
        map.put("pwd",pwd);
        return "comment";
    }
}
