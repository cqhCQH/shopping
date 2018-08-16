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
<title>购物车-合众饰品专卖</title>
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
<script>
$(document).ready(function(){
  //show or hide:delBtn
  $(".edit").toggle(function(){
	  $(this).parent().siblings("dd").find(".delBtn").fadeIn();
	  $(this).html("完成");
	  $(".numberWidget").show();
	  $(".priceArea").hide();
	  },function(){
	  $(this).parent().siblings("dd").find(".delBtn").fadeOut();
	  $(this).html("编辑");
	  $(".numberWidget").hide();
	  $(".priceArea").show();
		  });
  //minus
  $(".minus").click(function(){
	  var currNum=$(this).siblings(".number");
	  if(currNum.val()<=1){
		  $(this).parents("dd").remove();
		  nullTips();
       $.post("updateCart", {goodsid: $(this).attr("title"), flag: "del"}, function (data) {
        $(".cart_icon em").html(data.get("totalcount"));
        $("#price").html("总价格：￥"+data.get("totalprice"));
       });
		  }else {
       currNum.val(parseInt(currNum.val()) - 1);
       $.post("updateCart", {goodsid: $(this).attr("title"), flag: "-"}, function (data) {
           $(".cart_icon em").html(data.get("totalcount"));
           $("#price").html("总价格：￥"+data.get("totalprice"));
       });
      }
	  });
  //plus
  $(".plus").click(function(){
	  var currNum=$(this).siblings(".number");
	  currNum.val(parseInt(currNum.val())+1);
      $.post("updateCart", {goodsid: $(this).attr("title"), flag: "+"}, function (data) {
          $(".cart_icon em").html(data.get("totalcount"));
          $("#price").html("总价格：￥"+data.get("totalprice"));
     });
	  });
  //delBtn
  $(".delBtn").click(function(){
	  $(this).parent().remove();
	  nullTips();
   $.post("updateCart", {goodsid: $(this).attr("title"), flag: "del"}, function (data) {
    alert(data);
       $(".cart_icon em").html(data.get("totalcount"));
       $("#price").html("总价格：￥"+data.get("totalprice"));
   });
	  });
  //isNull->tips
  function nullTips(){
	  if($(".cart dd").length==0){
		  var tipsCont="<mark style='display:block;background:none;text-align:center;color:grey;'>购物车为空！</mark>"
		  $(".cart").remove();
		  $("body").append(tipsCont);
		  }
	  }
});
</script>
</head>
<body>
<!--header-->
<header>
 <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>
 <h1>购物车</h1>
</header>
<dl class="cart">
 <c:set var="count" value="0"></c:set>
 <c:set var="totalMoney" value="0"></c:set>
 <c:forEach items="${cart}" var="ca">
  <c:set var="count" value="${count+ca.value.count}"></c:set>
  <c:set var="totalMoney" value="${totalMoney+ca.value.count*ca.value.goodsinfo.goodsSellPrice}"></c:set>
 <dd>
  <a href="goodsinfo${ca.value.goodsinfo.goodsId}" class="goodsPic"><img src="${ca.value.goodsinfo.goodsImage}"/></a>
  <div class="goodsInfor">
   <h2>
    <a href="goodsinfo${ca.value.goodsinfo.goodsId}">${ca.value.goodsinfo.goodsName}</a>
  <%--  //<span>1</span>--%>
   </h2>
   <div class="priceArea">
    <strong>${ca.value.goodsinfo.goodsSellPrice}</strong>
    <del>${ca.value.goodsinfo.goodsPrice}</del>
   </div>
   <div class="numberWidget">
    <input type="button" value="-" class="minus" title="${ca.value.goodsinfo.goodsId}"/>
    <input type="text" value="${ca.value.count}" disabled  class="number"/>
    <input type="button" value="+"  class="plus" title="${ca.value.goodsinfo.goodsId}"/>
   </div>
  </div>
  <a class="delBtn" title="${ca.value.goodsinfo.goodsId}">删除</a>
 </dd>
 </c:forEach>
</dl>
<!--bottom nav-->
<div style="height:1rem;"></div>
<aside class="btmNav">
 <ul>
  <li><a class="cart_icon"><em>${count}</em></a></li>
  <li ><a id="price">${totalMoney}</a></li>
  <li><a href="confirm_order.jsp">立即下单</a></li>
 </ul>
</aside>
</body>
</html>
