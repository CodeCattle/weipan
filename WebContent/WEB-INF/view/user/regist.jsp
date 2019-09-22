<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <base href="${pageContext.request.contextPath }/">
          <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>用户 -注册界面 </title>
        <link href="resources/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="resources/hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
        <link href="resources/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
        <link href="resources/hplus/css/animate.css" rel="stylesheet">
        <link href="resources/hplus/css/style.css?v=4.1.0" rel="stylesheet">
    </head>
    <body class="gray-bg">
        <div class="wrapper wrapper-content">
                <!-- 定义行数 -->
                <div class="row">
                    <!-- 定义列数 -->
                    <div class="col-md-12">
                        <div class="ibox float-e-margins">
                            <!-- 定义标题 -->
                            <div class="ibox-title">
                                <h2>用户<small>注册界面</small></h2>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <form class="form-horizontal" id="registForm" method="post" action="sys/user/regist">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">用户账号:</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="account" id="account" class="form-control" autofocus="autofocus" placeholder="请输入用户账号">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">用户密码:</label>
                                        <div class="col-sm-4">
                                            <input type="password" name="password" id="password" class="form-control" placeholder="请输入用户密码">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">用户手机:</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="phone" id="phone" class="form-control" placeholder="请输入用户手机号码">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">用户注册</button>
                                        </div>
                                    </div>
                                    <div class="form-group">
										<label for="message" class="col-sm-12 control-label text-danger">
											${requestScope.message }
										</label>
									</div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <!-- 全局js -->
        <script src="resources/hplus/js/jquery.min.js?v=2.1.4"></script>
        <script src="resources/hplus/js/bootstrap.min.js?v=3.3.6"></script>
        <!-- 自定义js -->
        <script src="resources/hplus/js/content.js?v=1.0.0"></script>
        <!-- iCheck -->
        <script src="resources/hplus/js/plugins/iCheck/icheck.min.js"></script>
        
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
	   		    var reg = /^[a-zA-Z]\w+$/;
	   		    return this.optional(element) || (reg.test(value));   
	   		  },"账号必须以字母开头");
	   		 
	   		 jQuery.validator.addMethod("checkPhone", function(value, element, param) {
	   		    var reg =/^1[3456789][0-9]{9}$/; 
	   		    return this.optional(element) || (reg.test(value));   
	   		  },"手机号码必须为11位");
	   		
	   		  $("#registForm").validate({
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
	   					},
	   					phone:{
	   						required:true,
	   						checkPhone:true
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
	   					},
	   					phone:{
	   						required:icon+"手机号码不能为空"
	   					}
	   		  		}
	   		  });	
    	});
    </script>
</body>
</html>