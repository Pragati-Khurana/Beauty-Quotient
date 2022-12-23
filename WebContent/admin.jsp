<%@page import="com.ikonique.bean.Offer"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.ikonique.bean.Order"%>
<%@page import="com.ikonique.bean.OrderDetails"%>
<%@page import="com.ikonique.bean.BookingInfo"%>
<%@page import="com.ikonique.bean.Booking"%>
<%@page import="com.ikonique.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="FontFaces.jsp"%>
<%@include file="commoncss.jsp"%>
</head>
<jsp:include page="/SelectProductDetails"/>
<%List<Product> productList =(List)request.getAttribute("productList"); %>
<jsp:include page="/SelectUserDetails"/>
<%List<User> userList =(List)request.getAttribute("userList"); %>
<jsp:include page="/SelectBookingDetails"/>
<%List<Booking> bookinglist =(List)request.getAttribute("bookinglist"); %>
<jsp:include page="/SelectBookingInfoDetails"/>
<%List<BookingInfo> bookinginfolist =(List)request.getAttribute("bookinginfolist"); %>
<jsp:include page="/SelectOrderDetails"/>
<%List<OrderDetails> orderdetailsList =(List)request.getAttribute("orderdetailsList"); %>
<jsp:include page="/SelectOrderTableDetails"/>
<%List<Order> orderList =(List)request.getAttribute("orderList"); %>
<jsp:include page="/SelectOfferDetails"/>
<%List<Offer> offerList =(List)request.getAttribute("offerList"); %>
<body>
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>
<div class="main-content" style="margin-left:17rem; background-color: #e6e7ee;">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Admin Dashboard</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-25">
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>
                                            <%int totalproduct=0; %>
                                            <%for(Product product : productList){ %>
                                           	 <%if(product.getStatus() == 1){ %>
                                            	<%totalproduct = totalproduct + 1; %>
                                           	 <%} %>
                                            <%} %>
                                            <div class="text">
                                                <h2><%=totalproduct %></h2>
                                                <span>Total Products</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-shopping-cart"></i>
                                            </div>
                                            <%int totalitem=0; %>
                                            <%for(Order order:orderList){ %>
                                            <%for(OrderDetails od:orderdetailsList){ %>
                                            <%if(order.getOrderid()==od.getOrderid()){ %>
                                            <%if(order.getPaymentstatus().equals("success")) {%>
                                            	<%totalitem=totalitem+od.getQuantity(); %>
                                            <%} %>	
                                            <%} %>
                                            <%} %>
                                            <%} %>
                                            <div class="text">
                                                <h2><%=totalitem %></h2>
                                                <span>Items Sold</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart2"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-calendar-note"></i>
                                            </div>
                                            <%int earnings1=0; %>
                                            <%for(Booking booking:bookinglist) {%>
                                            		<%if(booking.getPaymentstatus().equalsIgnoreCase("success")) {%>
                                            			<%earnings1=earnings1+1; %>   
                                            		<%} %>
                                            <%} %>
                                            <div class="text">
                                                <h2><%=earnings1 %></h2>
                                                <span>Artist's Appointments</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart3"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i>&#x20B9;</i>
                                            </div>
                                            <%double totalearning=0; %>
                                            <%for(Order order:orderList){ %>
                                            	<%if(order.getPaymentstatus().equals("success")){ %>
                                            		<%totalearning=totalearning+order.getAmount(); %>
                                            	<%} %>
                                            <%} %>
                                            <%DecimalFormat df=new DecimalFormat("#.00"); %>
                                            
                                            <div class="text">
                                                <h2>&#x20B9;<%=(df.format(totalearning))%></h2>
                                                <span>ToTal Earnings</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart4"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 m-b-25">Earnings By Items</h2>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
                                                <th>date</th>
                                                <th>order ID</th>
                                                <th>name</th>
                                                <th class="text-right">price</th>
                                                <th class="text-right">quantity</th>
                                                <th class="text-right">total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%for(Order order:orderList){ %>
                                        	<%for(OrderDetails od:orderdetailsList){ %>
                                        	<%if(od.getOrderid()==order.getOrderid()) {%>
                                        	<%for(Product product:productList) {%>
                                        	<%if(product.getProduct_id()==od.getProductid()) {%>
                                        	<%if(order.getPaymentstatus().equalsIgnoreCase("success")) {%>
                                            <tr>
                                                <td><%=order.getOrderdate() %></td>
                                                <td>OID_<%=order.getOrderid() %></td>
                                                <td><%=product.getProduct_name() %></td>
                                                <td class="text-right">&#x20B9;<%=product.getProduct_price() %></td>
                                                <td class="text-right"><%=od.getQuantity() %></td>
                                                <%double p=Double.parseDouble(product.getProduct_price()); %>
                                                <%double discount=0; %>
                                                <%for(Offer offer:offerList) {%>
                                                	<%if(offer.getOfferid()==product.getOfferid()) {%>
                                                		<%discount=(p*offer.getDiscount())/100; %>
                                                	<%} %>
                                                <%} %>
                                                <%double amt=p-discount; %>
                                                 <%DecimalFormat df1=new DecimalFormat("#.00"); %>
                                                <td class="text-right">&#x20B9;<%=(df1.format(amt*od.getQuantity()))%> </td>
                                           </tr>
                                            <%} %>
                                            <%} %>
                                            <%} %>
                                            <%} %>
                                            <%} %>
                                            <%} %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © BeautyQuotient 2020 . All rights reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>