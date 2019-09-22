<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.request.contextPath}/">
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	
	    <title>文件管理</title>
	    <link href="resources/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	    <link href="resources/hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
	
	    <link href="resources/hplus/css/animate.css" rel="stylesheet">
	    <link href="resources/hplus/css/style.css?v=4.1.0" rel="stylesheet">
	
	</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="file-manager">

                            <button class="btn btn-primary btn-block">上传文件</button>
                            <div class="hr-line-dashed"></div>
                            <h5>个人文件夹</h5>
                            <ul class="folder-list" style="padding: 0">
                            	<li>
                                <a href="javascript:;" class="dir" pk-id=""><i class="fa fa-folder">&nbsp;</i>全部</a>
                                </li>
                            	<c:forEach items="${requestScope.dirList }" var="dir">
                                <li>
                                	<a href="javascript:;" class="dir" pk-id="${dir.id }"><i class="fa fa-folder"></i> ${dir.dir_name }</a>
                                </li>
                                </c:forEach>
                                
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 animated fadeInRight">
                <div class="row">
                    <div class="col-sm-12">
                        <!-- 开始 -->
		                    <div class="col-sm-12">
		                        <div class="example">
		                             <div class="btn-group hidden-xs" id="exampleToolbar" role="group">
	                                   <button type="button" class="btn btn-outline btn-default move-more-Btn">
	                                       <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>移动
	                                   </button>
	                                   <button type="button" class="btn btn-outline btn-default del-more-Btn">
	                                       <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
	                                   </button>
                                  </div>
		                           <table id="fileTable" data-mobile-responsive="true">
		                           </table>
		                        </div>
		                    </div>
                    <!-- 结束 -->

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
    
    
    <!-- Bootstrap table -->
    <script src="resources/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="resources/hplus/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="resources/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    
    <script src="resources/hplus/layui/layui.all.js"></script>
    <script src="resources/hplus/js/plugins/layer/layer.min.js"></script>
    
    
    
    <script type="text/javascript">    
    	 $(function(){
    		 
    		 $('#fileTable').bootstrapTable("removeAll");
    		 
    		 $(".dir").click(function(){
    	    		var dir_id=$(this).attr("pk-id");
    	    		var option={};
    	    		if(dir_id){
    	    			option.dir_id=dir_id;
    	    		}
    	    		var options=$('#fileTable').bootstrapTable('refresh', {
    	    			query:option,
    	    			silent:true
    	    		});
    	    	});  
    		 
    		var table= $('#fileTable').bootstrapTable({
    			 url: 'sys/file/list',               //请求后台的URL（*）
    			 striped: true,                      //是否显示行间隔色
    			 pagination: true,                   //是否显示分页（*）
    			 sortable: true,                     //是否启用排序
   	             sortOrder: "desc",                  //排序方式
   	             pageNumber:1,                       //初始化加载第一页，默认第一页
   	             pageSize: 10,                       //每页的记录行数（*）
   	             pageList: [10, 30, 50],             //可供选择的每页的行数（*）
   	             idField:"id",
   	             showColumns: false,                 //是否显示所有的列
	             columns: [{ 
	            	 checkbox:true
	             },
            	 {
					title: '序号',
					formatter: function (value, row, index) {
						return index+1;
					}
	              },
	   	         {      
	   	        	 field: 'file_name',
					 title: '文件名称'
						
	              }, {
	                  field: 'dir_name',
	                  title: '文件目录'
	              }, {
	                  field: 'file_size',
	                  title: '文件大小'
	              }, {
	                  field: 'upload_date',
	                  title: '上传日期'
	              },{
	                  field: 'download_count',
	                  title: '下载次数'
	              },{
	            	  title:"操作",
	            	  formatter: function (value, row, index) {
	            		   var btn= '<button pk-id="'+row.id+'" pk-dirName="'+row.dir_name+'" id="Btn04" type="button" class="btn btn-info btn-xs"> <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>分享</button>';
	            		   if(row.share_count){
	            		       btn= '<button  pk-id="'+row.id+'" id="Btn05" type="button" class="btn btn-warning btn-xs"> <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>取消分享</button>';
	            		   }
	           
							return ['<button pk-id="'+row.id+'" pk-dirName="'+row.dir_name+'" id="Btn01" type="button" class="btn btn-primary btn-xs"> <i class="fa fa-odnoklassniki" aria-hidden="true"></i>移到</button> &nbsp',
								    '<button pk-id="'+row.id+'" pk-dirName="'+row.dir_name+'" id="Btn02" type="button" class="btn btn-warning btn-xs"> <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除</button> &nbsp',
								    '<button pk-id="'+row.id+'" pk-dirName="'+row.dir_name+'" id="Btn03" type="button" class="btn btn-danger btn-xs"> <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>下载</button> &nbsp',
								   btn
								].join('');
						} 
	              }
	              ]
    		 });
    		
    		 $("#fileTable").on("click","#Btn01",function(){
    			 var id=$(this).attr("pk-id"); 
    			 layer.open({
 					type:2,
 					title:"文件夹移动",
 					content:"sys/file/update?id="+id,
 					area:["500px","400px"],
 					shade:0.01,
 					resize:false
 				 });	
    		 });
    		  		
    		 $("#fileTable").on("click","#Btn02",function(){
    			 var id=$(this).attr("pk-id"); 
    			 layer.confirm("你确定要执行文件删除操作吗？",{
    				 icon:2,
    				 shift:6
    			 },function(index){
    				$.get("sys/file/delete",{id:id},function(data){
    					if(data.flag){
    						$('#fileTable').bootstrapTable('refresh');
    						layer.close(index);
    					}else{
    						layer.msg(data.message);
    					}
    				},"json") 
    			 });
    		 });
    		 
    		 $("#fileTable").on("click","#Btn03",function(){
    			 var id=$(this).attr("pk-id"); 
    			 window.location.href="sys/file/download?id="+id;
    		 });
    		 
    		 
    		 $("#fileTable").on("click","#Btn04",function(){
    			 var id=$(this).attr("pk-id"); 
    			 layer.open({
  					type:2,
  					title:"文件分享窗口",
  					content:"sys/file/share?id="+id,
  					area:["500px","400px"],
  					shade:0.01,
  					resize:false
  				 });	
    		 });
    		 
    		 $("#fileTable").on("click","#Btn05",function(){
    			 var id=$(this).attr("pk-id"); 
    			 layer.confirm("你确定要取消文件分享吗？",{
    				 icon:2,
    				 shift:6,
    				 shade:0.01
    			 },function(index){
    				$.get("sys/share/cancel",{id:id},function(data){
    					if(data.flag){
    						$('#fileTable').bootstrapTable('refresh');
    						layer.close(index);
    					}else{
    						layer.msg(data.message);
    					}
    				},"json") 
    			 });
    		 });
    		 
    		 
    		 $(".move-more-Btn").click(function(){
    			 var rows =$('#fileTable').bootstrapTable('getSelections');
    			 if (!rows || rows.length == 0) {
    				   layer.msg("请先选择一行");
    				   return false;
    			 } 
    			 var arr=[];
    			 for(var i=0;i<rows.length;i++){
    				 console.log(rows);
    				 arr[i]=rows[i].id;
    			 }
    			 layer.open({
  					type:2,
  					title:"文件夹移动",
  					content:"sys/file/update/more?arr="+arr.join(),
  					area:["500px","400px"],
  					shade:0.01,
  					resize:false
  				 });	
    		 });
    		 
    		 $(".del-more-Btn").click(function(){
    			 var rows =$('#fileTable').bootstrapTable('getSelections');
    			 if (!rows || rows.length == 0) {
    				   layer.msg("请先选择一行");
    				   return false;
    			 }
    			 var arr=[];
    			 for(var i=0;i<rows.length;i++){
    				 console.log(rows);
    				 arr[i]=rows[i].id;
    			 }
    			 layer.confirm("你确定要执行多个文件删除操作吗？",{
    				 icon:2,
    				 shift:6
    			 },function(index){
    				$.get("sys/file/delete/more",{arr:arr},function(data){
    					if(data.flag){
    						$('#fileTable').bootstrapTable('refresh');
    						layer.close(index);
    					}else{
    						layer.msg(data.message);
    					}
    				},"json") 
    			 });
    		 });
    	 });
    </script>


  

</body>

</html>