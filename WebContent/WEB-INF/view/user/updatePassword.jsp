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

        <title>个人密码修改</title>
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
                                <h5>修改个人密码</h5>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <form method="post" class="form-horizontal" action="sys/user/update/password" id="userForm">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">原密码</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="p1" id="p1" class="form-control" autofocus="autofocus"">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">新密码</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="password" id="password" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">确认密码</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="password1" id="password1" class="form-control">
                                        </div>
                                    </div>
                                    
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">修改密码</button>
                                        </div>
                                    </div>
                                    
                                    <input type="hidden" name="user_id" value="${user.user_id }">
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
			$(function() {
				$.validator.setDefaults({
					highlight : function(element) {
						$(element).closest('.form-group')
								.removeClass('has-success').addClass('has-error');
					},
					success : function(element) {
						element.closest('.form-group').removeClass('has-error')
								.addClass('has-success');
					},
					errorElement : "span",
					errorPlacement : function(error, element) {
						if (element.is(":radio") || element.is(":checkbox")) {
							error.appendTo(element.parent().parent().parent());
						} else {
							error.appendTo(element.parent());
						}
					},
					errorClass : "help-block m-b-none",
					validClass : "help-block m-b-none"
	
				});
	
				// validate signup form on keyup and submit
				var icon = "<i class='fa fa-times-circle'></i> ";
				$("#userForm").validate({
					onfocusout : false,
					onkeyup : false,
					rules : {
						p1 : {
							required : true,
							remote :{
								type:"get",
							 	url:"sys/user/valid/password",
							 	data:{
							 		password:function(){
							 			return $("#p1").val();
							 		}
							 	}
							}
						},
						password : {
							required:true,
							rangelength:[5,10]
						},
						password1 :{
							equalTo:"#password"
						}
					},
					messages : {
						p1 : {
							required : icon + "旧密码不能为空",
							remote:"输入的旧密码不正确"
						},
						password : {
							required : icon + "新密码不能为空",
							rangelength:icon+"新密码长度在5到10之间"
						},
						password2 :{
							equalTo:icon+"两次密码输入不一致"
						}
					}
				});
			});
	</script>

</body>
