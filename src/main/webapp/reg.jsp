<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'res.jsp' starting page</title>

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

        /* ··········表单验证·········· */

        function checkForm(){
            var v = $("#rem_u").prop("checked");
            /* alert(v);
            alert(checkCode());
            alert(checkTel());
            alert(checkCard());
            alert(checkPaw());
            alert(checkName()); */
            if(v&&checkCode()&&checkTel()&&checkCard()&&checkPaw()&&checkName()){
                return true;
            }else{
                return false;
            }
        }

        function checkName(){

            if($("[name=uname]").val()!=''&&$("[name=uname]").val().length>=6){
                $("#s1").html("");
                return true;
            }else{
                $("#s1").html("用户名要求不低于6个字符");
                return false;
            }
        }

        function checkPaw(){
            if($("[name=password]").val().length>=6){
                $("#s2").html("");
                return true;
            }else{
                $("#s2").html("密码要求不低于6个字符");
                return false;
            }
        }

        function checkCard(){
            if($("[name=card]").val()!=''){
                $("#s3").html("");
                return true;
            }else{
                $("#s3").html("身份证号必填");
                return false;
            }
        }

        function checkTel(){
            if($("[name=tel]").val()!=''){
                $("#s4").html("");
                return true;
            }else{
                $("#s4").html("电话号码必填");
                return false;
            }
        }

        function checkCode(){
            if($("[name=code]").val()!=''){
                $("#s5").html("");
                return true;
            }else{
                $("#s5").html("验证码不能为空");
                return false;
            }
        }


    </script>
</head>

<body>
<div class="wrap">
    <!-- main begin-->

    <div class="zclf login logns">
        <form action="${pageContext.request.contextPath}/reg.do" method="post" onsubmit="return checkForm()">
            <h1  class="blue">用户注册</h1>
            <dl>
                <dd>
                    <label> <small>*</small>用户名</label>
                    <input type="text" class="inputh lf" value="" name="uname" onblur="checkName()" />
                    <div class="lf red laba" id="s1"></div>
                </dd>
                <dd>
                    <label> <small>*</small>密码</label>
                    <input type="password" class="inputh lf" value="" name="password" onblur="checkPaw()"/>
                    <div class="lf red laba" id="s2"></div>
                </dd>
                <dd>
                    <label> <small>*</small>身份证号</label>
                    <input type="text" class="inputh lf" value="" name="card" onblur="checkCard()"/>
                    <div class="lf red laba" id="s3"></div>
                </dd>
                <dd>
                    <label> <small>*</small>电话</label>
                    <input type="text" class="inputh lf" value="" name="tel" onblur="checkTel()"/>
                    <div class="lf red laba" id="s4"></div>
                </dd>
                <dd>
                    <label> <small>*</small>住址</label>
                    <input type="text" class="inputh lf" value="" name="address"/>
                </dd>
                <dd>
                    <label> <small>*</small>邮政编码</label>
                    <input type="text" class="inputh lf" value="" name="postNumber"/>
                </dd>
                <dd class="hegas">
                    <label> <small>*</small>验证码</label>
                    <input type="text" class="inputh inputs lf" value="" name="code" onblur="checkCode()"/>
                    <span class="wordp lf"><img src="${pageContext.request.contextPath}/code.do" id="imgVcode" width="96" height="27" alt="" /></span>
                    <span class="blues lf"><a href="javascript:void(0)" title="" onclick="test()">看不清</a></span>
                    <div class="lf red laba" id="s5"></div>
                </dd>
                <dd class="hegas">
                    <label>&nbsp;</label>
                    <input name=""  type="checkbox" id="rem_u"  />
                    <label for="rem_u" class="labels">我同意<span class="blues">《服务条款》</span></label>
                </dd>
                <dd class="hegas">
                    <label>&nbsp;</label>
                    <input name="" type="submit" value="立即注册" class="spbg buttombg buttombgs f14 lf" />
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
