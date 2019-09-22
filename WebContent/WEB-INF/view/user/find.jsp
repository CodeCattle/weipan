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

        <title>系统用户管理</title>

		<link href="resources/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="resources/hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">

        <link href="resources/hplus/css/animate.css" rel="stylesheet">
        <link href="resources/hplus/css/style.css?v=4.1.0" rel="stylesheet">

    </head>

<body class="gray-bg">

        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>系统用户管理</h5>
                        <!--<div class="ibox-tools">
                            <a href="projects.html" class="btn btn-primary btn-xs">创建新项目</a>
                        </div>-->
                    </div>
                    <div class="ibox-content">
                    	<form action="sys/user/find" method="get" id="searchFrom">
                        <div class="row m-b-sm m-t-sm">
                            <div class="col-md-2">
                                <button type="button" id="user-add-btn" class="btn btn-primary btn-sm"><i class="fa fa-user-plus"></i> 新建</button>
                                <button type="button" id="user-loading-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
                            </div>
                            <div class="col-md-2 col-md-offset-4">
                                <select class="input-sm form-control input-s-sm inline" style="font-size: 12px;" id="status" name="status">
                                    <option value="">请选择状态</option>
                                    <option value="1">可用</option>
                                    <option value="2">注销</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入用户的姓名" id="user_name" name="user_name" class="input-sm form-control">
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary" id="searchBtn"> 搜索</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- 隐藏域 -->
                        <input type="hidden" id="pageNow" name="pageNow" value="${page.pageNow }">
                        <input type="hidden" id="totalPages" value="${page.totalPages }">
					</form>
					
                        <div class="project-list">

                            <table class="table table-hover">
                               <c:forEach items="${page.datas }" var="user">
                                <tbody id="">
                                    <tr>
                                        <td class="client-avatar">
                                            <img alt="image" src="attr/${user.photo }" onerror="this.src='resources/hplus/img/a2.jpg'" style="width: 28px;height: 28px">
                                        </td>
                                        <td>
                                            <!-- A标签的样式,暂时没有使用该链接 -->
                                            <a href="javascript:;" class="client-link">${user.user_name }</a>
                                        </td>
                                        <td>${empty user.account?"未设置":user.account }</td>
                                        <td>${empty user.phone?"未设置":user.phone }</td>
                                        <td class="contact-type">
                                            <i class="fa fa-user-secret"> </i>
                                        </td>
                                        <td class="client-status">
                                        	<c:if test="${user.status==1 }" var="flag">
                                        		<span class="label label-primary">已激活</span>
                                        	</c:if>
                                        	<c:if test="${!flag }" >
                                        		<span class="label label-danger">已注销</span>
                                        	</c:if>
                                            
                                        </td>
                                        <td class="contact-type">
                                            <i class="fa fa-clock-o"> </i>
                                        </td>
                                        <td>
                                           <fmt:formatDate value="${user.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </td>
                                        <td>
                                          ${user.type_name }
                                        </td>
                                        <td>
                                            <!-- 设置自定义数据 pk-id 用于表示注解 -->
                                            <c:if test="${user.status==1 && user.user_id!=sessionScope.session_user.user_id }" >
                                            	 <a href="javascript:;" pk-id="${user.user_id }" user-status="2" class="btn btn-warning btn-sm user-status-btn"><i class="fa fa-remove"></i> 注销 </a>
                                            </c:if>
                                            <c:if test="${user.status==2 }">
                                           		<a href="javascript:;" pk-id="${user.user_id }" user-status="1" class="btn btn-primary btn-sm user-status-btn"><i class="fa fa-smile-o"></i> 激活 </a> 
                                            </c:if> 
                                            <a href="javascript:;" id="resetBtn" pk-id="${user.user_id }" class="btn btn-info btn-sm user-password-btn"><i class="fa fa-odnoklassniki"></i> 重置密码 </a>
                                        </td>
                                    </tr>
                                  </c:forEach> 
                                </tbody>
                            </table>
                        </div>
                        <div class="row m-b-sm m-t-sm">
                            <div class="col-md-2">
                                <span style="line-height: 30px;">显示 1 到 10 项，共 63 项</span>
                            </div>
                            <div class="col-md-5 col-md-offset-5">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-sm btn-white" id="start"> 首页</button>
                                    <button type="button" class="btn btn-sm btn-white" id="prev"> 上一页</button>
                                    <button type="button" class="btn btn-sm btn-white" id="next"> 下一页</button>
                                    <button type="button" class="btn btn-sm btn-white" id="end"> 尾页</button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 全局js -->
        <script src="resources/hplus/js/jquery.min.js?v=2.1.4"></script>
        <script src="resources/hplus/js/bootstrap.min.js?v=3.3.6"></script>
        <script src="resources/hplus/js/plugins/layer/layer.min.js"></script>


        <!-- 自定义js -->
        <script src="resources/hplus/js/content.js?v=1.0.0"></script>
        <script type="text/javascript">
          $(function(){
        	$(".user-status-btn").click(function(){
        		var user_id=$(this).attr("pk-id");
        		var status=$(this).attr("user-status");
        		layer.confirm("您确定要执行此操作吗？",{
        			icon:6,
        			shift:6
        		},function(index){
        			$.get("sys/user/update/status",{user_id:user_id,status:status},function(data){
        				window.location.reload();
        				layer.close(index);
        			});
        		});
        	});
        	
        	
        	
        	$(".user-password-btn").click(function(){
        		var user_id=$(this).attr("pk-id");
        		layer.confirm("您确定要执行此操作吗？",{
        			icon:6,
        			shift:6
        		},function(index){
        			$.get("sys/user/reset/password",{user_id:user_id},function(data){
        				if(data.flag){
        					layer.alert("您的重置密码为11111",{icon:6});
        				}else{
        					layer.msg(data.message);
        				}
        			},"json");
        		});
        	});
        	
          });	
        </script>
        
        <script type="text/javascript">
        	let status='${page.query.status }';
        	let user_name='${page.query.user_name }';
        	$("#status").val(status);
        	$("#user_name").val(user_name);
        </script>
        
		<script type="text/javascript">
			$(function(){
				var form=$("#searchFrom");
				var pageNow=$("#pageNow");
				var totalPages=$("#totalPages");
				
				$("#searchBtn").click(function(){
					pageNow.val(1);
					form.submit();
				});
				
				$("#start").click(function(){
					pageNow.val(1);
					form.submit();
				});
				$("#prev").click(function(){
					if(pageNow.val()==1){
						layer.msg("没有上一页啦");
						return false;
					}
					pageNow.val(pageNow.val()-1)
					form.submit();
				});
				$("#next").click(function(){
					if(pageNow.val()==totalPages.val()){
						layer.msg("没有下一页啦");
						return false;
					}
					pageNow.val(parseInt(pageNow.val())+1)
					form.submit();
				});
				$("#end").click(function(){
					pageNow.val(totalPages.val());
					form.submit();
				});
				
			});
		</script>

        


    </body>
</html>
