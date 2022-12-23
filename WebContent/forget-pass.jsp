<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Primary Meta Tags -->
<title>Forgot-Password</title>
<style>
#form .indicator7 {
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height: 10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid6 .indicator7 {
	background: #f00;
	box-shadow: 0 0 5px #f00, 0 0 10px #f00, 0 0 20px #f00, 0 0 40px #f00;
}

#form.valid6 .indicator7 {
	background: #0f0;
	box-shadow: 0 0 5px #0f0, 0 0 10px #0f0, 0 0 20px #0f0, 0 0 40px #0f0;
}

.forget {
	top: 30px;
}
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
	integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
	crossorigin="anonymous" />

<!-- Fontawesome -->
<link type="text/css"
	href="neuro/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">

<!-- Pixel CSS -->
<link type="text/css" href="neuro/css/neumorphism.css" rel="stylesheet">


<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->

</head>
<jsp:include page="/CheckEmail" />
<%
	String mailid = (String) request.getAttribute("mailid");
%>

<body class="animsition">
	<div class="page-wrapper">
		<div class="page-container">
			<div class="main-content">
				<h1 align="center" style="margin-top: 50px;">Forgot-PassWord</h1>
				<section class="min-vh-80 d-flex bg-primary align-items-center">
					<form action="GenerateOtpPass" class="w-50 ml-10" class="box"
						class="form" id="form" method="post" onsubmit="return login()">

						<div class="form-group mb-3 ml-10 inputBox">
							<label for="email">Email address</label> <input type="text"
								name="email" class="form-control" id="email" autocomplete="off"
								aria-describedby="emailHelp" onkeyup="validate();"> <span
								class="indicator7"></span><span class="small validate" id="p"></span>
								
						</div>
						<div class="mb-3"><span style="margin-left:26rem;" class="medium" id="p1"></span></div>
						<div align="center">
							<button type="submit" name="submit"
								class="btn btn-primary form-group ml-10">Send</button>
						</div>
						<div class="register-link ml-10" align="center">
							<h6>
								<a href="login.jsp" class="color">Back To Login</a>
							</h6>
						</div>
					</form>
				</section>
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
			</div>
		</div>
	</div>

	<script>
// 		form.addEventListener('submit',(event)= > {
// 			 event.preventDefault();
// 			 validate();
// 		})
		
		function validate(){
				const form= document.getElementById('form');
				const email= document.getElementById('email').value;
				const pattern=/^[^ ]+@[^ ]+\.[a-z]{2,3}$/
				
				
				if(email.match(pattern))
				{
					$('#p').html('Email Is valid').css('color', 'Green');
					form.classList.add('valid6')
					form.classList.remove('invalid6')
				}
				else
				{
					$('#p').html('Email Is Not Valid').css('color', 'red');
					form.classList.add('invalid6')
					form.classList.remove('valid6')
				}
				if(email == "")
				{
					$('#p').html('Email Field Is Empty').css('color', 'red');
					form.classList.remove('invalid6')
					form.classList.remove('valid6')
				}
			}
			function login()
			{
				const form= document.getElementById('form');
				const email= document.getElementById('email').value;
				const pattern=/^[^ ]+@[^ ]+\.[a-z]{2,3}$/
				
				if(email.match(pattern))
				{
// 						window.location="/customer.jsp";
						return true;
				}
				else
				{
					$('#p1').html('Please Fill-Up The Filed').css('color', 'red');
					return false;
// 					window.location="/triallogin.jsp";
				}
			}
		
		</script>
</body>
</html>