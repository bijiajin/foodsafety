<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>static/css/news/layout.css">
<link rel="stylesheet" href="<%=basePath%>static/css/news/home.css">
<script type="text/javascript" src="<%=basePath%>static/js/news/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/news/ajax.js"></script>
<title>广东信息</title>

</head>
<body style="min-width: 1220px; overflow-x: hidden;">
	<div class="y-wrap">

    <div class="y-header">
        <div class="header ">
            <div riot-tag="topbar" style="height: 37px; background: #ed4040;">
                <div class="y-box topbar">
					<ul class="y-right">
                        <li class="tb-item more">
	                        <a class="tb-link" href="#">
	                        	<img alt="foodsafety" src="<%=basePath%>static/avatars/user.jpg">
	                        	<span style="text-align:center;">${user.NAME}</span>
	                        	
							</a>
                            <div class="layer">
                                <ul>
                                    
                                    <li>
                                    	<a onclick="userInfo('${user.USER_ID}')" class="layer-item" rel="nofollow">
                                    		<i class="y-icon icon-location"></i>
                                    		个人信息
                                    	</a>
                                    </li>
                                    <li>
                                    	<a href="<%=basePath%>logout" class="layer-item" rel="nofollow">
                                    		<i class="y-icon icon-location"></i>退出
                                    	</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="middlebar">
                <div class="y-box middlebar-inner" >
                    <div class="y-left logo-box">
                        <a class="logo-link" href="App/new_def.do" ga_event="go_home">
                            <img class="logo" id="home-logo" src="<%=basePath%>static/login/logo_food.png">
                        </a>
                    </div>
                    <div riot-tag="searchbox">
                        <div name="searchBox" class="y-left search-box">
                            <form action="App/new_def.do" method="post" data-node="searchForm" >
                                <div class="y-box input-group">
                                    <input class="y-left input-text" id="keywords" name="keywords" autocomplete="off" ga_event="mh_search" type="text" placeholder="请输入关键字" value="${pd.keyboard }">
                                    <div class="y-right btn-submit">
                                        <input type="hidden" id="cloumName" name="cloumName" value="${pd.n }">
                                        <input type="hidden" id="pagesize" name="pagesize" value="${page.totalPage }">
                                        <button type="submit" href="javascript:;">
                                            <i class="y-icon icon-search" ga_event="mh_search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            
            <div id="toast"></div>
        </div>
        <div class="y-box container">
            <div class="y-left index-channel">
                <div riot-tag="channel">
                    <div ga_event="left-channel-click" id="left-channel-click" class="channel ">
                        <ul>
