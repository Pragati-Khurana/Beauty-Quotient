<!DOCTYPE html>
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
<jsp:include page="/SelectCategoryDetails"/>
<%List<Category> categoryList1 =(List)request.getAttribute("categoryList"); %>
<%@include file="commonsidebar.jsp"%>
<%@include file="commonheader.jsp"%>
    <div class="container" style="overflow-x: scroll">
        <h2>
            <span>Category Details Table</span>
            <input type="search" placeholder="Search category..." class="form-control search-input" data-table="customers-list"/>
            <br>
        </h2>
        <a class="btn" style="margin-left:65rem;" href="insertproduct.jsp"><i class="fa fa-plus" aria-hidden="true"></i></a><br><br>
        <table class="table table-striped mt32 customers-list" id="myTable">
            <thead>
                <tr>
                    <th>Category-ID<i class="fa fa-fw fa-sort" onclick="sortTable(0)"></i></th>
                    <th>Category Name<i class="fa fa-fw fa-sort" onclick="sortTable(1)"></i></th>
                    <th>Status<i class="fa fa-fw fa-sort" onclick="sortTable(2)"></i></th>
                    <!-- <th><a class="item" data-toggle="tooltip" data-placement="top" title="Add Category" href="insertproduct.jsp">
                    <i class="fa fa-plus"></i></a></th> -->
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <%int categoryid=0; %>
            <%for(Category category:categoryList1) { %>
            <tbody>
                <tr>
                    <td><%=category.getCategory_id() %></td>
                    <td><%=category.getCategory_name() %></td>
                    <td><%=category.getStatus() %></td>
                    <td>
                    <div class="table-data-feature">
                       <a href="EditProductsDetails?categoryId=<%=category.getCategory_id() %>"class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                        <i class="zmdi zmdi-edit"></i>
                        </a>
                     </div>
                    </td>
                    <td>
                     <div class="table-data-feature">
                     	<%categoryid=category.getCategory_id(); %>
                       <a data-toggle="modal"  data-id="<%=category.getCategory_id() %>" href="#addDeleteDialog" class="item open-addDeleteDialog" id="delbtn" data-toggle="tooltip" data-placement="top" title="Delete">
                       <i class="zmdi zmdi-delete"></i>
                       </a>                                    
                  </div>
                  </td>
                </tr>
                </tbody>
            <%} %>
        </table>
    </div>
	<div class="modal fade hide" id="addDeleteDialog" tabindex="-1" role="dialog"
		aria-labelledby="modal-default" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="h6 modal-title mb-0" id="modal-title-default">The Ikonique Interiors</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
<!-- 						<span aria-hidden="true">×</span> -->
					</button>
				</div>
				<div class="modal-body">
					<p>Are You Sure You Want To Delete This Category?</p>
                    <p>If Yes Then All SubCategory Will Be Deleted Which Are Belong To This Category.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn text-danger ml-auto" data-dismiss="modal">No</button>
					<a href="" id="a" type="button" class="btn btn-sm">Yes</a>
			
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
    <script type="text/javascript">
//     $('#delbtn').onclick(function(){
//     	$('#modal-default').modal('show');
//     })
    	var myBookId="";
    	$(document).on("click", ".open-addDeleteDialog", function () {
     	var myBookId = $(this).data('id');
     	//alert(myBookId);
     	<%-- $(".modal-body #bookId").val( myBookId ); --%>
     	$("#a").attr("href","DelectCategoryDetails?categoryId="+myBookId) 
		
     // As pointed out in comments, 
     // it is unnecessary to have to manually call the modal.
     // $('#addBookDialog').modal('show');
});
    
    
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
    <%-- <%@include file="commonjs.jsp"%> --%>
</body>
</html>
