package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.Goodsinfo;
import cn.edu.jxufe.entity.GouWuPing;
import cn.edu.jxufe.service.GoodsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 程 on 2018/8/10.
 */
@Controller
public class CartController {
    @Autowired
    GoodsInfoService goodsInfoService;

    @RequestMapping("putcart")
    @ResponseBody
    public Object putCart(int goodsid, HttpSession session) {
        try {
            Goodsinfo goodsinfo = goodsInfoService.findGoodsById(goodsid);
            GouWuPing g = new GouWuPing(goodsinfo, 1);
            //从session中查找用户的购物车对象，假设session中存在一个叫做cart的对象
            Map<Integer, GouWuPing> cart = (Map) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap();
            }
            //将商品放入购物车中
            GouWuPing goods = cart.get(goodsid);
            if (goods == null) {
                cart.put(goodsid, g);
            } else {
                goods.setCount(goods.getCount() + 1);
            }
            session.setAttribute("cart", cart);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping("toCart")
    public String toCart() {
        System.out.println("去购物车页面");
        return "cart";
    }

    @RequestMapping("updateCart")
    public Object updataCart(Integer goodsid, String flag, HttpSession session) {
        Map<Integer, GouWuPing> cart = (Map<Integer, GouWuPing>) session.getAttribute("cart");
        int totalcount = 0;
        int totalprice = 0;
        if (cart != null) {
            GouWuPing g = cart.get(goodsid);
            if (flag.equals("+")) {
                System.out.println("修改购物车中" + goodsid);
                g.setCount(g.getCount() + 1);
            } else if (flag.equals("-")) {
                System.out.println("修改购物车中" + goodsid);
                g.setCount(g.getCount() - 1);
            } else if (flag.equals("del")) {
                System.out.println("修改购物车中" + goodsid);
                cart.remove(goodsid);
            }
        }
        for (GouWuPing gc : cart.values()) {
            totalcount += gc.getCount();
            totalprice += gc.getGoodsinfo().getGoodsSellPrice() * gc.getCount();
        }
        Map map = new HashMap();
        map.put("totalcount", totalcount);
        map.put("totalprice", totalprice);
        return map;
    }

}
