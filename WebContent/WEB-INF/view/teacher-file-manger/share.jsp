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

        <title>文件分享</title>
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
                                <h5>文件分享</h5>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <form method="post" class="form-horizontal" action="sys/file/share" id="typeForm">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">分享标题</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="title" id="title" class="form-control" autofocus="autofocus" placeholder="请输入分享标题"  required="required"">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">分享路径:</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="path" id="path" class="form-control" readonly="readonly" value="http://${web_config.server_ip }:${web_config.server_port }${web_config.server_path }share/download?id=${attrFile.id }">
                                        </div>
                                    </div>
                             
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">分享文件</button>
                                        </div>
                                    </div>
                                    <input type="hidden" name="user_id" value="${attrFile.user_id }">
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
	
		
</body>
</html>