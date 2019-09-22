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

        <title>个人资料修改</title>
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
                                <h5>个人资料修改</small></h5>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <form method="post" class="form-horizontal" action="sys/update" id="userForm">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">账号</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="account" id="account" class="form-control" readonly="readonly" value="${user.account }">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">手机号码</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="phone" id="phone" class="form-control"  value="${user.phone }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">别名</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="user_name" id="user_name" class="form-control"  value="${user.user_name }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">会员类型</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="type_name" id="type_name" class="form-control" readonly="readonly" value="${user.type_name }">

                                        </div>
                                    </div>
                      
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">更新个人资料</button>
                                        </div>
                                    </div>
                                    <input type="hidden" id="oldPhone" value="${user.phone }">
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
	
				jQuery.validator.addMethod("checkPhone", function(value, element,param) {
					var reg = /^1[3456789][0-9]{9}$/;
					return this.optional(element) || (reg.test(value));
				}, icon+"手机号码必须为11位");
				
				jQuery.validator.addMethod("validPhone", function(value, element,param) {
					var oldPhone = $("#oldPhone").val();
					if(value==oldPhone){
						return true;
					}else{
						$.ajax("sys/user/valid",{
							type:"get",
							async:false,
							data:{account:value},
							success:function(result){
								return result;
							}
						});
					}
				}, icon+"该手机号码已经被使用");
				
	
				$("#userForm").validate({
					onfocusout : false,
					onkeyup : false,
					rules : {
						user_name : {
							required : true,
							rangelength : [ 2, 10 ]
						},
						phone : {
							required : true,
							checkPhone : true,
							validPhone :true
						}
					},
					messages : {
						user_name : {
							required : icon + "别名不能为空",
							rangelength : icon+"用户名称长度必须再2到10之间"
						},
						phone : {
							required : icon + "手机号码不能为空"
						}
					}
				});
			});
	</script>

</body>
</html>