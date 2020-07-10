<%-- 관리자 첫 페이지 --%>

<%@page import="kook.WarehousingDTO"%>
<%@page import="kook.WarehousingDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kook.MemberServiceDAO"%>
<%@page import="kook.PurchaseDTO"%>
<%@page import="kook.PurchaseDAO"%>
<%@page import="kook.StockDTO"%>
<%@page import="kook.MemberDAO"%>
<%@page import="kook.ClickRecommendDTO"%>
<%@page import="kook.ClickRecommendDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/main/top/topAdmin.jsp"%>


<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Ko-oK &mdash; Korean-Cooking (Admin)</title>

  <!-- Custom fonts for this template-->
  <link href="/kook/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/kook/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<%-- ######################## 매출 관련 출력 // 작성자 : 백윤정 ########################## --%>

<%
	Date sal_date = new Date();
	
	Calendar sal_cal = Calendar.getInstance();
	Calendar week_cal = Calendar.getInstance();
	
	SimpleDateFormat sal_sdf = new SimpleDateFormat("yyyy-MM-dd");

	sal_cal.setTime(sal_sdf.parse(sal_sdf.format(sal_date)));
	week_cal.setTime(sal_sdf.parse(sal_sdf.format(sal_date)));
	
	String sal_today = sal_sdf.format(sal_cal.getTime()); // 오늘 날짜
	
	sal_cal.add(Calendar.DATE, 1);
	String sal_tomorrow = sal_sdf.format(sal_cal.getTime()); // 내일 날짜
	
	sal_cal.add(Calendar.DATE, -2);
	String sal_yesterday = sal_sdf.format(sal_cal.getTime());
	
	sal_cal.add(Calendar.DATE, -1);
	String bef_yesterday = sal_sdf.format(sal_cal.getTime());
	
	sal_cal.add(Calendar.DATE, -5);
	String sal_week = sal_sdf.format(sal_cal.getTime());
	
	sal_cal.add(Calendar.DATE, -21);
	String sal_month = sal_sdf.format(sal_cal.getTime());
	
	
	String sal_1 = sal_sdf.format(week_cal.getTime()); // 오늘 날짜
	
	week_cal.add(Calendar.DATE, -1);
	String sal_2 = sal_sdf.format(week_cal.getTime()); // 어제 날짜
	
	week_cal.add(Calendar.DATE, -1);
	String sal_3 = sal_sdf.format(week_cal.getTime()); // 2일전 날짜
	
	week_cal.add(Calendar.DATE, -1);
	String sal_4 = sal_sdf.format(week_cal.getTime()); // 3일전 날짜
	
	week_cal.add(Calendar.DATE, -1);
	String sal_5 = sal_sdf.format(week_cal.getTime()); // 4일전 날짜
	
	week_cal.add(Calendar.DATE, -1);
	String sal_6 = sal_sdf.format(week_cal.getTime()); // 5일전 날짜
	
	week_cal.add(Calendar.DATE, -1);
	String sal_7 = sal_sdf.format(week_cal.getTime()); // 6일전 날짜
	
	week_cal.add(Calendar.DATE, -1);
	String sal_8 = sal_sdf.format(week_cal.getTime()); // 7일전 날짜


	PurchaseDAO sal_pdao = new PurchaseDAO();

	int todaySales = sal_pdao.getSales(sal_today, sal_tomorrow);
	int yesterdaySales = sal_pdao.getSales(sal_yesterday,sal_today);
	int weeklySales = sal_pdao.getSales(sal_week, sal_today); //어제부터 일주일
	int monthlySales = sal_pdao.getSales(sal_month, sal_today);  // 어제부터 한 달
	
	int sal_yesda = sal_pdao.getSales(sal_2, sal_1);
	int sal_twoda = sal_pdao.getSales(sal_3, sal_2);
	int sal_threeda = sal_pdao.getSales(sal_4, sal_3);
	int sal_fourda = sal_pdao.getSales(sal_5, sal_4);
	int sal_fiveda = sal_pdao.getSales(sal_6, sal_5);
	int sal_sixda = sal_pdao.getSales(sal_7, sal_6);
	int sal_sevenda = sal_pdao.getSales(sal_8, sal_7);
%>


