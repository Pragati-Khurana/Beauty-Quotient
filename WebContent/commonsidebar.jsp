<%@page import="com.ikonique.bean.SubCategory"%>
<%@page import="com.ikonique.bean.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ikonique.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<%@include file="FontFaces.jsp"%>
<%@include file="commoncss.jsp"%>
<% int temp = '0'; %>
<% HttpSession httpSessionsidebaar = request.getSession(false);
	User usersidebaar = null;   
	if(null!=httpSessionsidebaar){
		usersidebaar = (User)httpSessionsidebaar.getAttribute("loginBean");
		if(usersidebaar!=null){
			temp = '1';
		}
		
   }
	else
	{
		temp = '0';
	}
%>
<jsp:include page="/SelectCategoryDetails"/>
<%List<Category> categoryList =(List)request.getAttribute("categoryList"); %>
<jsp:include page="/SelectSubCategoryDetails"/>
<%List<SubCategory> subcategoryList =(List)request.getAttribute("subcategoryList"); %>

<meta charset="ISO-8859-1">
</head>
<body class=animsition>
<%if(temp == '1'){ %>
	<%if(usersidebaar.getRole_id()==1){ %>
	<aside class="menu-sidebar d-none d-lg-block" style="background-color: #e6e7ee;">
	<div class="logo" style="background-color: #e6e7ee;">
		<a href="#"> <img src="images/icon/logo2.png" alt="Cool Admin" />
		</a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">
		<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li><a href="customer.jsp"> <i
						class="fas fa-home"></i>Home
				</a></li> 
				<li><a class="js-arrow" href="#"> <i
						class="fas  fa-caret-down"></i>Categories
				</a>
				<%for(Category category:categoryList){ %>
					<ul class="list-unstyled navbar__sub-list js-sub-list">
						<li class="has-sub"><a class="js-arrow" href="#"><i
								class="fas  fa-toggle-down (alias)"></i><%=category.getCategory_name() %></a>
								<%for(SubCategory subcategory:subcategoryList){ %>
								<%if(subcategory.getCategory_id()==category.getCategory_id()){ %>
								<ul class="list-unstyled js-sub-list">
								<li><a class="js-arrow" href="SelectParticularProduct?subcategoryid=<%=subcategory.getSub_category_id() %>" ><i class="fas fa-arrow-circle-o-right"></i><%=subcategory.getSub_category_name() %></a></li>
								
							</ul>
							<%} %>
					<%} %></li>
						
					</ul>
					<%} %>
				</li>
				
				<li><a href="wishlist.jsp"> <i class="fas fa-bookmark"></i>Wishlist
				</a></li>
				<li><a href="myorder.jsp"> <i class="fas fa-suitcase"></i>My
						Orders
				</a></li>
				<li><a href="appointmentcards.jsp"> <i class="fas fa-male"></i>Appoint
						Artist
				</a></li>
				<li><a href="contactus.jsp"> <i class="fas fa-question"></i>Enquiry
				</a></li>
				<li><a href="aboutus.jsp"> <i class="fas fa-exclamation"></i>About
						Us
				</a></li>


			</ul>			
		</nav>
	</div>
 </aside>   
	<%}else if(usersidebaar.getRole_id()==2){ %>
	<aside class="menu-sidebar d-none d-lg-block" style="background-color: #e6e7ee;">
	<div class="logo" style="background-color: #e6e7ee;">
		<a href="#"> <img src="images/icon/logo2.png" alt="Cool Admin" />
		</a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">
		<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li><a href="designer.jsp"> <i
						class="fas fa-home"></i>Home
				</a> </li>
				
				<li><a href="manageappointments.jsp"> <i class="fas fa-suitcase"></i>Manage
						Appointments
				</a></li>
				
				<li><a href="contactus.jsp"> <i class="fas fa-question"></i>Enquiry
				</a></li>
				<li><a href="aboutus.jsp"> <i class="fas fa-exclamation"></i>About
						Us
				</a></li>


			</ul>
		</nav>
	</div>
</aside>  
	<%}else{ %>
	<aside class="menu-sidebar d-none d-lg-block"
		style="background-color: #e6e7ee;">
		<div class="logo" style="background-color: #e6e7ee;">
			<a href="#"> <img src="images/icon/logo2.png" alt="Cool Admin" />
			</a>
		</div>
		<div class="menu-sidebar__content js-scrollbar1">
			<nav class="navbar-sidebar">
				<ul class="list-unstyled navbar__list">
					<li><a href="admin.jsp"> 
					<i class="fas fa-home"></i>Home</a>
					</li>		
				<li><a class="js-arrow" href="#"> <i
							class="fas  fa-caret-down"></i>Manage
				</a>
					<ul class="list-unstyled navbar__sub-list js-sub-list">
						<li><a href="managecustomer.jsp"><i class="fas"></i>Customer Profile</a>
						</li>
						<li><a href="managedesigner.jsp"><i class="fas"></i>Designer Profile</a>
						</li>
						<li><a href="managefeedback.jsp"><i class="fas"></i>Feedback</a>
						</li>
						<li><a href="socialmediamanagement.jsp"><i class="fas"></i>Social Media</a>
						</li>
					</ul>
				</li>
				<!-- <li><a href="#"> <i class="fas fa-bar-chart-o"></i>Chart
				</a></li> -->
				<li><a class="js-arrow" href="#"> <i
							class="fas  fa-caret-down"></i>Manage Tables
				</a>
					<ul class="list-unstyled navbar__sub-list js-sub-list">
						<li><a href="customertable.jsp"><i class="fas"></i>Customer Table</a>
						</li>
						<li><a href="designerTable.jsp"><i class="fas"></i>Designer Table</a>
						</li>
						<li><a href="productTable.jsp"><i class="fas"></i>Product Table</a>
						</li>
						<li><a href="categoryTable.jsp"><i class="fas"></i>Category Table</a>
						</li>
						<li><a href="subcategoryTable.jsp"><i class="fas"></i>Sub-Category Table</a>
						</li>
						<li><a href="offertable.jsp"><i class="fas"></i>Offer Table</a>
						</li>
					</ul>
				</li>
						
				<li><a href="paymentstatustable.jsp"> <i class="fas fa-credit-card"></i>Payment Status
				</a></li>
				<li><a href="GenerateReportForAdmin"> <i class="fas fa-file-text"></i>Generate Report
				</a></li>
				<li><a href="aboutus.jsp"> <i class="fas fa-exclamation"></i>About Us
				</a></li>


			</ul>
		</nav>
	</div>
</aside> 
	<%}%>  
<%}else{%>
<aside class="menu-sidebar d-none d-lg-block" style="background-color: #e6e7ee;">
	<div class="logo" style="background-color: #e6e7ee;">
		<a href="#"> <img src="images/icon/logo2.png" alt="Cool Admin" />
		</a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">
		<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li><a class="js-arrow" href="visitor.jsp"> <i
						class="fas fa-home"></i>Home
				</a></li>
				<li><a class="js-arrow" href="#"> <i
						class="fas  fa-caret-down"></i>Categories
				</a>
				<%for(Category category:categoryList){ %>
					<ul class="list-unstyled navbar__sub-list js-sub-list">
						<li class="has-sub"><a class="js-arrow" href="#"><i
								class="fas  fa-toggle-down (alias)"></i><%=category.getCategory_name() %></a>
							<%for(SubCategory subcategory:subcategoryList){ %>
							<%if(subcategory.getCategory_id()==category.getCategory_id()){ %>
							<ul class="list-unstyled js-sub-list">
								<li><a href="SelectParticularProduct?subcategoryid=<%=subcategory.getSub_category_id() %>"><i class="fas fa-arrow-circle-o-right"></i><%=subcategory.getSub_category_name() %></a></li>
							</ul>
							<%} %>
							<%} %>
						</li>
					</ul>
					<%} %>
				</li>
				<li><a href="login.jsp"> <i class="fas fa-male"></i>Appoint
						Artist
				</a></li>
				<li><a href="login.jsp"> <i class="fas fa-question"></i>Enquiry
				</a></li>
				<li><a href="aboutus.jsp"> <i class="fas fa-exclamation"></i>About
						Us
				</a></li>
			</ul>
		</nav>
	</div>
</aside>

<%} %>
</body>
<%@include file="commonjs.jsp"%>
</html>