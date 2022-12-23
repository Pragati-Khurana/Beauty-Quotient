<!DOCTYPE html>
<%@page import="com.ikonique.bean.OrderDetails"%>
<%@page import="com.ikonique.bean.Order"%>
<%@page import="com.ikonique.bean.Offer"%>
<%@page import="com.ikonique.dao.impl.userDaoImpl"%>
<%@page import="com.ikonique.dao.userDao"%>
<%@page import="com.ikonique.bean.Product"%>
<%@page import="com.ikonique.bean.Cart"%>
<html lang="en">
<title>My Order</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Primary Meta Tags -->
<style>
.cart {
	background-color: #e6e7ee;
}

$
quantity-btn-color: #95d7fc ;
.product {
	width: 30%;
	margin: 30px;
}

.form-group {
	width: 30%;
	margin: 30px;
	.
	glyphicon
	{
	color
	:
	$
	quantity-btn-color;
}
}
.demo-2 
        {
  			overflow: hidden;
 			white-space: nowrap;
  			text-overflow: ellipsis;
  			max-width: 150px;
		}
</style>
<!-- Fontawesome -->
<link type="text/css"
	href="neuro/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">

<!-- Pixel CSS -->
<link type="text/css" href="neuro/css/neumorphism.css" rel="stylesheet">

<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->
<%
HttpSession httpSession1 = request.getSession(false);
User user1 = null;
if (null != httpSession1) {
	user1 = (User) httpSession1.getAttribute("loginBean");
}
%>
</head>
<jsp:include page="/SelectOrderTableDetails"/>
<%List<Order> orderList =(List)request.getAttribute("orderList"); %>
<jsp:include page="/SelectOrderDetails"/>
<%List<OrderDetails> orderdetailsList =(List)request.getAttribute("orderdetailsList"); %>
<jsp:include page="/SelectProductDetails"/>
<%List<Product> productList =(List)request.getAttribute("productList"); %>
<jsp:include page="/SelectOfferDetails"/>
<%List<Offer> offerList =(List)request.getAttribute("offerList"); %>
<body>
	
	<div class="page-wrapper">
		<%@include file="commonsidebar.jsp"%>
		<%@include file="commonheader.jsp"%>
		<div class="page-container">
			<div class="main-content">
			
			<%for(Order order : orderList) {%>
				<%if(order.getUserid()==user1.getUser_id()){ %>
					<%if(order.getPaymentstatus().equalsIgnoreCase("success")){ %>
				<div class="card shadow-inset border-light p-3 mr-2 ml-2 mb-5"
					style="background-color: #e6e7ee;">
					<div class="row mr-0 ml-0" style="background-color: #e6e7ee;">
						<div class="col-12">
							<div class="card shadow-soft border-light p-4 mb-3"
								style="background-color: #e6e7ee;">
								<table>
								<tr>
								<td>Order Placed</td>
								<td>Total</td>
								<td>Ship To</td>
								<td>Order Id</td>
								</tr>
								<tr>
								<td><%=order.getOrderdate() %></td>
								<td><%=order.getAmount() %></td>
								<td class="demo-2" data-toggle="tooltip" data-placement="bottom" title="<%=order.getAddress() %>"><%=order.getFirstname() %> <%=order.getLastname() %></td>
								<td>OID_<%=order.getOrderid() %></td>
								</tr>
								</table>
							</div>
							
						</div>
					</div>
					<div class="row mr-0 ml-0" style="background-color: #e6e7ee;">
						<div class="col-12">
						<%for(OrderDetails orderDetails : orderdetailsList){ %>
							<%if(order.getOrderid()==orderDetails.getOrderid()){ %>
							<%for(Product product : productList) {%>
								<%if(product.getProduct_id()==orderDetails.getProductid()){ %>
							<div class="card shadow-soft border-light p-4 mb-3"
								style="background-color: #e6e7ee;">
								<div class="row align-items-center item">
									<div class="col-3">
										<a href="#"> <img src="data:image/jpg;base64,<%=product.getProductpicString()%>"></a>
									</div>
									<div class="col">
										<div class="d-flex font-weight-bold">
											<a class="h5 pname" href="#"><%=product.getProduct_name() %></a> <span id="mainprice"
												class="price lineitemtotal h5 ml-auto"><%=product.getProduct_price() %></span><br>
												
										</div>
										<div class="d-flex font-weight-bold">
										<%for (Offer offer : offerList) {%>
													<%if (product.getOfferid() == offer.getOfferid()) {%>
														<span Style="font-size: 5mm;"id="discount" class="h6 mb-0 ml-auto lineitemtotal1 text-danger"
															value="<%=offer.getDiscount()%>"> <%=offer.getDiscount()%>%Off
														</span>
													<%break;}%>
												<%}%>
											</div>
										<span Style="font-size: 5mm; margin-left: 44rem;"
											id="discount" class="h6 mb-0 lineitemtotal1 text-danger"
											value=""> </span>
										<ul class="pl-3">
											<li class="small"><%=product.getProduct_desc() %></li>
											<li class="small">Quantity :  <%=orderDetails.getQuantity() %></li>
										</ul>
										<a href="InsertProductInCart?productid=<%=product.getProduct_id()%>" style="margin-left:34rem;" class="btn btn-block col-lg-4" type="submit">Buy It Again</a>
										<a href="SelectProductLandDetails?productId=<%=product.getProduct_id()%>" style="margin-left:34rem;" class="btn btn-block col-lg-4" type="submit">Write A Product Review</a>
									</div>
								</div>
							</div>
										<%} %>
									<%} %>
								<%} %>
							<%} %>
						</div>

						<a style="margin-left:21rem;" class="btn btn-block col-lg-6" href="GenerateOrderInvoice?orderid=<%=order.getOrderid() %>">Download Invoice</a>
					</div>
				</div>
						<%} %>
					<%} %>
				<%} %>
				
			</div>
		</div>
	</div>
	
