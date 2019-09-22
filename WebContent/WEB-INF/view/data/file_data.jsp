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
      <style>
      	div{
      		position: absolute;
            top: 5%;
            left: 15%;
      	}
      </style>
   </head>
   <body>
   	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 700px;height:500px;">
    
    </div>
    <script type="text/javascript" src="resources/jquery.js"></script>
    <script type="text/javascript" src="resources/echarts/echarts.js"></script>
    <script src="resources/hplus/js/plugins/layer/layer.min.js"></script> 
    <script type="text/javascript">
    	$(function(){
    		$.get("sys/file/data",function(result){
    			// 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));

                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '文件统计'
                    },
                    tooltip: {},
                    legend: {
                        data:['目录名称']
                    },
                    series: [{
                        name: '文件个数',
                        type: 'pie',
                        data: result
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
                
                myChart.on('click', function (params) {
               	  $.get("sys/file/data/list",{dirName:params.name},function(data){
	               		layer.open({
	    					type:2,
	    					title:"个人头像",
	    					content:"",
	    					area:["400px","400px"],
	    					shade:0.01,
	    					resize:false
	    				});
                     },"json"); 	
                });
    		},"json")	
    	})
    </script>
      
   </body>
</html>