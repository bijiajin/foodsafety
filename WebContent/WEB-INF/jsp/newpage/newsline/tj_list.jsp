<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>static/css/news/layout.css">
<link rel="stylesheet" href="<%=basePath%>static/css/news/home.css">
<script type="text/javascript" src="<%=basePath%>static/js/news/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/news/ajax.js"></script>
<!-- basic styles -->
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/font-awesome.min.css" />
	<link rel="stylesheet" href="static/css/datepicker.css" />
	<link rel="stylesheet" href="static/css/ace.min.css" />
	

<%-- <%@ include file="../../system/admin/top.jsp"%>  --%>

<title>统计报告</title>

</head>
<body style="min-width: 1220px; overflow-x: hidden;">
	<div class="y-wrap">

    <div class="y-header">
    <!-- head start -->
        <div class="header ">
        	<!-- user info start -->
            <div riot-tag="topbar" style="height: 37px; background: #ed4040;">
                <div class="y-box topbar">
					<ul class="y-right">
                        <li class="tb-item more">
	                        <a class="tb-link" href="#">
	                        	<img alt="foodsafety" src="<%=basePath%>static/avatars/user.jpg">
	                        	<span style="text-align:center;">${user.NAME}</span>
	                        	
							</a>
                            <div class="layer">
                                <ul>
                                    
                                    <li>
                                    	<a onclick="userInfo('${user.USER_ID}')" class="layer-item" rel="nofollow">
                                    		<i class="y-icon icon-location"></i>
                                    		个人信息
                                    	</a>
                                    </li>
                                    <li>
                                    	<a href="<%=basePath%>logout" class="layer-item" rel="nofollow">
                                    		<i class="y-icon icon-location"></i>退出
                                    	</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- user info end -->
            <!-- searchForm start -->
            <div class="middlebar">
                <div class="y-box middlebar-inner" >
                    <div class="y-left logo-box">
                        <a class="logo-link" href="App/new_def.do" ga_event="go_home">
                            <img class="logo" id="home-logo" src="<%=basePath%>static/login/logo_food.png">
                        </a>
                    </div>
                    

                </div>
            </div>
            <!-- searchForm start end -->
            
            <div id="toast"></div>
        </div>
        <!-- head end -->
        <!-- main start -->
        <div class="y-box container">
        	<!-- column start -->
            <div class="y-left index-channel">
                <div riot-tag="channel">
                    <div ga_event="left-channel-click" id="left-channel-click" class="channel ">
                        <ul>

								<c:forEach items="${columnList}" var="column" varStatus="cl">
									<c:if test="${column.checked}">
									 <li class="channel-item active"><a href="App/new_def.do?n=${column.alias }" > <i
                                    class="y-icon ${column.icon}"></i><span>${column.clon_name }</span> </a></li>
                                    </c:if>
								</c:forEach>
                            
                        </ul>
                    </div>
                </div>
                <div riot-tag="nchannel"></div>
            </div>
            <!-- column end -->
             <!-- content start -->
            <div class="y-left index-content">
                <div riot-tag="tfeedadd">
                <div riot-tag="msgAlert" mwidth="600" mtop="100" category="__all__"></div>
                 <!-- 检索  -->
			<form action="App/new_def.do" method="post" name="tjForm" id="tjForm">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off"  type="text" id="keywords" name="keywords" value="${pd.keyboard }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off"  type="text" id="province" name="province" value="${pd.province }" placeholder="这里输入省份" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10 date-picker" name="inerttime" id="inerttime"  value="${pd.inerttime}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="日期" title="日期"/></td>
					<td>
						<input type="hidden" id="cloumName" name="cloumName" value="${pd.n }">
                        <input type="hidden" id="pagesize" name="pagesize" value="${page.totalPage }">
					</td>
					
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="createReport()" title="生成报告"><i id="nav-search-icon" class="icon-exchange"></i></a></td>
					<td style="vertical-align:top;"><a class="btn btn-mini btn-light" id="export" href=""  title="导出报告"><i id="nav-search-icon" class="icon-download-alt"></i></a></td>
					
				</tr>
			</table>
			</form>
			<!-- 检索  -->
                </div>
                <div riot-tag="subchannel" id="subchannel"></div>
                <div riot-tag="feedBox">
                    <div class="feedBox" name="feedBox">
                        <div riot-tag="commonFeed" category="__all__" abtype="1">
                            <div class="commonFeed">
                                <div riot-tag="msgAlert" mwidth="600" mtop="100" category="__all__">
                                </div>
                                <ul class="listNewsTimeLy" scrollpagination="enabled">
                                	<c:choose>
                                	<c:when test="${not empty contentList}">
                                	<c:forEach items="${contentList}" var="content" varStatus="vs">
                                    <li class="item"><span id="ad_extra" style="display:none;"></span>
                                        <div class="y-box item-inner">
                                        	
                                            <div class="rbox ">
                                                <div class="rbox-inner">
                                                    <div class="title-box" ga_event="article_title_click">
                                                    <img alt="" src="<%=basePath%>static/images/point.png">
                                                        <a class="link title" target="_blank"
                                                           href="${content.link }">
                                                            ${content.title} </a>
                                                    </div>
                                                    <div class="y-box summary">
                                                       ${content.summary}
                                                    </div>
                                                    <div class="y-box footer">
                                                        <div class="y-left">
                                                           
                                                            <span class="lbtn">&nbsp;${content.source}</span>
                                                            <span>&nbsp;<fmt:formatDate value="${content.pubtime}" type="date"/></span>
                                                        </div>
                                                        <div class="y-right">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="item"><span id="ad_extra" style="display:none;"></span>
                                        <div class="y-box item-inner">
                                            	暂无新闻
                                        </div>
                                    </li>
                                    </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                        <div riot-tag="wcommonFeed" category="__all__" abtype="1"></div>
                    </div>
                </div>
            </div>
            <!-- content end -->

        </div>
        <!-- main end -->
        <div class="action-feedback">
            <div riot-tag="feedback" class="feedback">
                <ul class="">
                    <li class="tool-item go-top"><a href="javascript:window.scrollTo( 0, 0 );"> <i class="y-icon icon-backtotopfeed"></i> </a>
                    </li>
                </ul>
            </div>
        </div>
        <div riot-tag="verification"></div>

        
        
         <script>
         var curpage = 1;
         var totalpage = $("#pagesize").val();
         var geturl = '<%=basePath%>App/newList.do?&page=';
         
         $(function(){        
        	 $(window).scroll(function(){            
        		 $offset = $('#subchannel').offset();//不能用自身的div，不然滚动起来会很卡     
        		 if($(window).scrollTop()>78){ 
//         			 $('#left-channel-click').css({
//         				 'position':'fixed',                
//         				 'top':'0px',                
// //         				 'left':$offset.left+'px',                
//         				 'z-index':'999'                
//         				 });
						$("#left-channel-click").addClass("channel-fixed");
						
        			 }else{
//         				 $('#left-channel-click').removeAttr('style'); 
        				 $("#left-channel-click").removeClass("channel-fixed");
        				 }        
        		 });  
        	 
        	//日期框
 			$('.date-picker').datepicker();
 			
 			//下拉框
 			$(".chzn-select").chosen(); 
 			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
 			
 			//复选框
 			$('table th input:checkbox').on('click' , function(){
 				var that = this;
 				$(this).closest('table').find('tr > td:first-child input:checkbox')
 				.each(function(){
 					this.checked = that.checked;
 					$(this).closest('tr').toggleClass('selected');
 				});
 					
 			});
        	 
        	 
        	 })
        	 
        	 
        	 
        
        			
         </script>
         
    
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>static/js/news/scrollpagination.js"></script>
	<!--引入弹窗组件start-->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script type="text/javascript" src="<%=basePath%>plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugins/attention/zDialog/zDialog_main.js"></script>
	<script type="text/javascript">
	function userInfo(userID){
   	 var diag = new Dialog();

//    	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="个人资料";
	 diag.URL = '<%=basePath%>user/goAppEditU.do?USER_ID='+userID+'&fx=head';
	 diag.Width = 230;
	 diag.Height = 400;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
   	 
    }
	
	//检索
	function search(){
		top.jzts();
		$("#tjForm").submit();
	}
	
	//生成报表
	function createReport(){
		var keywords = $("#keywords").val();
		var province  = $("#province").val();
		var inerttime = $("#inerttime").val();
		console.log(keywords);
		console.log(province);
		console.log(inerttime);
		$.ajax({
			  type: 'POST',
			  url: "App/createReport.do",
			  data: {
				  "keywords":keywords,
				  "province":province,
				  "inerttime":inerttime
			  },
			  success: function(msg){
				  $("#export").attr("href",msg.filePath); 
				  alert("报表生成成功");
			  },
			  dataType: "JSON"
			});
		
	}
	
	function check(){
		var href = $("#export").attr("href");
		if(href  == null || href == undefined || href == '' ){
			alert("请先生成报表,再下载");
			return false;
		}
	}
	
	</script>
	

    </div>
</div>
</body>
</html>