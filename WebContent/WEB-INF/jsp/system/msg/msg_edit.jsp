<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		

	</head>
<body>
		<form action="msg/editMsg.do" name="form1" id="form1"  method="post">
			<input type="hidden" name="id" id="id" value="${pd.id }"/>
			<div id="zhongxin">
			<table>
				<tr>
					<td>
						<span>收件人邮箱</span>
						<input type="text" name="sendToMail" id="sendToMail" placeholder="这里输收件人邮箱" title="邮箱" value="${pd.send_to_mail} "/>
					</td>
				</tr>
				<tr>
					<td>
						<span>邮件主题</span>
						<input type="text"  name="subject" id="subject" placeholder="这里输入邮件主题" title="邮件主题" value="${pd.subject}"/>
					</td>
				</tr>
				<tr>
					<td>
						<span>触发报警关键字</span>
						<input type="text"  name="keyWord" id="keyWord" placeholder="触发报警关键字" title="关键字" value="${pd.key_word}"/>
					</td>
				</tr>
				<tr>
					<td>
						<span>阈值</span>
						<input type="number"  name="threshold" id="threshold" placeholder="阈值" title="阈值" value="${pd.threshold}"/>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
			</div>
		</form>
	
	<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
		<!-- 引入 -->
		<script src="static/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript">
	top.hangge();
	//保存
	function save(){
		
			$("#form1").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	}
	
	
</script>
</body>
</html>
