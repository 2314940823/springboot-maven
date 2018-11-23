<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
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
  	
  	function checkFor(){
  		return checkPrice();
  	}
  	
  	function checkPrice(){
  		
  		var price = parseFloat($("#sale").val());
  		var highPrice = $("[class=highPrice]:first").html();
  		var dijia = $("#dijia").html();
		if(highPrice){
			if(price>parseFloat(highPrice)){
	  			$("#ttt").html("当前您的出价最高！！！");
	  			return true;
	  		}else{
	  			$("#ttt").html("不能低于最高竞拍价！！！");
	  			return false;
	  		}
  		}else if(price>parseFloat(dijia)){
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
  <div class="items sg-font lf">
      <ul class="rows">
        <li>名称：</li>
        <li class="borderno">${auction.aname}</li>
      </ul>
      <ul class="rows">
        <li>描述：</li>
        <li class="borderno">${auction.desc}</li>
      </ul>
      <ul class="rows">
        <li>开始时间：</li>
        <li><fmt:formatDate value="${auction.start_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
					        
      </ul>
      <ul class="rows">
        <li>结束时间：</li>
        <li class="borderno"><li><fmt:formatDate value="${auction.end_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
      </ul>
      <ul class="rows border-no">
        <li>起拍价：</li>
        <li class="borderno" id="dijia">${auction.startPrice}</li>
      </ul>
  </div>
  <div class="rg borders"><img src="images/${auction.img}" width="270" height="185" alt="" /></div>
  <div class="cl"></div>
  
  
 
  
  <div class="top10 salebd">
   <form action="${pageContext.request.contextPath}/record/auction.do" method="post" onsubmit="return checkFor()">
       <p>
       <input type="hidden" name="aid" value="${auction.aid}"/>
       <label for="sale">出价：</label>
       <input type="text" onblur="checkPrice()" class="inputwd" id="sale" value="" name="aucPrice"/>
       <input name="" type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom"/>
       </p>
       <p class="f14 red" id="ttt">不能低于最高竞拍价</p>
  </form>
  </div>
 
  
  <div class="top10">
    <input name="" type="submit" value="刷 新" class="spbg buttombg f14" />
    <input name="" type="submit" value="返回列表" class="spbg buttombg f14" />
  </div>
  <div class="offer">
     <h3>出价记录</h3>
    <div class="items sg-font">
      <ul class="rows even strong">
        <li>竞拍时间</li>
        <li>竞拍价格</li>
        <li class="borderno">竞拍人</li>
      </ul>
    <div class="items sg-font">
    
    <c:forEach items="${requestScope.recList}" var="sta" varStatus="vs">
		<c:if test="${vs.index%2 == 0}">
			<ul class="rows even strong">
			
				<li><fmt:formatDate value="${sta.aucTime}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
		        <li class="highPrice">${sta.aucPrice}</li>
		        <li class="borderno">${sta.uname}</li>
			</ul>
		        
		     
		</c:if>
		
		<c:if test="${vs.index%2 != 0}">
			<ul class="rows">
				<li><fmt:formatDate value="${sta.aucTime}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
		        <li>${sta.aucPrice}</li>
		        <li class="borderno">${sta.uname}</li>
		     </ul>
		</c:if>    
    </c:forEach>
    	
      
      
      
   </div>
  </div>
<!-- main end-->
</div>
  </body>
</html>
