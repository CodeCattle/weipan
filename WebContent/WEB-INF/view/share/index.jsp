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


    <title>资源分享列表</title>
   
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="resources/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resources/hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="resources/hplus/css/animate.css" rel="stylesheet">
    <link href="resources/hplus/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="ibox">
                    <div class="ibox-content">
                        <span class="text-muted small pull-right">当前时间：<i class="fa fa-clock-o"></i><fmt:formatDate value="${nowdate }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span>
                        <h2>资源分享</h2>
                        <div class="input-group">
                            <input type="text" id="keyword" placeholder="请输入分享的标题名称或者用户别名" class="input form-control">
                            <span class="input-group-btn">
                                        <button id="search" type="button" class="btn btn btn-primary"> <i class="fa fa-search"></i> 搜索</button>
                            </span>
                        </div>
                        <div class="clients-list">
                            <ul class="nav nav-tabs">
                                <span class="pull-right small text-muted" id="totalCount"></span>
                                <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i> 用户别名</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-hover">
                                                <tbody id="result"></tbody>
                                                <tfoot>
                                                	<tr>
                                                		<td colspan="4">
                                                			<button type="button" id="more" class="btn btn-info btn-block">加载更多</button>
                                                		</td>
                                                	</tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                               
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="resources/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/hplus/js/bootstrap.min.js?v=3.3.6"></script>

    <script src="resources/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- 自定义js -->
    <script src="resources/hplus/js/content.js?v=1.0.0"></script>
    
    <script type="text/javascript">
      $(function(){
    	  let pageNow=1;
    	  let keyword="";
    	  
    	  $("#search").click(function(){
    		  $("#result tr").remove();
    		  pageNow=1;
    		  loadFile();
    	  });
    	  
    	  $("#more").click(function(){
    		  pageNow=pageNow+1;
    		  loadFile();
    	  });
    	  
    	  
      	  loadFile();
      	  function loadFile(){
      		keyword=$.trim($("#keyword").val());
      		$.get("sys/share/find",{pageNow:pageNow,keyword:keyword},function(page){
      			$("#totalCount").html(page.totalCount+"个文件");
      			for(let i=0;i<page.datas.length;i++){
      				 let s=page.datas[i];
      				 let tr=$("<tr></tr>");
	                 let td=$("<td></td>");
	                 td.addClass("client-avatar");
	                 if(s.photo.length>0){
	                	 td.append('<img alt="image" src="attr/'+s.photo+'">');
	                 }else{
	                	td.append('<img alt="image" src="img/a2.jpg">');
	                 }
	                 tr.append(td);
	                 
	                 td=$("<td></td>").html(s.user_name);
	                 tr.append(td);
	                 td=$("<td></td>").html(s.title);
	                 tr.append(td);
	                 td=$("<td></td>").html("<a href='"+s.path+"' class='btn btn-success btn-sm'>下载</a>");
	                 tr.append(td);
	                 
	                 $("#result").append(tr);
	                 
	                 if(page.pageNow==page.totalPages){
	                	 $("#more")[0].disabled=true;
	                 }
      			}	
      		},"json");
       	 };
      });
    	
    
    
    </script>

    <script>
        $(function () {
            $('.full-height-scroll').slimScroll({
                height: '100%'
            });
        });
    </script>
</body>

</html>