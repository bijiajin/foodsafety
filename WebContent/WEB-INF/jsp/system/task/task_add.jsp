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
		
<script type="text/javascript">
	top.hangge();
	//保存
	function save(){
		if($("#columnName").val()==""){
			$("#columnName").tips({
				side:3,
	            msg:'请输入栏目名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#columnName").focus();
			return false;
		}
		if($("#alias").val()==""){
			$("#alias").tips({
				side:3,
	            msg:'请输入栏目别名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#alias").focus();
			return false;
		}
		
		
			$("#form1").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	}
	
	
</script>
	</head>
<body>
		<form action="task/add.do" name="form1" id="form1"  method="post">
			
			<div id="zhongxin">
			<table>
				<tr>
					<td>任务名称</td>
					<td>
						<input type="text" name="jobName"  id="jobName" placeholder="这里输入任务名称" title="名称" value=""/>
					</td>
					<td>任务组</td>
					<td>
						<input type="text" name="jobGroup" id="jobGroup"  placeholder="这里输入任务组" title="任务组" value=""/>
					</td>
				</tr>
				
				<tr>
					<td>状态</td>
					<td>
						<select class="input_txt"  name="jobStatus" id="jobStatus" data-placeholder="请选择状态" >
							<option value="1" >开启</option>
							<option value="2" >停止</option>
						</select>
					</td>
					<td>是否同步</td>
					<td>
						<select class="input_txt"  name="isConcurrent" id="isConcurrent" data-placeholder="请选择是否同步" >
							<option value="1" >是</option>
							<option value="2" >否</option>
						</select>
					</td>
		
				</tr>
				
				<tr>
					<td>cron表达式</td>
					<td >
						<input type="text" name="cronExpression" id="cronExpression" placeholder="这里输入定时表达是" title="定时器执行规则" value=""/>
					</td>
					<td>类路径</td>
					<td >
						<input type="text" name="beanClass" id="beanClass" placeholder="这里输入定时器需要执行任务类包路径" title="包路径" value=""/>
					</td>
					
				</tr>
				<tr>
					<td>spring id</td>
					<td>
						<input type="text" readonly="readonly" name="springId" id="springId" placeholder="这里输入spring ID" title="spring id" value=""/>
					</td>
					<td>方法名</td>
					<td><input type="text"  name="methodName" id="methodName" placeholder="这里输入需要执行的方法名" title="方法名" value=""/></td>
				</tr>
				<tr>
					<td>描述</td>
					<td >
<!-- 						<input type="text" name="description" id="description" placeholder="这里输入任务描述" title="描述" value=" "/> -->
						<textarea rows="3" cols="100" name="description" id="description" placeholder="这里输入任务描述" title="描述"></textarea>
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
</body>
</html>
