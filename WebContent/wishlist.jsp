<%@page import="com.ikonique.bean.Product"%>
<%@page import="com.ikonique.bean.Wishlist"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>

</style>
<meta charset="ISO-8859-1">
<title>wishlist</title>
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
<jsp:include page="/SelectWishlistDetails"/>
<%List <Wishlist> wishlistList =(List)request.getAttribute("wishlistList"); %> 
<%List <Integer> wishlistint =(List)request.getAttribute("wishlistint"); %>

<jsp:include page="/SelectProductDetails"/>
<%List <Product> productList =(List)request.getAttribute("productList"); %>

</head>
<body style="background-color: #e6e7ee;">
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>

<br><br><br>
<div class="row mr-0 ml-2">
<%int temp2 = 0; %>
	 <%for(Product product:productList){ %>
                	<%if(wishlistint.contains(product.getProduct_id())){ %>
  	<%temp2 = temp2 + 1; %>
    <div class="col-10 ml-10">
        <div class="card shadow-soft border-light p-4 ml-5 mt-3" style="background-color: #e6e7ee;">
        	
            <div class="row align-items-center">
                
                             <aside class="col-md-3">
                
	                    <a href="#">
	                        <img src="data:image/jpg;base64,<%=product.getProductpicString()%>">
	                    </a>
                   
                </aside>
                <div class="col-md-6">
                    <div class="info-main">
                        <a href="SelectProductLandDetails?productId=<%=product.getProduct_id()%>" class="h5 title"> <%=product.getProduct_name() %> </a>
                       <!--  <p>Monitor your health. Track your workouts. Get the motivation you need to achieve your fitness goals. And stay connected to the people and information you care about.</p> -->
                    	<p><%= product.getProduct_desc() %></p>
                    </div>
                </div> 
                <div class="col-12 col-md-3">
                    <div class="d-flex align-items-center ml-7">
                        <span class="h5 mb-0 text-gray  mr-2">
                            &#x20B9;<%=product.getProduct_price() %>
                        </span>
                    </div>
                    <!-- info-price-detail // -->
                    <!-- <span class="text-success small"><span class="fas fa-shipping-fast mr-1"></span>Free shipping</span> -->
                    <div class="mt-4">
                    <%if(product.getProduct_quantity().equals("0")){ %>
                    	<div class="ml-7 mt-3">
											<span Style="font-size: 6mm" class="text-danger">Out Of Stock</span>
										</div>
                    
                    <%}else{ %>
                       <div class="ml-7 mt-3">
											<a class="btn-link text-dark" href="InsertProductInCart?productid=<%=product.getProduct_id()%>"><span
												class="fas fa-shopping-cart mr-2"></span>Add To Cart </a>
										</div>
					<%} %>
                        <div class="ml-7 mt-3">
											<a class="btn-link text-dark" href="DeleteWishlistDetail?productid=<%=product.getProduct_id()%>"><span
												class="far fa-trash-alt mr-2"></span>Remove </a>
										</div>
					
                    </div>
                 
                </div> 
               
            </div> 
            
        </div>
    </div>
      <%}%><br>
 <%} %>
 <%if(temp2 == 0){ %>
		<div style="margin-left:40rem;" class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content bg-primary" style="width:28rem;">
				<div class="modal-header">
					<p class="modal-title" id="modal-title-notification">Ikonique
						Interiors</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="py-3 text-center">
						<span class="modal-icon display-1-lg"><span
							class="fas fa-exclamation-triangle"></span></span>
						<h2 class="h4 my-3">Your Wishlist Is Empty!</h2>
					</div>
				</div>
				<div class="modal-footer">
					<a href="customer.jsp" type="button" class="btn btn-sm btn-primary">Home</a>
				</div>
			</div>
		</div>
		<%
			}
		%>
</div>
</body>
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
<script>

$('.fa-heart').click(function(){
	//alert($(this).attr('id'));
    if($(this).attr('att') == 0){
    
    	var pid = $(this).attr('id');
    	var opname = "red";
    	
    	$.post( "InsertDeleteProductInWishlist", {productid: pid , operation : opname } )
		  .done(function( data ) {
			  //alert("succesfull called..");
		  });
    	
        $(this).css('color', 'red');
        $(this).attr('att',1);
    } else {
    	var pid = $(this).attr('id');
    	var opname = "black";
    	
    	$.post( "InsertDeleteProductInWishlist", {productid: pid , operation : opname } )
		  .done(function( data ) {
			 // alert("succesfull called..");
		  });
    	
        $(this).css('color', 'black');
        $(this).attr('att',0);
    }
   
});


</script>
</html>