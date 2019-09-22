<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
    <base href="${pageContext.request.contextPath }/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>H+ 后台主题UI框架 - 登录</title>
    <link href="resources/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resources/hplus/css/animate.css" rel="stylesheet">
    <link href="resources/hplus/css/style.css" rel="stylesheet">
    <link href="resources/hplus/css/login.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>[ ${applicationScope.web_config.web_title } ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong> ${applicationScope.web_config.web_title }</strong></h4>
                    <ul class="m-b">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一：${applicationScope.web_config.advantange_1 }</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二：${applicationScope.web_config.advantange_2 }</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三：${applicationScope.web_config.advantange_3 }</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四：${applicationScope.web_config.advantange_4 }</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五：${applicationScope.web_config.advantange_5 }</li>
                    </ul>
                    <strong>还没有账号？ <a href="sys/user/regist">立即注册&raquo;</a></strong>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" action="sys/login" id="formData">
                    <h4 class="no-margins" style="color: #337AB7">登录：</h4>
                    <p class="m-t-md" style="color: #337AB7">登录到${applicationScope.web_config.web_title }后台管理系统</p>
                    <input type="text" name="account" class="form-control uname" placeholder="用户名或手机号" />
                    <input type="password" name="password" class="form-control pword m-b" placeholder="密码" />
                    <span class="danger-text" style="color: red">${message }</span>
                    <button class="btn btn-success btn-block">登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left" style="color:#337AB7;">
                &copy; 2019-08-05 二阶段java web课程设计项目
            </div>
        </div>
    </div>
    
     <!-- 全局js -->
    <script src="resources/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/hplus/js/bootstrap.min.js?v=3.3.6"></script>
   
    <!-- jQuery Validation plugin javascript-->
    <script src="resources/hplus/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="resources/hplus/js/plugins/validate/messages_zh.min.js"></script>

    <script src="resources/hplus/js/demo/form-validate-demo.js"></script>
    <script type="text/javascript">
    	$(function(){
	   		 $.validator.setDefaults({
	   	            highlight: function (element) {
	   	                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
	   	            },
	   	            success: function (element) {
	   	                element.closest('.form-group').removeClass('has-error').addClass('has-success');
	   	            },
	   	            errorElement: "span",
	   	            errorPlacement: function (error, element) {
	   	                if (element.is(":radio") || element.is(":checkbox")) {
	   	                    error.appendTo(element.parent().parent().parent());
	   	                } else {
	   	                    error.appendTo(element.parent());
	   	                }
	   	            },
	   	            errorClass: "help-block m-b-none",
	   	            validClass: "help-block m-b-none"
	
	
	   	        });
	   		 
	   		 // validate signup form on keyup and submit
	          var icon = "<i class='fa fa-times-circle'></i> ";
	   		 
	   		 jQuery.validator.addMethod("checkAccount", function(value, element, param) {
	   		    var reg01 = /^[a-zA-Z]\w+$/;
	   		    var reg02 =/^1[3456789][0-9]{9}$/; 
	   		    return this.optional(element) || (reg01.test(value))|| (reg02.test(value));   
	   		  },"账号必须以字母开头");
   		    		
	   		  $("#formData").validate({
	   				onfocusout:false,
	   				onkeyup:false,
	   				rules:{
	   					account:{
	   						required:true,
	   						rangelength:[5,16],
		   					checkAccount:true
	   					},
	   					password:{
	   						required:true,
	   						rangelength:[5,16],
	   					}	
	   				},
	   		  		messages:{
		   		  		account:{
	   						required:icon+"账号不能为空",
	   						rangelength:icon+"账号长度必须在5到16之间"
	   					},
	   					password:{
	   						required:icon+"密码不能为空",
	   						rangelength:icon+"密码长度必须在5到16之间"
	   					}
	   		  		}
	   		  });	
    	});
    </script>
    
</body>

</html>