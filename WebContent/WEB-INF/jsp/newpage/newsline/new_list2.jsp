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
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="renderer" content="webkit">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../system/admin/top.jsp"%>

<style type="text/css">
		p{
			margin: 0;
			padding: 0;
		}
		ul li{  
list-style-type:none;  
}  
		.data-item{
			 border: 0;
       border-bottom: 1px solid #f5f6f7;
       /*border-bottom: 1px solid #000; */
       margin-top: 5px;
		}
		.data-group-text .data-group-text-title a{
        font-size: 20px;
        font-weight: bold;
        color: #222;
		margin-top: 0;
    }
    .data-group-text-content p{
    	font-size:15px;
    }
    .data-group-img img{
    	display: inline-block;
    	width: 126px;
    	height: 82px;
    	margin-top: 5px;
    }
		.data-group-img + .data-group-text{  /* 加号+用于选择兄弟元素 */
				margin-left: 140px;

		}
		.data-group-text-footer-right a{
				color: #999;
				margin-left: 5px;
		}
		.data-group-text-footer-left span{
				color: #999;
				font-size: 10px;
		}


	</style>
</head>
<body>

<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	<form action="App/new_default.do" method="post" name="cententForm" id="cententForm">
	<!--S 中间列表内容-->
				<div class="col-md-12">
					<ul class="list-group">
					<c:choose>
					<c:when test="${not empty contentList}">
					<c:forEach items="${contentList}" var="content" varStatus="vs">
						<li class="list-group-item data-item">
							<div class="data-group">
								<div class="data-group-text">
									<div class="data-group-text-title">
										<a onclick="checkDetails('${content.infoid }');" class="bigger-110">${content.title}</a>
									</div>
									<div class="data-group-text-content">
<!-- 										<font size="3"> -->
											<p>${content.summary}...</p>
<!-- 										</font> -->
										 
									</div>
									<div class="data-group-text-footer">
										<div class="data-group-text-footer-left pull-left">
											<span>${content.source}．</span>
                      						
                      						<span>．<fmt:formatDate value="${content.pubtime}" type="date"/></span>
										</div>
										
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
						</c:when>
						<c:otherwise>
	            		<li>
                   
                    <div class="cbp_tmlabel">
                    	<h2>没有相关新闻</h2>
                        <p>
                        
                            	
                        </p>
                    </div>
                </li>
	            	</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- 分页 -->
    <div class="page-header position-relative">
		<table style="width:100%;">
			<tr align="center">
				<td style="vertical-align:top;"><div class="pagination" style="padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
		</form>
				<!--E 中间列表内容-->
			</div>
			</div>
			</div>
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
			 diag.Height = 880;
			 diag.CancelEvent = function(){ //关闭事件
				
				diag.close();
			 };
			 diag.show();
		}
    	$("#toGoPage").css({width: "60px",height: "20px"})
    </script>
</body>
</html>