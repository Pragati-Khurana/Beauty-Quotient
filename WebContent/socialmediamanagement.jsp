<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Social Media</title>
<style>
.btn-instagram1 
{
	background-color: #e6e7ee;
    color: #DD2A7B;
    border-color: #D1D9E6;
}
.btn-instagram1:active 
{
	color: #ECF0F3;
    background-color: #DD2A7B;
}
.sm
{
	margin-left: 350px !important;
}
</style>
<link type="text/css" href="neuro/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
<!-- Pixel CSS -->
<link type="text/css" href="neuro/css/neumorphism.css" rel="stylesheet">
<!--  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"> -->
<%@include file="FontFaces.jsp"%>
   <%@include file="commoncss.jsp"%>
</head>
<body style="background-color: #e6e7ee;">
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>
	
	
				
	<section class="section section-lg pt-0">
	
		<div class="sm" style="background-color: #e6e7ee;">
		<h1 class="display-2 mt-8 ml-8 mb-6">Our Social Media</h1>
					<div class="shadow-soft border-light" style="background-color: #e6e7ee; height: 300px; width: 1100px;">
						<div class="row">
							<div class="col-12 col-lg-4 px-md-0 mb-lg-0" >
								<div class="card-body text-center py-5">
									<div
										class="btn-instagram1 icon icon-shape shadow-inset border-light rounded-circle mb-3">
										<span onclick="window.location='https://instagram.com/meet_suthar_98?igshid=1866cp7e8v5wd'" class="fab fa-instagram"></span>
									</div>
									<!-- Heading -->
									<h2 class="h4 mr-2">Instagram</h2>
									<!-- Text -->
									<p class="mb-0">Instagram is a popular social networking 
									platform for sharing photos and videos</p>
								</div>
							</div>
							<div class="col-12 col-lg-4 px-md-0 mb-4 mb-lg-0">
								<div class="card-body text-center py-5">
									<div
										class="btn-facebook icon icon-shape shadow-inset border-light rounded-circle mb-3">
										<span onclick="window.location='https://www.facebook.com/profile.php?id=100013277928212'" class="fab fa-facebook"></span>
									</div>
									<!-- Heading -->
									<h2 class="h4 mr-2">FaceBook</h2>
									<!-- Text -->
									<p class="mb-0">FaceBook is a popular social networking 
									platform for sharing photos and videos</p>
								</div>
							</div>
							<div class="col-12 col-lg-4 px-md-0">
								<div class="card-body text-center py-5">
									<div
										class="btn-twitter icon icon-shape shadow-inset border-light rounded-circle mb-3">
										<span onclick="window.location='https://twitter.com/Solanki31415767?s=08'" class="fab fa-twitter"></span>
									</div>
									<!-- Heading -->
									<h2 class="h4 mr-2">Twitter</h2>
									<!-- Text -->
									<p class="mb-0">Twitter is a popular social networking 
									platform for sharing photos and videos</p>
								</div>
							</div>
						</div>
					</div>
				</div>
	</section>
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
</body>
</html>