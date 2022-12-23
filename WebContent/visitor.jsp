<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visitor</title>
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
</head>
<body class="animsition" style="background-color: #e6e7ee;">
	<div class="page-wrapper" style="background-color: #e6e7ee;">
		<%@include file="commonsidebar.jsp"%>
		<%@include file="commonheader.jsp"%>
		<div class="page-container">
			<div class="main-content pt-4"  style="background-color: #e6e7ee;">
				<div id="Carousel2"
					class="carousel slide shadow-soft border border-light p-4 rounded mt-5"
					data-ride="carousel">
					<div class="carousel-inner rounded">
						<div class="carousel-item">
							<img class="d-block w-150 h-50"
								src="images/slideshow1.jpg" alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-150 h-50"
								src="images/slideshow2.jpg" alt="Second slide">
						</div>
						<div class="carousel-item active">
							<img class="d-block w-150 h-50"
								src="images/slideshow3.jpg" alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-150 h-50"
								src="images/slideshow4.jpg" alt="Fourth slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-150 h-50"
								src="images/slideshow5.jpg" alt="Fifth slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#Carousel2" role="button"
						data-slide="prev"></a> 
					<a class="carousel-control-next" href="#Carousel2" role="button"
						data-slide="next"></a>
				</div>
				<%@include file="product.jsp"%>
				<div class="col-12 col-lg-15">
                <div class="card shadow-soft border-light mb-6">
                    <div class="card-body px-5 py-5 text-center text-md-left" style="background-color: #e6e7ee;">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <h2 class="mb-3">Get in touch</h2>
                                <p class="mb-0">
                                    If you need any help with our products or services, choose one of the following ways to contact us.
                                </p>
                            </div>
                            <div class="col-12 col-md-6 mt-4 mt-md-0 text-md-right">
                                <a href="contactus.jsp" class="btn btn-primary" style="background-color: #e6e7ee; border-color: #e6e7ee; color: black;">
                                    <span class="mr-1">
                                        <span class="fas fa-headphones"></span>
                                    </span>
                                    Contact Us
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
             
            
            <hr class="my-5"  style="background-color: #e6e7ee;">
        <div class="row"  style="background-color: #e6e7ee;">
            <div class="col">
<!--                 <a href="https://themesberg.com" target="_blank" class="d-flex justify-content-center"> -->
<!--                     <img src="neuro/assets/img/themesberg.svg" height="25" class="mb-3" alt="Themesberg Logo"> -->
<!--                 </a> -->
            <div class="d-flex text-center justify-content-center align-items-center" role="contentinfo">
                <p class="font-weight-normal font-small mb-0">Copyright © Beauty Quotient
                    <span class="current-year">2020</span>. All rights reserved.</p>
                </div>
            </div>
        </div>
			</div>
		</div>
	</div>
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
</body>
</html>