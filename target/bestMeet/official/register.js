 window.onload=function(){
	 var height = $("#header-logo").height()*0.72;
	 $("#header").height(height+"px");
	 var inputHeight=$("#mobile").height()*0.60;
	 $("input").css("font-size",inputHeight+"px");
	 $(".yzmhq").css("font-size",inputHeight*0.8+"px");
	 $(".sex").css("font-size",inputHeight+"px");
	 if(isWeiXin()){
	        $(".footer").attr("href","http://a.app.qq.com/o/simple.jsp?pkgname=com.bestMeet.appointment&g_f=991653")
	        $(".ios").attr("href","http://a.app.qq.com/o/simple.jsp?pkgname=com.bestMeet.appointment&g_f=991653")
	        $(".and").attr("href","http://a.app.qq.com/o/simple.jsp?pkgname=com.bestMeet.appointment")
	    }else{
	        $(".ios").attr("href","https://itunes.apple.com/cn/app/yi-yue-yue-hui/id1003136897?mt=8")
	        $(".and").attr("href","http://ws.bestMeet.com.cn/app/Appointment.apk")
	    }
	    initSex();
	 //   initHeadFlag();
		
	};
	
	//初始化头像
	function initHeadFlag(){
		var userId=$("#inviteUid").val();
		if(userId == 'null' ||userId==undefined || userId == ''){
			$("#header").html("<img class='header' src='images/bestMeet_logo.png'/>");
			$("#register").html("立即注册");
			return;
		}
		 //var  param={"userId":userId};
		var url = '/bestMeet_ws/auth/getHeadFlag/'+userId+'.do';
		$.ajax({
	        type: 'GET',
	        url: url,
			success: function (result) {
				 if (result.status == 'error' || result.status == 'failed') {
	                    alert(result.message);
	                    return;
	              }
				 if(result.data != null){
					$("#header").html("<img class='header' src='/bestMeet_ws/userDatum/download.do?fileName="+result.data.imgName+"'/>");
					if(result.user.sex == '女'){
						$("#userName").html(result.user.firstName+"女士");
					}else{
						$("#userName").html(result.user.firstName+"先生");
					}
				 }
			}
		});
	}
	
	
	function isWeiXin(){
	    var ua = window.navigator.userAgent.toLowerCase();
	    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
	        return true;
	    }else{
	        return false;
	    }
	}
	function initSex(){
		//默认性别选择
	    // $('#sex').val('男');
	    // $('#select_male').attr('src','images/man.png');
	     //$('#select_female').attr('src','images/woman1.png');
	}

    function checkPlatform(){
        if(/android/i.test(navigator.userAgent)){
            $(".footer").attr("href","http://ws.bestMeet.com.cn/app/Appointment.apk");//这是Android平台下浏览器
        }
        if(/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)){
            $(".footer").attr("href","https://itunes.apple.com/cn/app/yi-yue-yue-hui/id1003136897?mt=8");//这是iOS平台下浏览器
        }
    }
    
    $(document).ready(function(){
        checkPlatform();
    });
    
	//判断滑动到的位置
	window.onscroll=function(){
		var height= window.scrollY;
			if(height >60){
				$("#download-app").css("display","block");
			}else{
				$("#download-app").css("display","none");
			}
	};
	function changeSex(type){
		 if(type == 'male'){
	            $('#sex').val('男');
	            $('#select_male').attr('src','images/man.png');
	            $('#select_female').attr('src','images/woman1.png');
	      }else{
	            $('#sex').val('女');
	            $('#select_male').attr('src','images/man1.png');
	            $('#select_female').attr('src', 'images/woman.png');
	     }
	}
	
	$(function(){
		
		$("input").focusin(function(){
			$(this).css("border","2px solid #fe595f;");
		});
		
		$("input").focusout(function(){
			$(this).css("border","2px solid #ccc;");
		});
		//时间
		var wait=60;
		function time(o) {
			if (wait == 0) {
				$(o).text("获取验证码");
				$(o).css("color","#868686");
				$(o).click(function(){time(this);});
				wait = 60;
			} else {
				$(o).unbind("click");
				$(o).css("color","#868686")
				$(o).text("重新获取" + wait + "s");
				wait--;
				setTimeout(function() {time(o)},1000);
			}
		}
		/**
		 * 验证
		 * @param type
		 * @returns {boolean}
		 */
		var validParam = function (type) {
		    if ($('#mobile').val() == '') {
		        alert("请输入手机号码");
		        $('#mobile').focus();
		        return false;
		    }
	
		    if(!/^(1\d{10})$/.test($('#mobile').val())){
		        alert("请输入正确手机号码");
		        $('#mobile').focus();
		        return false;
		    }
	
		    //注册
		    if (type == 'register') {
		        if ($('#password').val() == '') {
		            alert('请填写密码');
		            $('#password').focus();
		            return false;
		        }
		        if ($('#smsCode').val() == '') {
		            alert('请填写验证码');
		            $('#smsCode').focus();
		            return false;
		        }
		    }
		    return true;
		}

		 /**
		 * 发送短信
		 * */
		$(".yzmhq").click(function () {
			if (!validParam('code')) {
				return;
			}
			var mobile = $.trim($('#mobile').val());
			$.ajax({
				url : "../activity/getCode.do",
				type : "post",
				dataType : "json",
				data : {"phone" : mobile},
				success : function(json) {
					if (json.errorMsg){
						alert(json.errorMsg);return;
					}
					if(json.status=='success'){
						time($(".yzmhq"));
					}	
				}
			});
			
		});

	    var register = function(){
	    	var sex=$("#sex").val();
	    	if(sex == ''){
	    		alert("请选择性别");return;
	    	}
	        if (!validParam('register')) {
	            return;
	        }
	        var url = '../inviteRegister/register.do';
	        var param = {
	            'mobile': $('#mobile').val(), 'password': $('#password').val(),
	            'sex': sex,'smsCode': $('#smsCode').val(),
	            'clientType': 'invite'};
	        if($("#inviteUid").val() != '' && $("#inviteUid").val() != 'null'){
	        	param.inviteUid=$("#inviteUid").val() ;
	        }
	        if( $('#inviteType').val() != '' && $("#inviteType").val() != 'null'){
	        	param.inviteType =$('#inviteType').val();
	        }
	        if( $('#functionType').val() != '' && $("#functionType").val() != 'null'){
	        	param.functionType =$('#functionType').val();
	        }
	        //防止重复提交
	        $('#register').unbind('click', register);
	        $.ajax({
	            type: 'POST',
	           // dataType: 'json',
//	            contentType: 'application/json',
	            url: url,
	            data: param,
	            success: function (json) {
	                if (json.errorMsg) {
	                    alert(json.errorMsg);
	                    return;
	                }
	              $("#register-success").html("<img style='margin-top:20%;margin-bottom:48%;' src='images/register-success.jpg' width='100%'/>");
	          	  $("#app-download").html("<a href='http://a.app.qq.com/o/simple.jsp?pkgname=com.bestMeet.appointment&g_f=991653'><img style='margin-left:10%;' src='images/app-download-btn.jpg' width='80%'/></a>")
	          	 },
	            error: function () {
	                alert('服务器繁忙，请稍后再试');
	                return;
	            },
	            complete : function(){
	                $('#register').bind('click', register);
	            }
	        });
	    }

	    /**
	     * 注册
	     */
	    $('#register').bind('click', register);	
	});
