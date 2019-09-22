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

        <title>会员夹 - 修改</title>
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
                                <h5>会员类型<small> 修改</small></h5>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <form method="post" class="form-horizontal" action="sys/dir/update" id="dirForm">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">文件夹序号：</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="dir_id" id="dir_id" class="form-control" readonly="readonly" value="${dir.id }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">文件夹名称:</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="dir_name" id="dir_name" class="form-control" autofocus="autofocus" value="${dir.dir_name }">
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label">文件夹描述:</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="dir_remark" id="dir_remark" class="form-control"  value="${dir.remark }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">文件个数:</label>
                                        <div class="col-sm-4">
                                            <input type="number" name="fileNum" id="fileNum" class="form-control" readonly="readonly"  value="${dir.fileNum }">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">确认更新</button>
                                        </div>
                                    </div>
                                    <input type="hidden" name="dir_id" value="${dir.id }">
                                    <input type="hidden" id="oldDirName" value="${dir.dir_name }">
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

				var icon = "<i class='fa fa-times-circle'></i> ";
				
				jQuery.validator.addMethod("validDirName", function(value,element,param) {
					var user_id='${sessionScope.session_user.user_id }';
					var oldDirName = $("#oldDirName").val();
					var flag=true;
					if(value!=oldDirName){
						console.log(value),
						console.log(user_id),
						$.ajax("sys/dir/valid02",{
							type:"get",
							async:false,
							dataType:"json",
							data:{dir_name:value,user_id:user_id},
							success:function(result){
								if(result>"0"){
									flag=false;
								}
							}
						});
					}
					return flag;
				}, icon+"该文件夹名称已经被使用");
	
	
				$("#dirForm").validate({
					onfocusout : false,
					onkeyup : false,
					rules : {
						dir_name : {
							required : true,
							rangelength : [ 2, 10 ],
							validDirName:true
						},
						dir_remark : {
							required : true
						}
					},
					messages : {
						dir_name : {
							required : icon+"文件夹名称不能为空",
							rangelength : icon+"文件夹长度必须在2到10之间"
						},
						dir_remark : {
							required : icon+"文件描述必须填写"
						}
					}
				});
			});
	</script>

</body>
</html>