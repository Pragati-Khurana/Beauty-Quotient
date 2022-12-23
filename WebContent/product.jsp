<%@page import="com.ikonique.bean.Cart"%>
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
 
<% int temp1 = '0'; %>
<% HttpSession httpSession4 = request.getSession(false);
	User user4 = null;   
	if(null!=httpSession4){
		user4 = (User)httpSession4.getAttribute("loginBean");
		if(user4!=null){
			temp1 = '1';
		}
		
   }
	else
	{
		temp1 = '0';
	}
%>
<%if(temp1 == '1'){ %>
<jsp:include page="/SelectProductDetails"/>
<%List <Product> productList =(List)request.getAttribute("productList"); %>
  <jsp:include page="/SelectWishlistDetails"/>
<%List <Wishlist> wishlistList =(List)request.getAttribute("wishlistList"); %> 
<%List <Integer> wishlistint =(List)request.getAttribute("wishlistint"); %> 
<jsp:include page="/SelectCartDetails"/>
<%List <Cart> cartList =(List)request.getAttribute("cartList"); %> 
<%List <Integer> cartlistint =(List)request.getAttribute("cartint"); %> 
<body>
<section class="section-bg" style="background-color: #e6e7ee;">
	<div class="container" >

		<div class="row">
			<div class="col-xl-12">
				<div class="section-title">
					<h2>Products</h2>
				</div>
			</div>
		</div>
		<div class="row" >
		<%for(Product product : productList) {%>
			<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
				<div class="single-product">
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
						
						<!-- For Cart Icon -->
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
				</div>
				
			</div>
			
			<%} %>
		</div>
	</div>
</section>
</body>
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

/* $('.fa-shopping-cart').click(function(){
    if($(this).attr('att') == 0){
        $(this).css('color', 'blue');
        $(this).attr('att',1);
    } else {
        $(this).css('color', 'black');
        $(this).attr('att',0);
    }
}); */

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
</script>
<%}else{%>
<jsp:include page="/SelectProductDetails"/>
<%List <Product> productList =(List)request.getAttribute("productList"); %>
<body>
<section class="section-bg" style="background-color: #e6e7ee;">
	<div class="container" >

		<div class="row">
			<div class="col-xl-12">
				<div class="section-title">
					<h2>Products</h2>
				</div>
			</div>
		</div>
		<div class="row" >
		<%for(Product product : productList) {%>
			<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
				<div class="single-product">
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
							<a class="btn-round"><i id="<%=product.getProduct_id() %>"  class="fa fa-heart"></i></a> 
						<%}else{ %>
							<a class="btn-round mr-2"><i class="fa fa-shopping-cart" id="<%=product.getProduct_id() %>"></i></a>
							<a class="btn-round"><i id="<%=product.getProduct_id() %>"  class="fa fa-heart"></i></a>
						<%} %>
						</div>
						<div class="mt-3" align="center">
							<%if(product.getProduct_quantity().equals("0")){ %>
	 							<span Style="font-size: 6mm" class="text-danger">Out Of Stock</span>
	 						<%} %>
 						</div>
				</div>
				
			</div>
			<%} %>
		</div>
	</div>
</section>
</body>
<script>
$('.fa-heart').click(function(){
	window.location="login.jsp";
});
$('.fa-shopping-cart').click(function(){
	window.location="login.jsp";
});
</script>
<%} %>
</html>
