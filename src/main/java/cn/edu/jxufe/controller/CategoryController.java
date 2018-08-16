package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.GoodsCategory;
import cn.edu.jxufe.service.CategoryService;
import cn.edu.jxufe.service.GoodsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by 程 on 2018/8/15.
 */
@Controller
public class CategoryController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    GoodsInfoService goodsInfoService;
    @RequestMapping("goodsinfobycategory{cid}")
    @ResponseBody
    public  Object getGoodsByCategory(@PathVariable("cid")int cid){
        return goodsInfoService.findByCategory(cid);
    }
    @RequestMapping("category")
    public String toCategory(ModelMap modelMap){
        List<GoodsCategory> list=categoryService.findAllCategory();
        modelMap.put("catelist",list);
        return "category";
    }
}
