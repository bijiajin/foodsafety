<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>static/css/timeLine.css" />
</head>
<body>

	
			
	<!-- 时间轴 -->
	<div class="container">
        
        
			<div class="main">
			<!-- 检索  -->
			<form action="App/new_default.do" method="post" name="cententForm" id="cententForm">
			<input type="hidden" name="clon_name" value="${pd.clon_name }">
			<table align="center" style="margin-top: 10px">
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" style="height: 31px!important;" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
						</span>
					</td>
					<td style="vertical-align:top;"> 
					 	<input autocomplete="off" style="height: 31px!important;" id="nav-search-input" type="text" name="title" value="${pd.title }" placeholder="这里输入标题关键词" />
					</td>
					<td style="vertical-align:top;"> 
					 	<input autocomplete="off" style="height: 31px!important;" id="nav-search-input" type="text" name="content" value="${pd.content }" placeholder="这里输入内容关键词" />
					</td>
					
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					
				</tr>
			</table>
			<!-- 检索  -->
<!-- 			<div class="main"> -->
            <ul class="cbp_tmtimeline">
            	<c:choose>
	            	<c:when test="${not empty contentList}">
	            		<c:forEach items="${contentList}" var="content" varStatus="vs">
	            			<li>
			                    <time class="cbp_tmtime" datetime="${content.pubtime}">
			                        <span>
			                        	<fmt:formatDate value="${content.pubtime}" type="date"/>
			                        </span> 
			                        <span>
			                        	<fmt:formatDate value="${content.pubtime}" type="time"/> 
			                        </span>
			                    </time>
			                    <div class="cbp_tmicon cbp_tmicon-phone">
			                    </div>
			                    <div class="cbp_tmlabel">
			                        <h2>
			                        	<span>${content.title}</span>
			                        	<br/>
			                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                            
			                            
			                            <span>来源：${content.source}</span>
			                        </h2>
			                        <p>
			                        	${content.summary}
			                         </p>
			                         <h2></h2>
			                         <div class="pull-left">
			                             <i class="icon-hand-right grey bigger-125"></i>
<%-- 			                             <a href="${content.link}" target="_blank" class="bigger-110">查看详情 &hellip;</a> --%>
<%-- 			                             <a title="查看详情" onclick="checkLink('${content.link }');" class="bigger-110">查看详情 &hellip;</a> --%>
			                        	<a  title="查看详情" onclick="checkDetails('${content.infoid }');" class="bigger-110">查看详情 &hellip;</a>
			                         </div>
			                    </div>
			                </li>
	            		</c:forEach>
	            	</c:when>
	            	<c:otherwise>
	            		<li>
                    <time class="cbp_tmtime" datetime="2013-04-10 18:30">
                        <span>4/10/13</span> <span>18:30</span></time>
                    <div class="cbp_tmicon cbp_tmicon-phone">
                    </div>
                    <div class="cbp_tmlabel">
                    	<h2>没有相关新闻</h2>
                        <p>
                        
                            	
                        </p>
                    </div>
                </li>
	            	</c:otherwise>
            	</c:choose>
                
            </ul>
<!--              </div> -->
             <!-- 分页 -->
    <div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
    </form>
       </div>
    </div>
   
    <!-- 时间轴 -->

    <!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
	<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		
		
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		
    <script type="text/javascript">
    	$(top.hangge());
    	
    	function checkDetails(infoid){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新闻详情";
			 diag.URL = '<%=basePath%>App/checkDetails.do?infoid='+infoid;
			 diag.Width = 1055;
			 diag.Height = 680;
			 diag.CancelEvent = function(){ //关闭事件
				
				diag.close();
			 };
			 diag.show();
		}
    	
    	function checkLink(link){
			 top.jzts();
			 var diag = new Dialog();
			 diag.Drag=true;
			 diag.Title ="新闻详情";
			 diag.URL = link;
			 diag.Width = 1055;
			 diag.Height = 680;
			 diag.CancelEvent = function(){ //关闭事件
				
				diag.close();
			 };
			 diag.show();
		}
    	$("#toGoPage").css({width: "60px",height: "30px"})
    </script>
</body>
</html>