<!--                             <li class="channel-item active"><a href="new_def.do?n=jr" > <i -->
<!--                                     class="y-icon icon-recommandchannel"></i><span>今日关注</span> </a></li> -->
<!--                             <li class="channel-item "><a href="new_def.do?n=yz" > <i -->
<!--                                     class="y-icon icon-hotchannel"></i><span>一周要闻</span> </a></li> -->
<!--                             <li class="channel-item "><a href="new_def.do?n=dg" > <i -->
<!--                                     class="y-icon icon-videochannel"></i><span>东莞信息</span> </a></li> -->
<!--                             <li class="channel-item "><a href="new_def.do?n=gd" > -->
<!--                                 <i class="y-icon icon-imagechannel"></i><span>广东信息</span> </a></li> -->
<!--                             <li class="channel-item "><a href="new_def.do?n=js" > <i -->
<!--                                     class="y-icon icon-militarychannel"></i><span>检索信息</span> </a></li> -->
								<c:forEach items="${columnList}" var="column" varStatus="cl">
									<c:if test="${column.checked}">
									 <li class="channel-item active"><a href="App/new_def.do?n=${column.alias }" > <i
                                    class="y-icon ${column.icon}"></i><span>${column.clon_name }</span> </a></li>
                                    </c:if>
								</c:forEach>
                            
                        </ul>
                    </div>
                </div>
                <div riot-tag="nchannel"></div>
            </div>
            <div class="y-left index-content">
                <div riot-tag="tfeedadd"></div>
                <div riot-tag="subchannel" id="subchannel"></div>
                <div riot-tag="feedBox">
                    <div class="feedBox" name="feedBox">
                        <div riot-tag="commonFeed" category="__all__" abtype="1">
                            <div class="commonFeed">
                                <div riot-tag="msgAlert" mwidth="600" mtop="100" category="__all__">
                                </div>
                                <ul class="listNewsTimeLy" scrollpagination="enabled">
                                	<c:choose>
                                	<c:when test="${not empty contentList}">
                                	<c:forEach items="${contentList}" var="content" varStatus="vs">
                                    <li class="item"><span id="ad_extra" style="display:none;"></span>
                                        <div class="y-box item-inner">
                                        	<!-- 
                                            <div class="y-left lbox" ga_event="article_img_click">
                                                <a class="img-wrap" target="_blank" href="${content.link }"> 
                                                   <img alt="" src="<%=basePath%>static/images/point.png">
                                                </a>
                                            </div>
                                             -->
                                            <div class="rbox ">
                                                <div class="rbox-inner">
                                                    <div class="title-box" ga_event="article_title_click">
                                                    <img alt="" src="<%=basePath%>static/images/point.png">
                                                        <a class="link title" target="_blank"
                                                           href="${content.link }">
                                                            ${content.title} </a>
                                                    </div>
                                                    <div class="y-box summary">
                                                       ${content.summary}
                                                    </div>
                                                    <div class="y-box footer">
                                                        <div class="y-left">
                                                            <!--<div class="y-left">-->
                                                                <!--<a class="lbtn tag-hot" ga_event="article_avatar_click"-->
                                                                   <!--href="http://toutiao.92kaifa.com/news_game/">游戏</a>-->
                                                                <!--<a class="lbtn source" ga_event="article_name_click">-->
                                                                    <!--&nbsp;&nbsp;游戏时光VGTIME&nbsp;</a>-->
                                                            <!--</div>-->
                                                            <span class="lbtn">&nbsp;${content.source}</span>
                                                            <span>&nbsp;<fmt:formatDate value="${content.pubtime}" type="date"/></span>
                                                        </div>
                                                        <div class="y-right">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="item"><span id="ad_extra" style="display:none;"></span>
                                        <div class="y-box item-inner">
                                            	暂无新闻
                                        </div>
                                    </li>
                                    </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                        <div riot-tag="wcommonFeed" category="__all__" abtype="1"></div>
                    </div>
                </div>
            </div>

        </div>
        <div class="action-feedback">
            <div riot-tag="feedback" class="feedback">
                <ul class="">
                    <li class="tool-item go-top"><a href="javascript:window.scrollTo( 0, 0 );"> <i class="y-icon icon-backtotopfeed"></i> </a>
                    </li>
                </ul>
            </div>
        </div>
        <div riot-tag="verification"></div>

        
        
         <script>
         var curpage = 1;
         var totalpage = $("#pagesize").val();
         var geturl = '<%=basePath%>App/newList.do?&page=';
         
         $(function(){        
        	 $(window).scroll(function(){            
        		 $offset = $('#subchannel').offset();//不能用自身的div，不然滚动起来会很卡     
        		 if($(window).scrollTop()>78){ 
//         			 $('#left-channel-click').css({
//         				 'position':'fixed',                
//         				 'top':'0px',                
// //         				 'left':$offset.left+'px',                
//         				 'z-index':'999'                
//         				 });
						$("#left-channel-click").addClass("channel-fixed");
						
        			 }else{
//         				 $('#left-channel-click').removeAttr('style'); 
        				 $("#left-channel-click").removeClass("channel-fixed");
        				 }        
        		 });  
        	 
        	 
        	 })
        	 
        	 
        	 
        
        			
         </script>
         
    
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>static/js/news/scrollpagination.js"></script>
	<!--引入弹窗组件start-->
	<script type="text/javascript" src="<%=basePath%>plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugins/attention/zDialog/zDialog_main.js"></script>
	<script type="text/javascript">
	function userInfo(userID){
   	 var diag = new Dialog();

//    	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="个人资料";
	 diag.URL = '<%=basePath%>user/goAppEditU.do?USER_ID='+userID+'&fx=head';
	 diag.Width = 230;
	 diag.Height = 400;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
   	 
    }
	</script>


    </div>
</div>
</body>
</html>