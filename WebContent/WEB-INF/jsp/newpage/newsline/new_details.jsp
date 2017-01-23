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
<meta http-equiv="Access-Control-Allow-Origin" content="*"> 
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>static/css/timeLine.css" />
</head>
<body>
	<div class="container">
        <div class="main">
            
	            	
			                    <div class="cbp_tmlabel" id="content">
			                        <iframe   
			                        name="ifr1" 
			                        id="ifr1" 
			                        frameborder="0" 
			                        scrolling="auto"  
			                        src="${pd.link}" 
			                        width="900px" 
			                        height="680px"
			                        >
			                        </iframe>
			                    </div>
			           
        </div>
    </div>
	 
    <script type="text/javascript">
    	$(top.hangge());
  	 
    	
    </script>
</body>
</html>