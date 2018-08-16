package cn.edu.jxufe.service;

import cn.edu.jxufe.entity.Memberinfo;

/**
 * Created by King on 2018/8/12.
 */
public interface MemberinfoServer {
    Memberinfo denglu(Memberinfo memberinfo);

    void zhuce(Memberinfo memberinfo);

    void find_pwd(Memberinfo memberinfo);
    Memberinfo find_pwd2(Memberinfo memberinfo);

    void changeName(String name, String TEL);
    String findUserIDByTel(String tel);
    Memberinfo selectByPrimaryKey(int memberId);
 //   Memberinfo findUserByTel(String TEL);
}
