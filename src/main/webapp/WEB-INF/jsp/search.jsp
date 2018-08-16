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
<title>搜索-合众饰品专卖</title>
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
  $(".searchHistory dd:last a").click(function(){
	  var clear=confirm("确定清除搜索记录吗?");
	  if(clear==true){
		  $(this).parents(".searchHistory").find("dd").remove();
		  }
	  });	
});

    function searchGoods(){
        var searchTxt=document.getElementById('searchText').value;
        url="searchinfo";
        $.ajax({
            type:"post",
            url:url,
            contentType:"application/json",
            data:JSON.stringify({"sId":5,"searchKey":searchTxt,"memberId":1}),
            success:function(){
                console.log('查询成功');
                viewGoods(searchTxt);
            },
            error:function(){
                console.log('查询失败');
            }
        }
)
    }

    function viewGoods(searchtxt){
        url="searchShow";
        var li=$("#view_goods");
        $.post(url,{"searchtxt":searchtxt},function(data){
            for(var i=0;i<data.length;i++){
                 li.find("a").eq(0).attr("href","goodsinfo"+data[i].goodsId);
                 li.find("a").eq(0).find("img").attr("src",data[i].goodsImage);
                 li.find("h2").find("a").attr("href","goodsinfo"+data[i].goodsId);
                 li.find("p;eq(0) del").html(data[i].goodsPrice);
                 li.find("p:eq(1) strong").html(data[i].goodsSellPrice)
                 li.find(".addTocart").attr("title",data[i].goodsId);
                 li.find("aside").find(".like_icon").html(data[i].thumbsUpNum);
                 li.find("aside").find(".comment_icon").html(data[i].commentNum);
                 li.find("aside").find(".deal_icon").html(data[i].goodsCollectNum);
                 $(".goods_cont ul").append("<li>"+li.html()+"</li>");
            }
                }
        )
    }
</script>
</head>
<body>
<!--header-->
<header>
 <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>
 <h1>搜索</h1>
</header>
<aside class="searchArea">
 <input type="text" placeholder="查找玻璃品..." id="searchText"/>
 <input type="button" value="&#63;" class="searchBtn" onclick="javascript:searchGoods()"/>
</aside>
<dl class="searchHistory">
 <dt>历史搜索</dt>
 <dd>
  <ul>
   <li><a href="category.jsp">骷髅头</a></li>
   <li><a href="category.jsp">天鹅</a></li>
   <li><a href="category.jsp">玻璃工艺品</a></li>
   <li><a href="category.jsp">玻璃球</a></li>
  </ul>
 </dd>
 <dd>
  <a>清空历史记录</a>
 </dd>
</dl>
<dd class="goods_cont">
    <ul id="model" style="display: none">

        <li id="view_goods">
                <div class="search_goods">
                    <a href="" class="goodsPic">
                        <img src=""/>
                    </a>
                    <div class="">
                        <h2>
                            <a href=""></a>
                        </h2>
                        <p>
                            <del></del>
                        </p>
                        <p>
                            <strong class="price"></strong>
                        </p>
                        <a class="addToCart" title="">&#126;</a>
                    </div>
                </div>
                <aside>
                    <a class="like_icon">0</a>
                    <a class="comment_icon">0</a>
                    <a class="deal_icon">0</a>
                </aside>
            </li>
    </ul>
</dd>
</body>
</html>
