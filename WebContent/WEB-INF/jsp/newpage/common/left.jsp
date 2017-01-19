<%
	String pathl = request.getContextPath();
	String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>
		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
		<div id="sidebar" class="menu-min">

				<div id="sidebar-shortcuts">

					

					<div id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>

				</div><!-- #sidebar-shortcuts -->


				<ul class="nav nav-list">

					<li class="active" id="fhindex">
					  <a href="main/index"><i class="icon-dashboard"></i><span>新闻栏目</span></a>
					</li>


			<c:forEach items="${columnList}" var="column">
				<c:if test="${column.checked}">
				<li id="lm${column.clon_id }">
					  <a style="cursor:pointer;" class="dropdown-toggle" >
						<i class="icon-desktop"></i>
						<span>${column.clon_name }</span>
<!-- 						<b class="arrow icon-angle-down"></b> -->
					  </a>
				</li>
				</c:if>
			</c:forEach>

				</ul><!--/.nav-list-->

				<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>

			</div><!--/#sidebar-->