<%-- ######################## Shop 주문 관련 출력 // 작성자 : 김태언 ########################## --%>
<%
	Date date_t = new Date();
	PurchaseDAO pdao = new PurchaseDAO();
	
	List shopList = null; // shop게시글 저장할 list생성

	Calendar cal_t = Calendar.getInstance();
	SimpleDateFormat sdf_t = new SimpleDateFormat("yyyy-MM-dd");
	cal_t.setTime(sdf_t.parse(sdf_t.format(date_t)));
	
	String today_t = sdf_t.format(cal_t.getTime());		// 오늘 날짜
	
	cal_t.add(Calendar.DATE, 1);
	String tomor_t = sdf_t.format(cal_t.getTime());		// 내일 날짜
	
	cal_t.add(Calendar.DATE, -2);
	String yester_t = sdf_t.format(cal_t.getTime());	// 어제 날짜
	
	cal_t.add(Calendar.DATE, -1);
	String twoDayAgo = sdf_t.format(cal_t.getTime());	// 엊그제 날짜(2일 전)
	
	cal_t.add(Calendar.DATE, -1);
	String threeDayAgo = sdf_t.format(cal_t.getTime());	// 3일 전 날짜
	
	cal_t.add(Calendar.DATE, -1);
	String fourDayAgo = sdf_t.format(cal_t.getTime());	// 4일 전 날짜
	
	cal_t.add(Calendar.DATE, -1);
	String fiveDayAgo = sdf_t.format(cal_t.getTime());	// 5일 전 날짜
	
	cal_t.add(Calendar.DATE, -1);
	String sixDayAgo = sdf_t.format(cal_t.getTime());	// 6일 전 날짜
	
	cal_t.add(Calendar.DATE, -1);
	String weekAgo = sdf_t.format(cal_t.getTime());	// 7일 전 날짜
	
	cal_t.add(Calendar.DATE, -23);
	String monthAgo = sdf_t.format(cal_t.getTime());	// 30일 전 날짜
	
	
	Calendar cal_m = Calendar.getInstance();
	SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd");
	cal_m.setTime(sdft.parse(sdft.format(date_t)));

	cal_m.set(Calendar.DATE,1);
	String month_day = sdft.format(cal_m.getTime());		//매월 1일

	int orderCount_today = pdao.dayCountPurchase(today_t, tomor_t);	// 오늘 주문 수
	int yesterdayPurchaseCount = pdao.dayCountPurchase(yester_t, today_t);	// (어제 - 오늘) 어제 주문 수		
	int twoDayPurchaseCount = pdao.dayCountPurchase(twoDayAgo, yester_t);	 // 2일 전 주문 수
	int orderCount_third = pdao.dayCountPurchase(threeDayAgo, twoDayAgo); // 3일 전
	int orderCount_fourth = pdao.dayCountPurchase(fourDayAgo, threeDayAgo); // 4일 전
	int orderCount_fiveth = pdao.dayCountPurchase(fiveDayAgo, fourDayAgo); // 5일 전
	int orderCount_sixth = pdao.dayCountPurchase(sixDayAgo, fiveDayAgo); // 6일 전
	int orderCount_seventh = pdao.dayCountPurchase(weekAgo, sixDayAgo); // 7일 전
	
	int monthCount = pdao.dayCountPurchase(month_day,tomor_t);	// 한달 전 주문수																	
	
%>


	<%-- ################# 입고/재고 관련 출력 // 작성자 : 김나희, 이건우 ##################### --%>
<% 	
StockDTO stdto2 = new StockDTO();
List stockList2 = null;

WarehousingDAO wa_dao = new WarehousingDAO();
stockList2 = wa_dao.getStock();

int count = 0; 
%>


<% 
for (int i = 0; i < stockList2.size(); i++) {
	
	stdto2 = (StockDTO)stockList2.get(i); 

		if (stdto2.getAmount() <= 10) {	
			count++;
		}
} 


	Date wa_date = new Date();
	SimpleDateFormat wa_sdf = new SimpleDateFormat("yyyyMMdd");
	Date wa_nowTime = wa_sdf.parse(wa_sdf.format(wa_date));
