<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointments Of Interior Designer</title>
<%@include file="FontFaces.jsp"%>
<%@include file="commoncss.jsp"%>
<link rel="stylesheet" href="appointmentcssjs/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

</head>
<jsp:include page="/SelectDesignerDetails" />
<%
	List<User> designerList = (List) request.getAttribute("designerList");
%>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
			rel="stylesheet">
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>
<body class="animsition" style="background-color: #e6e7ee;">
	<div class="page-wrapper">
		<div class="page-container">
			<div class="main-content">
				<div class="row">
					<div class="col-xl-12">
						<div class="section-title">
							<h2>Artists</h2>
						</div>
					</div>
				</div>
				<div class="row">
						<%
							for (User user1 : designerList) {
						%>
						<section>
							<div class="container">
								<a href="SelectDesigner?designerid=<%=user1.getUser_id() %> ">
									<div class="card" style="height: 300px;">
										<div class="imgBx">
											<%
												if (user1.getUserProfilepicString() != null) {
											%>
											<img
												src="data:image/jpg;base64,<%=user1.getUserProfilepicString()%>" />
											<%
												} else {
											%>
											<img src="bg-img/Blank-Photo.png">
											<%
												}
											%>
										</div>
										<div class="content">
											<div class="contentBx">
												<h3>
													<%=user1.getFirstname()%>
													<%=user1.getLastname()%><br> <span><%=user1.getEmail()%></span>
												</h3>
											</div>
											<ul class="sci">
												<li style="-i: 1;"><a href="#"><i
														class="fa fa-facebook" aria-hidden="true"></i></a></li>
												<li style="-i: 2;"><a href="#"><i
														class="fa fa-twitter" aria-hidden="true"></i></a></li>
												<li style="-i: 3;"><a href="#"><i
														class="fa fa-instagram" aria-hidden="true"></i></a></li>
											</ul>
										</div>
									</div>
								</a>
							</div>
						</section>
				<%}%>
				</div>
			</div>
		</div>
	</div>
	<%@include file="commonjs.jsp"%>
</body>
</html>