<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="favicon.png" type="image/x-icon">
<link rel="Bookmark" href="favicon.png" type="image/x-icon">
<title>关于我们</title>
<style>
	body{
		padding:0; margin:0;font-family:"方正兰亭黑_GBK";
	}
	.header{
		position:relative;left:0;top:0; width:100%;
	}
	.header-info{
		position:absolute; width:100%; margin-top:4%;
	}
	.content{
		position:relative; width:100%; margin-top:2%;height:650px; 
	}
	.content-left-section{
		width:60%;float:left; position:absolute;height: 100%;
	}
	.content-right-section{
		width:40%; float:right; position:absolute;margin-left:60%;height: 100%;
	}
	.footer{
		position:relative;
		bottom:0;
		width:100%;
		margin-top:2%; padding-top:2%; 
		width:100%; color:#ccc; 
		text-align:center; 
		background-color:#09080d; height:120px;
		margin-top:5%;
		padding-bottom:1%;
	}
	p{
		margin:1%;
	}
	.show_content{
	/* height:580px;*/ height:100%; overflow:hidden;
	}
</style>
<script type="text/javascript" src="../js/common/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
function loadData(){
	var html = "";
	$.ajax({
		url:"../app/getContentEditByType.do",
		data:{"type":"officialAbout"},
		dataType:"json",
		success:function(data){
			var dataList = data.data;
			/* for(var i=0;i<dataList.length;i++){
				html+="<span>"+dataList[i].title+"</span>"
				html+="<div>"+dataList[i].content+"</div>"
			} */
			if(dataList.length>0){
				html+=dataList[0].content
			}
			console.log(html);
			$(".show_content").html(html);
			$("p").append("&nbsp;");
		},
		error:function(){
			console.log(data);
		}
	});
}
$(function(){
	loadData();
});
</script>
</head>

<body>
<div>
 <div class="header">
 	<div class="header-info">
   		<a style="margin-left:10%" href="http://www.bestMeet.com.cn"> <img  width="4%" src="about/back-logo.png"/></a>
    	<p align="center" style="width:100%; letter-spacing:2px; font-size:36px; color:#fff;">中国精英专属社交圈</p>
    </div>
    <img src="about/about-header.png"  width="100%"/>
 </div>
 <div class="content">
 	<div class="content-left-section">
    	<div class="show_content" style="float:right;margin-right:15%; width:60%">  	
    	</div>
    </div>
    <div class="content-right-section">
    	<div class="content-right-up">
        	<img src="about/right-up.png" width="50%"/>
        </div>
        <div class="content-right-down">
        	<img src="about/right-down.png"  width="50%"/>
        </div>
    </div>
 </div>
  <div class="footer" >
      <p align="center" style="font-size:1.5em; vertical-align:middle; position:relative;">
           <a href="about.jsp" style="color:#fff;font-size:0.7em; cursor:pointer;text-decoration: none;">关于我们</a>
                        &nbsp;|&nbsp;
		   <a target="_black"  href="http://jobs.51job.com/guangzhou/co3656072.html" style="color:#fff;font-size:0.7em;cursor:pointer;text-decoration: none;"> 英才招募</a>
       </p>
        <p style=" left:0; position:relative; width:100%; text-align:center; margin-top: 1%;color:#737373; font-size:14px; ">
                地址：广州市天河区龙口东路129号龙泽商业大厦M层
        </p>
		<p style=" left:0; position:relative; width:100%; text-align:center; margin-top: 1%;color:#737373; font-size:14px; ">
                    copyright©2011-2015 &nbsp;bestMeet.com.cn &nbsp;粤ICP备14025561号-2
 		</p>
     </div>
</div>
</body>
</html>
