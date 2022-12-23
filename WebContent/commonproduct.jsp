<%@page import="com.ikonique.bean.Wishlist"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ikonique.bean.User"%>
<%@page import="com.ikonique.bean.Product"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="css1/bootstrap.min.css">

<link rel="stylesheet" href="css1/Fontawesome.css">

<link rel="stylesheet" href="css1/product.css">
</head>
<title>Products</title>
<style>
input.search-input
{
			width: 300px;
            margin-left: 850px;
            background-color: #e6e7ee;
            float: 150;
           
}
</style>
 <% int temp6 = '0'; %>
<% HttpSession httpSession2 = request.getSession(false);
	User user1 = null;   
	if(null!=httpSession2){
		user1 = (User)httpSession2.getAttribute("loginBean");
		if(user1!=null){
			temp6 = '1';
		}
		
   }
	else
	{
		temp6 = '0';
	}
%>

<%List <Product> productlist =(List)request.getAttribute("productlist"); %>
<%int subcatid=(int)request.getAttribute("subcatid"); %>
<%String subcategoryname=(String)request.getAttribute("subcategoryname"); %>

<jsp:include page="/SelectSubCategoryDetails"/>
<%List<SubCategory> subcategoryList1 =(List)request.getAttribute("subcategoryList"); %>

<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>

