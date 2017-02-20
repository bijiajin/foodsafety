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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>static/css/news/layout.css">
<link rel="stylesheet" href="<%=basePath%>static/css/news/home.css">
<script type="text/javascript" src="<%=basePath%>static/js/news/jquery-2.0.3.min.js"></script>
<title>一周要闻</title>
<script>
        var curpage = 1;
        var totalpage = 375;
        var geturl = '/e/extend/list/?classid=47,33,32,31,30,29,28,27,26,25,34,35,36,46,45,44,43,42,41,39,38,37,24,23,10,9,8,7,6,5,4,3,2,11,12,13,22,21,20,19,18,17,16,15,14,1,&orderby=newstime&page=';
    </script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>static/js/scrollpagination.js"></script>
</head>
<body style="min-width: 1220px; overflow-x: hidden;">
	<div class="y-wrap">

    <div class="y-header">
        <div class="header">
            <div riot-tag="topbar" style="height: 24px; background: #ed4040;">
                <div class="y-box topbar">

                </div>
            </div>
            <div class="middlebar">
                <div class="y-box middlebar-inner">
                    <div class="y-left logo-box">
                        <a class="logo-link" href="new_def.do" ga_event="go_home">
                            <img class="logo" id="home-logo" src="<%=basePath%>static/images/logo.png">
                        </a>
                    </div>
                    <div riot-tag="searchbox">
                        <div name="searchBox" class="y-left search-box">
                            <form action="new_def.do" method="post" data-node="searchForm"
                                  target="_blank">
                                <div class="y-box input-group">
                                    <input class="y-left input-text" name="keyboard" autocomplete="off" ga_event="mh_search" type="text" placeholder="请输入关键字" value="">
                                    <div class="y-right btn-submit">
                                        <input type="hidden" name="cloumName" value="${pd.n }">
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
            <div riot-tag="login">
            </div>
            <div id="toast"></div>
        </div>
        <div class="y-box container">
            <div class="y-left index-channel">
                <div riot-tag="channel">
                    <div ga_event="left-channel-click" class="channel">
                        <ul>
                            <li class="channel-item active"><a href="new_def.do?n=jr" > <i
                                    class="y-icon icon-recommandchannel"></i><span>今日关注</span> </a></li>
                            <li class="channel-item "><a href="new_def.do?n=yz" > <i
                                    class="y-icon icon-hotchannel"></i><span>一周要闻</span> </a></li>
                            <li class="channel-item "><a href="new_def.do?n=dg" > <i
                                    class="y-icon icon-videochannel"></i><span>东莞信息</span> </a></li>
                            <li class="channel-item "><a href="new_def.do?n=gd" >
                                <i class="y-icon icon-imagechannel"></i><span>广东信息</span> </a></li>
                            <li class="channel-item "><a href="new_def.do?n=js" > <i
                                    class="y-icon icon-militarychannel"></i><span>检索信息</span> </a></li>

                            
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
                                            <div class="y-left lbox" ga_event="article_img_click">
                                                <a class="img-wrap" target="_blank"
                                                   href="${content.link }"> 
                                                   <img alt="" src="<%=basePath%>static/images/jr.jpg">
                                                </a>
                                            </div>
                                            <div class="rbox ">
                                                <div class="rbox-inner">
                                                    <div class="title-box" ga_event="article_title_click">
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
                    <li class="tool-item go-top"><a href="javascript:;"> <i class="y-icon icon-backtotopfeed"></i> </a>
                    </li>
                </ul>
            </div>
        </div>
        <div riot-tag="verification"></div>

        <!--
         <script>
             riot.mount('topbar', {
                 home: true
             });
             riot.mount('searchbox');
             riot.mount('userbox', {
                 userInfo: userInfo
             });
             riot.mount('login');
         </script>
         <script>
             riot.mount('feedBox', {
                 type: channelType,
                 category: '__all__',
                 feedUrl: use_feed_service,
                 abType: ab_list_style
             });
         </script>
         <script>
             riot.mount('channel', {
                 tag: '__all__' == '__all__' ? '/' : '/' + '__all__' + '/'
             });
             riot.mount('feedback', {});
             riot.mount('verification');
             subchannels && subchannels.length > 0 && riot.mount('subchannel', {
                 subchannels: subchannels,
                 suspension: true
             });
         </script>
         <script>
             riot.mount('adTab');
             riot.mount('hotNews', {hotNews: hotNews});
             riot.mount('hotJoke');
             riot.mount('hotVideo');
             riot.mount('hotPicture');
         </script>

 -->

    </div>
</div>
</body>
</html>