<!DOCTYPE html>
<%@page import="com.ikonique.bean.Area"%>
<%@page import="com.ikonique.bean.Category"%>
<%@page import="java.util.List"%>
<html lang="en-US">
<head>
    <title>Category Table</title>
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
<jsp:include page="/SelectUserDetails"/>
<%List<User> userList =(List)request.getAttribute("userList"); %>
<jsp:include page="/AreaRegistration" />
<%
	List<Area> area1 = (List) request.getAttribute("area");
%>
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>
    <div class="container" style="overflow-x: scroll">
        <h2>
            <span>Customer Details Table</span>
            <input type="search" placeholder="Search Customer" class="form-control search-input" data-table="customers-list"/>
            <br>
        </h2>
        <table class="table table-striped mt32 customers-list" id="myTable">
            <thead>
                <tr>
                    <th>Customer_ID<i class="fa fa-fw fa-sort" onclick="sortTable(0)"></i></th>
                    <th>First Name<i class="fa fa-fw fa-sort" onclick="sortTable(1)"></i></th>
                    <th>Last Name<i class="fa fa-fw fa-sort" onclick="sortTable(2)"></i></th>
                    <th>Address<i class="fa fa-fw fa-sort" onclick="sortTable(3)"></i></th>
                    <th>Contact No<i class="fa fa-fw fa-sort" onclick="sortTable(4)"></i></th>
                    <th>Area<i class="fa fa-fw fa-sort" onclick="sortTable(5)"></i></th>
                    <th>E-Mail<i class="fa fa-fw fa-sort" onclick="sortTable(6)"></i></th>
                    <th>Customer Photo<i class="fa fa-fw fa-sort" onclick="sortTable(7)"></i></th>
                    <th>Gender<i class="fa fa-fw fa-sort" onclick="sortTable(8)"></i></th>
                    <th>Status<i class="fa fa-fw fa-sort" onclick="sortTable(9)"></i></th>
                    <!-- <th><a class="item" data-toggle="tooltip" data-placement="top" title="Add Category" href="insertproduct.jsp">
                    <i class="fa fa-plus"></i></a></th> -->
                    <!-- <th>Edit</th>
                    <th>Delete</th> -->
                </tr>
            </thead>
            <%for(User user2:userList) { %>
            <tbody>
                <tr>
                    <td><%=user2.getUser_id() %></td>
                    <td><%=user2.getFirstname() %></td>
                    <td><%=user2.getLastname() %></td>
                    <td><%=user2.getAddress() %></td>
                    <td><%=user2.getMobileno() %></td>
                    <%for(Area area: area1){%>
                    	<% if(area.getArea_id()==user2.getArea_id()){ %>
                    <td><%=area.getArea_name() %></td>
                    	<%} %>
                    <%} %>
                    <td><%=user2.getEmail() %></td>
                     <%if(user2.getUserProfilepicString()!=null){ %>
                    <td><img src="data:image/jpg;base64,<%=user2.getUserProfilepicString() %>"></td>
                    <%}else{ %>
                    <td><img src="bg-img/Blank-Photo.png"></td>
                    <%} %>
                    <td><%=user2.getGender() %></td>
                    <td><%=user2.getRole_id() %></td>
                    
                    <!-- <td>
                    <div class="table-data-feature">
                       <a href="#"class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                        <i class="zmdi zmdi-edit"></i>
                        </a>
                     </div>
                    </td> -->
                    <td>
                    <!--  <div class="table-data-feature">
                       <a href="#" data-toggle="modal" data-target="#modal-default" class="item" id="delbtn" data-toggle="tooltip" data-placement="top" title="Delete">
                       <i class="zmdi zmdi-delete"></i>
                       </a>                                    
                  </div> -->
                  </td>
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
