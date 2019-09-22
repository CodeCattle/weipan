<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.request.contextPath}/">
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - Bootstrap Table</title>

    <link href="resources/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resources/hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="resources/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="resources/hplus/css/animate.css" rel="stylesheet">
    <link href="resources/hplus/css/style.css?v=4.1.0" rel="stylesheet">
    

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>基本</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#">选项1</a>
                        </li>
                        <li><a href="#">选项2</a>
                        </li>
                    </ul>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">
                	<!-- 开始 -->
                    <div class="col-sm-12">
                        <div class="example">
                           <table id="dirTable" data-mobile-responsive="true">
                           </table>
                            <div class="btn-group hidden-xs" id="exampleToolbar" role="group">
                                   <button type="button" class="btn btn-outline btn-default addBtn">
                                       <i class="glyphicon glyphicon-plus" aria-hidden="true">添加文件目录</i> 
                                   </button>
                            </div>
                        </div>
                    </div>
                    <!-- 结束 -->
                </div>
            </div>
        </div>
        <!-- End Panel Basic -->

    </div>

    <!-- 全局js -->
    <script src="resources/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/hplus/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="resources/hplus/js/content.js?v=1.0.0"></script>
    <script src="resources/hplus/js/plugins/layer/layer.min.js"></script>

    <!-- Bootstrap table -->
    <script src="resources/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="resources/hplus/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="resources/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
   
    <script src="resources/hplus/layui/layui.all.js"></script>
    <script src="resources/hplus/js/plugins/layer/layer.min.js"></script>
    <!-- Peity -->
    <!-- <script src="resources/hplus/js/demo/bootstrap-table-demo.js"></script> -->
    <script type="text/javascript">
    	 $(function(){
    		var table= $('#dirTable').bootstrapTable({
    			 url: 'sys/dir/show',         //请求后台的URL（*）
    			 striped: true,                      //是否显示行间隔色
    			 pagination: true,                   //是否显示分页（*）
    			 sortable: true,                     //是否启用排序
   	             sortOrder: "desc",                   //排序方式
   	             pageNumber:1,                       //初始化加载第一页，默认第一页
   	             pageSize: 10,                       //每页的记录行数（*）
   	             pageList: [10, 30, 50],        //可供选择的每页的行数（*）
   	             showColumns: true,   //是否显示所有的列
	   	         rowStyle: function (row, index) {
	                  var strclass = "";
	                  console.log(row);
	                  if (row.dir_name == "电影") {
	                      strclass = 'success';
	                  }
	                  else if(row.dir_name == "图片"){
	                	  strclass = 'info';  
	                  }
	                  else if(row.dir_name == "体育"){
	                	  strclass = 'active';  
	                  }
	                  else{
	                	  return {};
	                  }
	                  return {classes: strclass }
	              },
	             columns: [
	   	         {      
	   	        	 field: 'id',
					 title: '文件目录序号'//标题  可不加
						
	              }, {
	                  field: 'account',
	                  title: '上传者'
	              }, {
	                  field: 'dir_name',
	                  title: '上传文件目录'
	              }, {
	                  field: 'remark',
	                  title: '文件目录描述'
	              },{
	                  field: 'fileNum',
	                  title: '文件个数'
	              },{
	            	  title:"操作",
	            	  formatter: function (value, row, index) {
							return [
								    '<button pk-id="'+row.id+'" pk-dirName="'+row.dir_name+'" id="Btn02" type="button" class="btn btn-warning btn-xs"> <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>更新</button> &nbsp',
								    '<button pk-id="'+row.id+'" pk-dirName="'+row.dir_name+'" id="Btn03" type="button" class="btn btn-danger btn-xs"> <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除</button>',
								].join('');
						} 
	              } ]
    		 });
    		 $(".addBtn").click(function(){
    			 var dir_id=$(this).attr("pk-id"); 
    			 window.location.href="sys/dir/add?dir_id="+dir_id;
    		 });
    		 
    		 $("#dirTable").on("click","#Btn02",function(){
    			 var dir_id=$(this).attr("pk-id"); 
    			 window.location.href="sys/dir/update?dir_id="+dir_id;
    		 });
    		 
    		 $("#dirTable").on("click","#Btn03",function(){
    			 var dir_id=$(this).attr("pk-id"); 
    			 $.get("sys/dir/valid",{dir_id:dir_id},function(result){
 					if(result=="0"){
 						layer.confirm("您确定要删除吗？",{
 							icon:6,
 							shift:6
 						},function(index){
 							window.location.href="sys/dir/delete?dir_id="+dir_id;
 							layer.close(index);
 						});
 					}else{
 						layer.msg("文件夹中有文件，您不能删除！");
 					}	
 				},"json") 
    		 });
    	 });
    </script>

    

</body>

</html>