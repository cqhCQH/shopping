package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.SearchinfoDAO;
import cn.edu.jxufe.entity.Searchinfo;
import cn.edu.jxufe.service.SearchServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.PublicKey;

/**
 * Created by 程 on 2018/8/15.
 */
@Service
public class SearchServerImpl implements SearchServer {
    @Autowired
    private SearchinfoDAO searchinfoDAO;

    @Override
    public Searchinfo findGoodsByKey(String key){
        return searchinfoDAO.findGoodsByKey(key);
    }

    @Override
    public int insert(Searchinfo searchinfo){
        return searchinfoDAO.insert(searchinfo);
    }
}
