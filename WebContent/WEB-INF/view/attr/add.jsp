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

        <title>文件- 上传</title>
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
                                <h5>会员<small> 上传</small></h5>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <!--  enctype="multipart/form-data" 中间为-疏忽大意 -->
                                <form method="post" class="form-horizontal" id="attrForm" action="sys/attr/add" enctype="multipart/form-data" >
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">文件目录</label>
                                        <div class="col-sm-4">
                                        <select name="dir_id" id="dir_id" class="form-control" >
                                        	<option value="">请选择存储的文件目录:</option>
                                        	<c:forEach items="${dirList }" var="d">
                                        		<option value="${d.id }" >${d.dir_name }</option>
                                        	</c:forEach>	
                                        </select>
                                        </div>
                                    </div>
                                   
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">上传文件:</label>
                                        <div class="col-sm-4">
                                            <input type="file" name="myfile" id="myfile" class="form-control" multiple="multiple">
                                        </div>
                                    </div>
                                    
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">文件上传</button>
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
        
        <script src="resources/hplus/js/plugins/layer/layer.min.js"></script>


        <!-- 自定义js -->
        <script src="resources/hplus/js/content.js?v=1.0.0"></script>
        
        <script type="text/javascript">
        	$(function(){
        		var file_size='${userType.file_size}';
        		var max_size='${userType.max_size}';
        		console.log(file_size,file_size);
        		$("#attrForm").submit(function(){
        			var dir_id=$("#dir_id").val();
        			if(!dir_id){
        				layer.msg("请选择存储的目录");
        				return false;
        			}
        			var files=$("#myfile").prop("files");
        			if(!files.length){
        				layer.msg("请选择上传的文件");
        				return false;
        			}
        			let max=0
        			for(let i=0;i<files.length;i++){
        				var f=files[i];
        				var fileName=f.name;
        				if(f.size>file_size){
        					layer.msg(f.name+",您上传的单文件大小超过操作权限，上传的单文件大小为:"+file_size);
        					return false;
        				}
        				max+=f.size;
        			}
        			if(max>max_size){
    					layer.msg("您上传的总文件大小超过了操作权限，上传的总文件大小为：:"+max_size);
    					return false;
    				}
        			
        			return true;
        			
        		});
        	});
        </script>
	
		

</body>
</html>