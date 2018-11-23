<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/common.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.11.1.js"></script>

    <script type="text/javascript">

        $(function(){
            $("#upload_image").change(function(event) {
                //  HTML5 js 对象的获取
                var files = event.target.files, file;
                if(files && files.length > 0){
                    // 获取目前上传的文件
                    file = files[0];
                    // 文件的限定类型什么的道理是一样的
                    if(file.size > 1024 * 1024 * 2) {
                        alert('图片大小不能超过 2MB!');
                        return false;
                    }
                    // file对象生成可用的图片
                    var URL = window.URL || window.webkitURL;
                    // 通过 file 生成目标 url
                    var imgURL = URL.createObjectURL(file);
                    // 用这个 URL 产生一个 <img> 将其显示出来
                    $("#img").attr('src', imgURL);
                }
            });
        });

        /*·········· 表单验证············ */

        function checkName(){

            if($("[name=aname]").val()!=''&&$("[name=aname]").val().length>=6){
                $("#s1").html("");
                return true;
            }else{
                $("#s1").html("名称要求不低于6个字符");
                return false;
            }
        }


        function checkPrice(){
            var startPrice = $("[name=startPrice]").val();
            var reg = /^\d{1,10}$/;
            if(reg.test(startPrice)){
                $("#s2").html("");
                return true;
            }else{
                $("#s2").html("必须为数字");
                return false;
            }
        }

        function checkUpset(){
            var upsetPrice = $("[name=upset]").val();
            var reg = /^\d{1,10}$/;
            if(reg.test(upsetPrice)){
                $("#s3").html("");
                return true;
            }else{
                $("#s3").html("必须为数字");
                return false;
            }
        }

        function checkImg(){
            if($("[name=auction_img]").val()!=''){
                $("#s4").html("");
                return true;
            }else{
                $("#s4").html("图片不能为空");
                return false;
            }
        }

        function checkDesc(){
            if($("[name=desc]").val()!=''){
                $("#s5").html("");
                return true;
            }else{
                $("#s5").html("描述不能为空");
                return false;
            }
        }

        function checkForm(){
            if(checkName()&&checkPrice()&&checkUpset()&&checkImg()&&checkDesc()){
                return true;
            }else{
                return false;
            }
        }

    </script>
	
  </head>
  
  <body>
    <div class="wrap">
  <!-- main begin-->
  
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="#" title="注销">注销</a></div>
  </div>
      <div class="login logns produce">
      <form action="${pageContext.request.contextPath}/auction/update" method="post" onsubmit="return checkForm()" enctype="multipart/form-data">
        <h1 class="blues">拍卖品信息</h1>
          <dl>
            <dd >
              <label>名称：</label>
              <input type="hidden" name="aid" value="${auction.aid }"/>
              <input type="text" name="aname" class="inputh lf" value="${auction.aname}" onblur="checkName()"/>
              <div class="xzkbg spbg lf" id="s1"></div>
            </dd>
            <dd>
              <label>起拍价：</label>
              <input type="text" class="inputh lf" onblur="checkPrice()" name="startPrice" value="${auction.startPrice }" />
              <div class="lf red laba" id="s2"></div>
            </dd>
            <dd>
              <label>底价：</label>
              <input type="text" class="inputh lf" onblur="checkUpset()" name="upset" value="${auction.upset}" />
              <div class="lf red laba" id="s3"></div>
            </dd>
            <dd>
              <label>开始时间：</label>													
              <input type="text" name="start_time" class="inputh lf" value="<fmt:formatDate value="${auction.start_time}" pattern="yyyy-MM-dd hh:mm:ss" />" />
              <div class="lf red laba">格式：2011-05-05 12:30:00</div>
            </dd>
            <dd>
              <label>结束时间：</label>
              <input type="text" name="end_time" class="inputh lf" value="<fmt:formatDate value="${auction.end_time}" pattern="yyyy-MM-dd hh:mm:ss" />" />
              <div class="lf red laba">格式：2011-05-05 12:30:00</div>
            </dd>
            <dd class="dds">
              <label>描述：</label>
              <textarea name="desc" cols="" rows="" onblur="checkDesc()" class="textarea">${auction.desc}</textarea>
           		 <div class="lf red laba" id="s5"></div>
            </dd>
            <dd>
              <label>修改图片：</label>
               <input type="hidden" name="img" value="${auction.img}"/>
              <div class="lf salebd"><img src="${pageContext.request.contextPath}/images/${auction.img}" width="100" height="100" id="img"/></div>
               <input name="auction_img" type="file" class="marg10" id="upload_image" onchange="checkImg()"/>
               <div class="lf red laba" id="s4"></div>
            </dd>
            <dd class="hegas">
                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs f14 lf buttomb" />
                <input name="" type="reset" value="取 消" class="spbg buttombg buttombgs f14 lf buttomb" />
                
            </dd>
          </dl>
            </form>
    </div>
  
<!-- main end-->
<!-- footer begin-->

</div>
 <!--footer end-->
 
</div>
  </body>
</html>
