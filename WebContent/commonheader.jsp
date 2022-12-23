<%@page import="com.ikonique.bean.Product"%>
<%@page import="com.ikonique.bean.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.ikonique.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%!int temp = '0';%>
<%
	HttpSession httpSession = request.getSession(false);
User userheader = null;
if (null != httpSession) {
	userheader = (User) httpSession.getAttribute("loginBean");
	if(userheader!=null){
		temp = '1';
	}
	
} else {
	temp = '0';
}
%>
<style>
.marq {
            padding-top: 30px;
            padding-bottom: 30px;
        }
</style>
<meta charset="ISO-8859-1">
<%@include file="FontFaces.jsp"%>
<%@include file="commoncss.jsp"%>
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

<body>
	<%
		if (temp == '1') {
	%>
	<%
		if (userheader.getRole_id() == 1) {
	%>
	<jsp:include page="/SelectCartDetails" />
	<%
		List<Cart> cartCountList = (List) request.getAttribute("cartList");
	%>
	<%
		List<Integer> cartcountint = (List) request.getAttribute("cartint");
	%>
	<%
		int cartcount = 0;
	%>
	<%
		for (Cart cart : cartCountList) {
	%>
	<%
		cartcount = cartcount + 1;
	%>
	<%
		}
	%>
	<header class="header-desktop" style="background-color: #e6e7ee;">
		<!-- <link data-require="sweet-alert@*" data-semver="0.4.2" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" /> -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="header-wrap" style="position: sticky; z-index: 9">
					<form id="from1" class="form-header" action="" method="POST">
						 <marquee class="marq" style="width:47rem; font-size: 35px; font-style: normal; font-family: Georgia, serif; color:#483C32;" direction = "left">Beauty Quotient</marquee>
					</form>
					<div class="header-button">
						<div class="noti-wrap">
							<div class="noti__item">
								<a href="cart.jsp"><i class="fas fa-shopping-cart"></i><span class="quantity"><%=cartcount %></span> </a>
							</div>
						</div>
						<div class="account-wrap">
							<div class="account-item clearfix js-item-menu">
								<div class="image">
									<%
										if (userheader.getUserProfilepicString() != null) {
									%>
									<img
										src="data:image/jpg;base64,<%=userheader.getUserProfilepicString()%>" />
									<%
										} else {
									%>
									<img src="bg-img/Blank-Photo.png">
									<%
										}
									%>
								</div>
								<div class="content">
									<a class="js-acc-btn" href="#"><%=userheader.getFirstname()%>
										<%=userheader.getLastname()%></a>
								</div>
								<div class="account-dropdown js-dropdown">
									<div class="info clearfix">
										<div class="image">
											<%
												if (userheader.getUserProfilepicString() != null) {
											%>
											<a href="editpro.jsp"> <img
												src="data:image/jpg;base64,<%=userheader.getUserProfilepicString()%>" />
											</a>
											<%
												} else {
											%>
											<a href="editpro.jsp"> <img src="bg-img/Blank-Photo.png">
											</a>
											<%
												}
											%>
										</div>
										<div class="content">
											<h5 class="name">
												<a href="editpro.jsp"><%=userheader.getFirstname()%> <%=userheader.getLastname()%></a>
											</h5>
											<span class="email"><%=userheader.getEmail()%></span>
										</div>

									</div>
									<div class="account-dropdown__body">
										<div class="account-dropdown__item">
											<a href="editpro.jsp"> <i class="far fa-edit"></i>Edit
												Profile
											</a>
										</div>
										<div class="account-dropdown__item">
											
											<a  id="click" onclick='return check()' >
												<i class="fas fa-user-minus"></i>Delete Account?
											</a>
										</div>
										
										<div class="account-dropdown__item">
											<a href="changepassword.jsp"> <i class="fas fa-key"></i>Change
												Password
											</a>
										</div>
									</div>
									<div class="account-dropdown__footer">
										<a href="LogoutServlet"> <i class="fas fa-sign-out-alt"></i>Logout
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="modal fade" id="modal" tabindex="-1"
								role="dialog" aria-labelledby="modal-default" aria-hidden="true" data-backdrop="static" data-keyboard="false">
								<div class="modal-dialog modal-dialog-centered" role="document" >
									<div class="modal-content">
										<div class="modal-header">
											<h2 class="h6 modal-title mb-0" id="modal-title-default">Beauty Quotient</h2>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
<!-- 												<span aria-hidden="true">Ã</span> -->
											</button>
										</div>
										<div class="modal-body">
											<p><h4><b>Are You Sure ? You Want To Delete Your Account?</b></h4></p>
											
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm" data-dismiss="modal">No</button>
											<a href="DeleteUserRecord" type="button"
												class="btn ml-auto"
												>Yes</a>
										</div>
									</div>
								</div>
							</div>
	<%
		} else if (userheader.getRole_id() == 2) {
	%>
	<header class="header-desktop" style="background-color: #e6e7ee;">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="header-wrap" style="position: sticky; z-index: 9">
					<form id="from1" class="form-header" action="" method="POST">
						<marquee class="marq" style="width:50rem; font-size: 35px; font-style: normal; font-family: Georgia, serif; color:#483C32;" direction = "left">Beauty Quotient</marquee>
					</form>
					<div class="header-button">
						
						<div class="account-wrap">
							<div class="account-item clearfix js-item-menu">
								<div class="image">
									<%
										if (userheader.getUserProfilepicString() != null) {
									%>
									<img
										src="data:image/jpg;base64,<%=userheader.getUserProfilepicString()%>" />
									<%
										} else {
									%>
									<img src="bg-img/Blank-Photo.png">
									<%
										}
									%>
								</div>
								<div class="content">
									<a class="js-acc-btn" href="#"><%=userheader.getFirstname()%>
										<%=userheader.getLastname()%></a>
								</div>
								<div class="account-dropdown js-dropdown">
									<div class="info clearfix">
										<div class="image">
											<%
												if (userheader.getUserProfilepicString() != null) {
											%>
											<a href="editpro.jsp"> <img
												src="data:image/jpg;base64,<%=userheader.getUserProfilepicString()%>" />
											</a>
											<%
												} else {
											%>
											<a href="editpro.jsp"> <img src="bg-img/Blank-Photo.png">
											</a>
											<%
												}
											%>
										</div>
										<div class="content">
											<h5 class="name">
												<a href="editpro.jsp"><%=userheader.getFirstname()%> <%=userheader.getLastname()%></a>
											</h5>
											<span class="email"><%=userheader.getEmail()%></span>
										</div>

									</div>
									<div class="account-dropdown__body">
										<div class="account-dropdown__item">
											<a href="editpro.jsp"> <i class="far fa-edit"></i>Edit
												Profile
											</a>
										</div>
										<div class="account-dropdown__item">
											 <a  id="click" onclick='return check()' >
												<i class="fas fa-user-minus"></i>Delete Account?
											</a>
											
										</div>
										<div class="account-dropdown__item">
											<a href="changepassword.jsp"> <i class="fas fa-key"></i>Change
												Password
											</a>
										</div>
									</div>
									<div class="account-dropdown__footer">
										<a href="LogoutServlet"> <i class="fas fa-sign-out-alt"></i>Logout
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="modal fade" id="modal" tabindex="-1"
								role="dialog" aria-labelledby="modal-default" aria-hidden="true" data-backdrop="static" data-keyboard="false">
								<div class="modal-dialog modal-dialog-centered" role="document" >
									<div class="modal-content">
										<div class="modal-header">
											<h2 class="h6 modal-title mb-0" id="modal-title-default">Beauty Quotient</h2>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
<!-- 												<span aria-hidden="true">Ã</span> -->
											</button>
										</div>
										<div class="modal-body">
											<p><h4><b>Are You Sure ? You Want To Delete Your Account?</b></h4></p>
											
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm" data-dismiss="modal">No</button>
											<a href="DeleteUserRecord" type="button"
												class="btn ml-auto"
												>Yes</a>
										</div>
									</div>
								</div>
							</div>
	
	<%
		} else {
	%>
	<header class="header-desktop" style="background-color: #e6e7ee;">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="header-wrap" style="position: sticky; z-index: 9">
					<form class="form-header" action="" method="POST">
						<marquee class="marq" style="width:50rem; font-size: 35px; font-style: normal; font-family: Georgia, serif; color:#483C32;" direction = "left">Beauty Quotient</marquee>
					</form>
					<div class="header-button">
						<div class="noti-wrap">
							<div class="noti__item js-item-menu">
								<i class="zmdi zmdi-notifications"></i> <span class="quantity">3</span>
								<div class="notifi-dropdown js-dropdown">
									<div class="notifi__title">
										<p>You have 3 Notifications</p>
									</div>
									<div class="notifi__item">
										<div class="bg-c1 img-cir img-40">
											<i class="zmdi zmdi-email-open"></i>
										</div>
										<div class="content">
											<p>You got a email notification</p>
											<span class="date">April 12, 2018 06:50</span>
										</div>
									</div>
									<div class="notifi__item">
										<div class="bg-c2 img-cir img-40">
											<i class="zmdi zmdi-account-box"></i>
										</div>
										<div class="content">
											<p>Your account has been blocked</p>
											<span class="date">April 12, 2018 06:50</span>
										</div>
									</div>
									<div class="notifi__item">
										<div class="bg-c3 img-cir img-40">
											<i class="zmdi zmdi-file-text"></i>
										</div>
										<div class="content">
											<p>You got a new file</p>
											<span class="date">April 12, 2018 06:50</span>
										</div>
									</div>
									<div class="notifi__footer">
										<a href="#">All notifications</a>
									</div>
								</div>
							</div>
						</div>
						<div class="account-wrap">
							<div class="account-item clearfix js-item-menu">
								<div class="image">
									<%
										if (userheader.getUserProfilepicString() != null) {
									%>
									<img
										src="data:image/jpg;base64,<%=userheader.getUserProfilepicString()%>" />
									<%
										} else {
									%>
									<img src="bg-img/Blank-Photo.png">
									<%
										}
									%>
								</div>
								<div class="content">
									<a class="js-acc-btn" href="#"><%=userheader.getFirstname()%>
										<%=userheader.getLastname()%></a>
								</div>
								<div class="account-dropdown js-dropdown">
									<div class="info clearfix">
										<div class="image">
											<%
												if (userheader.getUserProfilepicString() != null) {
											%>
											<a href="editpro.jsp"> <img
												src="data:image/jpg;base64,<%=userheader.getUserProfilepicString()%>" />
											</a>
											<%
												} else {
											%>
											<a href="editpro.jsp"> <img src="bg-img/Blank-Photo.png">
											</a>
											<%
												}
											%>
										</div>
										<div class="content">
											<h5 class="name">
												<a href="editpro.jsp"><%=userheader.getFirstname()%> <%=userheader.getLastname()%></a>
											</h5>
											<span class="email"><%=userheader.getEmail()%></span>
										</div>
									</div>
									<div class="account-dropdown__body">
										<div class="account-dropdown__item">
											<a href="editpro.jsp"> <i class="zmdi zmdi-account"></i>Edit
												Profile
											</a>
										</div>
										<div class="account-dropdown__item">
											<a href="changepassword.jsp"> <i class="fas fa-key"></i>Change
												Password
											</a>
										</div>
									</div>
									<div class="account-dropdown__footer">
										<a href="login.jsp"> <i class="zmdi zmdi-power"></i>Logout
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<%
		}
	%>
	<%
		} else {
	%>
	<header class="header-desktop" style="background-color: #e6e7ee;">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="header-wrap">
					<form class="form-header" action="" method="POST">
						<marquee class="marq" style="width:49rem; font-size: 35px; font-style: normal; font-family: Georgia, serif; color:#483C32;" direction = "left">Beauty Quotient</marquee>
					</form>
					<div class="">
					 <button type="submit" name="submit" onclick="location.href='register.jsp';"
							class="btn ml-8">Register</button>
						<button type="submit" name="submit" onclick="location.href='login.jsp';"
							class="btn ml-1">login</button>
					</div>
				</div>
			</div>
		</div>
	</header>
	<%} %>
</body>

<%@include file="commonjs.jsp"%>
<script>

function check()
{
	$('#modal').modal('show');
    return false;
}

</script>
</html>