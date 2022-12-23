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
	height: 400px;
	width: 500px;
}

.wishlist {
	margin-left: 1000px !important;
	margin-top: -6rem !important;
}


</style>
<meta charset="ISO-8859-1">
<title>Interior Designer Details</title>
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

<%
	User user = (User) request.getAttribute("user");
%>
</head>
<body style="background-color: #e6e7ee">
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>
	<div class="col-5 col-lg-11 ml-6 mt-7">
		<div class="card shadow-inset border-light p-3 ml-10"
			style="background-color: #e6e7ee;">
			<!-- Content -->
			<div class="card-body shadow-soft border border-light rounded p-4">
				<i class="fas fa-badge-check"></i> 
				<div class="card shadow-inset border-light p-3" style="margin-right:710px; background-color: lightgrey;">
					
					<%if(user.getUserProfilepicString()!=null) {%>
									<img src="data:image/jpg;base64,<%=user.getUserProfilepicString() %>" style="height:300px; width:300px;" 
										class="rounded" >
									<%}else{ %>
										<img src="bg-img/Blank-Photo.png" height="400px" width="300px" class="rounded" >
									<% }%>
					
				</div>
				<div align="center" style="margin-top:-20rem;">
					<h3 class="">Hello,</h3>
					<h1 class="ml-10 display-3">I'M <%=user.getFirstname() %></h1>
					<h4 class="ml-10"><%=user.getDesignation() %></h4>
				</div>
				<br><br><br><br><br><br><br>
				<div class="ml-6">
                         <a href="SelectPerticularDesigner?designerid=<%=user.getUser_id() %>" type="submit" name="submit" id="submit" class="btn col-lg-2 btn-primary1">Hire Me</a>
                 </div>
				<div class="ml-7 mb-5">
                         <h4 align="center" class="mb-3 mr-7">About Me</h4>
                         <textarea readonly style="background-color: #e6e7ee; resize: none;" class="form-control1" name="desc" id="desc" rows="10" cols="95"><%=user.getAboutme() %></textarea>
                 </div>
                 <br>
                 <h4 align="center" class="mb-3">Services</h4>
                 <div class="ml-7 mb-5">
                         <textarea readonly style="background-color: #e6e7ee; resize: none;  text-align: center;" class="form-control1" name="desc" id="desc" rows="12" cols="25">Personalised Service
						Every home is a unique expression of its homeowners. We ensure your house design is in keeping with your distinct tastes. Everything, from creating furniture to choosing furnishings and lighting, is meant to reflect your sense of design.</textarea>
                         <textarea readonly style="background-color: #e6e7ee; resize: none;  text-align: center;" class="form-control1 ml-5" name="desc" id="desc" rows="12" cols="25">Interior Design Experts
						The most important decision you will make when it comes to interior decoration is finding skilled and reliable professionals. At Beautiful Homes Service, we ensure your house design is in the hands of our panel of experienced interior designers.</textarea>
                         <textarea readonly style="background-color: #e6e7ee; resize: none;  text-align: center;" class="form-control1 ml-5" name="desc" id="desc" rows="12" cols="26">End-to-End Service
							While we work towards giving you your dream home interior design, all you need to do is relax while everything is taken care of. From concept to creation and planning to execution, our team has got you covered</textarea>
                 </div>
                 <div>
                  <hr class="my-5"  style="background-color: #A9A9A9;">
                  <h4 align="center" class="mb-3 ml-6"><u>If You Have Any Designs In Your Mind?</u></h4>
                 	<br>
                 	<div align="center" class="ml-6">
                         <a href="SelectPerticularDesigner?designerid=<%=user.getUser_id() %>" type="submit" name="submit" id="submit" class="btn col-lg-2 btn-primary1">Hire Me</a>
                 	</div>
                 	<hr class="my-5"  style="background-color: #A9A9A9;">
                 </div>
			</div>
			<!-- End Content -->
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
<script>
</script>
</html>