<%-- 상단 로고 및 메뉴 바 // 각 페이지에 include 할 페이지--%>
<%-- 작성자 : 전민기 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import = "kook.WarehousingDTO" %>
<%@ page import = "kook.WarehousingDAO" %>
<%@ page import = "java.util.List" %>
<%
	String main_id = (String)session.getAttribute("kook_member_id");
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	Date nowTime = sdf.parse(sdf.format(date));
	
	WarehousingDAO wdao = new WarehousingDAO();
	
	List wareList = null;
	
	wareList = wdao.getWarehousing();
	
	for (int i = 0; i < wareList.size(); i++) {
		WarehousingDTO wdto = new WarehousingDTO();
		wdto = (WarehousingDTO)wareList.get(i);
	
		Date ExTime= sdf.parse(wdto.getExpiration());
		long diffDay = (ExTime.getTime() - nowTime.getTime()) / (24*60*60*1000);
		wdao.update_during(wdto.getExpiration(), diffDay);
	
	}
%>
		
	<head>
	<style type="text/css">	
		a:link { color: black; text-decoration: none;	}
		a:visited { color: black; text-decoration: none;	}
		a:hover{ color: black; text-decoration: none;	}
	</style>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
			
	<!-- Animate.css -->
	<link rel="stylesheet" href="/kook/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/kook/css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="/kook/css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/kook/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="/kook/css/magnific-popup.css">

	<!-- Bootstrap DateTimePicker -->
	<link rel="stylesheet" href="/kook/css/bootstrap-datetimepicker.min.css">



	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="/kook/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/kook/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="/kook/css/style.css">

	<!-- Modernizr JS -->
	<script src="/kook/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="/kook/js/respond.min.js"></script>
	<![endif]-->
	
	<style>
		nav.box{
			background: #4d4d4d;;
			height:80px;
			margin : 0 auto;		
		}

		#menu li ul li a{display:inline-block; background : #4d4d4d; padding:5px;}

		#menu li ul.recipe{
			background: #4d4d4d;
			right:300px;
			display:none;
			height:150px;
			padding:0px;
			margin:0px;
			border:0px;
			position:absolute; 
			width:150px;
			z-index:200;
		}

		#menu > ul> li:hover > ul{display:block;}
		
	
	</style>
	
	</head>
		<body>
		<nav class="gtco-nav box" role="navigation">
			
			<div class="gtco-container">
				<div class = "row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo"><a href="/kook/index.jsp">Ko - oK <em>.</em></a></div>
				</div>	
						
				<div id = "menu" class="col-xs-8 text-right menu-1">
					<ul>
<%
						if("admin".equals(main_id)){
%>
							<li class ="btn-cta"><a href="/kook/admin/admin.jsp">Administrator</a></li>
<%										
						}
%>
						<li>
							<a href="/kook/recipe/recipe.jsp">Recipes</a>
							<ul class="recipe">
								<li><a href="/kook/recipe/dish.jsp">Dish Recipe</a></li>
								<li><a href="/kook/recipe/level.jsp">Level Recipe</a></li>
								<li><a href="/kook/recipe/recommend.jsp">Recommend Recipe</a></li>
							</ul>
						</li>
						<li><a href="/kook/shop/shop.jsp">Shop</a></li>
						<li><a href="/kook/service/service.jsp">Service</a></li>
<%						
						if (main_id != null) {
%>
						<li class="btn-cta"><a href="/kook/mypage/mypage.jsp"><span>My-Page</span></a></li>
						<li class="btn-cta"><a href="/kook/main/logout.jsp">Log-out</a></li>
<%						
						}else{
%>
						<li class="btn-cta"><a href="/kook/main/login.jsp">Log-in</a></li>
<%
						}
%>					
					</ul>	
				</div>
			</div>		
		</div>
	</nav>
	
	<br /><br />