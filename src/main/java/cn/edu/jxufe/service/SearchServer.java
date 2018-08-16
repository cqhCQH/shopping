package cn.edu.jxufe.service;

import cn.edu.jxufe.entity.Searchinfo;

/**
 * Created by 程 on 2018/8/15.
 */
public interface SearchServer {
    Searchinfo findGoodsByKey(String key);
    int insert(Searchinfo searchinfo);
}
