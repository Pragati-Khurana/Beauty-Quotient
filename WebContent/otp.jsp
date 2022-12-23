<%@page import="com.ikonique.bean.User"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Primary Meta Tags -->
<title>Forgot-Password</title>


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
<style>
#form .indicator7
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid .indicator7
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid .indicator7
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}



</style>


<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->

</head>
<% HttpSession httpSession = request.getSession(false);
	User user = null;   
	if(null!=httpSession){
	   user = (User)httpSession.getAttribute("user");
   }
%>
<body class="animsition">
 <%String otpstring=(String) request.getAttribute("otpstring");%>
	<div class="page-wrapper">
		<div class="page-container">
			<div class="main-content">
				<h1 align="center" style="margin-top: 50px;">Forgot-PassWord</h1>
				<section class="min-vh-80 d-flex bg-primary align-items-center">
					<form action="updatepassword.jsp" class="w-50 ml-10" class="box"
						class="form" id="form" method="post" onsubmit="return login()">

						<div class="form-group mb-3 ml-10 inputBox">
							<label for="email">Enter OTP</label> <input type="text"
								name="otp" class="form-control" id="otp" autocomplete="off"
								aria-describedby="emailHelp" placeholder="Enter Your OTP Here" onkeyup="validate();" maxLength="4"> 
 								<span 
 								class="indicator7"></span> <span class="small" id="p"></span>
 								<input style="visibility:hidden;" value="<%=otpstring %>" type="text" name="otp1"  id="otp1">
						</div>
						<div class="mb-2"><span style="margin-left:28rem;" class="medium" id="p1"></span></div>
						<div align="center">
							<button type="submit" name="submit"
								class="btn btn-primary form-group ml-10">Submit</button>
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
function validate() {
	const form = document.getElementById('form');
	const otp = document.getElementById('otp').value;
	const otp1=document.getElementById('otp1').value;
	const pattern = "^-?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)$";
	
	if (otp == "") 
	{
		$('#p').html('OTP Field Is Empty').css('color', 'red');
		form.classList.add('invalid')
		form.classList.remove('valid')
	}
	else
	{ 
		if(otp.match(pattern))
		{
			$('#p').html('OTP Field Is Valid').css('color', 'Green');
			form.classList.remove('invalid')
			form.classList.add('valid')
		}
		else
		{
			$('#p').html('OTP Field Is Not Valid').css('color', 'red');
			form.classList.add('invalid')
			form.classList.remove('valid')
		}
	}
}

function login(){
	const form=document.getElementById('form');
	const otp=document.getElementById('otp').value;
	const otp1=document.getElementById('otp1').value;
	
	if(otp.match(otp1))
	{
		return true;
	}
	else
	{
		form.classList.add('invalid')
		form.classList.remove('valid')
		$('#p1').html('OTP IS INVALID!!').css('color', 'red');
		return false;
	}
	
}


</script>
</body>
</html>