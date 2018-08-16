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
<title>点评-合众饰品专卖</title>
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
     $(document).ready(
         shuaxin(${gid})
     )
   function submit() {
    var context=document.getElementById('context').value;
    var url="commentTest";
       if(context!=""){
           alert("评论成功！^-^")
    $.ajax({
     type:"post",
     url:url,
     contentType:"application/json",
     data:JSON.stringify({"goodisId":"${gid}","scommContent":context,"scommMembername":"${userName}"}),
     success:function(){
             shuaxin(${gid});
     },
     error:function(){
      console.log('提交失败')
     }
    }
    );
       }else{
       alert("评论为空，请重新输入！");
           shuaxin(${gid});
       }
    };

  function shuaxin(gidd){
   url="comment_list/"+gidd;
   $.post(url,function(data){
               $(".comment_cont ul li:gt(0)").remove();
            var li=$("#model");
            for(var i=0;i<data.length;i++){
            li.find("span").eq(0).find("img").attr("src",data[i].scommMemberavatar);
            li.find("span:eq(1) em").html(" "+data[i].scommMembername);
            li.find("span:eq(1) time").html(data[i].scommTime);
            li.find(".comment_cont_txt").html(data[i].scommContent);
            $(".comment_cont ul").append("<li>"+li.html()+"</li>");
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
 <h1>点评</h1>
</header>
<div class="comment_input">
 <textarea placeholder="输入评论内容..." id="context"></textarea>
 <input type="button" value="评论" id="submit" onclick="javascript:submit()"/>
</div>
<div class="comment_cont">
 <ul>
  <li id="model" style="display: none">
   <div class="user_infor">
    <span class="user_pic"><img src=""/></span>
    <span class="rt_infor">
     <em>&nbsp;</em>
     <time>1111111</time>
    </span>
   </div>
   <div class="comment_cont_txt"></div>
  </li>
 </ul>
</div>
</body>
</html>
