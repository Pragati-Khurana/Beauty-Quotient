<%@page import="com.ikonique.userService.impl.userServiceImpl"%>
<%@page import="com.ikonique.bean.BookingInfo"%>
<%@page import="com.ikonique.bean.Booking"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Interior Designer</title>
<%@include file="FontFaces.jsp"%>
<%@include file="commoncss.jsp"%>
<%@page import="com.ikonique.bean.User"%>

<link type="text/css"
	href="neuro/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">

<!-- Pixel CSS -->
<link type="text/css" href="neuro/css/neumorphism.css" rel="stylesheet">

<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->

<link rel="stylesheet" type="text/css" href="css/style.css">
<% HttpSession httpSession1 = request.getSession(false);
	User user = null;   
	if(null!=httpSession1){
	   user = (User)httpSession1.getAttribute("loginBean");
   }
%>
</head>
<jsp:include page="/SelectProductDetails"/>
<%List<Product> productList =(List)request.getAttribute("productList"); %>

<jsp:include page="/SelectUserDetails"/>
<%List<User> userList =(List)request.getAttribute("userList"); %>

<jsp:include page="/SelectBookingDetails"/>
<%List<Booking> bookinglist =(List)request.getAttribute("bookinglist"); %>

<jsp:include page="/SelectBookingInfoDetails"/>
<%List<BookingInfo> bookinginfolist =(List)request.getAttribute("bookinginfolist"); %>

<%userServiceImpl us=new userServiceImpl(); %>
<%List<BookingInfo> bookinginfolist2=us.selectPreviousBookingInfo(); %>


<body class="animsition" style="background-color: #e6e7ee;">
	<div class="page-wrapper" style="background-color: #e6e7ee;">
		<%@include file="commonsidebar.jsp"%>
		<%@include file="commonheader.jsp"%>
		<div class="main-content" style="margin-left:17rem; background-color: #e6e7ee;">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                    <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Interior Designer Dashboard</h2>
                                </div>
                            </div>
                        </div>
                    <div class="row m-t-25">
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box ">
                                            <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>
                                            <div class="text">
                                            <%int totalbooking=0; %>
                                            <%for(Booking booking: bookinglist){ %>
                                            	<%if(user.getUser_id()==booking.getDesignerid()){ %>
                                           			 <%if(booking.getPaymentstatus().equalsIgnoreCase("success")) {%>
                                            			<%totalbooking=totalbooking+1; %>
                                          	 		<%} %>
                                            	<%} %>
                                            <%} %>
                                                <h2><%=totalbooking %></h2>
                                                <span>Booking Members</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box ">
                                            <div class="icon">
                                                <i class="zmdi zmdi-shopping-cart"></i>
                                            </div>
                                            <%int totalproduct=0; %>
                                            <%for(Product product: productList){ %>
                                            	<%if(user.getUser_id() == product.getProduct_owner_id()){ %>
                                            			<%totalproduct=totalproduct+1; %>
                                            	<%} %>
                                            <%} %>
                                            <div class="text">
                                                <h2><%=totalproduct %></h2>
                                                <span>My Design items</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart2"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box ">
                                            <div class="icon">
                                                <i class="zmdi zmdi-calendar-note"></i>
                                            </div>
                                            <%int totalpreappointment=0; %>
                                            <%for(Booking booking:bookinglist) { %>
             									<%if(booking.getDesignerid()==user.getUser_id()) {%>
             										<%for(BookingInfo bookinginfo:bookinginfolist2) {%>
             											<%if(bookinginfo.getBookingid()==booking.getBookingid()){ %>
             												<%totalpreappointment=totalpreappointment+1; %>
             											<%} %> 
                									<%} %>
                								<%} %>
             								<%} %> 
                                            <div class="text">
                                                <h2><%=totalpreappointment %></h2>
                                                <span>Previous Appointments</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart3"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box ">
                                            <div class="icon">
                                                <i class="fas fa-inr"></i>
                                            </div>
                                            <div class="text">
                                            <%int earnings1=0; %>
                                            <%for(Booking booking:bookinglist) {%>
                                            	<%if(user.getUser_id()==booking.getDesignerid()){ %>
                                            		<%if(booking.getPaymentstatus().equalsIgnoreCase("success")) {%>
                                            			<%earnings1=earnings1+1; %>                                         			
                                            		<%} %>
                                            	<%} %>
                                            <%} %>
                                            
                                            <input type="hidden" value="<%=user.getVisitingfees() %>" id="vfees">
                                            <input type="hidden" value="<%=earnings1 %>" id="earnings">
                                                <h2 id="a1"></h2>
                                                <span>total earnings</span>
                                                
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart4"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 m-b-25">My Appointments</h2>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Booking ID</th>
                                                <th>Name</th>
                                                 <th>Booking Status</th>
                                                 <th>Payment Status</th>
                                                 <th>EMail</th>
                                                
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%for(Booking booking:bookinglist) {%>
                                        <%if(booking.getDesignerid()==user.getUser_id()){ %>
                                        <%for(BookingInfo bookinginfo:bookinginfolist){ %>
                                       <%--  <%if(booking.getBookingid()==bookinginfo.getBookingid() ){%> --%> 
                                        	<%if(booking.getPaymentstatus().equals("success")) {%>
                                            <tr>
                                                <td><%=bookinginfo.getBookingdate() %></td>
                                                <td><%=bookinginfo.getBookingid() %></td>
                                                
                                                <td><%=bookinginfo.getBookingfname() %> <%=bookinginfo.getBookinglname() %></td>
                                               
                                                <td><%=booking.getBookingstatus() %></td>
                                                <td><%=booking.getPaymentstatus() %></td>
                                                <td><%=bookinginfo.getBookingemail() %></td>
                                            </tr>
                                            <%} %>
                                           <%--  <%} %> --%>
                                           <%} %>
                                           <%break;} %> 
                                           <%} %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © Ikonique Interiors 2020 . All rights reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
           </div>
	</div>
</body>	
<!-- Core -->
	<script src="neuro/vendor/jquery/dist/jquery.min.js"></script>
	<script src="neuro/vendor/popper.js/dist/umd/popper.min.js"></script>
	<script src="neuro/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="neuro/vendor/headroom.js/dist/headroom.min.js"></script>

	<!-- Vendor JS -->
	<script src="neuro/vendor/onscreen/dist/on-screen.umd.min.js"></script>
	<script src="neuro/vendor/nouislider/distribute/nouislider.min.js"></script>
	<script
		src="neuro/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="neuro/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script src="neuro/vendor/jarallax/dist/jarallax.min.js"></script>
	<script src="neuro/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script
		src="neuro/vendor/jquery-countdown/dist/jquery.countdown.min.js"></script>
	<script
		src="neuro/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
	<script src="neuro/vendor/prismjs/prism.js"></script>

	<script async defer src="https://buttons.github.io/buttons.js"></script>

	<!-- Neumorphism JS -->
	<script src="neuro/assets/js/neumorphism.js"></script>
	<%@include file="commonjs.jsp"%>
	
<script>
$(document).ready(function(){
// 	alert("Alert");
	
	
});
function earn(){
	const a1 = document.getElementById('vfees').value;
	const  a2= document.getElementById('earnings').value;
	
	const ans=a1*a2;
	return ans;
}
document.getElementById("a1").innerHTML = earn();
</script>	
	
	
</html>