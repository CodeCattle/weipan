<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>>
<!DOCTYPE html>
<html>
   <head>
      <base href="${pageContext.request.contextPath }/">
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="renderer" content="webkit">

    <title>个人微盘操作</title>


    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="resources/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="resources/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="resources/hplus/css/animate.css" rel="stylesheet">
    <link href="resources/hplus/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span>
                           		 <img id="adminImg" onerror="this.src='resources/hplus/img/profile_small.jpg'" alt="image" class="img-circle"/>
                            </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${sessionScope.session_user.account }</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            	<!-- 修改头像设置弹出层  -->
                                <li><a href="javascript:;" class="photo">修改头像</a></li>
                                <li><a class="J_menuItem" href="sys/update">个人资料</a>
                                </li>
                                <li><a class="J_menuItem" href="sys/user/update/password?id=${sessionScope.session_user.user_id }">修改密码</a>
                                </li>
                               
                                <li class="divider"></li>
                                <li>
                                     <a class="logout" href="javascript:;">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">H+
                        </div>
                    </li>
                    
                    <c:if test="${fn:contains(applicationScope.web_config.manager,sessionScope.session_user.account) }">
                    <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">系统管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                           
                            <li>
                                <a class="J_menuItem" href="sys/user/find">会员管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="sys/type/list">会员类型管理</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    <li>
                        <a class="J_menuItem" href="sys/attr/add"><i class="fa fa-columns"></i> <span class="nav-label">文件上传</span></a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="sys/dir/list"><i class="fa fa-columns"></i> <span class="nav-label">文件目录管理</span></a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="sys/file/index"><i class="fa fa-columns"></i> <span class="nav-label">文件管理</span></a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="sys/share/index"><i class="fa fa-columns"></i> <span class="nav-label">资源分享列表</span></a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">统计图表</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="sys/file/data/index">个人文件统计</a>
                                <a class="J_menuItem" href="sys/share/data/index">分享文件数量统计</a>
                            </li>     
                        </ul>
                    </li>        
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="hidden-xs">
                            <a href="javascript:;" id="buyVip" data-index="0"><i class="fa fa-cart-arrow-down"></i> 购买</a>
                        </li>
                        <li class="hidden-xs">
                            <a href="javascript:;" id="buyRecord" data-index="0"><i class="glyphicon glyphicon-usd"></i> 交易记录</a>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题设置
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="javascript:;" class="roll-nav roll-right J_tabExit logout"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="sys/index" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>
                        固定宽度
                    </span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                            </div>
                        </div>
                    </div>
             
                </div>

            </div>
        </div>
        <!--右侧边栏结束-->
    </div>

<%-- 	<input type="hidden" name="user_id" value="${userId }"> --%>

    <!-- 全局js -->
    <script src="resources/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="resources/hplus/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="resources/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="resources/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="resources/hplus/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="resources/hplus/js/hplus.js?v=4.1.0"></script>
    <script type="text/javascript" src="resources/hplus/js/contabs.js"></script>

    <!-- 第三方插件 -->
    <script src="resources/hplus/js/plugins/pace/pace.min.js"></script>
	<script src="resources/hplus/layui/layui.all.js"></script>
	
	<script type="text/javascript">
		$(function(){
				let user_id= '${sessionScope.session_user.user_id }';
			    $.get("show",{userId:user_id},function(data){
			    	$("#adminImg").attr("src","attr/"+data).css({
	            		width:"64px",
	            		height:"64px"
	            	});
		    	});
			
			$(".logout").click(function(){
				layer.confirm("您确定要退出吗？",{
				      title:'退出选项',
				      icon:5,
				      btn:['<span style="color: red">任性离开</span>','<span id="btn01" style="color: blue">继续逛逛</span>'],
				      yes:function(){
				    	  window.top.location.href="sys/logout";
				      }
				  });
			});
			
			$(".photo").click(function(){
				layer.open({
					type:2,
					title:"个人头像",
					content:"sys/update/photo",
					area:["400px","400px"],
					shade:0.01,
					resize:false
				});
			});
				
			$("#buyVip").click(function(){
				$.get("sys/buy/valid",function(result){
					if(result){
						layer.open({
							type:2,
							title:"购买会员",
							content:"sys/buy/add",
							area:["570px","570px"],
							shade:0.01,
							resize:false
						});	
					}else{
						layer.msg("您已经购买会员啦！");
					}	
				},"json")
			});	
			
			$("#buyRecord").click(function(){
				layer.open({
					type:2,
					title:"您的购买会员记录",
					content:"sys/buy/show",
					area:["800px","570px"],
					shade:0.01,
					resize:false
				});	
			});		
		});
	</script>
	<script type="text/javascript">
	$(function(){
		window.setInterval(function(){
			tip();
		},1000*60*30);
		tip();//先执行一遍
		function tip(){
			$.get("sys/tip/stop",function(data){
				if(data.flag){
					layer.msg(data.message,{
						icon:6,
						shift:6,
						time:5000
					})
				}
			},"json")
		}
	});
	
	</script>
</body>

</html>
