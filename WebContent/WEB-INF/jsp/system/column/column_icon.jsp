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
		<!-- 引入App样式文件 -->
		<link rel="stylesheet" href="<%=basePath%>static/css/news/layout.css">
		<link rel="stylesheet" href="<%=basePath%>static/css/news/home.css">	

		<script type="text/javascript">
				
				$(top.hangge());
				//保存
				function save(){
					if($("#MENU_ICON").val()==""){
						alert('请选择图标');
						return false;
					}
					$("#columnForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				}
			function seticon(icon){
				$("#Colimn_ICON").val(icon);
			}	
			
		</script>
		
	</head>
	
	<body>
		<form action="Column/editicon.do" name="columnForm" id="columnForm" method="post">
			<input type="hidden" name="ColumnID" id="ColumnID" value="${pd.ColumnID}"/>
			<input type="hidden" name="Colimn_ICON" id="Colimn_ICON" value=""/>
			<div id="zhongxin">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				
				<tr>
					<td><label onclick="seticon('icon-carchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-carchannel"></i></span></label></td>
					<td><label onclick="seticon('icon-sportschannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-sportschannel"></i></span></label></td>
					<td><label onclick="seticon('icon-technologychannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-technologychannel"></i></span></label></td>
					<td><label onclick="seticon('icon-travelchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-travelchannel"></i></span></label></td>
					<td><label onclick="seticon('icon-videochannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-videochannel"></i></span></label></td>
					<td><label onclick="seticon('icon-hotchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-hotchannel"></i></span></label></td>
					<td><label onclick="seticon('icon-jokechannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-jokechannel"></i></span></label></td>
					<td><label onclick="seticon('icon-socialchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-socialchannel"></i></span></label></td>
					<td><label onclick="seticon('icon-medicinechannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-medicinechannel"></i></span></label></td>
				</tr>
				<tr>
					
					<td><label onclick="seticon('icon-gamechannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-gamechannel"></i></span></label></td>
					<td><label onclick="seticon('icon-storychannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-storychannel"></i></span></label></td>
					<td><label onclick="seticon('icon-articlechannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-articlechannel"></i></span></label></td>
					<td><label onclick="seticon('icon-childcarechannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-childcarechannel"></i></span></label></td>
					<td><label onclick="seticon('icon-entertainmentchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-entertainmentchannel"></i></span></label></td>
					<td><label onclick="seticon('icon-explorechannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-explorechannel"></i></span></label></td>
					<td><label onclick="seticon('icon-fashionchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-fashionchannel"></i></span></label></td>
					<td><label onclick="seticon('icon-financechannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-financechannel"></i></span></label></td>
					<td><label onclick="seticon('icon-foodchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-foodchannel"></i></span></label></td>
				</tr>
				
				
				<tr>
					<td><label onclick="seticon('icon-healthchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-healthchannel"></i></span></label></td>
					<td><label onclick="seticon('icon-historychannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-historychannel"></i></span></label></td>
					<td><label onclick="seticon('icon-imagechannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-imagechannel"></i></span></label></td>
					<td><label onclick="seticon('icon-internationalchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-internationalchannel"></i></span></label></td>
					<td><label onclick="seticon('icon-militarychannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-militarychannel"></i></span></label></td>
					<td><label onclick="seticon('icon-morechannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-morechannel"></i></span></label></td>
					<td><label onclick="seticon('icon-olympicchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-olympicchannel"></i></span></label></td>
					<td><label onclick="seticon('icon-recommandchannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-recommandchannel"></i></span></label></td>
					<td><label onclick="seticon('icon-funnychannel');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="y-icon icon-funnychannel"></i></span></label></td>
				</tr>
				
				
				
				<tr>
				<td style="text-align: center;" colspan="100">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
			</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" /></div>
		</form>
	</body>
</html>