</body>
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
<script src="neuro/vendor/jquery-countdown/dist/jquery.countdown.min.js"></script>
<script
	src="neuro/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="neuro/vendor/prismjs/prism.js"></script>

<script async defer src="https://buttons.github.io/buttons.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Neumorphism JS -->
<script src="neuro/assets/js/neumorphism.js"></script>
<%@include file="commonjs.jsp"%>
<script>
				$(document).ready(function(){
// 					alert("fn ready...");
					updatetotal();
					$( ".plus" ).click(function() {
						 
// 						  alert( "Handler for .click() called."+$(this).attr('data-id'));
// 						  alert("que:-"+$(this).parent().find('#myNumber').val());
						  var qunt =  parseInt($(this).parent().find('#myNumber').val());
						  qunt = qunt + 1;
						  if(qunt===11)
						  {
							  qunt = qunt - 1;
						  }
						  $(this).parent().find('#myNumber').val(qunt);
						  $(this).parent().find('#quantity').name = "quantity"+qunt;
						  $(this).parent().find('#quantity').val(qunt);
						 
						  if (document.getElementById("myNumber").value >= parseInt('10')) {
						        document.getElementById("myNumber").value = '10';
						    }
						  var amount = parseInt($(this).attr('data-id'));
						  var total = qunt * amount;
						  var discamt = $(this).parent().parent().find('#discount1').text();
						  var disctotal = discamt * qunt;
						  var disctotal1 = (disctotal).toFixed(2);
// 						  var disc = $(this).parent().parent().find('#discount').text();
// 						  alert("total p:-"+total);
						  $(this).parent().parent().find('#mainprice').text(total);
						  $(this).parent().parent().find('#individuldiscount').text(disctotal1);
						  updatetotal();
					});
					
					$( ".minus" ).click(function() {
						
// 						  alert( "Handler for .click() called."+$(this).attr('data-id'));
// 						  alert("que:-"+$(this).parent().find('#myNumber').val());
						  var qunt =  parseInt($(this).parent().find('#myNumber').val());
						  qunt = qunt - 1;
						  if(qunt===0)
						  {
							qunt = qunt + 1;  
						  }
						  $(this).parent().find('#myNumber').val(qunt);
						  var amount = parseInt($(this).attr('data-id'));
						  var total = qunt * amount;
						  var discamt = $(this).parent().parent().find('#discount1').text();
						  var disctotal = discamt * qunt;
						  var disctotal1 = (disctotal).toFixed(2);
// 						  alert("total p:-"+total);
						  $(this).parent().parent().find('#mainprice').text(total);
						  $(this).parent().parent().find('#individuldiscount').text(disctotal1);
						  updatetotal();
					});
					
				});
				
				function updatetotal()
				{
					var total=0;
					var disc = 0;
					var tax = 0;
					var grandtotal = 0;
					$( ".lineitemtotal" ).each(function() {
						total = total + parseInt($(this).text());
					   
					  });
					$( ".individuldiscount" ).each(function() {
						disc = disc + parseInt($(this).text());
					   
					  });
// 					alert("total:-"+total);
					$("#mrp").text(total);
					$("#dis").text(disc);
					tax = ((total - disc) * 18)/100;
					tax1 = (tax).toFixed(2);
					$("#tax").text(tax1);
					grandtotal = total - disc + tax;
					grandtotal1 = (grandtotal).toFixed(2);
					$("#grandtotal").text(grandtotal1);
					$("#total").val(grandtotal1);
					
				}
			
				function discount(amount,disc) {
					//alert("disc fn total:-"+amount);
// 					var dis = $('#discount').text();
					//alert("discount perticular:-"+disc);
// 					var dec = (dis / 100).toFixed(2);
// 					var mult = main * dec;
// 					var discount = (main - mult);
// 					var discount1 = (discount).toFixed(2);
// 					return discount1;
				}

				
		</script>
</html>