//유통기한 얼마 남지 않은 것 보일 수 있도록 함
	WarehousingDAO wdao3 = new WarehousingDAO();
	WarehousingDTO wdto2 = new WarehousingDTO();
	List wareList2 = null;
	
	wareList2 = wdao3.getWarehousing(); 
	
	int count2 = 0;

	
	for (int i = 0; i < wareList2.size(); i++) {
		wdto2 = (WarehousingDTO)wareList2.get(i);
	
		Date ExTime= wa_sdf.parse(wdto2.getExpiration());
		long diffDay = (ExTime.getTime() - wa_nowTime.getTime()) / (24*60*60*1000);
		
		if (diffDay <= 7) { 
			count2++; 		
		}	
	}
	int goods = count + count2;
%>

	
<%-- ######################### 문의 관련 출력 // 작성자 : 전민기 ############################# --%>
<%
		Date qu_date = new Date();
		MemberServiceDAO qu_dao = new MemberServiceDAO();
		
		Calendar qu_cal = Calendar.getInstance();
		SimpleDateFormat qu_sdf = new SimpleDateFormat("yyyy-MM-dd");
		qu_cal.setTime(qu_sdf.parse(qu_sdf.format(qu_date)));
		
		String qu_tdy = qu_sdf.format(qu_cal.getTime());	// 오늘
		
		qu_cal.add(Calendar.DATE, 1);
		String qu_tomor = qu_sdf.format(qu_cal.getTime());	// 내일
		
		qu_cal.add(Calendar.DATE, -2);
		String qu_yester = qu_sdf.format(qu_cal.getTime());	// 어제
		
		qu_cal.add(Calendar.DATE, -6);
		String qu_week = qu_sdf.format(qu_cal.getTime());	// 7일전
		
		qu_cal.add(Calendar.DATE, -22);
		String qu_month = qu_sdf.format(qu_cal.getTime());	// 30일전
		
		int totalQuestionCount = qu_dao.totalQuestionCount();	// 전체 문의글 수
		
		int todayQuestionCount = qu_dao.countQuestionCal(qu_tdy, qu_tomor);		// 오늘 문의글 수
		int yesterdayQuestionCount = qu_dao.countQuestionCal(qu_yester, qu_tomor);		// 어제 문의글 수
		int weekQuestionCount = qu_dao.countQuestionCal(qu_week, qu_tdy);	// 최근 7일간 문의글 수
		int monthQuestionCount = qu_dao.countQuestionCal(qu_month, qu_tdy);	// 최근 30일간 문의글 수
		
		int noRefQuestionCount = qu_dao.noRefQuestionCount();	// 답글없는 문의 글 수
%>

 
 <%-- ######################### 회원, 선호맛 관련 출력 // 작성자 : 전민기 ############################# --%>
 <%
	Date mb_date = new Date();
	MemberDAO dao = new MemberDAO();

	Calendar mb_cal = Calendar.getInstance();
	SimpleDateFormat mb_sdf = new SimpleDateFormat("yyyy-MM-dd");
	mb_cal.setTime(mb_sdf.parse(mb_sdf.format(mb_date)));
	
	String mb_tdy = mb_sdf.format(mb_cal.getTime());			// 오늘 날짜

	mb_cal.add(Calendar.DATE, 1);
	String mb_tomor = mb_sdf.format(mb_cal.getTime());	// 내일 날짜
	
	mb_cal.add(Calendar.DATE, -2);
	String mb_yester = mb_sdf.format(mb_cal.getTime());	// 어제 날짜
	
	mb_cal.add(Calendar.DATE, -6);
	String mb_week = mb_sdf.format(mb_cal.getTime());		// 7일 전 날짜
	
	mb_cal.add(Calendar.DATE, -22);
	String mb_month = mb_sdf.format(mb_cal.getTime());	// 30일 전 날짜
	
	int totalMembersCount = dao.totalMembers();	// 전체 회원 수
	int yesterdayMembersCount = dao.countMembersCal(mb_yester, mb_tdy);	// (어제 - 오늘)
	int todayMembersCount = dao.countMembersCal(mb_tdy, mb_tomor);	// (오늘 - 내일)
	int weekMembersCount = dao.countMembersCal(mb_week, mb_tdy);	// (7일전 - 오늘)
	int monthMembersCount = dao.countMembersCal(mb_month, mb_tdy);	// (30일전 - 오늘)
	
	int totalLeaveMembersCount = dao.totalLeaveMembers();	// 전체 탈퇴 회원수
	int yesterdayLeaveMembersCount = dao.countLeaveMembersCal(mb_yester, mb_tdy);	// 어제 탈퇴 회원 수
	int todayLeaveMembersCount = dao.countLeaveMembersCal(mb_tdy, mb_tomor);	// 오늘 탈퇴 회원 수
	
	int sweetCount = dao.countPreferFlavor("sweet");
	int sourCount = dao.countPreferFlavor("sour");
	int saltyCount = dao.countPreferFlavor("salty");
	int spicyCount = dao.countPreferFlavor("spicy");
	int non_spicyCount = dao.countPreferFlavor("non_spicy");
	int softCount = dao.countPreferFlavor("soft");
	int freshCount = dao.countPreferFlavor("fresh");
	int hotCount = dao.countPreferFlavor("hot");
	int coolCount = dao.countPreferFlavor("cool");
	int lightCount = dao.countPreferFlavor("light");
	
