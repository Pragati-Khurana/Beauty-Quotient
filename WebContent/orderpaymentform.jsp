<%@page import="com.ikonique.bean.OrderDetails"%>
<%@page import="com.ikonique.bean.Order"%>
<%@page import="com.ikonique.bean.BookingInfo"%>
<%@page import="com.ikonique.bean.Booking"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>

<%@page import="com.ikonique.bean.Wishlist"%>
<%@page import="com.ikonique.bean.Offer"%>
<%@page import="com.ikonique.bean.Product"%>
<%@ page session="false" %>
<%
	Random randomGenerator = new Random();
int randomInt = randomGenerator.nextInt(1000000);
%>

<%
HttpSession httpSession1 = request.getSession(false);
User user = null;
if (null != httpSession1) {
	user = (User) httpSession1.getAttribute("loginBean");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Order Details</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#form .indicator1 {
	position: absolute;
	top: 50px;
	left: 44rem;
	width: 10px;
	height: 10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid .indicator1 {
	background: #f00;
	box-shadow: 0 0 5px #f00, 0 0 10px #f00, 0 0 20px #f00, 0 0 40px #f00;
}

#form.valid .indicator1 {
	background: #0f0;
	box-shadow: 0 0 5px #0f0, 0 0 10px #0f0, 0 0 20px #0f0, 0 0 40px #0f0;
}

#form .indicator2 {
	position: absolute;
	top: 50px;
	left: 44rem;
	width: 10px;
	height: 10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid1 .indicator2 {
	background: #f00;
	box-shadow: 0 0 5px #f00, 0 0 10px #f00, 0 0 20px #f00, 0 0 40px #f00;
}

#form.valid1 .indicator2 {
	background: #0f0;
	box-shadow: 0 0 5px #0f0, 0 0 10px #0f0, 0 0 20px #0f0, 0 0 40px #0f0;
}

#form .indicator3 {
	position: absolute;
	top: 50px;
	left: 44rem;
	width: 10px;
	height: 10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid2 .indicator3 {
	background: #f00;
	box-shadow: 0 0 5px #f00, 0 0 10px #f00, 0 0 20px #f00, 0 0 40px #f00;
}

#form.valid2 .indicator3 {
	background: #0f0;
	box-shadow: 0 0 5px #0f0, 0 0 10px #0f0, 0 0 20px #0f0, 0 0 40px #0f0;
}

#form .indicator4 {
	position: absolute;
	top: 50px;
	left: 44rem;
	width: 10px;
	height: 10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid3 .indicator4 {
	background: #f00;
	box-shadow: 0 0 5px #f00, 0 0 10px #f00, 0 0 20px #f00, 0 0 40px #f00;
}

#form.valid3 .indicator4 {
	background: #0f0;
	box-shadow: 0 0 5px #0f0, 0 0 10px #0f0, 0 0 20px #0f0, 0 0 40px #0f0;
}

#form .indicator5 {
	position: absolute;
	top: 20px;
	left: 32rem;
	width: 10px;
	height: 10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid4 .indicator5 {
	background: #f00;
	box-shadow: 0 0 5px #f00, 0 0 10px #f00, 0 0 20px #f00, 0 0 40px #f00;
}

#form.valid4 .indicator5 {
	background: #0f0;
	box-shadow: 0 0 5px #0f0, 0 0 10px #0f0, 0 0 20px #0f0, 0 0 40px #0f0;
}

#form .indicator6 {
	position: absolute;
	top: 50px;
	left: 44rem;
	width: 10px;
	height: 10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid5 .indicator6 {
	background: #f00;
	box-shadow: 0 0 5px #f00, 0 0 10px #f00, 0 0 20px #f00, 0 0 40px #f00;
}

#form.valid5 .indicator6 {
	background: #0f0;
	box-shadow: 0 0 5px #0f0, 0 0 10px #0f0, 0 0 20px #0f0, 0 0 40px #0f0;
}

textarea {
	overflow: auto;
	resize: none;
}

.form-control1 {
	font-size: 1rem;
	border-radius: 0.55rem;
	box-shadow: inset 2px 2px 5px #b8b9be, inset -3px -3px 7px #ffffff;
	padding: 0.6rem 0.75rem;
}

