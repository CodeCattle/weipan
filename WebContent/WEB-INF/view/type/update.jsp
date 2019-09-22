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

        <title>会员类型 - 编辑</title>
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
                                <h5>会员类型<small> 编辑</small></h5>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <form method="post" class="form-horizontal" action="sys/type/update" id="typeForm">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">类型名称</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="type_name" id="type_name" class="form-control" autofocus="autofocus" placeholder="请输入类型名称" value="${type.type_name }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">单文件大小:</label>
                                        <div class="col-sm-4">
                                            <input type="number" name="file_size" id="file_size" class="form-control" placeholder="请输入单文件大小" value="${type.file_size }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">总文件大小:</label>
                                        <div class="col-sm-4">
                                            <input type="number" name="max_size" id="max_size" class="form-control" placeholder="请输入总文件大小" value="${type.max_size }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">价格(月):</label>
                                        <div class="col-sm-4">
                                            <input type="number" name="money" id="money" class="form-control" placeholder="请输入价格" value="${type.money }">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">新增会员类型</button>
                                        </div>
                                    </div>
                                    <input type="hidden" name="type_id" value="${type.type_id }">
                                    <input type="hidden" id="oldTypeName" value="${type.type_name }">
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
				
				jQuery.validator.addMethod("validTypeName", function(value, element,param) {
					var oldTypeName = $("#oldTypeName").val();
					var flag=true;
					if(value!=oldTypeName){
						$.ajax("sys/type/valid",{
							type:"get",
							async:false,
							dataType:"json",
							data:{type_name:value},
							success:function(result){
								flag=result;
							}
						});
					}
					return flag;
				}, icon+"该会员类型名称已经被使用");
	
	
				$("#typeForm").validate({
					onfocusout : false,
					onkeyup : false,
					rules : {
						type_name : {
							required : true,
							rangelength : [ 2, 10 ],
							validTypeName:true
						},
						file_size : {
							required : true,
							min:1024
						},
						max_size : {
							required : true,
							min:1024
						},
						money : {
							required : true,
						}
					},
					messages : {
						type_name : {
							required : icon+"会员名称不能为空",
							rangelength : icon+"会员长度必须在2到10之间"
						},
						file_size : {
							required : icon+"单文件大小必须设置",
							min:icon+"单文件大小不能超过1024"
						},
						max_size : {
							required : icon+"总文件大小必须设置",
							min:icon+"总文件大小不能超过1024"
						},
						money : {
							required : icon+"价格必须设置"
						}
					}
				});
			});
	</script>

</body>
</html>