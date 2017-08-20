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
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%> 
	<!-- 引入App样式文件 -->
		<link rel="stylesheet" href="<%=basePath%>static/css/news/layout.css">
		<link rel="stylesheet" href="<%=basePath%>static/css/news/home.css">
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="Column/coluList.do" method="post" name="columnForm" id="columnForm">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="clon_name" value="${pd.clon_name }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="clon_state" id="clon_state" data-placeholder="请选择状态" style="vertical-align:top;width: 120px;">
							<option value=""></option>
							<option value="">全部</option>
							<option value="1" <c:if test="${pd.clon_state==1}">selected</c:if>>启用</option>
							<option value="2" <c:if test="${pd.clon_state==2}">selected</c:if>>禁用</option>
					  	</select>
					</td>
					<c:if test="${QX.cha == 1 }">
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					</c:if>
				</tr>
			</table>
			<!-- 检索  -->
		
		
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th>序号</th>
						<th>name</th>
						<th>group</th>
						<th>状态</th>
						<th>cron表达式</th>
						<th>描述</th>
						<th>同步否</th>
						<th>类路径</th>
						<th>spring id</th>
						<th>方法名</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty taskList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${taskList}" var="job" varStatus="vs">
									
							<tr>
								<td>${job.jobId }</td>
						<td>${job.jobName }</td>
						<td>${job.jobGroup }</td>
						<td>${job.jobStatus }<c:choose>
								<c:when test="${job.jobStatus=='1' }">
									<a href="javascript:;"
										onclick="changeJobStatus('${job.jobId}','stop')">停止</a>&nbsp;
								</c:when>
								<c:otherwise>
									<a href="javascript:;"
										onclick="changeJobStatus('${job.jobId}','start')">开启</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</td>
						<td>${job.cronExpression }</td>
						<td>${job.description }</td>
						<td>${job.isConcurrent }</td>
						<td>${job.beanClass }</td>
						<td>${job.springId }</td>
						<td>${job.methodName }</td>
						<td>
						<a class='btn btn-mini btn-info' title="编辑" onclick="editTask('${job.jobId }');"><i class='icon-edit'></i></a>
						</td>
							</tr>
						
						</c:forEach>
						</c:if>
						
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="10" class="center">您无权查看</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="10" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
					
				
				</tbody>
			</table>
			
		<div class="page-header position-relative">
		
 		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;">
					<c:if test="${QX.add == 1 }">
					<c:choose>
					<c:when test="${empty taskList}">
					<a class="btn btn-small btn-success" onclick="add();">新增</a>
					</c:when>
						</c:choose>
					</c:if>
					<%-- <c:if test="${QX.del == 1 }">
					<a title="批量删除" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='icon-trash'></i></a>
					</c:if> --%>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		
		</div>
		</form>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
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
		
		//检索
		function search(){
			top.jzts();
			$("#columnForm").submit();
		}
		
		
		
		
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>task/goAdd.do';
			 diag.Width = 600;
			 diag.Height = 350;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		function changeJobStatus(jobId,cmd){
			bootbox.confirm("确定要停止该任务吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>task/changeJobStatus.do?jobId="+jobId+"&cmd="+cmd;
					$.get(url,function(data){
						
						 window.location.reload();
					});
				}
			});
		}
		
		//修改
		function editTask(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 diag.URL = '<%=basePath%>task/goEdit.do?taskId='+id;
			 diag.Width = 600;
			 diag.Height = 350;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delColn(clon_id,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>Column/deleteColn.do?clon_id="+clon_id;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>Column/deleteAll.do',
						    	data: {clon_id:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
						
						
					}
				}
			});
		}
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
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
			
		});
		
		//编辑栏目图标
		function editTb(ColumnID){
			 top.jzts();
		   	 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑图标";
			 diag.URL = '<%=basePath%>Column/toEditicon.do?ColumnID='+ColumnID;
			 diag.Width = 630;
			 diag.Height = 200;
			 diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					top.jzts(); 
					setTimeout("location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		
		
		
		
		
		
		</script>
		
		
		
	</body>
</html>

