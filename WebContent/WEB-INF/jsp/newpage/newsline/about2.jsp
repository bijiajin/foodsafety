<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于我们</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>static/css/news/about.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>static/css/news/core.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>static/css/news/aboutnav.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>static/css/news/base.css">
</head>
<body>
	<div id="wrapper">
		<!-- 
		<div id="pagelet-nav" data-test="toutiao.92kaifa.com">
			<div class="nav-inner clearfix">
				<div class="nav-logo">
					<a href="http://toutiao.92kaifa.com/" class="logo-box"
						ga_event="nav_icon"><img
						src="./今日头条 - 关于我们_files/toutiaoweblogo_22cbc60.png" class="logo"></a>
				</div>
				<div class="nav-title">
					<ul class="clearfix">
					</ul>
				</div>
				<div class="nav-subtitle">
					<ul class="nav-list clearfix">
					</ul>
				</div>
			</div>
		</div>
		
		<div id="pagelet-aboutnav">
			<div data-node="toolbarInner" class="inner">
				<div class="toolbar-inner clearfix">
					<ul class="hv-list left clearfix" data-node="curCategory">
						<li class="current"><a class="item selected"
							data-node="about" href="http://toutiao.92kaifa.com/about/"
							ga_event="header" ga_label="about_tab">关于头条</a></li>
						<li><a class="item" data-node="media_partners"
							href="http://toutiao.92kaifa.com/media_partners/"
							ga_event="header" ga_label="about_tab">媒体合作</a></li>
						<li><a class="item" data-node="cooperation"
							href="http://toutiao.92kaifa.com/cooperation/" ga_event="header"
							ga_label="about_tab">产品合作</a></li>
						<li><a class="item" data-node="media_cooperation"
							href="http://toutiao.92kaifa.com/media_cooperation/"
							ga_event="header" ga_label="about_tab">合作说明</a></li>
						<li><a class="item" data-node="contact"
							href="http://toutiao.92kaifa.com/contact/" ga_event="header"
							ga_label="about_tab">联系我们</a></li>
						<li><a class="item" data-node="user_agreement"
							href="http://toutiao.92kaifa.com/user_agreement/"
							ga_event="header" ga_label="about_tab">用户协议</a></li>
						<li><a class="item" data-node="complain"
							href="http://toutiao.92kaifa.com/complain/" ga_event="header"
							ga_label="about_tab">投诉指引</a></li>
						<li><a class="item" data-node="corrupt_report"
							href="http://toutiao.92kaifa.com/corrupt_report/"
							ga_event="header" ga_label="about_tab">廉洁举报</a></li>
					</ul>
				</div>
				<div class="abs_l">
					<a class="btn back" href="http://toutiao.92kaifa.com/"></a>
				</div>
			</div>
		</div>
		 -->
		<div id="container" class="about">
			<div class="inner">
				<p>
					“今日头条”是一款基于数据挖掘技术的个性化推荐引擎产品，它为用户推荐有价值的、个性化的信息，提供连接人与信息的新型服务，是国内移动互联网领域成长最快的产品之一。“今日头条”于2012年8月上线，截至2016年9月底，“今日头条”累计激活用户数已达5.8亿，日活跃用户超过6300万。</p>
				<p>相比于传统的新闻客户端，"今日头条"更适合被称为兴趣媒体，因其有着一项强大的技术武器——推荐引擎。在信息爆炸的时代，人们面对的选择越来越多，选择过多，信息超载，也常常会使人无所适从。在这种情况下，推荐引擎便开始展现技术优势，发挥威力。“今日头条”就是一款基于数据挖掘的推荐引擎产品，也是国内唯一使用推荐引擎做出独立产品的公司。它没有采编人员，不生产内容，没有立场和价值观，运转核心是一套由代码搭建而成的算法。“今日头条”搭建的算法模型会记录用户在今日头条上的每一次行为，基于此计算出用户的喜好，推送他最有可能感兴趣的内容。</p>
				<p>“今日头条”推出了开放的内容创作与分发平台--“头条号”，是针对媒体、国家机构、企业以及自媒体推出的专业信息发布平台，致力于帮助内容生产者在移动互联网上高效率地获得更多的曝光和关注。截至2016年9月底，“头条号”平台的账号数量已超过30万个。</p>
				<p>2012年，今日头条从边缘切入，经过4年地快速发展如今已经跻身新闻资讯客户端第一阵营。“今日头条”会继续努力，成为最懂你的信息平台，连接人与信息，促进创作和交流。</p>
				<p>你关心的，才是头条！</p>
			</div>
		</div>
	</div>
	<div class="company">
		<p class="J-company-name">© 2017 北龙泽达 toutiao.92kaifa.com</p>
		<p>注：本网所有资讯来源于国家食品药品监督管理安全局，每条资讯都真实可靠。</p>
		<p>
			本网致力于食品安全资讯传播，希望建立合作关系。若有任何不当请联系我们，将会在24小时内删除。邮箱：<a
				href="mailto:mp@xxxxxx.com">mp@xxxxxx.com</a>
		</p>
		<span>备案号 统计代码</span>
	</div>
</body>
</html>