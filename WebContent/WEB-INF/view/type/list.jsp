<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <base href="${pageContext.request.contextPath }/">
      <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <title>会员类型管理</title>

        <link href="resources/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="resources/hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
        <link href="resources/hplus/css/animate.css" rel="stylesheet">
        <link href="resources/hplus/css/style.css?v=4.1.0" rel="stylesheet">
    </head>
    <body class="gray-bg">
        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>会员类型管理</h5>
                            <div class="ibox-tools">
                                <a href="javascript:;" id="add-type-btn" class="btn btn-primary btn-xs">
                                    <i class="fa fa-plus"></i> 新增会员类型
                                </a>
                                <a href="javascript:;" class="btn btn-white btn-xs" style="color: #000000" onclick="javascript:window.location.reload()">
                                    <i class="fa fa-refresh"></i> 刷新
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 角色列表数据 -->
            <div class="row">
            	<c:forEach items="${typeList }" var="type">
                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                           <h5>${type.type_name }</h5>
                            <div class="ibox-tools">
                                <a href="javascript:;" pk-id="${type.type_id }" class="btn btn-success btn-xs type-update-btn" style="color: #FFFFFF">编辑</a>
                           		<c:if test="${type.type_id > 0 }">
                                	<a href="javascript:;" pk-id="${type.type_id }"  class="btn btn-primary btn-xs type-delete-btn" style="color: #FFFFFF">删除</a>
                                </c:if>
                            </div>

                        </div>
                        <div class="ibox-content">
                            <h5>会员类型介绍</h5>
                            <p>单文件大小：${type.file_size }</p>
                            <p>总文件大小：${type.max_size }</p>
                            <p>价格：${type.money }</p>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>

        <!-- 全局js -->
        <script src="resources/hplus/js/jquery.min.js?v=2.1.4"></script>
        <script src="resources/hplus/js/bootstrap.min.js?v=3.3.6"></script>
        <script src="resources/hplus/js/plugins/layer/layer.min.js"></script>

        <!-- 自定义js -->
        <script src="resources/hplus/js/content.js?v=1.0.0"></script>
		<script src="resources/hplus/js/plugins/pace/pace.min.js"></script>
	    <script src="resources/hplus/layui/layui.all.js"></script>
	    
		<script type="text/javascript">
			$(function(){
				$("#add-type-btn").click(function(){
					layer.open({
						type:2,
						title:"会员类型｜新增",
						content:"sys/type/add",
						area:["570px","570px"],
						shade:0.01,
						resize:false
					});
				});
				
				$(".type-update-btn").click(function(){
					var type_id=$(this).attr("pk-id");
					layer.open({
						type:2,
						title:"会员类型｜新增",
						content:"sys/type/update?type_id="+type_id,
						area:["570px","570px"],
						shade:0.01,
						resize:false
					});
				});
				
				$(".type-delete-btn").click(function(){
					var type_id=$(this).attr("pk-id");
					layer.confirm("<b style='color:red;'>慎重！删除会员类型信息涉及多表操作！</b>",{
						icon:5,
						shift:6,
						shade:0.01
					},function(index){
						$.get("sys/type/delete",{type_id:type_id},function(data){
							if(data.flag){
								window.location.reload();
								layer.close();
							}else{
								layer.msg(data.message);
							}
						},"json");	
					});
				});
			});
		</script>
    
    </body>
</html>