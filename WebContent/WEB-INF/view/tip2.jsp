<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <base href="${pageContext.request.contextPath }/">
      <meta charset="UTF-8">
      <title>Insert title here</title>
   </head>
   <body>
   		<!--全局 js  -->
     <script src="resources/hplus/js/jquery.min.js?v=2.1.4"></script>
     <script src="resources/hplus/js/plugins/layer/layer.min.js"></script> 
     <script type="text/javascript">
     	$(function(){
     		var message='${requestScope.message}';
     		layer.alert(message,{
     			icon:1,
     			shift:6
     		},function(){
     			var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
     			window.parent.location.reload();
				parent.layer.close(index); //再执行关闭  
     		});
     	});
     </script>
   </body>
</html>