<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <div class="main-container-inner">

        <div class="main-content">

            <div class="page-content">

                <div class="row">
                    <div class="col-xs-12">
                        <div id="timeline-1">
                            <div class="row">
                                <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                                    <div class="timeline-container">
                                        <div class="timeline-label">
													<span class="label label-primary arrowed-in-right label-lg">
														<b>Today</b>
													</span>
                                        </div>

                                        <div class="timeline-items">
                                            <div class="timeline-item clearfix">
                                                <div class="timeline-info">
                                                    <img alt="Susan't Avatar" src="assets/avatars/avatar1.png" />
                                                    <span class="label label-info label-sm">16:22</span>
                                                </div>

                                                <div class="widget-box transparent">
                                                    <!--新闻标题-->
                                                    <div class="widget-header widget-header-small">
															<h5 class="smaller">
                                                            <a href="#" class="blue">新闻标题</a>
                                                            <span class="grey">总局通告7批次食品不合格</span>
                                                            &nbsp;
                                                            <a href="#" class="blue">来源</a>
                                                            <span class="grey">国家食药局</span>
                                                        </h5>

                                                        <span class="widget-toolbar no-border">
																	<i class="icon-time bigger-110"></i>
																	16:22
																</span>

                                                        <span class="widget-toolbar">
                                                            <!--
																	<a href="#" data-action="reload">
																		<i class="icon-refresh"></i>
																	</a>
																	-->

																	<a href="#" data-action="collapse">
																		<i class="icon-chevron-up"></i>
																	</a>
																</span>
                                                    </div>
                                                    <!--新闻简介-->
                                                    <div class="widget-body">
                                                        <div class="widget-main">
                                                            调味品、饮料、速冻食品等6类食品500批次样品，抽样检验项目合格样品493批次.
                                                            <div class="space-6"></div>

                                                            <div class="widget-toolbox clearfix">
                                                                <div class="pull-left">
                                                                    <i class="icon-hand-right grey bigger-125"></i>
                                                                    <a href="http://www.sda.gov.cn/WS01/CL0051/168249.html" target="_blank" class="bigger-110">查看详情 &hellip;</a>
                                                                </div>
                                                                <!--
                                                                <div class="pull-right action-buttons">
                                                                    <a href="#">
                                                                        <i class="icon-ok green bigger-130"></i>
                                                                    </a>

                                                                    <a href="#">
                                                                        <i class="icon-pencil blue bigger-125"></i>
                                                                    </a>

                                                                    <a href="#">
                                                                        <i class="icon-remove red bigger-125"></i>
                                                                    </a>
                                                                </div>-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div><!-- /.timeline-items -->
                                    </div><!-- /.timeline-container -->

                                    <div class="timeline-container">
                                        <div class="timeline-label">
													<span class="label label-primary arrowed-in-right label-lg">
														<b>Today</b>
													</span>
                                        </div>

                                        <div class="timeline-items">
                                            <div class="timeline-item clearfix">
                                                <div class="timeline-info">
                                                    <img alt="Susan't Avatar" src="assets/avatars/avatar1.png" />
                                                    <span class="label label-info label-sm">16:22</span>
                                                </div>

                                                <div class="widget-box transparent">
                                                    <!--新闻标题-->
                                                    <div class="widget-header widget-header-small">
                                                        <h5 class="smaller">
                                                            <a href="#" class="blue">新闻标题</a>
                                                            <span class="grey">总局通告7批次食品不合格</span>
                                                        </h5>

                                                        <span class="widget-toolbar no-border">
																	<i class="icon-time bigger-110"></i>
																	16:22
																</span>

                                                        <span class="widget-toolbar">
                                                            <!--
																	<a href="#" data-action="reload">
																		<i class="icon-refresh"></i>
																	</a>
																	-->

																	<a href="#" data-action="collapse">
																		<i class="icon-chevron-up"></i>
																	</a>
																</span>
                                                    </div>
                                                    <!--新闻简介-->
                                                    <div class="widget-body">
                                                        <div class="widget-main">
                                                            调味品、饮料、速冻食品等6类食品500批次样品，抽样检验项目合格样品493批次.
                                                            <div class="space-6"></div>

                                                            <div class="widget-toolbox clearfix">
                                                                <div class="pull-left">
                                                                    <i class="icon-hand-right grey bigger-125"></i>
                                                                    <a href="http://www.sda.gov.cn/WS01/CL0051/168249.html" target="_blank" class="bigger-110">查看详情 &hellip;</a>
                                                                </div>
                                                                <!--
                                                                <div class="pull-right action-buttons">
                                                                    <a href="#">
                                                                        <i class="icon-ok green bigger-130"></i>
                                                                    </a>

                                                                    <a href="#">
                                                                        <i class="icon-pencil blue bigger-125"></i>
                                                                    </a>

                                                                    <a href="#">
                                                                        <i class="icon-remove red bigger-125"></i>
                                                                    </a>
                                                                </div>-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div><!-- /.timeline-items -->
                                    </div><!-- /.timeline-container -->



                                </div>
                            </div>
                        </div>
                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div><!-- /.main-content -->

        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i>
            </div>

            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; Choose Skin</span>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                    <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                    <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                    <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                    <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                    <label class="lbl" for="ace-settings-add-container">
                        Inside
                        <b>.container</b>
                    </label>
                </div>
            </div>
        </div><!-- /#ace-settings-container -->
    </div><!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
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
    jQuery(function($) {
        $('[data-toggle="buttons"] .btn').on('click', function(e){
            var target = $(this).find('input[type=radio]');
            var which = parseInt(target.val());
            $('[id*="timeline-"]').addClass('hide');
            $('#timeline-'+which).removeClass('hide');
        });
    });
</script>
</body>
</html>