<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="<%=basePath %>"/>
<title>分类列表-合众饰品专卖</title>
<meta name="keywords"  content="KEYWORDS..." />
<meta name="description" content="DESCRIPTION..." />
<meta name="author" content="HZIT" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name='apple-touch-fullscreen' content='yes'>
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<link rel="icon" href="../../images/icon/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon-precomposed" sizes="57x57" href="../../images/icon/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="120x120" href="../../images/icon/apple-touch-icon-120x120-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="196x196" href="../../images/icon/apple-touch-icon-196x196-precomposed.png">
<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script src="../../js/jquery.js"></script>
<script src="../../js/swiper.min.js"></script>
    <script>
        var orderbycloumnName;
        var categoryId;
        var currPage=1;
        $(document).ready(function() {
//默认获取第一个类别的类别ID
            categoryId = $(".curr_link").attr("title");
            orderbycloumnName='goods_sell_price';
            chaShangpin(categoryId, orderbycloumnName,true);

            $(".asc_icon").click(function () {

                $(this).toggleClass("des_icon");
                //去查商品
                //先获取拍序列
                orderbycloumnName = $(this).attr("title");
                console.log("class-->"+$(this).attr("class"));
                if($(this).attr("class").indexOf("des")!=-1){
                    orderbycloumnName=orderbycloumnName+" desc";
                }
                chaShangpin(categoryId, orderbycloumnName,true);
            });
            /* $(".drop_icon").click(function(){
             $(".drop_list").toggle();
             $(".drop_list li a").click(function(){
             $(this).parents(".drop_list").hide();
             });
             });*/
            var mySwiper = new Swiper('.swiper-container',{
                slidesPerView :5,
                slidesPerGroup :5
            })
        });


        //定义了一个方法实现动画效果
        function donghua(obj){
            obj=$(obj);  //将普通的对象转换成 jquery对象
            //修改购物车数量的显示
            $(".hoverCart a").html(parseInt($(".hoverCart a").html())+1);/*测试+1*/
            //拿到样式类别为hoverCart的坐标
            var shopOffset = $(".hoverCart").offset();
            //复制图片的元素
            var cloneDiv = obj.parent().siblings(".goodsPic").clone();
            //获取图片的坐标
            var proOffset = obj.parent().siblings(".goodsPic").offset();
            //设置这个图片初始样式
            cloneDiv.css({ "position": "absolute", "top": proOffset.top, "left": proOffset.left });
            //将图片追加到类别为goodsPic的父元素上面
            obj.parent().siblings(".goodsPic").parent().append(cloneDiv);
            //开始一个移动的动画效果
            cloneDiv.animate({
                width:0,
                height:0,
                left: shopOffset.left,
                top: shopOffset.top,
                opacity:1
            },"fast",function(){
                $(this).remove();
            });
            $.post("putcart",{goodsid: obj.attr("title")},function(data){
                if(data!="success"){
                    alert('添加失败');
                }
            })
        }

        function more(){
            currPage++;
            chaShangpin(categoryId,orderbycloumnName,false);
        }
    </script>



    <script>
        function initcategory(cid,orderCloumName,page,flag){
            currPage=page;
            chaShangpin(cid,orderCloumName,flag);
        }

        //JAVASCRIPT方法的定义
        function chaShangpin(cid,orderCloumName,flag){
            categoryId=cid;
            var url="goodsinfobycategory"+cid;
            $.post(url,{order:orderCloumName,page:currPage},function(data){
                if(flag){
                    $(".productList ul li:gt(0)").remove();
                }
                for(var i=0;i<data.length;i++){
                    var li=$("#moban"); //找到模版的LI标签
                    li.find("H2").html("<a href='goodsinfo"+data[i].goodsId+"'>"+data[i].goodsName+"</a>");
                    li.find("a").eq(0).attr("href","goodsinfo"+data[i].goodsId);
                    li.find("a").eq(0).find("img").attr("src",data[i].goodsImage);
                    li.find("p del").html(data[i].goodsPrice);
                    li.find("p strong").html(data[i].goodsSellPrice);
                    li.find(".addToCart").attr("onclick","donghua(this)");
                    li.find(".addToCart").attr("title",data[i].goodsId);
                    li.find("h3 strong").html("销量:"+data[i].salenumNum);
                    $(".productList ul").append("<li>"+li.html()+"</li>");
                }
            });
        }
    </script>
</head>
<body style="background:white;">
<!--header-->
<header>
 <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>
 <h1>分类列表</h1>
</header>
<!-- category Swiper -->
<div class="swiper-container category_list">
    <ul class="swiper-wrapper">
        <c:forEach items="${catelist}" var="bt" varStatus="vs">
            <c:choose>
                <c:when test="${vs.index}==0">
                    <li class="swiper-slide"><a class="curr_link" title="${bt.catId}" href="javascript:initcategory('${bt.catId}', 'goods_sell_price') ">${bt.catName}</a></li>
                </c:when>
                <c:otherwise>
                    <li class="swiper-slide"><a href="javascript:initcategory('${bt.catId}', 'goods_sell_price') ">${bt.catName}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
</div>
 <!--asc->1[升序asc_icon];des->0[降序des_icon]-->
 <ul class="sift_nav">
  <li><a class="des_icon">价格</a></li>
  <li><a class="des_icon">销量优先</a></li>
  <li>
   <a class="nav_li drop_icon">筛选项目</a>
   <ul class="drop_list">
    <li><a>自定义</a></li>
    <li><a>自定义</a></li>
    <li><a>自定义</a></li>
    <li><a>自定义</a></li>
   </ul>
  </li>
 </ul>
<!--productList-->
<section class="productList">
  <ul>

   <li id="moban" style="display: none">
    <a href="product.jsp" class="goodsPic">
     <img src="../../upload/1.webp.jpg"/>
    </a>
    <div class="goodsInfor">
     <h2>
      <a href="product.jsp"></a>
     </h2>
     <p>
      <del></del>
     </p>
     <p>
      <strong class="price"></strong>
     </p>
     <a class="addToCart">&#126;</a>
    </div>
   </li>
  </ul>
  <a class="more_btn">加载更多</a>
</section>
<!--floatCart-->
<div class="hoverCart">
 <a href="toCart">0</a>
</div>
<div style="height:1.2rem;"></div>
<nav>
    <a href="index" class="homeIcon">首页</a>
    <a href="category" class="categoryIcon">分类</a>
    <a href="toCart" class="cartIcon">购物车</a>
    <a href="user" class="userIcon">我的</a>
</nav>
</body>
</html>
