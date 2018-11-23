<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
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
        function test(){
            $("#imgVcode").prop("src","${pageContext.request.contextPath}/code.do?id="+Math.random());
        }

        function reg(){
            location='${pageContext.request.contextPath}/reg.jsp';
        }

        /*··········· 表单验证··········· */

        function checkName(){

            if($("#name").val()!=null&&$("#name").val()!=''){
                $("#span1").html("");
                return true;
            }else{
                $("#span1").html("内容不能为空！！！");
                return false;
            }
        }

        function checkPaw(){
            if($("#password").val().length>=6){
                $("#span2").html("");
                return true;
            }else{
                $("#span2").html("密码长度不够！！！");
                return false;
            }
        }

        function checkCode(){
            if($("#passwords").val()!=''){
                $("#span3").html("");
                return true;
            }else{
                $("#span3").html("验证码不能为空！！！");
                return false;
            }
        }

        function checkForm(){
            if(checkName()&&checkPaw()&&checkCode()){
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
    <div class="main">
        <div class="sidebar">
            <p><img src="images/img1.jpg" width="443" height="314" alt="" /></p>
        </div>
        <div class="sidebarg">

            <div class="login">
                <form action="${pageContext.request.contextPath}/login" method="post" onsubmit="return checkForm()">

                    <dl>

                        <dt class="blues">用户登陆</dt>
                        <dd><label for="name">用户名：</label><input type="text" name="aname" class="inputh" value="" id="name" onblur="checkName()"/><span id="span1"></span></dd>
                        <dd><label for="password">密 码：</label><input type="password" name="password" class="inputh" value="" id="password" onblur="checkPaw()"/><span id="span2"></span></dd>
                        <dd>
                            <label class="lf" for="passwords">验证码：</label>
                            <input type="text" name="code" class="inputh inputs lf" value="" id="passwords" onblur="checkCode()"/>
                            <span class="wordp lf"><img src="${pageContext.request.contextPath}/code.do" id="imgVcode" width="96" height="27" alt="" /></span>
                            <span class="blues lf"><a href="javascript:void(0)" onclick="test()" title="">看不清</a></span>
                            <span id="span3"></span>
                        </dd>
                        <dd>
                            <input name=""  type="checkbox" id="rem_u"  />
                            <span for="rem_u">下次自动登录</span>
                        </dd>
                        <dd class="buttom">
                            <input name="" type="submit" value="登 录" class="spbg buttombg f14 lf" />
                            <input name="" type="button" value="注 册" class="spbg buttombg f14 lf" onclick="reg()"/>
                            <span class="blues  lf"><a href="" title="">忘记密码?</a></span>
                            <div class="cl"></div>
                        </dd>

                    </dl>
                </form>
            </div>

        </div>
        <div class="cl"></div>
    </div>
    <!-- main end-->

    <!-- footer begin-->
</div>
<!--footer end-->

</div>
</body>
</html>

