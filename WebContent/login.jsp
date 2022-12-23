<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Primary Meta Tags -->
<title>Login</title>
<style>
    
#form .indicator1
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid .indicator1
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid .indicator1
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
.eye
{
	position: absolute;
	top: 45px;
	right: 20px;
	width: 15px;
	height:15px;
}
/* #form .indicator2 */
/* { */
/* 	position: absolute; */
/* 	top: 50px; */
/* 	right: 20px; */
/* 	width: 10px; */
/* 	height:10px; */
/* 	background: #555; */
/* 	border-radius: 50%; */
/* } */

/* #form.invalid1 .indicator2 */
/* { */
/* 	background: #f00; */
/* 	box-shadow: 0 0 5px #f00, */
/* 				0 0 10px #f00, */
/* 				0 0 20px #f00, */
/* 				0 0 40px #f00; */
/* } */

/* #form.valid1 .indicator2 */
/* { */
/* 	background: #0f0; */
/* 	box-shadow: 0 0 5px #0f0, */
/* 				0 0 10px #0f0, */
/* 				0 0 20px #0f0, */
/* 				0 0 40px #0f0; */
/* } */
.forget
{
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
<body class="animsition">
<!-- <div class="loader" id="loader">Loading...</div> -->
<div class="page-wrapper">

		<%-- 		<%@include file="customermobilesidebar.jsp"%> --%>
<%-- 		<%@include file="customersidebar.jsp"%> --%>
<%-- 		<%@include file="customerheader.jsp"%> --%>
		<div class="page-container">
			<div class="main-content">
			<h1 align="center" style="margin-top: 50px;">Login</h1>
				  <section class="min-vh-80 d-flex bg-primary align-items-center">
				<form action="LoginServlet" onsubmit="return meet()" class="w-50 ml-10" class="box" class="form" id="form" 
				 enctype="multipart/form-data" method="post">
					<div class="form-group mb-3 ml-10 inputBox">
						<label for="email">Email address</label> 
						<input type="text" name="email" class="form-control" id="email" autocomplete="off" aria-describedby="emailHelp" onkeyup="validate();">
						<span class="indicator1"></span>
						<span class="small" id="p"></span>
					</div>
					<div class="form-group mb-1 ml-10">
						<label for="password">Password</label> 
						<input type="password" name="password" class="form-control" id="pass" onkeyup="validate1();">
<!-- 						<span class="indicator2"></span> -->
						<i class="eye far fa-eye" id="togglePassword"></i>
						<span class="small" id="p1"></span><br><br>
					</div>
					<div class="form-group ml-10">
						<span class="small" id="p2"></span>
					</div>
					
					<div align="right" class="forget ml-10">
				<h6> <a class="color small" id="forget" href="forget-pass.jsp">Forgotten Password?</a> </h6><br>
				</div>
					<div align="center" >
					
					<button type="submit" name="submit" class="btn btn-primary form-group ml-10">Login</button>
					</div>
					
					
				<div class="register-link ml-10" align="center">
                                <h6>
                                  <a href="visitor.jsp" class="color">Skip Login</a>
                                  <br><br>
                                    Don't you have account?
                                    <a class="color" href="register.jsp"><b>Sign Up Here</b></a>
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
// 		form.addEventListener('submit',(event)=> {
// 			 event.preventDefault();
			
// 			validate();
// 			validate1();
// 		})
		
// 		const sendData =(sRate,count) =>{
// 	if(sRate == count)
// 		{	
// 			swal( "","log in is successful!!","valid"); 
// 		}
// }
	
// 		const successMsg = () => {
			
			 
// 			 var formCon =document.getElementsByClassName('form-group');

// 			var count=(formCon.length)-2;
			
// 			for(var i=0;i< formCon.length;i++)
// 				{
// 					if(formCon[i].className == 'form-group valid'){
// 						var sRate=0+i;
// 						console.log(sRate);
// 						sendData(sRate,count);
						
// 					}
// 					else
// 						{
// 							return false;
// 						}
// 				} 

// 		}


	
	
	
	
	const togglePassword = document.querySelector('#togglePassword');
	const password = document.querySelector('#pass');
	togglePassword.addEventListener('click', function (e) {
	    // toggle the type attribute
	    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
	    password.setAttribute('type', type);
	    // toggle the eye slash icon
	    this.classList.toggle('fa-eye-slash');
	});
	
	
		function validate(){
				const form= document.getElementById('form');
				const email= document.getElementById('email').value;
				const pattern=/^[^ ]+@[^ ]+\.[a-z]{2,3}$/
				
				if(email.match(pattern)){
					form.classList.add('valid')
					form.classList.remove('invalid')
					$('#p').html('Email Is Valid').css('color', 'Green');
				}else{
					form.classList.add('invalid')
					form.classList.remove('valid')
					$('#p').html('Email Is Not Valid').css('color', 'red');
				}
				if(email == "")
					{
					form.classList.add('invalid')
					form.classList.remove('valid')
					$('#p').html('Email Field Is Empty').css('color', 'red');
					}
			}
			
			function validate1(){
				const form= document.getElementById('form');
				const pass= document.getElementById('pass').value;
				const pattern1=/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/
				
				if(pass.match(pattern1)){
					form.classList.add('valid1')
					form.classList.remove('invalid1')
					$('#p1').html('Password Is Valid').css('color', 'Green');
				}else{
					form.classList.add('invalid1')
					form.classList.remove('valid1')
					$('#p1').html('Password Is Not Valid').css('color', 'red');
				}
				if(pass == "")
					{
					form.classList.add('invalid1')
					form.classList.remove('valid1')
					$('#p1').html('Password Field Is Empty').css('color', 'red');
					}
			}
			
			function meet()
			{
				const form= document.getElementById('form');
				const email= document.getElementById('email').value;
				const pass= document.getElementById('pass').value;
				const pattern=/^[^ ]+@[^ ]+\.[a-z]{2,3}$/
				const pattern1=/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/
				
				if(email == "" || email == null && pass == "" || pass == null)
				{
					//alert("if....");
					$('#p2').html('Please Check Enter Email-Id & Password').css('color', 'red');
             		return false;
				}
				else
				{
					if(email.match(pattern) && pass.match(pattern1))
					{
						//alert("else if....");
						return true;
					}
					else
					{
						$('#p2').html('Please check Enter Email-Id & Password').css('color', 'red');
						return false;
					}
				}
			}

			// 			$(window).on('load', function(){
			// 			  setTimeout(removeLoader, 2000); 
			// 			});
			// 			function removeLoader(){
			// 			    $( "#loader" ).fadeOut(500, function() {
			// 			      $( "#loader" ).remove(); 
			// 			  });  
			// 			}
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</body>


</html>