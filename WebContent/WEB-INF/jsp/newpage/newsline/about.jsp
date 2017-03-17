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
                                    	<a  class="layer-item" rel="nofollow">
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
                    

                </div>
            </div>
            
            <div id="toast"></div>
        </div>
        <div class="y-box container">
            <div class="y-left index-channel">
                <div riot-tag="channel">
                    <div ga_event="left-channel-click" id="left-channel-click" class="channel ">
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
                                <div riot-tag="msgAlert" mwidth="600" mtop="100" category="__all__">                                </div>
                                <div id="container" class="about">
			<div class="inner">
				<p>
					食品安全（food safety）指食品无毒、无害，符合应当有的营养要求，对人体健康不造成任何急性、亚急性或者慢性危害。
					根据倍诺食品安全定义，食品安全是“食物中有毒、有害物质对人体健康影响的公共卫生问题”。
					食品安全也是一门专门探讨在食品加工、存储、销售等过程中确保食品卫生及食用安全，降低疾病隐患，防范食物中毒的一个跨学科领域，
					所以食品安全很重要。 
					2013年12月23日至24日中央农村工作会议在北京举行，习近平在会上发表重要讲话。
					会议强调，能不能在食品安全上给老百姓一个满意的交代，是对执政能力的重大考验。食品安全，是“管”出来的。
				</p>
				<p>
					食品(食物)的种植、养殖、加工、包装、储藏、运输、销售、消费等活动符合国家强制标准和要求，
					不存在可能损害或威胁人体健康的有毒有害物质以导致消费者病亡或者危及消费者及其后代的隐患。
					该概念表明，食品安全既包括生产安全，也包括经营安全；既包括结果安全，也包括过程安全；既包括现实安全，也包括未来安全
				</p>
				<p>
					食品安全的含义有三个层次：<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第一层<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;食品数量安全，即一个国家或地区能够生产民族基本生存所需的膳食需要。要求人们既能买得到又能买得起生存生活所需要的基本食品。<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二层<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;食品质量安全：指提供的食品在营养，卫生方面满足和保障人群的健康需要，食品质量安全涉及食物的污染、是否有毒，添加剂是否违规超标、
					标签是否规范等问题，需要在食品受到污染界限之前采取措施，预防食品的污染和遭遇主要危害因素侵袭。<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第三层<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;食品可持续安全：这是从发展角度要求食品的获取需要注重生态环境的良好保护和资源利用的可持续。
				</p>
				
				<p>
					食品安全是大家都关注的话题，在关注食品本身的同时，大家还应该去关注一些安全标识。
					英文Quality Safety（质量安全）的缩写，获得食品质量安全生产许可证的企业，其生产加工的食品经出厂检验合格的，
					在出厂销售之前，必须在最小销售单元的食品包装上标注由国家统一制定的食品质量安全生产许可证编号并加印或者加贴食品质量安全市场准入标志“QS”。
					食品质量安全市场准入标志的式样和使用办法由国家质检总局统一制定，该标志由“QS”和“质量安全”中文字样组成。
					标志主色调为蓝色，字母“Q”与“质量安全”四个中文字样为蓝色，字母“S”为白色，使用时可根据需要按比例放大或缩小，
					但不得变形、变色。加贴（印）有“QS”标志的食品，即意味着该食品符合了质量安全的基本要求。
				</p>
				<p>关注食品安全，关注他人健康！</p>
			</div>
			<div class="company">
				<p class="J-company-name">© 2017 北龙泽达 www.zedata.com</p>
				<p>注：本网所有资讯来源于国家食品药品监督管理安全局，每条资讯都真实可靠。</p>
				<p>
					本网致力于食品安全资讯传播，希望建立合作关系。若有任何不当请联系我们，将会在24小时内删除。邮箱：<a
						href="mailto:mp@xxxxxx.com">mp@xxxxxx.com</a>
				</p>
				<span>备案号 统计代码</span>
		</div>
		</div>
                            </div>
                        </div>
                        <div riot-tag="wcommonFeed" category="__all__" abtype="1"></div>
                    </div>
                </div>
            </div>

        </div>
        
        
        <div riot-tag="verification"></div>

        
        
         
	


    </div>
</div>
</body>
</html>