package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.Memberinfo;

import org.springframework.stereotype.Repository;

/**
 * MemberinfoDAO继承基类
 */
@Repository
public interface MemberinfoDAO extends MyBatisBaseDao<Memberinfo, Integer> {
    public Memberinfo selectMemberById(Memberinfo memberinfo);

    public void  zhuce(Memberinfo memberinfo);

    public void find_pwd(Memberinfo memberinfo);
    public Memberinfo find_pwd2(Memberinfo memberinfo);

    public void changeName(String name, String TEL);
    public String findUserIDByTel(String TEL);
   // public Memberinfo findUserByTel(String TEL);
}
