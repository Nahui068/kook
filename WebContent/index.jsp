<%@page import="kook.PurchaseDAO"%>
<%@page import="java.util.List"%>
<%@page import="kook.RecipeDTO"%>
<%@page import="kook.RecipeListDAO"%>
<%@page import="kook.MemberDAO"%>
<%@page import="kook.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
		try{
					String main_id = (String)session.getAttribute("kook_member_id");
					if (main_id != null) {	
							// ID 세션정보 확인하여 회원 로그인 상태 확인 -> 로그인 유지상태일 때
							response.sendRedirect("/kook/main/main.jsp");
					}else{
							
					}
%>

<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Ko-oK &mdash; Korean-Cooking</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Bootstrap DateTimePicker -->
	<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="gtco-loader"></div>
	
	<div id="page">

<%-- ########################################### ########### ######################################################## --%>	
<%-- ###########################################    Menu Bar    ######################################################## --%>		
<%-- ########################################### ########### ######################################################## --%>
	 <div class="page-inner"> 
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo"><a href="/kook/index.jsp">Ko - oK <em>.</em></a></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					<ul>
						<li><a href="/kook/main/main.jsp">Main</a></li>
						<li class="has-dropdown">
							<a href="/kook/recipe/recipe.jsp">Recipes</a>
							<ul class="dropdown">
								<li><a href="/kook/recipe/dish.jsp">Dish Recipe</a></li>
								<li><a href="/kook/recipe/level.jsp">Level Recipe</a></li>
								<li><a href="/kook/recipe/recommend.jsp">Recommend Recipe</a></li>
							</ul>
						</li>
						<li><a href="/kook/shop/shop.jsp">Shop</a></li>
						<li><a href="/kook/service/service.jsp">Service</a></li>
						<li class="btn-cta"><a href="/kook/register/register.jsp"><span>Register</span></a></li>
					</ul>	
				</div>
			</div>
		</div>
	</nav>
	
<%-- ########################################### ########### ######################################################## --%>	
<%-- ###########################################   Top Display  ######################################################## --%>		
<%-- ########################################### ########### ######################################################## --%>	
	<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(images/kook_backimg_999.jpg)" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
					

					<div class="row row-mt-15em">
						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
							<span class="intro-text-small">Hand-crafted by <a href="http://www.gith.co.kr/" target="_blank">Global IT 인재개발원 'Team No.2 in C - Class'</a></span>
							<h1 class="cursive-font">All in good Cooking!</h1>	
						</div>
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
											<h3 class="cursive-font">Log-in to <br /> "Korean - Cooking" !</h3>
											<form name = "login" action="/kook/main/loginPro.jsp">
												<div class="row form-group">
													<div class="col-md-12">
														<label class="sr-only" for="id">ID</label>
														<input type="text" name = "id" id="id" class="form-control" placeholder="Enter Your ID" tabindex = "1" />
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label class="sr-only" for="pw">Password</label>
														<input type="password" name = "pw" id="pw" class="form-control" placeholder="Enter Your Password" tabindex = "2" />
													</div>
												</div>
												
												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary btn-block" value="LOG - IN" tabindex = "3" />
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<input type="button" class="btn btn-primary btn-block" value="Find ID / PW" tabindex = "4" onClick = "location.href = '/kook/main/find_id_pw.jsp' " />
													</div>
												</div>
											</form>	
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
							
				</div>
			</div>
		</div>
	</header>
<%-- ########################################### ########### ######################################################## --%>	
<%-- ########################################### Header - End ######################################################## --%>		
<%-- ########################################### ########### ######################################################## --%>	

<%
	List recipeList = null;
	List recoList = null;
	List portionList = null;
	
	RecipeListDAO relidao = new RecipeListDAO();
	RecipeDTO redto1 = new RecipeDTO();
	RecipeDTO redto2 = new RecipeDTO();
	RecipeDTO redto3 = new RecipeDTO();

	recipeList = relidao.getAll_recipe();
	recoList = relidao.getDish_best_Reco();
	portionList = relidao.getPortion_One_recipe("1");
%>

<%-- ################################################################################################################## --%>
<%-- ################################################# 최신 레시피 ###################################################### --%>
<%-- ################################################################################################################## --%>	
	<div class="gtco-section">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 class="cursive-font primary-color">New Recipes</h2>
					<p>These are newly registered Korean recipes.</p>
				</div>
			</div>
				
			<div class="row">
					
<%
				redto1 = (RecipeDTO)recipeList.get(0);
				if(redto1 != null){
%>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?difficulty=<%=redto1.getDifficulty()%>&num=<%=redto1.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto1.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto1.getSubject() %></h2>
							<p>1st New Recipe</p>
						</div>
					</a>
				</div>
				
<%
				}
				redto1 = (RecipeDTO)recipeList.get(1);
				if(redto1 != null){
%>				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?difficulty=<%=redto1.getDifficulty()%>&num=<%=redto1.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto1.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto1.getSubject() %></h2>
							<p>2nd New Recipe</p>
						</div>
					</a>
				</div>
				
<%
				}
				redto1 = (RecipeDTO)recipeList.get(2);
				if(redto1 != null){
%>				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?difficulty=<%=redto1.getDifficulty()%>&num=<%=redto1.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto1.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto1.getSubject() %></h2>
							<p>3rd New Recipe</p>
						</div>
					</a>
				</div>
				
<%
				}
				redto1 = (RecipeDTO)recipeList.get(3);
				if(redto1 != null){
%>				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?difficulty=<%=redto1.getDifficulty()%>&num=<%=redto1.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto1.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto1.getSubject() %></h2>
							<p>4th New Recipe</p>
						</div>
					</a>
				</div>
				
<%
				}
				redto1 = (RecipeDTO)recipeList.get(4);
				if(redto1 != null){
%>				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?difficulty=<%=redto1.getDifficulty()%>&num=<%=redto1.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto1.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto1.getSubject() %></h2>
							<p>5th New Recipe</p>
						</div>
					</a>
				</div>
				
<%
				}
				redto1 = (RecipeDTO)recipeList.get(5);
				if(redto1 != null){
%>				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?difficulty=<%=redto1.getDifficulty()%>&num=<%=redto1.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto1.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto1.getSubject() %></h2>
							<p>6th New Recipe</p>
						</div>
					</a>
				</div>
					
<%
				}
%>			
				<ul><li style="color:white;"><a href="/kook/recipe/recipe.jsp">More ..</a></li></ul>
			</div>
		</div>
	</div>

<%-- ################################################################################################################## --%>
<%-- ############################################## 추천순 TOP 4 레시피 ################################################## --%>
<%-- ################################################################################################################## --%>	
	<div id="gtco-features">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
					<h2 class="cursive-font">Recommended Top 3 Recipes</h2>
					<p>These are the four recipes that received the most recommendations.</p>
				</div>
			</div>
			
<%
			redto2 = (RecipeDTO)recoList.get(0);
			if(redto2 != null){
%>							
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?category=<%=redto2.getCategory()%>&num=<%=redto2.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto2.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto2.getSubject() %></h2>
							<p>Recommended 1st Recipe</p>
							<%--<p><span class="price cursive-font">$19.15</span></p> --%>
						</div>
					</a>
				</div>
				
<%
			}
			redto2 = (RecipeDTO)recoList.get(1);
			if(redto2 != null){
%>						
				<div class="col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?category=<%=redto2.getCategory()%>&num=<%=redto2.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto2.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto2.getSubject() %></h2>
							<p>Recommended 2nd Recipe</p>
							<%--<p><span class="price cursive-font">$19.15</span></p> --%>
						</div>
					</a>
				</div>
	
<%
			}
			redto2 = (RecipeDTO)recoList.get(2);
			if(redto2 != null){
%>		
				<div class="col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?category=<%=redto2.getCategory()%>&num=<%=redto2.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto2.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto2.getSubject() %></h2>
							<p>Recommended 3rd Recipe</p>
							<%--<p><span class="price cursive-font">$19.15</span></p> --%>
						</div>
					</a>
				</div>
<%
			}
%>				
				<ul><li style="color: #FBB448;"><a href="/kook/recipe/recommend.jsp" style="color:white;">More ..</a></li></ul>
			</div>
		</div>
	</div>
	
<%-- ################################################################################################################## --%>
<%-- ############################################### 혼밥 레시피 추천 #################################################### --%>
<%-- ################################################################################################################## --%>
	<div class="gtco-section">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 class="cursive-font primary-color">Single-cooker recipes</h2>
					<p>These are single-person recipes for those who live alone.</p>
				</div>
			</div>
			<div class="row">
<%
			redto3 = (RecipeDTO)portionList.get(0);
			if(redto3 != null){
%>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?difficulty=<%=redto3.getDifficulty()%>&num=<%=redto3.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto3.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto3.getSubject() %></h2>
							<p>1st Recipe</p>
						</div>
					</a>
				</div>
				
<%
			}
			redto3 = (RecipeDTO)portionList.get(1);
			if(redto3 != null){
%>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?difficulty=<%=redto3.getDifficulty()%>&num=<%=redto3.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto3.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto3.getSubject() %></h2>
							<p>2nd Recipe</p>
						</div>
					</a>
				</div>
				
<%
			}
			redto3 = (RecipeDTO)portionList.get(2);
			if(redto3 != null){
%>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="/kook/recipe/content.jsp?difficulty=<%=redto3.getDifficulty()%>&num=<%=redto3.getNum()%>" class="fh5co-card-item">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/kook/image/<%= redto3.getThumbnail()%>" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2><%= redto3.getSubject() %></h2>
							<p>3rd Recipe</p>
						</div>
					</a>
				</div>
<%
			}
%>
			</div>
		</div>
	</div>	

<%-- ################################################################################################################## --%>
<%-- ############################################## 사이트 및 팀원 소개 ################################################## --%>
<%-- ################################################################################################################## --%>	
		<div class="gtco-cover gtco-cover-sm" style="background-image: url(images/kook_backimg_999.jpg)"  data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container text-center">
			<div class="display-t">
				<div class="display-tc">
					<h1>&ldquo; Instroduce &mdash;Korean Cooking&mdash; <br />recipes for you ! &rdquo;</h1>
					<p>&mdash; Team 2 of C-Class, Global IT.</p>
					<p>&mdash; Jeon Min Ki.</p>
					<p>&mdash; Kim Na hee.</p>
					<p>&mdash; Lee Geon Woo.</p>
					<p>&mdash; Kim Tae Eon.</p>
					<p>&mdash; Baek Yun Jeong.</p>
				</div>	
			</div>
		</div>
	</div>
	
	<%-- ################################################################################################################## --%>
	<%-- ############################################## Fun Facts (카운트맵) ################################################## --%>
	<%-- ################################################################################################################## --%>
<%
		MemberDAO mdao = new MemberDAO();
		int totalMembers = mdao.totalMembers();
		
		PurchaseDAO pdao = new PurchaseDAO();
		int totalOrders = pdao.getPurchaseCount();
		
		RecipeListDAO rldao = new RecipeListDAO();
		int totalRecipes = rldao.getAll_Count();
		int totalRecommendation = rldao.getDish_Reco_Count() + rldao.getLevel_recommend_Count();
	
%>

	<div id="gtco-counter" class="gtco-section">
		<div class="gtco-container">
		
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
					<h2 class="cursive-font primary-color">Fun Facts</h2>
					<p>Show you the total count of each item.</p>
				</div>
			</div> 

			<div class="row">
			
				<div class="col-md-3 col-sm-6 animate-box" data-animate-effect="fadeInUp">
					<div class="feature-center">
						<span class="counter js-counter" data-from="0" data-to="<%= totalMembers %>" data-speed="5000" data-refresh-interval="50"></span>
						<span class="counter-label">Members</span>

					</div>
				</div>
				<div class="col-md-3 col-sm-6 animate-box" data-animate-effect="fadeInUp">
					<div class="feature-center">
						<span class="counter js-counter" data-from="0" data-to="<%= totalRecipes %>" data-speed="5000" data-refresh-interval="50"></span>
						<span class="counter-label">Recipes</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 animate-box" data-animate-effect="fadeInUp">
					<div class="feature-center">
						<span class="counter js-counter" data-from="0" data-to="<%= totalOrders %>" data-speed="5000" data-refresh-interval="50"></span>
						<span class="counter-label">Orders</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 animate-box" data-animate-effect="fadeInUp">
					<div class="feature-center">
						<span class="counter js-counter" data-from="0" data-to="<%= totalRecommendation %>" data-speed="5000" data-refresh-interval="50"></span>
						<span class="counter-label">Recommendation</span>
					</div>
				</div>
				
			</div>
		</div>
	</div>
 
<%-- ################################################################################################################## --%>
<%-- ################################################ Bottom Display #################################################### --%>
<%-- ################################################################################################################## --%>	
	<footer id="gtco-footer" role="contentinfo" style="background-image: url(images/kook_backimg_999.jpg)" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row row-pb-md">

				<div class="col-md-12 text-center">
					<div class="gtco-widget">
						<h3>Get In Touch</h3>
						<ul class="gtco-quick-contact">
							<li><a href="http://www.gith.co.kr/"><i class="icon-phone"></i> +82 02 6020 0055</a></li>
							<li><a href="http://www.gith.co.kr/"><i class="icon-mail2"></i> gith_c_0417@gith.co.kr</a></li>
							<li><a href="http://www.gith.co.kr/"><i class="icon-chat"></i> Live Chat</a></li>
						</ul>
					</div>
					<div class="gtco-widget">
						<h3>Get Social</h3>
						<ul class="gtco-social-icons">
							<li><a href="https://twitter.com/explore"><i class="icon-twitter"></i></a></li>
							<li><a href="https://www.facebook.com/"><i class="icon-facebook"></i></a></li>
							<li><a href="https://www.linkedin.com/"><i class="icon-linkedin"></i></a></li>
							<li><a href="https://dribbble.com/"><i class="icon-dribbble"></i></a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-12 text-center copyright">
					<p><small class="block"> '2020.04.17. Global IT 인재개발원.</small> 
						<small class="block">Produced by <a href="http://www.gith.co.kr/" target="_blank">JeonMinKi, KimNaHee, LeeGeonWoo, KimTaeEon, BaekYunJeong</a></small></p>
						
					<p><small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small> 
						<small class="block">Designed by <a href="http://gettemplates.co/" target="_blank">GetTemplates.co</a> Demo Images: <a href="http://unsplash.com/" target="_blank">Unsplash</a></small></p>
				</div>

			</div>

		</div>
	</footer>
	<!-- </div> -->

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>

	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>

	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	
	<script src="js/moment.min.js"></script>
	<script src="js/bootstrap-datetimepicker.min.js"></script>


	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>

<%
		}catch(Exception e){	}
%>