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
    
    <link rel="shortcut icon" href="favicon.ico">
    <link href="resources/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resources/hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resources/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="resources/hplus/css/animate.css" rel="stylesheet">
    <link href="resources/hplus/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
                <div class="ibox float-e-margins"> 
                    <div class="ibox-content">
					  <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>用户名称</th>
                                        <th>会员类型</th>
                                        <th>开始时间</th>
                                        <th>结束时间</th>
                                        <th>购买价格</th>                                
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${type }" var="t">
                                    <tr>
                                        <td>${t.account }</td>
                                        <td>${t.type_name }</td>
                                        <td>${t.start_date }</td>
                                        <td>${t.end_date }</td>
                                        <td>${t.money }</td>
                                        <td></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                    </div>
                </div>      
        </div>
    </div>

    <!-- 全局js -->
    <script src="resources/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/hplus/js/bootstrap.min.js?v=3.3.6"></script>
    
    <!-- Peity -->
    <script src="resources/hplus/js/plugins/peity/jquery.peity.min.js"></script>

    <!-- 自定义js -->
    <script src="resources/hplus/js/content.js?v=1.0.0"></script>


    <!-- iCheck -->
    <script src="resources/hplus/js/plugins/iCheck/icheck.min.js"></script>

    <!-- Peity -->
    <script src="resources/hplus/js/demo/peity-demo.js"></script>

    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>

    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--统计代码，可删除-->

</body>

</html>
