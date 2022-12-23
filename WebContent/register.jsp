<%@page import="com.ikonique.bean.Area"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head> 

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Primary Meta Tags -->
<title>Registration</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
	integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
	crossorigin="anonymous" />
<link type="text/css" href="css/login1css.css" rel="stylesheet">

<!-- Fontawesome -->
<link type="text/css"
	href="neuro/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">

<!-- Pixel CSS -->
<link type="text/css" href="neuro/css/neumorphism.css" rel="stylesheet">


<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->

</head>
<jsp:include page="/AreaRegistration" />
<%
	List<Area> area = (List) request.getAttribute("area");
%>
<body class="animsition">
	<div class="page-wrapper">
	
		<%-- 		<%@include file="customermobilesidebar.jsp"%> --%>
		<%-- 		<%@include file="customersidebar.jsp"%> --%>
		<%-- 		<%@include file="customerheader.jsp"%> --%>
		<div class="page-container">
			<div class="main-content">
			
				<h1 align="center" style="margin-top: 50px;">Registration</h1>
				<div class="alert alert-error collapse" role="alert" id="passwordsNoMatchRegister">
  	<span>
  		<p>Looks like the passwords you entered don't match!</p>
  	</span>
	</div>
				<br>
				<section class="min-vh-80 d-flex align-items-center">
				
					<form action="RegistrationServlet" class="w-50 ml-10" class="box"
						class="form" id="form" method="post" onsubmit="return login()"
						enctype="multipart/form-data">
						<div class="form-group mb-3 ml-10 inputBox">
							Choose Your <b>Role</b><br>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="exampleRadios1" id="exampleRadios21" value="option21"
									checked> <label class="form-check-label"
									for="exampleRadios21"> <b>Artist</b>
								</label> <input class="form-check-input" type="radio"
									name="exampleRadios1" id="exampleRadios11" value="option11">
								<label class="form-check-label" for="exampleRadios11"> <b>Customer</b>
								</label>

							</div>
						</div>
						<div class="form-group mb-3 ml-10 inputBox">
							<label for="fname">First Name</label> <input type="text"
								name="fname" class="form-control" id="fname" autocomplete="off"
								aria-describedby="emailHelp" onkeyup="validate2();"> <span
								class="indicator3"></span><span class="small validate" id="p"></span>
						</div>
						<div class="form-group mb-3 ml-10 inputBox">
							<label for="lname">Last Name</label> <input type="text"
								name="lname" class="form-control" id="lname" autocomplete="off"
								aria-describedby="emailHelp" onkeyup="validate3();"> <span
								class="indicator4"></span><span class="small validate" id="p1"></span>
						</div>
						<div class="form-group mb-3 ml-10 inputBox">
							<label for="add">Address</label>
							<textarea rows="5" name="address" class="form-control" id="add"
								autocomplete="off" aria-describedby="emailHelp"
								onkeyup="validate4();"></textarea>
							<span class="indicator5"></span><span class="small validate" id="p2"></span>
						</div>


						<div class="form-group mb-3 ml-10 inputBox">
							<label for="areaname">Area</label> <select name="area"
								class="form-control" id="area" aria-describedby="emailHelp"
								onchange="validate6()">
								<option value="0" selected>Select Area</option>
								<%
									for (Area place : area) {
								%>

								<option value="<%=place.getArea_id()%>"><%=place.getArea_name()%></option>

								<%
									}
								%>
							</select> <span class="indicator8"></span><span class="small validate" id="p3"></span>

						</div>

						<!-- <div class="form-group mb-3 ml-10 inputBox">
							<label for="pincode">Pincode</label> <input type="number"
								name="pin" class="form-control" id="pin" autocomplete="off"
								aria-describedby="emailHelp" onkeyup="validate7();"> <span
								class="indicator9"></span>
						</div> -->
						<div class="form-group mb-3 ml-10 inputBox vfees">
							<label for="visitingfees">Visiting Fees</label> <input
								type="text" name="vfees1" class="form-control" id="vfees"
								autocomplete="off" aria-describedby="emailHelp"
								onkeyup="validate8();" onkeypress="return onlyNumberKey(event)"> <span id="vfees2"
								class="indicator10"></span><span class="small validate" id="p4"></span>
						</div>
						<div class="form-group mb-3 ml-10 inputBox designation">
							<label for="designation">Designation</label> <input
								type="text" name="designation" class="form-control" id="designation"
								autocomplete="off" aria-describedby="emailHelp"
								onkeyup="validate9();"> <span id="designation2"
								class="indicator11"></span><span class="small validate" id="p5"></span>
						</div>
						
						<div class="form-group mb-3 ml-10 inputBox aboutme" >
							<label for="aboutme">About YourSelf</label>
							<textarea rows="5" name="aboutme" class="form-control" id="aboutme"
								autocomplete="off" aria-describedby="emailHelp"
								onkeyup="validate10();"></textarea>
							<span class="indicator12"></span><span class="small validate" id="p6"></span>
						</div>
						

						<div class="form-group mb-3 ml-10 inputBox">
							<label for="mobilenumber">Mobile Number</label> <input
								type="text" name="mno" class="form-control" id="mno"
								autocomplete="off" aria-describedby="emailHelp"
								onkeyup="validate5();" maxLength="10" onkeypress="return onlyNumberKey(event)"> 
								<span class="indicator6"></span><span class="small validate" id="p7"></span>
						</div>
						<div class="form-group mb-3 ml-10 inputBox">
							Gender<br>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="exampleRadios" id="exampleRadios1" value="Male" checked>
								<label class="form-check-label" for="exampleRadios1">
									Male </label> <input class="form-check-input" type="radio"
									name="exampleRadios" id="exampleRadios2" value="Female">
								<label class="form-check-label" for="exampleRadios2">
									Female </label>
							</div>
						</div>
						<div class="form-group mb-3 ml-10 inputBox">
							<label for="email">Email address</label> <input type="text"
								name="email" class="form-control" id="email" autocomplete="off"
								aria-describedby="emailHelp" onkeyup="validate();"> <span
								class="indicator1"></span><span class="small validate" id="p8"></span>
						</div>
						<div class="form-group mb-3 ml-10">
							<label for="password">Password</label> <input type="password"
								name="password" class="form-control" id="pass"
								onkeyup="validate1();" maxLength="8"> <span class="indicator2"></span>
							<span class="small validate" id="p9"></span>
							<h6 class="small">
								* Password Must Contain 8 Character<br>* Password must
								Contain Atleast one: <br>Special Character(@#$&!)<br>Number[0-9]<br>An
								Uppercase Charater[A-Z]<br>A Lowercase Character[a-z]
							</h6>
						</div>
						<div align="center">
							<!-- 							<button type="submit" name="submit" -->
							<!-- 								class="btn btn-primary form-group ml-10">Register</button> -->
							<button type="submit" name="submit"
							class="btn form-group btn-primary ml-10">Register</button>
							<div class="modal fade" id="modal-default" tabindex="-1"
								role="dialog" aria-labelledby="modal-default" aria-hidden="true" data-backdrop="static" data-keyboard="false">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h2 class="h6 modal-title mb-0" id="modal-title-default">The Ikonique Interiors</h2>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
<!-- 												<span aria-hidden="true">Ã</span> -->
											</button>
										</div>
										<div class="modal-body">
											<p><h4><b>Error : Your Registration Is Failed!!</b></h4></p>
											<p><h5>Check Your Fill Data...</h5></p>
											<p><h5>Something Went Wrong Try Again...</h5></p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm btn-primary" data-dismiss="modal">OK</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="modal" tabindex="-1"
								role="dialog" aria-labelledby="modal-default" aria-hidden="true" data-backdrop="static" data-keyboard="false">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h2 class="h6 modal-title mb-0" id="modal-title-default">The Ikonique Interiors</h2>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
<!-- 												<span aria-hidden="true">Ã</span> -->
											</button>
										</div>
										<div class="modal-body">
											<p><h4><b>Your Registration Is successful!!</b></h4></p>
											<p><h5>Now You Can Login Into The WebSite..</h5></p>
											<p><h5>Enjoy Your Shopping....</h5></p>
										</div>
										<div class="modal-footer">
											<a href="login.jsp" type="button"
												class="btn btn-primary text-danger ml-auto"
												>I Got It</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="register-link ml-10" align="center">
							<h6>
								<a href="visitor.jsp" class="color">Skip Register</a>
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
	function onlyNumberKey(evt) {
        
        // Only ASCII charactar in that range allowed
        var ASCIICode = (evt.which) ? evt.which : evt.keyCode
        if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
            return false;
        return true;
    }
$(document).ready(function(){

//     $('#form').on('submit', function() {
//         event.preventDefault();
//         $.ajax({
//             url:"RegistrationServlet",
//             method:"POST",
//             data:$("form").serialize(),
//             success:function(data)
//             {
//             	alert("data value:-"+$("form").serialize());
//                 if(data === "null")
//                 {
//                 	 alert("failed..........");
//                 	 $('').modal('show');
//                 	 $('#modal').modal('hide');
//                 }
//                 else
//                 {
//                 	alert("succesful..........");
//                 	$('#modal').modal('show');
//                 	$('#modal-default').modal('hide'); 
//                 }
//             }
//         })
//     });
 });

		function validate() {
			const form = document.getElementById('form');
			const email = document.getElementById('email').value;
			const pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/

			if (email.match(pattern)) {
				$('#p8').html('Email Is Valid').css('color', 'Green');
				form.classList.add('valid')
				form.classList.remove('invalid')
			} else {
				$('#p8').html('Email Is Not Valid').css('color', 'red');
				form.classList.add('invalid')
				form.classList.remove('valid')
			}
			if (email == "") {
				$('#p8').html('Email Field Is Empty').css('color', 'red');
				form.classList.add('invalid')
				form.classList.remove('valid')
			}
		}

		function validate1() {
			const form = document.getElementById('form');
			const pass = document.getElementById('pass').value;
			const pattern1 = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/

			if (pass.match(pattern1) && pass.length >= 8 && pass.length <= 20) {
				form.classList.add('valid1')
				form.classList.remove('invalid1')
				$('#p9').html('Password Is Valid').css('color', 'Green');
			} else {
				form.classList.add('invalid1')
				form.classList.remove('valid1')
				$('#p9').html('Password Is Not Valid').css('color', 'red');
			}
			if (pass == "") {
				form.classList.add('invalid1')
				form.classList.remove('valid1')
				$('#p9').html('Password Field Is Empty').css('color', 'red');
			}
		}

		function login() {
			
 			const form = document.getElementById('form');
  			var fname = document.getElementById('fname').value;
  			var lname = document.getElementById('lname').value;
  			var add = document.getElementById('add').value;
  		   	var mno = document.getElementById('mno').value;
  		  	var email = document.getElementById('email').value;
  		 	var pass = document.getElementById('pass').value;
  			var vfees = document.getElementById('vfees').value;
  			var designation=document.getElementById('designation').value;
  			var aboutme=document.getElementById('aboutme').value;
			var areavalue = $('#area :selected').text();
			const emailpattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/
			const passpattern = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/
			const mnopattern = /(7|8|9)\d{9}/
  			if(fname == null || fname == "" && lname == null || lname == "" && add == null 
 				|| add == "" && mno == null || mno == ""  && email == null 
 				|| email == ""  && pass == null || pass == ""  
 				&& areavalue == null || areavalue == "")
  			{
  					if($('input[name="exampleRadios1"]:checked').val()=="option21")
  					{
  						if(vfees == null || vfees == "" && designation=="" || designation== null && aboutme==null || aboutme=="")
  						{	
  							//alert("if ...if...if");
  							$('#modal').modal('hide');
  		  	             	$('#modal-default').modal('show');
  		  	 				return false;
  						}
  						else
  						{
//   							alert("if ...if....else");
  							$('#modal').modal('show');
  		             		$('#modal-default').modal('hide');
  		 					return true;
  						}
  					}
//   					alert("if....main");
  	 				$('#modal').modal('hide');
  	             	$('#modal-default').modal('show');
  	 				return false;
  	 				window.location = "/register.jsp";
 			}
 			else
 			{
 				if(mno.match(mnopattern) && pass.match(passpattern) && email.match(emailpattern))
  				{
 					//alert("else....");
 					$('#modal').modal('show');
             		$('#modal-default').modal('hide');
 					return true;
 					window.location = "/login.jsp";
  				}
 				else
 				{
 					//alert("if....");
  	 				$('#modal').modal('hide');
  	             	$('#modal-default').modal('show');
  	 				return false;
  	 				window.location = "/register.jsp";
 				}
 			}
		}

		function validate2() {
			const form = document.getElementById('form');
			const fname = document.getElementById('fname').value;
			const pattern = " ";

			if (fname != pattern) {
				$('#p').html('First Name Is Valid').css('color', 'Green');
				form.classList.add('valid2')
				form.classList.remove('invalid2')
			} else {
				$('#p').html('First Name Is Not Valid').css('color', 'red');
				form.classList.add('invalid2')
				form.classList.remove('valid2')
			}
			if (fname == "") {
				$('#p').html('First Name Field Is Empty').css('color', 'red');
				form.classList.add('invalid2')
				form.classList.remove('valid2')
			}
			if($.isNumeric(fname))
			{
				$('#p').html('First Name Is Not Valid').css('color', 'red');
				form.classList.add('invalid2')
				form.classList.remove('valid2')
			}
		}
		function validate3() {
			const form = document.getElementById('form');
			const lname = document.getElementById('lname').value;
			const pattern = "  ";

			if (lname != pattern) {
				$('#p1').html('Last Name Is Valid').css('color', 'Green');
				form.classList.add('valid3')
				form.classList.remove('invalid3')
			} else {
				$('#p1').html('Last Name Is Not Valid').css('color', 'red');
				form.classList.add('invalid3')
				form.classList.remove('valid3')
			}
			if (lname == "") {
				$('#p1').html('Last Name Field Is Empty').css('color', 'red');
				form.classList.add('invalid3')
				form.classList.remove('valid3')
			}
			if($.isNumeric(lname))
			{
				$('#p1').html('Last Name Is Not Valid').css('color', 'red');
				form.classList.add('invalid3')
				form.classList.remove('valid3')
			}
		}
		function validate4() {
			const form = document.getElementById('form');
			const add = document.getElementById('add').value;
			const pattern = " ";

			if (add != pattern) {
				$('#p2').html('Address Is Valid').css('color', 'Green');
				form.classList.add('valid4')
				form.classList.remove('invalid4')
			} else {
				$('#p2').html('Address Is Not Valid').css('color', 'red');
				form.classList.add('invalid4')
				form.classList.remove('valid4')
			}
			if (add == "") {
				$('#p2').html('Address Field Is Empty').css('color', 'red');
				form.classList.add('invalid4')
				form.classList.remove('valid4')
			}
		}
		function validate5() {
			const form = document.getElementById('form');
			const mno = document.getElementById('mno').value;
			const pattern = /(7|8|9)\d{9}/

			if (mno.match(pattern) && mno.length == 10) {
				$('#p7').html('Mobile Number Is Valid').css('color', 'Green');
				form.classList.add('valid5')
				form.classList.remove('invalid5')
			} else {
				$('#p7').html('Mobile Number Is Not Valid').css('color', 'red');
				form.classList.add('invalid5')
				form.classList.remove('valid5')
			}
			if (mno == "") {
				$('#p7').html('Mobile Number Field Is Empty').css('color', 'red');
				form.classList.add('invalid5')
				form.classList.remove('valid5')
			}
		}

		function validate6() {
			
			 
			const form = document.getElementById('form');
			var e=document.getElementById('area');
			var value=e.options[e.selectedIndex].value;
			
			if (value!='0') 
			{
				$('#p3').html('Area Field Is Valid').css('color', 'Green');
				form.classList.add('valid6')
				form.classList.remove('invalid6')
			} 
			else 
			{
				$('#p3').html('Area Field Is Empty').css('color', 'red');
				form.classList.add('invalid6')
				form.classList.remove('valid6')
			}
		}

		 function validate9() {
			
		
			const form = document.getElementById('form');
			const designation = document.getElementById('designation').value;
			

			if (designation!="") {
				$('#p5').html('Designation Is Valid').css('color', 'Green');
				form.classList.add('valid11')
				form.classList.remove('invalid11')
			} else {
				$('#p5').html('Designation Is Not Valid').css('color', 'red');
				form.classList.add('invalid11')
				form.classList.remove('valid11')
			}
			if (designation == "") {
				$('#p5').html('Designation Field Is Empty').css('color', 'red');
				form.classList.add('invalid11')
				form.classList.remove('valid11')
			}
			if($.isNumeric(designation))
			{
				$('#p5').html('Designation Is Not Valid').css('color', 'red');
				form.classList.add('invalid11')
				form.classList.remove('valid11')
			}
		}
		 
		 function validate10() {
				
				
				const form = document.getElementById('form');
				const aboutme = document.getElementById('aboutme').value;
				

				if (aboutme!="") {
					$('#p6').html('About Me Is Valid').css('color', 'Green');
					form.classList.add('valid12')
					form.classList.remove('invalid12')
				} else {
					$('#p6').html('About Me Is Not Valid').css('color', 'red');
					form.classList.add('invalid12')
					form.classList.remove('valid12')
				}
				if (aboutme == "") {
					$('#p6').html('About Me Field Is Empty').css('color', 'red');
					form.classList.add('invalid12')
					form.classList.remove('valid12')
				}
			}
 
		function validate8() {
			const form = document.getElementById('form');
			const vfees = document.getElementById('vfees').value;
			const pattern = " ";

			if (vfees != pattern) {
				$('#p4').html('Visiting Fees Is Valid').css('color', 'Green');
				form.classList.add('valid8')
				form.classList.remove('invalid8')
			} else {
				$('#p4').html('Visiting Fees Is Not Valid').css('color', 'red');
				form.classList.add('invalid8')
				form.classList.remove('valid8')
			}
			if (vfees == "") {
				$('#p4').html('Visiting Fees Field Is Empty').css('color', 'red');
				form.classList.add('invalid8')
				form.classList.remove('valid8')
			}
		}

		$("input[name='exampleRadios1']").change(function() {

			if ($(this).val() == "option21") {
				$(".vfees").show();
				$(".designation").show();
				$(".aboutme").show();
				
				form.classList.remove('invalid1')
				form.classList.remove('valid1')

				form.classList.remove('invalid2')
				form.classList.remove('valid2')

				form.classList.remove('invalid3')
				form.classList.remove('valid3')

				form.classList.remove('invalid4')
				form.classList.remove('valid4')

				form.classList.remove('invalid5')
				form.classList.remove('valid5')

				form.classList.remove('invalid6')
				form.classList.remove('valid6')

				form.classList.remove('invalid7')
				form.classList.remove('valid7')

				form.classList.remove('invalid8')
				form.classList.remove('valid8')

				form.classList.remove('invalid11')
				form.classList.remove('valid11')
				
				form.classList.remove('invalid12')
				form.classList.remove('valid12')
			
				form.classList.remove('invalid')
				form.classList.remove('valid')
				
				
				document.getElementById("fname").value = "";
				document.getElementById("lname").value = "";
				document.getElementById("add").value = "";
				document.getElementById("pin").value = "";
				document.getElementById("mno").value = "";
				document.getElementById("email").value = "";
				document.getElementById("area").value = "";
				document.getElementById("pass").value = "";
				document.getElementById("vfees").value = "0";
				document.getElementById("designation").value = "";
			} else {
				$(".vfees").hide();
				$(".designation").hide();
				$(".aboutme").hide();
				
				
				form.classList.remove('invalid1')
				form.classList.remove('valid1')

				form.classList.remove('invalid2')
				form.classList.remove('valid2')

				form.classList.remove('invalid3')
				form.classList.remove('valid3')

				form.classList.remove('invalid4')
				form.classList.remove('valid4')

				form.classList.remove('invalid5')
				form.classList.remove('valid5')

				form.classList.remove('invalid6')
				form.classList.remove('valid6')

				form.classList.remove('invalid7')
				form.classList.remove('valid7')

				form.classList.remove('invalid8')
				form.classList.remove('valid8')

				form.classList.remove('invalid11')
				form.classList.remove('valid11')
				
				form.classList.remove('invalid12')
				form.classList.remove('valid12')
				
				form.classList.remove('invalid')
				form.classList.remove('valid')

				document.getElementById("fname").value = "";
				document.getElementById("lname").value = "";
				document.getElementById("add").value = "";
				document.getElementById("pin").value = "";
				document.getElementById("mno").value = "";
				document.getElementById("email").value = "";
				document.getElementById("area").value = "";
				document.getElementById("pass").value = "";
				document.getElementById("vfees").value = "0";
				document.getElementById("designation").value = "";

			}

		});
	</script>
</body>


</html>