<!DOCTYPE html>
<%@page import="com.ikonique.bean.SubCategory"%>
<%@page import="java.util.List"%>
<html lang="en-US">
<head>
    <title>Sub-Category Table</title>
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
<body class="mt32">
<jsp:include page="/SelectSubCategoryDetails"/>
<%List<SubCategory> subcategoryList1 =(List)request.getAttribute("subcategoryList"); %>
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>
    <div class="container" style="overflow-x: scroll">
        <h2>
            <span>Sub-Category Details Table</span>
            <input type="search" placeholder="Search Sub-category..." class="form-control search-input" data-table="customers-list"/>
        	<br>
        </h2>
        <a class="btn" style="margin-left:65rem;" href="insertproduct.jsp"><i class="fa fa-plus" aria-hidden="true"></i></a><br><br>
        
        <table class="table table-striped mt32 customers-list" id="myTable">
            <thead>
                <tr>
                    <th>SubCategory-ID<i class="fa fa-fw fa-sort" onclick="sortTable(0)"></i></th>
                    <th>Category-ID<i class="fa fa-fw fa-sort" onclick="sortTable(1)"></i></th>
                    <th>SubCategory Name<i class="fa fa-fw fa-sort" onclick="sortTable(2)"></i></th>
                    <th>Status<i class="fa fa-fw fa-sort" onclick="sortTable(3)"></i></th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <%for(SubCategory subcategory:subcategoryList1) { %>
            <tbody>
                <tr>
                    <td><%=subcategory.getSub_category_id() %></td>
                    <td><%=subcategory.getCategory_id() %></td>
                    <td><%=subcategory.getSub_category_name() %></td>
                    <td><%=subcategory.getStatus() %></td>
                    <td>
                    <div class="table-data-feature">
                       <a href="EditSubCategoryDetails?subcategoryId=<%=subcategory.getSub_category_id()%>"class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                        <i class="zmdi zmdi-edit"></i>
                        </a>
                     </div>
                    </td>
                    <td>
                     <div class="table-data-feature">
                       <a href="DelectSubCategoryDetails?subcategoryId=<%=subcategory.getSub_category_id() %>" class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                       <i class="zmdi zmdi-delete"></i>
                       </a>                                    
                  </div>
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