%>
 
 
	<%-- ################# 레시피 추천 수 관련 출력 // 작성자 : 김나희, 이건우 ########################## --%>
<%
	Calendar cal = Calendar.getInstance();
	
	ClickRecommendDAO cdao = new ClickRecommendDAO();
	ClickRecommendDTO cdto = new ClickRecommendDTO();

	List clickList = null;
	
	SimpleDateFormat r_sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String today0 = r_sdf.format(cal.getTime());
	
	// 하루(오늘)
	cal.add(Calendar.DATE, 1); // 내일 날짜	
	String tomorrow = r_sdf.format(cal.getTime());
	int ye_count = cdao.getReco_count(today0,tomorrow);// 어제 날짜에 해당되는 개수
	
	// 일주일
	cal.add(Calendar.DATE, -8);  // 일주일 전 날짜
	String week = r_sdf.format(cal.getTime());
	int we_count = cdao.getReco_count(week,tomorrow);
	
	// 한 달
	cal.add(Calendar.DATE, -23); // 한달 전 날짜
	String month = r_sdf.format(cal.getTime());
	int mo_count = cdao.getReco_count(month,tomorrow);
	
	%>

<%-- #################################################################################### --%>
<%-- ############################## 페이지 출력내용 (HTML) ################################# --%>
<%-- #################################################################################### --%>
<body id="page-top">

  <%-- Page Wrapper --%>
  <div id="wrapper">

    <%-- Delete Sidebar --%>

    <%-- Content Wrapper --%>
    <div id="content-wrapper" class="d-flex flex-column">

      <%-- Main Content --%>
      <div id="content">

        <%-- Delete Topbar --%>

        <%-- Begin Page Content --%>
        <div class="container-fluid">

          <%-- Page Heading --%>
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard - Admin</h1>
          </div>

          <div class="row">

            <%-- card - 월 매출액 --%>
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">월 매출액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%= monthlySales %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <%-- card - 월 주문 건수 --%>
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">월 주문 건수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=monthCount%></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <%-- card - 재고부족+유통기한임박 상품수 --%>
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-danger shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">재고부족 및 유통기한 임박 상품 수</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><%= goods %></div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <%-- card - 답글 대기 중 문의 --%>
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">문의 답글 대기중</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%= noRefQuestionCount %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>


		<!-- Content Row -->
          <div class="row">
          	
          	<div class="col-xl-7 col-lg-5">
          
				<%-- Area Chart - 7일 매출액 영역 그래프 --%>
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">매출액 - 영역 그래프</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="salAreaChart"></canvas>
                  </div>
                  
                  <hr>
                  
                   <%-- Table - 7일 매출액 표 --%>
					<div class="card-body">
		              <div class="table-responsive">
		                <table class="table table-bordered" width="100%" cellspacing="0">
		                    <tr>
		                      <th>오늘 매출액</th>
		                      <th>어제 매출액</th>
		                      <th>일주일 매출액</th>
		                      <th>한 달 매출액</th>
		                    </tr>
		                  <tbody>
		                    <tr>
		                      <td><%=todaySales%></td>
		                      <td><%=yesterdaySales%></td>
		                      <td><%=weeklySales%></td>
		                      <td><%=monthlySales%></td>
		                    </tr>
		                  </tbody>
		                </table>
		              </div>
		            </div>

                </div>
              </div>


            <!-- Donut Chart - 회원들의 선호하는 맛 비율 -->
            
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">회원들의 선호하는 맛 비율 - 도넛 그래프</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4">
                    <canvas id="preferPieChart"></canvas>
                  </div>
                  <hr>
                  
                  <%-- Table - 회원들의 선호하는 맛 --%>
					<div class="card-body">
		              <div class="table-responsive">
		                <table class="table table-bordered" width="100%" cellspacing="0">
		                    <tr>
		                      <th>Sweet</th>
		                      <th>Sour</th>
		                      <th>Salty</th>
		                      <th>Spicy</th>
		                      <th>NonSpicy</th>
		                      <th>Soft</th>
		                      <th>Fresh</th>
		                      <th>Hot</th>
		                      <th>Cool</th>
		                      <th>Light</th>
		                    </tr>
		                  <tbody>
		                    <tr>
		                      <td><%= sweetCount %></td>
		                      <td><%= sourCount %></td>
		                      <td><%= saltyCount %></td>
		                      <td><%= spicyCount %></td>
		                      <td><%= non_spicyCount %></td>
		                      <td><%= softCount %></td>
		                      <td><%= freshCount %></td>
		                      <td><%= hotCount %></td>
		                      <td><%= coolCount %></td>
		                      <td><%= lightCount %></td>
		                    </tr>
		                  </tbody>
		                </table>
		              </div>
		            </div>                  
		            
                </div>
              </div>
            
            
                   
            <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
            <nav class="navbar navbar-expand navbar-light bg-light">
              <h6 class="m-0 font-weight-bold text-primary">회원 등록 및 탈퇴 인원 확인</h6>
              
              <ul class="navbar-nav ml-auto">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          페이지 이동
                        </a>
                        <div class="dropdown-menu dropdown-menu-right animated--grow-in" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="/kook/admin/member/memberListAdmin.jsp">전체 회원 정보 및 관리</a>
                         
                        </div>
                      </li>
                    </ul>
                    </nav>
                    
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
           			<tr>
                      <th rowspan = "2">전체 등록 회원</th>
                      <th colspan = "4">기간 별 등록 회원</th>
                      <th rowspan = "2">전체 탈퇴 회원</th>
                      <th colspan = "2">기간 별 탈퇴 회원</th>
                    </tr>
                    <tr>
                     
                      <th>오늘</th>
                      <th>어제</th>
                      <th>주간</th>
                      <th>월간</th>
                      
                      <th>오늘</th>
                      <th>어제</th>
                    </tr>
                  <tbody>
                    <tr>
                      <td><%= totalMembersCount %></td>
                      <td><%= todayMembersCount %></td>
                      <td><%= yesterdayMembersCount %> </td>
                      <td><%= weekMembersCount %></td>
                      <td><%= monthMembersCount %></td>
                      <td><%= totalLeaveMembersCount %></td>
                      <td><%= todayLeaveMembersCount %></td>
                      <td><%= yesterdayLeaveMembersCount %></td>
                    </tr>
                  </tbody>
                  </table>
              </div>
            </div>
          </div>       


			</div>
			<%-- End class="col-xl-8 col-lg-7" --%>
			

					<!-- Bar Chart -->
			<div class="col-xl-5 col-lg-5">
					
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                
                  <nav class="navbar navbar-expand navbar-light bg-light">
                  <h6 class="m-0 font-weight-bold text-primary">주문 수 - 막대 그래프</h6>
                  
                  <ul class="navbar-nav ml-auto">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          페이지 이동
                        </a>
                        <div class="dropdown-menu dropdown-menu-right animated--grow-in" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="/kook/admin/shop/orderListAdmin.jsp">전체 주문 내역 확인</a>
                         
                        </div>
                      </li>
                    </ul>
                    </nav>
                  
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="orderBarChart"></canvas>
                  </div>
                  <hr>

					<%-- Table - 7일 주문 수 표 --%>
					<div class="card-body">
		              <div class="table-responsive">
		                <table class="table table-bordered" width="100%" cellspacing="0">
		                    <tr>
		                      <th>오늘 주문</th>
		                      <th>어제 주문</th>
		                      <th>일주일 주문</th>
		                      <th>한 달 주문</th>
		                    </tr>
		                  <tbody>
		                    <tr>
		                      <td><%= orderCount_today %></td>
		                      <td><%= yesterdayPurchaseCount %></td>
		                      <td><%= orderCount_seventh %></td>
		                      <td><%= monthCount %></td>
		                    </tr>
		                  </tbody>
		                </table>
		              </div>
		            </div>
		            

                </div>
              </div>
              
                   
            <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">상품 재고 및 유통기한 임박 수량</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
           		<tbody>
                   <tr>
                     <th>재고수량 임박</th>
                     <td> <%= count %> 개 </td>
                     <td>
                     	 <a href="/kook/admin/shop/adminStock.jsp" class="btn btn-warning btn-icon-split">
		                    <span class="icon text-white-50">
		                      <i class="fas fa-exclamation-triangle"></i>
		                    </span>
		                    <span class="text">해당 상품 확인</span>
		                  </a>
					</td>
                   </tr>
                   <tr>
                     <th>유통기한 임박</th>
                     <td> <%= count2 %> 개 </td>
                     <td>
                      <a href="/kook/admin/shop/adminExpiration.jsp" class="btn btn-warning btn-icon-split">
	                    <span class="icon text-white-50">
	                      <i class="fas fa-exclamation-triangle"></i>
	                    </span>
	                    <span class="text">해당 상품 확인</span>
	                  </a>
					</td>
                   </tr>
           		</tbody>
                </table>
              </div>
            </div>
          </div>       

                   
            <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">레시피 콘텐츠 추천 받은 횟수</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
           			<tr>
                      <th>오늘 추천 횟수</th>
                      <th>주간 추천 횟수</th>
                      <th>월간 추천 횟수</th>
                    </tr>
                  <tbody>
                    <tr>
                      <td><%= ye_count %></td>
                      <td><%= we_count %></td>
                      <td><%= mo_count %></td>
                    </tr>
                  </tbody>
                  </table>
              </div>
            </div>
          </div>       

                   
            <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
            
            <nav class="navbar navbar-expand navbar-light bg-light">
              <h6 class="m-0 font-weight-bold text-primary">회원들의 문의 게시판 현황</h6>
            
            <ul class="navbar-nav ml-auto">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          페이지 이동
                        </a>
                        <div class="dropdown-menu dropdown-menu-right animated--grow-in" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="/kook/admin/service/questionListAdmin.jsp">문의게시판 이동</a>
                         
                        </div>
                      </li>
                    </ul>
                    </nav>
            
            
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
           			<tr>
                      <th rowspan = "2">답글 대기중</th>
                      <th rowspan = "2">전체 문의글</th>
                      <th colspan = "4">기간 별 문의글</th>
                    </tr>
                    <tr>
                      <th>오늘</th>
                      <th>어제</th>
                      <th>주간</th>
                      <th>월간</th>
                    </tr>
                  <tbody>
                    <tr>
                      <td><%= noRefQuestionCount %></td>
                      <td><%= totalQuestionCount %></td>
                      <td><%= todayQuestionCount %></td>
                      <td><%= yesterdayQuestionCount %></td>
                      <td><%= weekQuestionCount %></td>
                      <td><%= monthQuestionCount %></td>
                    </tr>
                  </tbody>
                  </table>
              </div>
            </div>
          </div>       

			<a href="/kook/admin/sessionDelete.jsp" class="btn btn-danger btn-icon-split"  onClick = "return sessionDel()">
                   <span class="icon text-white-50">
                     <i class="fas fa-exclamation-triangle"></i>
                   </span>
                   <span class="text">세션 전체 삭제</span>
                 </a>
              
            </div>  
            <%-- End class="col-xl-4 col-lg-5" --%>  
            
          	</div>
          <%-- End of Content Row --%>    
          

        </div>
        <%-- /.container-fluid --%>

      </div>
      <%-- End of Main Content --%>

      <%-- Footer --%>
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <%-- End of Footer --%>

    </div>
    <%-- End of Content Wrapper --%>

  </div>
  <%-- End of Page Wrapper --%>

  <%-- Scroll to Top Button--%>
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript-->
  <script src="/kook/vendor/jquery/jquery.min.js"></script>
  <script src="/kook/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/kook/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/kook/js/sb-admin-2.min.js"></script>

 <!-- Page level plugins -->
  <script src="/kook/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/kook/js/demo/chart-pie-demo.js"></script>
  <script src="/kook/js/demo/chart-bar-demo.js"></script>
  
  
  
  <script>
  
  <%-- 매출 관련 Area Chart Script, /js/demo/chart-area-demo.js --%>
		//Set new default font family and font color to mimic Bootstrap's default styling
		  Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		  Chart.defaults.global.defaultFontColor = '#858796';
		
		  function number_format(number, decimals, dec_point, thousands_sep) {
		    // *     example: number_format(1234.56, 2, ',', ' ');
		    // *     return: '1 234,56'
		    number = (number + '').replace(',', '').replace(' ', '');
		    var n = !isFinite(+number) ? 0 : +number,
		      prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
		      sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
		      dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
		      s = '',
		      toFixedFix = function(n, prec) {
		        var k = Math.pow(10, prec);
		        return '' + Math.round(n * k) / k;
		      };
		    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
		    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
		    if (s[0].length > 3) {
		      s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
		    }
		    if ((s[1] || '').length < prec) {
		      s[1] = s[1] || '';
		      s[1] += new Array(prec - s[1].length + 1).join('0');
		    }
		    return s.join(dec);
		  }
		
		  // Area Chart Example
		  var sal_1 = '<%= sal_yesda %>';
		  var sal_2 = '<%= sal_twoda %>';
		  var sal_3 = '<%= sal_threeda %>';
		  var sal_4 = '<%= sal_fourda %>';
		  var sal_5 = '<%= sal_fiveda %>';
		  var sal_6 = '<%= sal_sixda %>';
		  var sal_7 = '<%= sal_sevenda %>';
		
		  var area_ctx = document.getElementById("salAreaChart");
		  var myLineChart = new Chart(area_ctx, {
		    type: 'line',
		    data: {
		      labels: ["7일 전", "6일 전", "5일 전", "4일 전", "3일 전", "2일 전", "1일 전"],
		      datasets: [{
		        label: "매출액",
		        lineTension: 0.3,
		        backgroundColor: "rgba(78, 115, 223, 0.05)",
		        borderColor: "rgba(78, 115, 223, 1)",
		        pointRadius: 3,
		        pointBackgroundColor: "rgba(78, 115, 223, 1)",
		        pointBorderColor: "rgba(78, 115, 223, 1)",
		        pointHoverRadius: 3,
		        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
		        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
		        pointHitRadius: 10,
		        pointBorderWidth: 2,
		        data: [sal_7, sal_6, sal_5, sal_4, sal_3, sal_2, sal_1],
		      }],
		    },
		    options: {
		      maintainAspectRatio: false,
		      layout: {
		        padding: {
		          left: 10,
		          right: 25,
		          top: 25,
		          bottom: 0
		        }
		      },
		      scales: {
		        xAxes: [{
		          time: {
		            unit: 'date'
		          },
		          gridLines: {
		            display: false,
		            drawBorder: false
		          },
		          ticks: {
		            maxTicksLimit: 7
		          }
		        }],
		        yAxes: [{
		          ticks: {
		            maxTicksLimit: 5,
		            padding: 20,
		            // Include a dollar sign in the ticks
		            callback: function(value, index, values) {
		              return number_format(value) + "원";
		            }
		          },
		          gridLines: {
		            color: "rgb(234, 236, 244)",
		            zeroLineColor: "rgb(234, 236, 244)",
		            drawBorder: false,
		            borderDash: [2],
		            zeroLineBorderDash: [2]
		          }
		        }],
		      },
		      legend: {
		        display: false
		      },
		      tooltips: {
		        backgroundColor: "rgb(255,255,255)",
		        bodyFontColor: "#858796",
		        titleMarginBottom: 10,
		        titleFontColor: '#6e707e',
		        titleFontSize: 14,
		        borderColor: '#dddfeb',
		        borderWidth: 1,
		        xPadding: 15,
		        yPadding: 15,
		        displayColors: false,
		        intersect: false,
		        mode: 'index',
		        caretPadding: 10,
		        callbacks: {
		          label: function(tooltipItem, chart) {
		            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
		            return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + " 원";
		          }
		        }
		      }
		    }
		  });
		  

 <%-- 주문 관련 Bar Chart Script, /js/demo/chart-bar-demo.js --%>		  
		// Set new default font family and font color to mimic Bootstrap's default styling
		  

		var order_7 = '<%= orderCount_seventh %>';
		var order_6 = '<%= orderCount_sixth %>';
		var order_5 = '<%= orderCount_fiveth %>';
		var order_4 = '<%= orderCount_fourth %>';
		var order_3 = '<%= orderCount_third %>';
		var order_2 = '<%= twoDayPurchaseCount %>';
		var order_1 = '<%= yesterdayPurchaseCount %>';		
		  // Bar Chart Example
		  var bar_ctx = document.getElementById("orderBarChart");
		  var myBarChart = new Chart(bar_ctx, {
		    type: 'bar',
		    data: {
		      labels: ["7일 전", "6일 전", "5일 전", "4일 전", "3일 전", "2일 전", "1일 전"],
		      datasets: [{
		        label: "주문 수",
		        backgroundColor: "#4e73df",
		        hoverBackgroundColor: "#2e59d9",
		        borderColor: "#4e73df",
		        data: [order_7, order_6, order_5, order_4, order_3, order_2, order_1],
		      }],
		    },
		    options: {
		      maintainAspectRatio: false,
		      layout: {
		        padding: {
		          left: 10,
		          right: 25,
		          top: 25,
		          bottom: 0
		        }
		      },
		      scales: {
		        xAxes: [{
		          time: {
		            unit: 'month'
		          },
		          gridLines: {
		            display: false,
		            drawBorder: false
		          },
		          ticks: {
		            maxTicksLimit: 7
		          },
		          maxBarThickness: 25,
		        }],
		        yAxes: [{
		          ticks: {
		            min: 0,
		            // max: 15000,
		            maxTicksLimit: 5,
		            padding: 10,
		            // Include a dollar sign in the ticks
		            callback: function(value, index, values) {
		              return number_format(value)+' 번';
		            }
		          },
		          gridLines: {
		            color: "rgb(234, 236, 244)",
		            zeroLineColor: "rgb(234, 236, 244)",
		            drawBorder: false,
		            borderDash: [2],
		            zeroLineBorderDash: [2]
		          }
		        }],
		      },
		      legend: {
		        display: false
		      },
		      tooltips: {
		        titleMarginBottom: 10,
		        titleFontColor: '#6e707e',
		        titleFontSize: 14,
		        backgroundColor: "rgb(255,255,255)",
		        bodyFontColor: "#858796",
		        borderColor: '#dddfeb',
		        borderWidth: 1,
		        xPadding: 15,
		        yPadding: 15,
		        displayColors: false,
		        caretPadding: 10,
		        callbacks: {
		          label: function(tooltipItem, chart) {
		            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
		            return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' 번';
		          }
		        }
		      },
		    }
		  });
		  
		  
		  <%-- 회원들의 선호맛 비율 Donut Chart Script, /js/demo/chart-pie-demo.js --%>		  		  
		// Set new default font family and font color to mimic Bootstrap's default styling
		  

			var sweet = '<%= sweetCount %>';
			var sour = '<%= sourCount %>';
			var salty = '<%= saltyCount %>';
			var spicy = '<%= spicyCount %>';
			var non_spicy = '<%= non_spicyCount %>';
			var soft = '<%= softCount %>';
			var fresh = '<%= freshCount %>';
			var hot = '<%= hotCount %>';
			var cool = '<%= coolCount %>';
			var light = '<%= lightCount %>';
		  // Pie Chart Example
		  var donut_ctx = document.getElementById("preferPieChart");
		  var myPieChart = new Chart(donut_ctx, {
		    type: 'doughnut',
		    data: {
		      labels: ["Sweet", "Sour", "Salty", "Spicy", "Non_spicy", "Soft", "Fresh", "Hot", "Cool", "Light"],
		      datasets: [{
		        data: [sweet, sour, salty, spicy, non_spicy, soft, fresh, hot, cool, light],
		        backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b', '#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b'],
		        hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#f4b619', '#e02d1b', '#2e59d9', '#17a673', '#2c9faf', '#f4b619', '#e02d1b'],
		        hoverBorderColor: "rgba(234, 236, 244, 1)",
		      }],
		    },
		    options: {
		      maintainAspectRatio: false,
		      tooltips: {
		        backgroundColor: "rgb(255,255,255)",
		        bodyFontColor: "#858796",
		        borderColor: '#dddfeb',
		        borderWidth: 1,
		        xPadding: 15,
		        yPadding: 15,
		        displayColors: false,
		        caretPadding: 10,
		      },
		      legend: {
		        display: false
		      },
		      cutoutPercentage: 80,
		    },
		  });

		  
		 function sessionDel(){
				return confirm("세션 전체 삭제하겠습니까?");
		}
		  
  </script>
  
  
</body>
