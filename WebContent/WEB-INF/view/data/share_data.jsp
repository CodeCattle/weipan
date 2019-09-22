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
    <div id="main" style="width: 600px;height:400px;">
    
    </div>
    <script type="text/javascript" src="resources/jquery.js"></script>
    <script type="text/javascript" src="resources/echarts/echarts.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$.get("sys/share/data",function(result){
    			// 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));

                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '文件分享统计'
                    },
                    color: ['#3398DB'],
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            
                            type : 'shadow'        
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    tooltip: {},
                    legend: {
                        data:['分享人']
                    },
                    xAxis: {
                    	type : 'category',
                        data: result.nameDatas,
                        axisTick: {
                            alignWithLabel: true
                        }
                    },
                    yAxis: {type : 'value'},
                    series: [{
                    	name:'分享文件数量',
                        type:'bar',
                        barWidth: '60%',
                        data: result.numDatas
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
    		},"json")
    	})
    </script>
      
   </body>
</html>