.form-control2 {
	display: block;
	width: 100%;
	height: calc(1.5em + 1.2rem + 0.0625rem);
	padding: 0.6rem 0.75rem;
	font-size: 1rem;
	font-weight: 300;
	line-height: 1.5;
	color: #44476A;
	background-color: #e6e7ee;
	background-clip: padding-box;
	border: 0.0625rem solid #D1D9E6;
	border-radius: 0.55rem;
	box-shadow: inset 2px 2px 5px #b8b9be, inset -3px -3px 7px #ffffff;
	transition: all 0.3s ease-in-out;
}

.btn {
	position: relative;
	transition: all 0.2s ease;
	letter-spacing: 0.025em;
	font-size: 1rem;
	border-color: #D1D9E6;
	box-shadow: 3px 3px 6px #b8b9be, -3px -3px 6px #ffffff;
	display: inline-block;
	font-weight: 400;
	color: #44476A;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 0.0625rem solid transparent;
	padding: 0.55rem 0.95rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 0.55rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.btn-primary1 {
	color: #31344b;
	background-color: #e6e7ee;
	border-color: #e6e7ee;
	box-shadow: inset 0 1px 0 rgb(236 240 243/ 15%), 0 1px 1px
		rgb(38 40 51/ 8%);
}

/* .btn:focus {  */
/*    outline: #D1D9E6 !important;   */
/*    box-shadow: none !important;    */
/*  }  */
.center {
	display: block;
	margin-left: auto;
	margin-right: auto;
	height: 400px;
	width: 500px;
}

.wishlist {
	margin-left: 1000px !important;
	margin-top: -6rem !important;
}

.dropdown-menu {
	background-color: #e6e7ee !important;
	left: 770px !important;
}
</style>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Evrsoft First Page">
<!-- Fontawesome -->
<link type="text/css"
	href="neuro/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<!-- Pixel CSS -->
<link type="text/css" href="neuro/css/neumorphism.css" rel="stylesheet">
<jsp:include page="/SelectOrderTableDetails"/>
<%List<Order> orderList =(List)request.getAttribute("orderList"); %>

<jsp:include page="/SelectOrderDetails"/>
<%List<OrderDetails> orderdetailslist =(List)request.getAttribute("orderdetailsList"); %>
</head>
<%!int count=0; %>
<%!int length=0; %>
<%!int count1=0; %>

<body style="background-color: #e6e7ee">
	<%@include file="commonsidebar.jsp"%>
	<%@include file="commonheader.jsp"%>
	<div class="col-5 col-lg-11 ml-6 mt-7">
		<div class="card shadow-inset border-light p-3 ml-10"
			style="background-color: #e6e7ee;">
			<!-- Content -->
			<div class="card-body shadow-soft border border-light rounded p-4">
			<div align="center">
			<%for(Order order : orderList) {%>
				<%if(order.getUserid() == user.getUser_id()){ %>
					<%count=count+1; %>
				<%} %>
			<%} %>
			<%length=count; %>
			<%for(Order order : orderList){ %>
				<%if(order.getUserid() == user.getUser_id()){ %>
					<%count1 = count1 + 1; %>
						<%for(OrderDetails orderDetails : orderdetailslist){ %>
							<%if(orderDetails.getOrderid() == order.getOrderid() && count1 == length) {%>
					<div class="form-group mb-3 inputBox">
						<label for="lname">Name</label><br>
						<input type="text" name="lname" style="background-color: #e6e7ee;"
							readonly class="form-control1 col-lg-5" id="lname"
							autocomplete="off" aria-describedby="emailHelp"
							value="<%=order.getFirstname()%> <%=order.getLastname()%>">
					</div>
					<div class="form-group mb-3 inputBox">
						<label for="add">Address</label><br>
						<textarea rows="5" name="address" readonly
							style="background-color: #e6e7ee;" class="form-control1 col-lg-5"
							id="add" autocomplete="off" aria-describedby="emailHelp"><%=order.getAddress() %></textarea>
					</div>
					<div class="form-group mb-3 inputBox">
						<label for="mobilenumber">Mobile Number</label><br>
						<input type="text" name="mno" readonly
							style="background-color: #e6e7ee;" class="form-control1 col-lg-5"
							id="mno" autocomplete="off" aria-describedby="emailHelp"
							value="<%=order.getContactnum()%>">
					</div>

					<div class="form-group mb-3 inputBox">
						<label for="add">Mail</label><br> <input
							value="<%=order.getEmail() %>" name="address"
							readonly style="background-color: #e6e7ee;"
							class="form-control1 col-lg-5" id="add" autocomplete="off"
							aria-describedby="emailHelp">
					</div>
					<div class="form-group mb-3 inputBox">
						<label for="add">Date</label><br> <input
							value="<%=order.getOrderdate() %>" name="address" readonly
							style="background-color: #e6e7ee;" class="form-control1 col-lg-5"
							id="add" autocomplete="off" aria-describedby="emailHelp">
					</div>

				</div>
					<form action="PgRedirect.jsp" method="post" align="center"
						id="form" name="form">

						<br>
						
						<div class="form-group mb-3 inputBox">
							<label for="fname">Order ID</label><br> <input type="text"
								name="ORDER_ID" style="background-color: #e6e7ee;" readonly
								class="form-control1 col-lg-5" id="ORDER_ID" autocomplete="off"
								aria-describedby="emailHelp" value="BID_<%=order.getOrderid()%>">
						</div>


						<div class="form-group mb-3 inputBox" hidden>
							<label for="fname">Customer ID</label><br> <input
								type="text" name="CUST_ID" style="background-color: #e6e7ee;"
								readonly class="form-control1 col-lg-5" id="CUST_ID"
								autocomplete="off" aria-describedby="emailHelp" value="<%=user.getUser_id()%>">
						</div>
						<div class="form-group mb-3 inputBox" hidden>
							<label for="fname">Industry Type ID</label><br> <input
								type="text" name="INDUSTRY_TYPE_ID"
								style="background-color: #e6e7ee;" readonly
								class="form-control1 col-lg-5" id="INDUSTRY_TYPE_ID"
								autocomplete="off" aria-describedby="emailHelp" value="Retail">
						</div>
						<div class="form-group mb-3 inputBox" hidden>
							<label for="fname">Channel</label><br> <input type="text"
								name="CHANNEL_ID" style="background-color: #e6e7ee;" readonly
								class="form-control1 col-lg-5" id="CHANNEL_ID"
								autocomplete="off" aria-describedby="emailHelp" value="WEB">
						</div>
						<div class="form-group mb-3 inputBox">
							<label for="email">Total Amount</label><br> <input
								type="text" style="background-color: #e6e7ee;" readonly
								name="TXN_AMOUNT" title="TXN_AMOUNT"
								class="col-lg-5 form-control1" id="email" autocomplete="off"
								aria-describedby="emailHelp" value="<%=order.getAmount()%>">
						</div>
						<input type="submit" value="CheckOut"
							class="btn col-lg-4 rounded-bottom">
					</form>
								<%break;} %>
							<%} %>
						<%} %>
					<%} %>
				</div>
				<!-- End Content -->
			
			</div>
		</div>
<!-- 		</div> -->
<%-- 	<%=count%> --%>
</body>
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
<script src="neuro/vendor/jquery-countdown/dist/jquery.countdown.min.js"></script>
<script
	src="neuro/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="neuro/vendor/prismjs/prism.js"></script>

<script async defer src="https://buttons.github.io/buttons.js"></script>

<!-- Neumorphism JS -->
<script src="neuro/assets/js/neumorphism.js"></script>
<!-- Bootstrap JS-->
<script src="vendor/bootstrap-4.1/popper.min.js"></script>
<script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="vendor/slick/slick.min.js">
	
</script>
<script src="vendor/wow/wow.min.js"></script>
<script src="vendor/animsition/animsition.min.js"></script>
<script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
	
</script>
<script src="vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="vendor/counter-up/jquery.counterup.min.js">
	
</script>
<script src="vendor/circle-progress/circle-progress.min.js"></script>
<script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="vendor/chartjs/Chart.bundle.min.js"></script>
<script src="vendor/select2/select2.min.js">
	
</script>
<!-- Main JS-->
<script type="module" src="js/main.js"></script>
<script>
	
</script>
</html>