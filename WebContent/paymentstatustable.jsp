<!DOCTYPE html>
<%@page import="com.ikonique.bean.Order"%>
<%@page import="com.ikonique.bean.Category"%>
<%@page import="java.util.List"%>
<html lang="en-US">
<head>
    <title>Payment Status Table</title>
    <link type="text/css"
	href="neuro/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
	integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
	crossorigin="anonymous" />
<!-- Pixel CSS -->
<link type="text/css" href="css/login1css.css" rel="stylesheet">
<link type="text/css" href="neuro/css/neumorphism.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    
    <style type="text/css">
        h3 span {
            font-size: 22px;
        }
        h2 input.search-input {
            width: 300px;
            margin-left: auto;
            float: 150
        }
        .mt32 {
            margin-top: 100px;
            margin-left: 300px;
        }
    </style>
   <%@include file="FontFaces.jsp"%>
   <%@include file="commoncss.jsp"%>
</head>
<body class="mt32">
<jsp:include page="/SelectOrderTableDetails"/>
<%List<Order> orderList =(List)request.getAttribute("orderList"); %>
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>
    <div class="container" style="overflow-x: scroll">
        <h2>
            <span>Payment Status Table</span>
            <input type="search" placeholder="Search category..." class="form-control search-input" data-table="customers-list"/>
            <br>
        </h2>
        
        <table class="table table-striped mt32 customers-list" id="myTable">
            <thead>
                <tr>
                    <th>Order-ID<i class="fa fa-fw fa-sort" onclick="sortTable(0)"></i></th>
                    <th>Customer Name<i class="fa fa-fw fa-sort" onclick="sortTable(1)"></i></th>
                    <th>Email-ID<i class="fa fa-fw fa-sort" onclick="sortTable(2)"></i></th>
                    <th>Amount<i class="fa fa-fw fa-sort" onclick="sortTable(5)"></i></th>
                    <th>Order Status<i class="fa fa-fw fa-sort" onclick="sortTable(3)"></i></th>
                    <th>Payment Status<i class="fa fa-fw fa-sort" onclick="sortTable(4)"></i></th>
                    <th>Order Date<i class="fa fa-fw fa-sort" onclick="sortTable(5)"></i></th>
                </tr>
            </thead>
            <%for(Order order:orderList) { %>
            <tbody>
                <tr>
                    <td><%=order.getOrderid()%></td>
                    <td><%=order.getFirstname() %> <%=order.getLastname() %></td>
                    <td><%=order.getEmail() %></td>
                    <td><%=order.getAmount() %></td>
                    <%if(order.getOrderstatus().equalsIgnoreCase("success")){ %>
                    	<td class=" text-success "><%=order.getOrderstatus() %></td>
                    <%}else{ %>
                   		 <td class=" text-danger "><%=order.getOrderstatus() %></td>
                    <%} %>
                    <%if(order.getPaymentstatus().equalsIgnoreCase("success")){ %>
                    	<td class=" text-success "><%=order.getPaymentstatus() %></td>
                    <%}else{ %>
                    	<td class=" text-danger "><%=order.getPaymentstatus() %></td>
                    <%} %>
                    <td><%=order.getOrderdate() %></td>
                </tr>
                </tbody>
            <%} %>
        </table>
    </div>
	<div class="modal fade" id="modal-default" tabindex="-1" role="dialog"
		aria-labelledby="modal-default" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="h6 modal-title mb-0" id="modal-title-default">Terms
						of Service</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
<!-- 						<span aria-hidden="true">×</span> -->
					</button>
				</div>
				<div class="modal-body">
					<p></p>
                    <p></p>
				</div>
				<div class="modal-footer">
					<button href="" type="button" class="btn btn-sm">I Got
						It</button>
					<button type="button" class="btn text-danger ml-auto" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
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
//     $('#delbtn').onclick(function(){
//     	$('#modal-default').modal('show');
//     })
    
        (function(document) {
            'use strict';

            var TableFilter = (function(myArray) {
                var search_input;

                function _onInputSearch(e) {
                    search_input = e.target;
                    var tables = document.getElementsByClassName(search_input.getAttribute('data-table'));
                    myArray.forEach.call(tables, function(table) {
                        myArray.forEach.call(table.tBodies, function(tbody) {
                            myArray.forEach.call(tbody.rows, function(row) {
                                var text_content = row.textContent.toLowerCase();
                                var search_val = search_input.value.toLowerCase();
                                row.style.display = text_content.indexOf(search_val) > -1 ? '' : 'none';
                            });
                        });
                    });
                }

                return {
                    init: function() {
                        var inputs = document.getElementsByClassName('search-input');
                        myArray.forEach.call(inputs, function(input) {
                            input.oninput = _onInputSearch;
                        });
                    }
                };
            })(Array.prototype);

            document.addEventListener('readystatechange', function() {
                if (document.readyState === 'complete') {
                    TableFilter.init();
                }
            });

        })(document);
        
        function sortTable(n) {
        	  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        	  table = document.getElementById("myTable");
        	  switching = true;
        	  dir = "asc";
        	  while (switching) {
        		  switching = false;
        		  rows = table.rows;
        		  for (i = 1; i < (rows.length - 1); i++) {
        			  shouldSwitch = false;
        			  x = rows[i].getElementsByTagName("TD")[n];
        		      y = rows[i + 1].getElementsByTagName("TD")[n];
        		      if (dir == "asc") {
        		          if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        		            // If so, mark as a switch and break the loop:
        		            shouldSwitch = true;
        		            break;
        		          }
        		      }
        		      else if (dir == "desc") 
        		      {
        		    	  if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) 
        		    	  {
        		              shouldSwitch = true;
        		              break;
        		          }
        		      }
        		  }
        		  if (shouldSwitch) {
        			  rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
        		      switching = true;
        		      switchcount ++;
        		  }
        		  else {
        			  if (switchcount == 0 && dir == "asc") {
        			        dir = "desc";
        			        switching = true;
        			      }
        		  }
        	  }
        }
    </script>
    
  
    
    <%@include file="commonjs.jsp"%>
</body>
</html>
