package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.Memberinfo;
import cn.edu.jxufe.service.MemberinfoServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by King on 2018/8/10.
 */
@Controller
public class MemberinfoController {

    String num;
String TEL;
    @Autowired
    MemberinfoServer memberinfoServer;
    Memberinfo mem=new Memberinfo();

//用户登录
    @RequestMapping("login1")
    @ResponseBody
    public String loginCheck(@RequestParam("tel") String tel,@RequestParam("pwd") String pwd,HttpSession session){
         Memberinfo a=new Memberinfo();
        a.setMemberMobile(tel);
         TEL=tel;
        a.setMemberPasswd(pwd);
        if( memberinfoServer.denglu(a)!=null){
            System.out.println("登陆成功");
            //Memberinfo memberinfo=memberinfoServer.findUserByTel(tel);
            String memberinfo=memberinfoServer.findUserIDByTel(tel);
            session.setAttribute("userName",memberinfo);
            session.setAttribute("password",pwd);
           // session.setAttribute("menber",memberinfo);
            return "{\"sign\":\"0\",\"msg\":\"登陆成功\"}";
        }
        else{
            System.out.println("登陆失败");
            return "{\"sign\":\"1\",\"msg\":\"登陆失败\"}";
        }

    }


    //用户注册
    @RequestMapping("check")
    public void checknum() {
        num = Integer.toString((int) (Math.random() * 1000000));
        System.out.println(num);
    }

    @RequestMapping("zhuce1")
    @ResponseBody
    public String zhuceCheck(@RequestParam("tel") String tel, @RequestParam("che") String a) {
        mem.setMemberMobile(tel);
        if (a.equals(num)) {
            memberinfoServer.zhuce(mem);
            System.out.println("注册成功");
            return "{\"sign\":\"0\",\"msg1\":\"注册成功\"}";
        } else {
            System.out.println("注册失败");
            return "{\"sign\":\"1\",\"msg1\":\"注册失败\"}";
        }
    }


    //找回密码
    @RequestMapping("findpwd")
    @ResponseBody
    public String findpwd(@RequestParam("tel") String tel, @RequestParam("pwd1") String pwd1,@RequestParam("pwd2") String pwd2, @RequestParam("che") String che) {
        mem.setMemberMobile(tel);
        mem.setMemberPasswd(pwd1);
        if (memberinfoServer.find_pwd2(mem)!=null &&che.equals(num) &&pwd1.equals(pwd2) &&pwd1!=null) {
            memberinfoServer.find_pwd(mem);
            System.out.println("修改成功");
            return "{\"sign\":\"0\",\"msg1\":\"修改成功\"}";
        } else {
            System.out.println("修改失败");
            return "{\"sign\":\"1\",\"msg1\":\"修改失败\"}";
        }
    }
//    //修改昵称
//    @RequestMapping("changeName")
//    @ResponseBody
//        public String changeName(@RequestParam("name") String name,@RequestParam("tel") String tel){
//        memberinfoServer.changeName(name,TEL);
//        System.out.println(TEL);
//        System.out.println(name);
//        return "{\"sign\":\"1\",\"msg\":\"修改成功\"}";
//    }

}
