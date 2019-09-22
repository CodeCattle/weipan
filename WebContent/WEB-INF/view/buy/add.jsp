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

        <title>会员 - 购买</title>
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
                                <h5>会员<small> 购买</small></h5>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <form method="post" class="form-horizontal" id="buyForm" action="sys/buy/add">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">会员类型</label>
                                        <select name="type_id" id="type_id" class="form-control" >
                                        	<option value="">请选择购买的会员类型:</option>
                                        	<c:forEach items="${type }" var="t">
                                        		<option value="${t.type_id }" money=${t.money }>${t.type_name }</option>
                                        	</c:forEach>	
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">会员周期</label>
                                        <select name="month" id="month" class="form-control" >
                                        	<option value="">请选择购买的会员周期:</option>
                                       		<option value="1">一个月</option>
                                       		<option value="3">一个季度</option>
                                       		<option value="6">半年</option>
                                       		<option value="12">一年</option> 
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">金额:</label>
                                        <div class="col-sm-4">
                                            <input type="number" name="money" id="money" class="form-control" readonly="readonly">
                                        </div>
                                    </div>
                                    
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">购买</button>
                                        </div>
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
        		$("#type_id").change(function(){
        			changMoney();
        		});
        		$("#month").change(function(){
        			changMoney();
        		});
        		function changMoney(){
        			var type_id=$("#type_id").val();
        			var month=$("#month").val();
        			if(type_id && month){
        				var money=$("#type_id option:selected").attr("money");
        				$("#money").val(month*money);
        			}else{
        				$("#money").val("");
        			}
        		}
        	});
        </script>
	
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
				
				$("#buyForm").validate({
					onfocusout : false,
					onkeyup : false,
					rules : {
						type_id : "required",
						month : "required"
					},
					messages : {
						type_id : {
							required : icon+"选择会员类型"
						},
						month : {
							required : icon+"选择购买时长"
						}
					}
				});
			});
	</script>

</body>
</html>
		
		
		
		