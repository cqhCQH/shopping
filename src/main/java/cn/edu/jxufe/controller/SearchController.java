package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.Goodsinfo;
import cn.edu.jxufe.entity.Memberinfo;
import cn.edu.jxufe.entity.Searchinfo;
import cn.edu.jxufe.service.GoodsInfoService;
import cn.edu.jxufe.service.SearchServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by 程 on 2018/8/15.
 */
@Controller
public class SearchController {
    @Autowired
    private SearchServer searchServer;
    @Autowired
    private GoodsInfoService goodsInfoService;

    @ResponseBody
    @RequestMapping("searchinfo")
    public String insertSearch(@RequestBody Searchinfo searchinfo,ModelMap modelMap){
        searchServer.insert(searchinfo);
        return "search";
}
    @ResponseBody
    @RequestMapping("searchShow")
    public List<Goodsinfo> goodsSearch(@PathVariable("searchtxt") String searchtxt,ModelMap modelMap){
        return goodsInfoService.findAllGoodsByKey(searchtxt);
    }
}
