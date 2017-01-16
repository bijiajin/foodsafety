<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
 <title>时间轴</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- basic styles -->

    <link href="<%=basePath%>static/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath%>static/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="<%=basePath%>static/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

    <!-- ace styles -->

    <link rel="stylesheet" href="<%=basePath%>static/css/ace.min.css" />
    <link rel="stylesheet" href="<%=basePath%>static/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="<%=basePath%>static/css/ace-skins.min.css" />

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=basePath%>static/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="<%=basePath%>static/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="<%=basePath%>static/js/html5shiv.js"></script>
    <script src="<%=basePath%>static/js/respond.min.js"></script>
    <![endif]-->
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
                                                    <img alt="Susan't Avatar" src="<%=basePath%>static/avatars/avatar1.png" />
                                                    <span class="label label-info label-sm">16:22</span>
                                                </div>

                                                <div class="widget-box transparent">
                                                    <!--新闻标题-->
                                                    <div class="widget-header widget-header-small">
                                                        <h5 class="smaller">
                                                            <a href="#" class="blue">新闻标题</a>
                                                            <span class="grey">总局通告7批次食品不合格</span>
                                                            <br />
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
                                                    <img alt="Susan't Avatar" src="<%=basePath%>static/avatars/avatar1.png" />
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

<!-- basic scripts -->

<!--[if !IE]> -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='<%=basePath%>static/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='<%=basePath%>static/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='<%=basePath%>static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="<%=basePath%>static/js/bootstrap.min.js"></script>
<script src="<%=basePath%>static/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!-- ace scripts -->

<script src="<%=basePath%>static/js/ace-elements.min.js"></script>
<script src="<%=basePath%>static/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

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
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
