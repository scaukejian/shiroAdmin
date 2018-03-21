<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<%
	//当type参数不为空时，为活动分享页面 ，否则则为邀请分享页面
    String id = "";
    String inviteType = "";
    String functionType="";
    id = request.getParameter("id");
    inviteType=request.getParameter("type");
    //type参数不为空设置邀请功能类型为活动
    if(StringUtils.isNotBlank(inviteType)){
    	functionType="activity";
    }
    //type不为空时 为活动分享 为空是为邀请注册分享
    if (StringUtils.isNotBlank(id)&&StringUtils.isBlank(functionType)) {
        inviteType = id.substring(id.length() - 1);
        id = id.substring(0, id.length() - 1);
    }
    
    String path=request.getContextPath();
%>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">
<link rel="shortcut icon" href="favicon.png" type="image/x-icon">
<link rel="Bookmark" href="favicon.png" type="image/x-icon">
<title>易约精英—中国精英轻奢生活社交圈</title>
<style>
	body{ padding:0; margin: 0; }
	div{ position:relative;}
	.background_image{ width:100%; }
	.content{
		background-image:url(images/white-back.jpg) ;
		background-repeat:repeat;
		width:90%;margin-left:5%; margin-top:-20%; 
		background-color:#ffffff; padding-bottom:10%;
		border-top-left-radius:0.4em;
		border-top-right-radius:0.4em;
		border-bottom-right-radius:0.4em;
		border-bottom-left-radius:0.4em;}
	input{ 
		margin-left:10%; 
		border-radius: 5px;
		border:1px solid #868686;
		padding-left:5%;
		letter-spacing:1px;
		height:25px; line-height: 25px;
	}
	input:focus {
	 border: 1px solid #fe595f;
	}
	#register{
		 margin-top:12%;width:80%;
		 margin-left:10%; text-align:center; 
		 line-height:30px; color:#ffffff; 
		 background-color:#fe595f;
		 border-top-left-radius:0.2em;
		 border-top-right-radius:0.2em;
		 border-bottom-right-radius:0.2em;
		 border-bottom-left-radius:0.2em;
	}
</style>
</head>

<body>
	<div class="background_image"><img src="images/background.png" width="100%"/></div>
    <div style="margin-top:-160%;  z-index:99999; margin-left:40%;"  id="header-logo"> 
        	<img id="header" src="images/logo.png" border="1px" width="30%" style="color:#ccc;border-top-left-radius:0.8em;border-top-right-radius:0.8em;border-bottom-right-radius:0.8em;border-bottom-left-radius:0.8em;"/>
            <div class="user-name" id="user-name" style=" margin-top:1%; margin-left:-2.5%;text-align:center; width:35%; font-size:15px;">
            <!-- 
            <img  width="80%" src="images/logo-font.jpg">
             -->
              <font style="font-size:15px;font-weight:900;">易悦</font>
            </div>
    </div>
    
    <div class="content">
    	<div style="width:100%; text-align:center; padding-top:25%; font-weight: 100;"><img  src="images/title-font.png" width="60%"></div>
    	<div id="register-success">	
	    	<div style="width:100%; padding-top:10%;">
	    		<input style=" width:75%;" id="mobile" maxlength="11" placeholder="输入手机号码"/>
	    		<input type="hidden" id="inviteUid" value="<%=id%>"/>
		        <input  type="hidden" id="inviteType" value="<%=inviteType%>"/>
		        <input  type="hidden" id="functionType" value="<%=functionType%>"/>
	    	</div>
	       <div style="width:100%; padding-top:5%;"> 
	       		<input style=" width:75%;" id="password" type="password"  placeholder="输入密码" />
	       </div>
	        <div style="width:100%;padding-top:5%;"> 
	            <input style=" width:40%;" id="smsCode" maxlength="10"  placeholder="输入验证码" /> 
	            <div style="margin-left:68%;margin-top:-8%; width:25%; color:#868686;" class="yzmhq"> 获取验证码</div>
	        </div>
	       <div style="width:80%; padding-top:10%; margin-left:10%;  font-size:18px; color:#3e3e3e;">
	       		<input type="hidden" name="sex" id="sex">
	       		<img id="select_male" onclick="changeSex('male')" width="10%" src="images/man1.png"/>&nbsp;
                <span style="font-size: 16px;vertical-align: super" onclick="changeSex('male')" >男</span>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <img id="select_female" onclick="changeSex('female')" width="10%" src="images/woman1.png"/>
                &nbsp;&nbsp;
                <span style="font-size: 16px;vertical-align: super" onclick="changeSex('female')">女</span>
	        </div> 
        </div>
        <div id="app-download" >		
        	<img id="register"  src="images/register-btn.jpg" >
        </div>  
    </div> 
    
    <div id="download-app" style=" position:fixed; left:0;right:0;bottom:-1%;top:0 auto;width:100%; z-index:999999; margin-top:8%; display:none;">
    	<a class="footer" >
    	<img  src="images/download-app.png" width="100%"/>
    	</a>
    </div>
    <div style="width:100%; margin-bottom:20%; margin-top:38%;">
    	<img src="images/footer-content.png" width="100%" />
    </div>
</body>
<script src="../js/common/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="register.js"></script>
</html>