<%if(temp6 == '1'){%> 

 
 <jsp:include page="/SelectWishlistDetails"/>
<%List <Wishlist> wishlistList =(List)request.getAttribute("wishlistList"); %> 
<%List <Integer> wishlistint =(List)request.getAttribute("wishlistint"); %> 
<jsp:include page="/SelectCartDetails"/>
<%List <Cart> cartList =(List)request.getAttribute("cartList"); %> 
<%List <Integer> cartlistint =(List)request.getAttribute("cartint"); %>

<body style="background-color: #e6e7ee;">
<h1>Hello World</h1>
<input type="hidden" value="100" >
<div class="page-wrapper">
<div class="page-container">
<div class="main-content" style="background-color: #e6e7ee;">
		<div class="row ml-4">
			<div class="col-xl-12">
				<div class="section-title">
					<h2><%=subcategoryname%> Products</h2>
					</div>
				
				<br>
			</div>
		</div>
		<section style="background-color: #e6e7ee;">
		<input type="text" id="mySearch" placeholder="Search Products..." class="form-control search-input">
						<ul style="margin-right:55rem; margin-top:-5rem;" class="navbar-nav navbar-nav-hover align-items-lg-center">
							<li class="nav-item dropdown"><a href="#" class="nav-link"
								data-toggle="dropdown"> <span class="nav-link-inner-text">Price Filter</span>
									<span class="fas fa-angle-down nav-link-arrow ml-2"></span>
							</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="SelectParticularProduct?subcategoryid=<%=subcatid%>">All Products</a></li>
									<li><a class="dropdown-item" href="PriceFilterForProduct?subcatid=<%=subcatid%>-0-500">0 - 500</a></li>
									<li><a class="dropdown-item" href="PriceFilterForProduct?subcatid=<%=subcatid%>-500-1000">500 - 1000</a></li>
								</ul></li>
						</ul>
						<div  style="margin-left:400px;">
							<%if(productlist.isEmpty()){ %>
							<h5>Match Not Found</h5>
						<%} %>
					</div>
			<div class="row" style="margin-left:10px; margin-right:10px;" id="result">
						<%
							for (Product product : productlist) {
						%>
			<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
				<div class="single-product" id="single">
					<div class="product-thumb">
						<a href="SelectProductLandDetails?productId=<%=product.getProduct_id()%>">
<%-- 						 <input type="text" name="pid" id="pid" value="<%=product.getProduct_id() %>"> --%>
						 <img src="data:image/jpg;base64,<%=product.getProductpicString() %>" alt="">
						</a>
					</div>
					<div class="product-title">
						<h3>
							 <a href="SelectProductLandDetails?productId=<%=product.getProduct_id()%>"><%=product.getProduct_name() %></a>
						</h3>
					</div>
					<div class="product-btns">
						<a href="SelectProductLandDetails?productId=<%=product.getProduct_id()%>" class="btn-small mr-2">&#x20B9;<%=product.getProduct_price() %></a>
						<%if(product.getProduct_quantity().equals("0")){ %>
							
							 <a class="btn-round"><i id="<%=product.getProduct_id() %>"  class="fa fa-heart"
						 <%if(null!=wishlistint && !wishlistint.isEmpty()) {%>
						  
							<%if(wishlistint.contains(product.getProduct_id())){ %>
								att="1" style="color: red"
							<%}else{ %>
								att="0" style="color: black"
							<%} %>
							
						<%}else{ %>
							 att="0" style="color: black"
							<%} %>
						></i></a> 
						<%}else{ %>
						
						<a  class="btn-round mr-2"><i class="fa fa-shopping-cart" id="<%=product.getProduct_id() %>"
						
						 <%if(null!=cartlistint && !cartlistint.isEmpty()) {%>
						  
							<%if(cartlistint.contains(product.getProduct_id())){ %>
								att="1" style="color: blue"
							<%}else{ %>
								att="0" style="color: black"
							<%} %>
							
						<%}else{ %>
							 att="0" style="color: black"
							<%} %>
						></i></a> 
						
						
						  <!-- For Wishlist Icon -->
						  <a class="btn-round"><i id="<%=product.getProduct_id() %>"  class="fa fa-heart"
						 <%if(null!=wishlistint && !wishlistint.isEmpty()) {%>
						  
							<%if(wishlistint.contains(product.getProduct_id())){ %>
								att="1" style="color: red"
							<%}else{ %>
								att="0" style="color: black"
							<%} %>
							
						<%}else{ %>
							 att="0" style="color: black"
							<%} %>
						></i></a>
						<%} %>
						
						</div>
						<div class="mt-3" align="center">
							<%if(product.getProduct_quantity().equals("0")){ %>
	 							<span Style="font-size: 6mm" class="text-danger">Out Of Stock</span>
	 						<%} %>
 						</div>
<%-- 					<input type="hidden" value="<%=String.valueOf(user.getUser_id()) %>" name="userid"> --%>
				</div>
			</div>
			<%} %>
		</div>
</section>
</div>
</div>
</div>
</body>

<%@include file="commonjs.jsp"%>
<script>

$('.fa-heart').click(function(){
    if($(this).attr('att') == 0){
    
    	var pid = $(this).attr('id');
    	var opname = "red";
    	
    	$.post( "InsertDeleteProductInWishlist", {productid: pid , operation : opname } )
		  .done(function( data ) {
		  });
    	
        $(this).css('color', 'red');
        $(this).attr('att',1);
    } else {
    	var pid = $(this).attr('id');
    	var opname = "black";
    	
    	$.post( "InsertDeleteProductInWishlist", {productid: pid , operation : opname } )
		  .done(function( data ) {
		  });
    	
        $(this).css('color', 'black');
        $(this).attr('att',0);
    }
   
});

$('.fa-shopping-cart').click(function(){
    if($(this).attr('att') == 0){
    
    	var pid = $(this).attr('id');
    	var opname = "blue";
    	
    	$.post( "InsertDeleteProductInCart", {productid: pid , operation : opname } )
		  .done(function( data ) {
		  });
    	
        $(this).css('color', 'blue');
        $(this).attr('att',1);
    } else {
    	var pid = $(this).attr('id');
    	var opname = "black";
    	
    	$.post( "InsertDeleteProductInCart", {productid: pid , operation : opname } )
		  .done(function( data ) {
		  });
    	
        $(this).css('color', 'black');
        $(this).attr('att',0);
    }
   
});

//  $("#mySearch").keyup(function() {

//      // Retrieve the input field text and reset the count to zero
//      var filter = $(this).val(),
//        count = 0;

//      // Loop through the comment list
//      $('#result div').each(function() {

//        // If the list item does not contain the text phrase fade it out
//        if ($(this).text().search(new RegExp(filter, "i")) < 0) {
//           $(this).hide(); // MY CHANGE

//          // Show the list item if the phrase matches and increase the count by 1
//        } else {
//           $(this).show();// MY CHANGE
//          count++;
//        }

//      });

//    });

$("#mySearch").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#result *").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
 
 
</script>
<%}else{ %>

<%-- <%List <Product> productlist =(List)request.getAttribute("productlist"); %> --%>

<body style="background-color: #e6e7ee;">



<div class="page-wrapper">
<div class="page-container">
<div class="main-content" style="background-color: #e6e7ee;">
		<div class="row ml-4">
			<div class="col-xl-12">
				<div class="section-title">
					<h2><%=subcategoryname %> Products</h2>
					</div>
				
				<br>
			</div>
		</div>
		<section style="background-color: #e6e7ee;">
		<input type="text" id="mySearch" placeholder="Search Products..." class="form-control search-input">
						<ul style="margin-right:55rem; margin-top:-5rem;" class="navbar-nav navbar-nav-hover align-items-lg-center">
							<li class="nav-item dropdown"><a href="#" class="nav-link"
								data-toggle="dropdown"> <span class="nav-link-inner-text">Price Filter</span>
									<span class="fas fa-angle-down nav-link-arrow ml-2"></span>
							</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="SelectParticularProduct?subcategoryid=<%=subcatid%>">All Products</a></li>
									<li><a class="dropdown-item" href="PriceFilterForProduct?subcatid=<%=subcatid%>-0-500">0 - 500</a></li>
									<li><a class="dropdown-item" href="PriceFilterForProduct?subcatid=<%=subcatid%>-500-1000">500 - 1000</a></li>
								</ul></li>
						</ul>
						<div  style="margin-left:400px;">
							<%if(productlist.isEmpty()){ %>
							<h5>Match Not Found</h5>
						<%} %>
					</div>
			<div class="row" style="margin-left:10px; margin-right:10px;" id="result">
						<%
							for (Product product : productlist) {
						%>
			<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
				<div class="single-product" id="single">
					<div class="product-thumb">
						<a href="SelectProductLandDetails?productId=<%=product.getProduct_id()%>">
<%-- 						 <input type="text" name="pid" id="pid" value="<%=product.getProduct_id() %>"> --%>
						 <img src="data:image/jpg;base64,<%=product.getProductpicString() %>" alt="">
						</a>
					</div>
					<div class="product-title">
						<h3>
							 <a href="SelectProductLandDetails?productId=<%=product.getProduct_id()%>"><%=product.getProduct_name() %></a>
						</h3>
					</div>
					<div class="product-btns">
						<a href="SelectProductLandDetails?productId=<%=product.getProduct_id()%>" class="btn-small mr-2">&#x20B9;<%=product.getProduct_price() %></a>
						<%if(product.getProduct_quantity().equals("0")){ %>
							 <a  href="login.jsp" class="btn-round"><i  class="fa fa-heart"></i></a>
						<%}else{ %>
							 <a href="login.jsp" class="btn-round mr-2"><i class="fa fa-shopping-cart"></i></a>
							 <a  href="login.jsp" class="btn-round"><i  class="fa fa-heart"></i></a>
							 
						<%} %>	
					</div>
						<div class="mt-3" align="center">
							<%if(product.getProduct_quantity().equals("0")){ %>
	 							<span Style="font-size: 6mm" class="text-danger">Out Of Stock</span>
	 						<%} %>
 						</div>
<%-- 					<input type="hidden" value="<%=String.valueOf(user.getUser_id()) %>" name="userid"> --%>
				</div>
			</div>
			<%} %>
		</div>
</section>
</div>
</div>
</div>
</body>

<%@include file="commonjs.jsp"%>
<script>


$("#mySearch").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#result *").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
 
 
</script>
	
<%} %>
</html>
