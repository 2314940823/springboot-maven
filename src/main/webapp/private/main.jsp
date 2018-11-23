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
    
    <title>My JSP 'manage.jsp' starting page</title>
    
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
  </head>
  
  <body>
   <div class="wrap">
<!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="${pageContext.request.contextPath}/login.jsp" title="注销">注销</a></div>
  </div>
  
  
  <div class="forms">
  <form action="${pageContext.request.contextPath}/auction/selectByCont" method="post">
    <label for="name">名称</label>
    <input name="aname" type="text" class="nwinput" id="name"/>
    <label for="names">描述</label>
    <input name="desc" type="text" id="names" class="nwinput"/>
    <label for="time">开始时间</label>
    <input name="start_time" type="text" id="time" class="nwinput"/>
    <label for="time">结束时间</label>
    <input name="end_time" type="text" id="end-time" class="nwinput" />
    <label for="price">起拍价</label>
    <input name="startPrice" type="text" id="price" class="nwinput" />
    <input name="" type="submit"  value="查询" class="spbg buttombg f14  sale-buttom"/>
    </form>
    
   
    <c:if test="${sessionScope.user.admin==0}">
    
    </c:if>
    
  	<c:if test="${sessionScope.user.admin!=0}">
    		<form action="${pageContext.request.contextPath}/private/add.jsp" method="post">
    	<input type="submit"  value="发布" class="spbg buttombg f14  sale-buttom buttomb"/>
    </form>
    </c:if>
  
  </div>
  <div class="items">
      <ul class="rows even strong">
        <li>名称</li>
        <li class="list-wd">描述</li>
        <li>开始时间</li>
        <li>结束时间</li>
        <li>起拍价</li>
        <li class="borderno">操作</li>
      </ul>
    <c:forEach items="${aucList}" var="auction" varStatus="sta">
    	<c:if test="${sta.index%2==0}">
    			<ul class="rows">
					        <li><a href="国书" title="">${auction.aname }</a></li>
					        <li class="list-wd">${auction.desc }</li>
					        <li><fmt:formatDate value="${auction.start_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
					        <li><fmt:formatDate value="${auction.end_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
					        <li>${auction.startPrice}</li>
					        <li class="borderno red">
					        	<c:if test="${sessionScope.user.admin==0}">
					        		<a href="${pageContext.request.contextPath}/record/recordAll.do?aid=${auction.aid}">竞拍</a>
					        	</c:if>
					        	<c:if test="${sessionScope.user.admin!=0}">
					           		 <a href="javascript:void(0)" title="修改" onclick="dele(${auction.aid})">修改</a>|
					          		<a href="javascript:void(0)" title="删除" onclick="abc(${auction.aid});">删除</a>
					           </c:if>
							  
					        </li>
      				</ul>
    	</c:if>
    	
    	<c:if test="${sta.index%2!=0}">
    			<ul class="rows even">
					         <li><a href="国书" title="">${auction.aname }</a></li>
					        <li class="list-wd">${auction.desc }</li>
					        <li><fmt:formatDate value="${auction.start_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
					        <li><fmt:formatDate value="${auction.end_time}" pattern="yyyy-MM-dd hh:mm:ss" /></li>
					        <li>${auction.startPrice}</li>
					        <li class="borderno red">
					        	<c:if test="${sessionScope.user.admin==0}">
					        		<a href="${pageContext.request.contextPath}/record/recordAll.do?aid=${auction.aid}">竞拍</a>
					        	</c:if>
					        	<c:if test="${sessionScope.user.admin!=0}">
					           		 <a href="javascript:void(0)" title="修改" onclick="dele(${auction.aid})">修改</a>|
					          		<a href="javascript:void(0)" title="删除" onclick="abc(${auction.aid});">删除</a>
					           </c:if>
							  
					        </li>
				      </ul>
    	</c:if>
    		
    </c:forEach>
      
      
     
      <div class="page">
        <a href="#" title="">首页</a>
        <a href="#" title="">上一页</a>
        <span class="red">前5页</span>
        <a href="#" title="">1</a> 
        <a href="#" title="">2</a> 
        <a href="#" title="">3</a> 
        <a href="#" title="">4</a>
        <a href="#" title="">5</a> 
        <a href="#" title="">下一页</a>
        <a href="#" title="">尾页</a> 
      </div>
  </div>
  <script type="text/javascript">
   function abc(id){
	   alert(id);
	   if(confirm("你真的确认要删除吗？请确认")){
	    
		   location='${pageContext.request.contextPath}/auction/delete?id='+id;
		 }
		 else{
			 return false;
			 }
			 
	   };
	   function dele(id){
		   alert(id);
		   if(confirm("你真的确认要修改吗？请确认")){
			   location='${pageContext.request.contextPath}/auction/selectOne?id='+id;
			   }
			   else{
				   return false;
				   }
		   }
  </script>
<!-- main end-->
</div>
  </body>
</html>
