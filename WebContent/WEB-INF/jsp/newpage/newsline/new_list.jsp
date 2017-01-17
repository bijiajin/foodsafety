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
                <li>
                    <time class="cbp_tmtime" datetime="2013-04-10 18:30">
                        <span>4/10/13</span> <span>18:30</span></time>
                    <div class="cbp_tmicon cbp_tmicon-phone">
                    </div>
                    <div class="cbp_tmlabel">
                        <h2>
                            Ricebean black-eyed pea</h2>
                        <p>
                            Winter purslane courgette pumpkin quandong komatsuna fennel green bean cucumber
                            watercress. Pea sprouts wattle seed rutabaga okra yarrow cress avocado grape radish
                            bush tomato ricebean black-eyed pea maize eggplant. Cabbage lentil cucumber chickpea
                            sorrel gram garbanzo plantain lotus root bok choy squash cress potato summer purslane
                            salsify fennel horseradish dulse. Winter purslane garbanzo artichoke broccoli lentil
                            corn okra silver beet celery quandong. Plantain salad beetroot bunya nuts black-eyed
                            pea collard greens radish water spinach gourd chicory prairie turnip avocado sierra
                            leone bologi.</p>
                            <h2></h2>
                            <div class="pull-left">
                                 <i class="icon-hand-right grey bigger-125"></i>
                                 <a href="http://www.sda.gov.cn/WS01/CL0051/168249.html" target="_blank" class="bigger-110">查看详情 &hellip;</a>
                            </div>
                    </div>
                </li>
                
            </ul>
        </div>
    </div>
    <script type="text/javascript">
    	$(top.hangge());
    </script>
</body>
</html>