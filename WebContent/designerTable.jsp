<!DOCTYPE html>
<%@page import="com.ikonique.bean.Area"%>
<%@page import="com.ikonique.bean.User"%>
<%@page import="java.util.List"%>
<html lang="en-US">
<head>
    <title>Interior-Designer Table</title>
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
    
     <%@include file="FontFaces.jsp"%>
	<%@include file="commoncss.jsp"%>
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
    
</head>
<jsp:include page="/SelectDesignerDetails"/>
<%List<User> designerList =(List)request.getAttribute("designerList"); %>
<jsp:include page="/AreaRegistration" />
<%
	List<Area> area1 = (List) request.getAttribute("area");
%>
<body class="mt32">
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>
    <div class="container" style="overflow-x: scroll">
        <h2>
            <span>Interior-Designer Details Table</span>
            <input type="search" placeholder="Search..." class="form-control search-input" data-table="customers-list"/>
       		<br>
        </h2>
        <table class="table table-striped mt32 customers-list" id="myTable">
            <thead>
                <tr>
					<th>User ID<i class="fa fa-fw fa-sort" onclick="sortTable(0)"></i></th>
					<th>First Name<i class="fa fa-fw fa-sort" onclick="sortTable(1)"></i></th>
					<th>Last Name<i class="fa fa-fw fa-sort" onclick="sortTable(2)"></i></th>
					<th>Address<i class="fa fa-fw fa-sort" onclick="sortTable(3)"></i></th>
					<th>Area<i class="fa fa-fw fa-sort" onclick="sortTable(4)"></i></th>
					<th>Contact No<i class="fa fa-fw fa-sort" onclick="sortTable(5)"></i></th>
					<th>Gender<i class="fa fa-fw fa-sort" onclick="sortTable(6)"></i></th>
					<th>Visiting Fees<i class="fa fa-fw fa-sort" onclick="sortTable(7)"></i></th>
					<th>Designation<i class="fa fa-fw fa-sort" onclick="sortTable(8)"></i></th>
					<th>About Me<i class="fa fa-fw fa-sort" onclick="sortTable(9)"></i></th>
					<th>Email-Id<i class="fa fa-fw fa-sort" onclick="sortTable(10)"></i></th>
					<th>Password<i class="fa fa-fw fa-sort" onclick="sortTable(11)"></i></th>
					<th>User image<i class="fa fa-fw fa-sort" onclick="sortTable(12)"></i></th>
					<!-- <th>Edit</th>
                    <th>Delete</th> -->
				</tr>
            </thead>
           <%for(User user1 : designerList){ %>
            <tbody>
                <tr>
                    <td><%=user1.getUser_id() %></td>
                    <td><%=user1.getFirstname() %></td>
                    <td><%=user1.getLastname() %></td>
                    <td><%=user1.getAddress() %></td>
                     <%for(Area area: area1){%>
                    	<% if(area.getArea_id()==user1.getArea_id()){ %>
                    <td><%=area.getArea_name() %></td>
                    	<%} %>
                    <%} %>
                    <td><%=user1.getMobileno() %></td>
                    <td><%=user1.getGender() %></td>
                    <td><%=user1.getVisitingfees() %></td>
                    <td><%=user1.getDesignation() %></td>
                    <td><%=user1.getAboutme() %></td>
                    <td><%=user1.getEmail() %></td>
                    <td><%=user1.getPassword() %></td>
                    <%if(user1.getUserProfilepicString()!=null){ %>
                    <td><img src="data:image/jpg;base64,<%=user1.getUserProfilepicString() %>"></td>
                    <%}else{ %>
                    <td><img src="bg-img/Blank-Photo.png"></td>
                    <%} %>
                    <td>
                    <!-- <div class="table-data-feature">
                       <a href=""class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                        <i class="zmdi zmdi-edit"></i>
                        </a>
                     </div> -->
                    </td>
                    <td>
                    <!--  <div class="table-data-feature">
                       <a href="" class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                       <i class="zmdi zmdi-delete"></i>
                       </a>                                    
                  </div> -->
                  </td>
                </tr>
            </tbody>
            <%} %>
        </table>
    </div>
    <script>
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
        		              // If so, mark as a switch and break the loop:
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
</body>
</html>
