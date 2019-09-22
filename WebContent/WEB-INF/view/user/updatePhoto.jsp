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

        <title>文件上传</title>
        <link href="resources/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="resources/hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">

        <link href="resources/hplus/css/animate.css" rel="stylesheet">
        <link href="resources/hplus/css/style.css?v=4.1.0" rel="stylesheet">

    </head>
    <body>
        <!-- 定义列数 -->
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <!-- 定义内容 -->
                <div class="ibox-content">
                    <form method="post" class="form-horizontal" action="sys/update/photo" enctype="multipart/form-data" id="userForm">
                        <div class="form-group">
                            <div class="col-sm-4">
                                <img id="showImage" alt="image" src="attr/${photo }" class="img-responsive" onerror="this.src='resources/hplus/img/profile_big.jpg'" style="width: 220px;height: 220px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-1">
                                <input type="file" id="myfile" name="myfile" accept="image/*" style="display:none;">
                                <button type="button" id="uploadBtn" class="btn btn-primary btn-block">上传文件</button>
                            </div>
                        </div>
                    </form>
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
        		$("#uploadBtn").click(function(){
        			//给按钮绑定事件
        			$("#myfile").click();
        			return false;//阻止默认行为
        		});
        		$("#myfile").change(function(){//设置本地预览功能
        			//获取上传文件
        			var file=$(this).prop("files")[0];
        			//创建文件读取对象
        			var reader=new FileReader();
        			//读取文件
        			reader.readAsDataURL(file);
        			//添加加载事件
        			reader.onload=function(){
        			//这个属性包含了当前事件事件最后触发的那个处理函数的返回值，除非值是 undefined   ==>event result
        			//最初触发事件的DOM元素。
                    //event target ==> 这是注册事件时的对象，或者它的子元素。通常用于比较 event.target 和 this 来确定事件是不是由于冒泡而触发的。经常用于事件冒泡时处理事件委托。
        				$("#showImage").attr("src",event.target.result);	
        			}	
        			//完成上传操作
        			layer.confirm("您确定要上传头像吗？",{
        				  shade:0.01,
        				  shift:6,
					      btn:['确定上传','再想一下'],
					  },function(index){
						  $("#userForm").submit();
						  layer.close();
					  });
        		});
        	});
        </script>

      
    </body>
</html>