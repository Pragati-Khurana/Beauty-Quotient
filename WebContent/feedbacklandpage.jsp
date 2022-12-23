<%@page import="java.util.List"%>
<%@page import="com.ikonique.bean.FeedBack"%>
<%@page import="com.ikonique.bean.Wishlist"%>
<%@page import="com.ikonique.bean.Offer"%>
<%@page import="com.ikonique.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

textarea {
    overflow: auto;
    resize: none;
}
.form-control1
{
	font-size: 1rem;
    border-radius: 0.55rem;
    box-shadow: inset 2px 2px 5px #b8b9be, inset -3px -3px 7px #ffffff;
    padding: 0.6rem 0.75rem;
}
.form-control2
{
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
    transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.btn-primary1 {
    color: #31344b;
    background-color: #e6e7ee;
    border-color: #e6e7ee;
    box-shadow: inset 0 1px 0 rgb(236 240 243 / 15%), 0 1px 1px rgb(38 40 51 / 8%);
}

/* .btn:focus {  */
/*    outline: #D1D9E6 !important;   */
/*    box-shadow: none !important;    */
/*  }  */

.center {
	display: block;
	margin-left: auto;
	margin-right: auto;
	height: 300px;
	width: 300px;
}

.pic {
	margin-left: 960px !important;
	margin-top: -7rem !important;
}

.pic1
{
	margin-left: 920px !important;
	margin-top :-2rem !important;
}

</style>
<meta charset="ISO-8859-1">
<title>feedback land page</title>
<%
	FeedBack feedBack = (FeedBack) request.getAttribute("feedBack");
%>
<jsp:include page="/SelectUserDetails"/>
<%List<User> userList =(List)request.getAttribute("userList"); %>
<jsp:include page="/SelectProductDetails"/>
<%List<Product> productList =(List)request.getAttribute("productList"); %>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
	integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
	crossorigin="anonymous" />
<link type="text/css" href="css/login1css.css" rel="stylesheet">

<!-- Fontawesome -->
<link type="text/css"
	href="neuro/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css1/product.css">
<!-- Pixel CSS -->
<link type="text/css" href="neuro/css/neumorphism.css" rel="stylesheet">
</head>
<body style="background-color: #e6e7ee">
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>
	<div class="col-5 col-lg-11 ml-6 mt-7">
		<div class="card shadow-inset border-light p-3 ml-10"
			style="background-color: #e6e7ee;">
			<!-- Content -->
			<div class="card-body shadow-soft border border-light rounded p-4">
			<%for(Product product:productList){ %>
				<%if(product.getProduct_id()==feedBack.getProductid()){ %>
				<h2 class="mb-3"><%=product.getProduct_name() %></h2>
				<%} %>
			<%} %>
				<p class="des"><%=feedBack.getFeedbackdate() %></p>
				<%for(User user1:userList){ %>
					<%if(user1.getUser_id()==feedBack.getUserid()){ %>
						<img src="data:image/jpg;base64,<%=user1.getUserProfilepicString() %>" class="pic" style="border-radius: 1000px; height: 50px; width: 50px;">
						<p class="pic1 des">  <%=user1.getFirstname() %>   <%=user1.getLastname() %></p>
					<%} %>
				<%} %>
<%-- <% String str="Ikonique"; %> --%> 
<%-- 				<%for(User user1 : designerList) {%> --%>
<%-- 					<%if(product.getProduct_owner_id()==user1.getUser_id()){ %> --%>
<%-- 						<%str=user1.getFirstname()+" "+user1.getLastname();%>  --%>
<%-- 					<% break;} %> --%>
<%-- 					<%} %> --%>
<%-- 				<p class="mb-4 des">By <%=str %></p> --%>
			<%for(Product product:productList){ %>	
			 <%if(product.getProduct_id()==feedBack.getProductid()) {%>	
				<i class="fas fa-badge-check"></i> <img class="center rounded"
					src="data:image/jpg;base64,<%=product.getProductpicString() %>" alt="">
			<%} %>
			<%} %>
				<div class="d-flex mb-3">
						<span class="price display-3 text-dark mb-0" id="finalprice">Feedback</span><br>
					<br>
				</div>

				<br> <br>
				<h4 class="mb-3">Product Description</h4>
				<%for(Product product:productList){ %>
				 <%if(product.getProduct_id()==feedBack.getProductid()){ %>
					<p class="mb-4 des"><%=product.getProduct_desc() %></p>
				 <%} %>
				<%} %>
				<h4 class="mb-3">Customer Feedback</h4>
				<p class="mb-4"><%=feedBack.getFeedbackdesc() %></p>
				<form action="DeleteFeedback" method="post" id="form">
				<input type="hidden" name="feedbackid" id="feedbackid" value="<%=String.valueOf(feedBack.getFeedbackid())%>">
				<div align="center">
				<button type="submit" class="btn rounded-bottom col-lg-5"
					style="background-color: #e6e7ee;">Delete Feedback</button>
				</div>
				</form>
			</div>
		</div>
	</div>
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
<%@include file="commonjs.jsp"%>
</html>