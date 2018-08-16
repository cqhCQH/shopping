package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.MemberinfoDAO;
import cn.edu.jxufe.entity.Memberinfo;
import cn.edu.jxufe.service.MemberinfoServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.event.TreeExpansionListener;

/**
 * Created by King on 2018/8/12.
 */
@Service
public class MemberinfoServerimpl implements MemberinfoServer{
    @Autowired
    MemberinfoDAO memberinfoDAO;
    @Override
    public Memberinfo denglu(Memberinfo memberinfo) {
        return memberinfoDAO.selectMemberById(memberinfo);}

    @Override
    public void zhuce(Memberinfo memberinfo) {
        memberinfoDAO.zhuce(memberinfo);}

    @Override
    public void find_pwd(Memberinfo memberinfo) {
        memberinfoDAO.find_pwd(memberinfo);}

    @Override
    public Memberinfo find_pwd2(Memberinfo memberinfo) {
        return memberinfoDAO.find_pwd2(memberinfo);
    }

    @Override
    public void changeName(String name,String TEL) {
     memberinfoDAO.changeName(name,TEL);
    }

    @Override
    public String findUserIDByTel(String tel){
        return memberinfoDAO.findUserIDByTel(tel);
     }

    @Override
    public Memberinfo selectByPrimaryKey(int memberId){
        return memberinfoDAO.selectByPrimaryKey(memberId);
    }
   /* @Override
    public Memberinfo findUserByTel(String TEL){
        return memberinfoDAO.findUserByTel(TEL);
    }*/
}
