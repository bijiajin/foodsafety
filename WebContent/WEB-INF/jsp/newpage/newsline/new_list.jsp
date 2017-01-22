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
	<div class="container">
        <div class="main">
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
			                             <a title="查看详情" onclick="checkLink('${content.link }');" class="bigger-110">查看详情 &hellip;</a>
<%-- 			                        	<a  title="查看详情" onclick="checkDetails('${content.infoid }');" class="bigger-110">查看详情 &hellip;</a> --%>
			                         </div>
			                    </div>
			                </li>
	            		</c:forEach>
	            	</c:when>
            	</c:choose>
                
                
            </ul>
        </div>
    </div>
    <!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
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
			 var diag = new top.Dialog();
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
    </script>
</body>
</html>