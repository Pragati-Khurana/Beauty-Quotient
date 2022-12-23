<%@page import="com.ikonique.bean.Offer"%>
<%@page import="com.ikonique.bean.User"%>
<%@page import="com.ikonique.bean.SubCategory"%>
<%@page import="com.ikonique.bean.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
	integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
	crossorigin="anonymous" />

<!-- Fontawesome -->
<link type="text/css"
	href="neuro/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">

<!-- Pixel CSS -->
<link type="text/css" href="neuro/css/neumorphism.css" rel="stylesheet">
<title>Insert Product,Category,Sub-Category & Offer</title>
</head>
<style>
#form .indicator1	/*Product name*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid .indicator1 /*Product name*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid .indicator1  /*Product name*/
{ 
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator2   /*Product Price*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid1 .indicator2   /*Product Price*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid1 .indicator2   /*Product Price*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator3  /*Product Qnt*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}
 
#form.invalid2 .indicator3  /*Product Qnt*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid2 .indicator3  /*Product Qnt*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator4		/*Product Weight*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid3 .indicator4  /*Product Weight*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid3 .indicator4  /*Product Weight*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator5     /*Product Desc*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid4 .indicator5   /*Product Desc*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid4 .indicator5   /*Product Desc*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator6  /*Category Dropdown*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid5 .indicator6  /*Category Dropdown*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid5 .indicator6  /*Category Dropdown*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator7    
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid6 .indicator7    
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid6 .indicator7    
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator8		/*categoty*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid7 .indicator8 /*categoty*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid7 .indicator8 /*categoty*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator9  /*subcategory*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid8 .indicator9 /*subcategory*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid8 .indicator9 /*subcategory*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator10   /*Product Owner drop*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid10 .indicator10   /*Product Owner drop*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid10 .indicator10     /*Product Owner drop*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator11   /*product Offer drop*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid11 .indicator11  /*product Offer drop*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid11 .indicator11  /*product Offer drop*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator12  /*Offer name*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid12 .indicator12  /*Offer name*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid12 .indicator12  /*Offer name*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator13   /*offer discount*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid13 .indicator13  /*offer discount*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid13 .indicator13  /*offer discount*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator14   /*Product image*/
{
	position: absolute;
	top: 20px;
	left: 520px;
 	right: 20px; 
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid14 .indicator14 /*Product image*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid14 .indicator14  /*Product image*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

</style>
<jsp:include page="/SelectCategoryDetails"/>
<jsp:include page="/SelectSubCategoryDetails"/>
<jsp:include page="/SelectDesignerDetails"/>
<jsp:include page="/SelectOfferDetails"/>

<%List<Category> categorylist =(List)request.getAttribute("categoryList"); %>
<%List<SubCategory> subcategorylist =(List)request.getAttribute("subcategoryList"); %>
<%List<User> designerList =(List)request.getAttribute("designerList"); %> 
<%List<Offer> offerList =(List)request.getAttribute("offerList"); %>
<%-- <%List<SubCategory> subcatlist =(List)request.getAttribute("subcatList"); %> --%>
<body>

	<h1 align="center" style="margin-top: 50px;">Insert Category,
		Sub-Category ,Offer & Product</h1>
	<hr class="my-5" style="background-color: #d4d4d4;">
	<form method="post" action="InsertProductsDetails"
	class="w-50 ml-10" class="box" class="form" id="form" enctype="multipart/form-data">
		<div class="form-group mb-3 ml-10 inputBox">
			<div class="form-check">
				<input class="form-check-input" type="radio" name="exampleRadios1"
					id="exampleRadios21" value="category"> <label
					class="form-check-label" for="exampleRadios21"> <b>Category</b></label>
				<input class="form-check-input" type="radio" name="exampleRadios1"
					id="exampleRadios11" value="subcategory"> <label
					class="form-check-label" for="exampleRadios11"> <b>Sub-category</b>
				</label> <input class="form-check-input" type="radio" name="exampleRadios1"
					id="exampleRadios31" value="product"> <label
					class="form-check-label" for="exampleRadios31"> <b>Product</b>
				</label>
				<input class="form-check-input" type="radio" name="exampleRadios1"
					id="exampleRadios41" value="offer"> <label
					class="form-check-label" for="exampleRadios41"> <b>Offer</b></label>
			</div>
		</div>
		<div class="pname">
			<div class="form-group mb-3 ml-10 inputBox">
				<label for="pname">Product Name</label> <input type="text"
					name="pname" class="form-control" id="pname" autocomplete="off"
					aria-describedby="emailHelp" onkeyup="validate1();"> <span
					class="indicator1"></span><span class="small" id="p5"></span>
			</div>
		</div>
		<div class="offername">
			<div class="form-group mb-3 ml-10 inputBox">
				<label for="offername">Offer Name</label> <input type="text"
					name="offername" class="form-control" id="offername" autocomplete="off"
					aria-describedby="emailHelp" onkeyup="validate12();"> <span
					class="indicator12"></span><span class="small" id="p3"></span>
			</div>
		</div>
		<div class="offerdiscount">
			<div class="form-group mb-3 ml-10 inputBox">
				<label for="offerdiscount">Offer Discount</label> <input type="text"
					name="offerdiscount" class="form-control" id="offerdiscount" autocomplete="off"
					aria-describedby="emailHelp" onkeyup="validate13();" maxLength="5"onkeypress="return onlyNumberKey(event)"> <span
					class="indicator13" ></span><span class="small" id="p4"></span>
			</div>
		</div>
		<div class="form-group mb-3 ml-10 inputBox pprice">
			<label for="pprice">Product Price</label> <input type="text"
				name="pprice" class="form-control" id="pprice" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate2();" maxLength="5" onkeypress="return onlyNumberKey(event)"> <span
				class="indicator2"></span><span class="small" id="p6"></span>
		</div>
		<div class="form-group mb-3 ml-10 inputBox pquentity">
			<label for="pquentity">Product Quantity</label> <input type="text"
				name="pquentity" class="form-control" id="pquentity"
				autocomplete="off" aria-describedby="emailHelp"
				onkeyup="validate3();"  maxLength="4" onkeypress="return onlyNumberKey(event)"> 
				<span class="indicator3"></span><span class="small" id="p7"></span>
		</div>
		<div class="form-group mb-3 ml-10 inputBox pweight">
			<label for="pweight">Product Weight</label> <input type="text"
				name="pweight" class="form-control" id="pweight" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate4();" maxLength="6"  onkeypress="return onlyNumberKey(event)"> <span
				class="indicator4"></span><span class="small" id="p8"></span>
		</div>
		<div class="form-group mb-3 ml-10 inputBox pdesc">
			<label for="pdescription">Product Description</label>
			<textarea rows="5" name="pdescription" class="form-control"
				id="pdescription" autocomplete="off" aria-describedby="emailHelp"
				onkeyup="validate5();"></textarea>
			<span class="indicator5"></span><span class="small" id="p9"></span>
		</div>
		<div class="form-group mb-3 ml-10 inputBox category">
			<label for="category">Category</label> <select name="category"
				class="form-control" id="category" aria-describedby="emailHelp"
				onchange="validate6()">
				<option value="0" selected>select Category</option>
				
												<%for (Category category : categorylist) {%>
													<%if(category.getStatus()==1){ %>
														<option value="<%=category.getCategory_id()%>"><%=category.getCategory_name()%></option>
													<%} %>
												<%}%> 
			</select> <span class="indicator6"></span><span class="small" id="p2"></span>

		</div>
		 <div class="form-group mb-3 ml-10 inputBox ownername">
			<label for="ownername">Product Owner</label> <select name="ownername"
				class="form-control" id="ownername" aria-describedby="emailHelp"
				onchange="validate10()">
				<option value="-1" selected>Select Owner</option>
				<option value="0" >By BeautyQuotient</option>
												<%
				 									for (User user : designerList) { 
												%> 
												<option value="<%=user.getUser_id()%>"><%=user.getFirstname()%> <%=user.getLastname()%></option>
												<% 
				 									} 
			 								%> 
			</select> <span class="indicator10"></span><span class="small" id="p10"></span>

		</div> 
		<div class="form-group mb-3 ml-10 inputBox offer">
			<label for="offer">Product Offer</label> <select name="offer"
				class="form-control" id="offer" aria-describedby="emailHelp"
				onchange="validate11()">
				<option value="-1" selected>Select Offer</option>
				<option value="0">No Offer</option>
				<% for(Offer offer : offerList) {  %> 
					
					<%if(offer.getValidoffer()==1){ %>
				    	<option value="<%=offer.getOfferid()%>"><%=offer.getOffername()%></option>
					<%} %>
				<%}%> 
			</select> <span class="indicator11"></span><span class="small" id="p11"></span>

		</div> 
		<div class="form-group mb-3 ml-10 inputBox subcategory">
			<label for="subcategory">Sub-Category</label> <select
				name="subcategory" class="form-control" id="subcategory"
				aria-describedby="emailHelp" onchange="validate7()">
				<option value="-1" selected>select Sub-Category</option>
			</select> <span class="indicator7"></span><span class="small" id="p12"></span>
		</div>
		<div class="form-group mb-3 ml-10 inputBox cname">
			<label for="cname">Category Name</label> <input type="text"
				name="cname" class="form-control" id="cname" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate8();"> <span
				class="indicator8"></span><span class="small" id="p"></span>
		</div>
		<div class="form-group mb-3 ml-10 inputBox scname">
			<label for="scname">Sub-Category Name</label> <input type="text"
				name="scname" class="form-control" id="scname" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate9();"> <span
				class="indicator9"></span><span class="small" id="p1"></span>
		</div>
		<div align="center">
		<div class="custom-file  mb-3 ml-10 col-sm-8 image">
		<input type="file" class="custom-file-input" id="customFile"
		aria-label="File upload" name="photo" onchange="return validate14()"><span class="indicator14"></span>
		<span class="small" id="p13"></span> <label
		class="custom-file-label" for="customFile">Choose Product Image</label>
		
		</div>
		</div>
		<div style="margin-left:25rem;" class="sendmail custom-control custom-switch">
			<input type="checkbox" class="custom-control-input"
				id="customSwitch1"> <label class="custom-control-label"
				for="customSwitch1">Send Mail Notification</label>
		</div>
		<input type="hidden" value="" name="togglevalue" id="togglevalue">
		<div align="center" class="submit mt-4">
			<button type="submit" id="submit" name="submit" class="btn form-group btn-primary ml-10">Submit</button>
		</div>
	</form>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
function onlyNumberKey(evt) {
        
        // Only ASCII charactar in that range allowed
        var ASCIICode = (evt.which) ? evt.which : evt.keyCode
        if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57) && ASCIICode != 46)
            return false;
        return true;
    }
// 	$(document).on('submit', '[id=form]', function (e) {
// 		  e.preventDefault();

// 		  var data = $(this).serialize();

// 		  swal({
// 		    title: "Are you sure?",
// 		    text: "You will not be able to recover this imaginary file!",
// 		    type: "warning",
// 		    showCancelButton: true,
// 		    confirmButtonColor: "#DD6B55",
// 		    confirmButtonText: "Yes, delete it!",
// 		    cancelButtonText: "No, cancel plx!",
// 		    closeOnConfirm: false,
// 		    closeOnCancel: false
// 		  },
// 		    function (isConfirm) {
// 		      if (isConfirm) {
// 		        $.ajax({
// 		          type: 'POST',
// 		          url: 'InsertProductsDetails',
// 		          data: data,
// 		          success: function (data) {
// 		            swal("Deleted!", "Your imaginary file has been deleted.", "success");
// 		          },
// 		          error: function (data) {
// 		            swal("NOT Deleted!", "Something blew up.", "error");
// 		          }
// 		        });
// 		      } else {
// 		        swal("Cancelled", "Your imaginary file is safe :)", "error");
// 		      }
// 		    });

// 		  return false;
// 		});
// 	$("button").click(function() {
// 		$.ajax({
//             url:"InsertProductsDetails",
//             method:"POST",
//             data:$('#form').serialize(),
//             success:function(data)
//             {
//                 	swal({title: "Good job", text: "You clicked the button!", type: "success"
// 						},function(){ 
// 						       location.reload();
// 						   });
						
//             }
// 		})
		
// 	});
$(document).ready(function(){
	var switchStatus = false;
	$("#customSwitch1").on('change', function() {
	    if ($(this).is(':checked')) 
	    {
	        switchStatus = $(this).is(':checked');
	    }
	    else 
	    {
	       switchStatus = $(this).is(':checked');
	    }
	    $("#togglevalue").val(switchStatus);
	});
});

function validate()
{
// 	alert("login called...");
	var radiovalue = document.getElementById("exampleRadios21").value;
// 	alert("radio value:-"+radiovalue);
	const form = document.getElementById('form');
	var cname = document.getElementById('cname').value;
	var scname = document.getElementById('scname').value;
	var category = document.getElementById('category');
 	var categoryvalue = category.options[category.selectedIndex].value;
// 	var productname = document.getElementById('pname').value;
// 	var offername = document.getElementById('offername').value;
// 	var offerdiscount = document.getElementById('offerdiscount').value;
// 	var productprice = document.getElementById('pprice').value;
// 	var pquentity = document.getElementById('pquentity').value;
// 	var productweight = document.getElementById('pweight').value;
// 	var productdesc = document.getElementById('pdescription').value; 	
// 	var owner = document.getElementById('ownername');
// 	var ownervalue = owner.options[owner.selectedIndex].value;
// 	var offer = document.getElementById('offer');
// 	var offervalue = offer.options[offer.selectedIndex].value;
// 	var subcategory = document.getElementById('subcategory');
// 	var subcategoryvalue = subcategory.options[subcategory.selectedIndex].value;
	if(radiovalue=="category")
	{
		//alert("if con...");
		if(cname == "" || cname == null)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	else if(radiovalue=="subcategory")
	{
		if(scname == "" || scname == null && categoryvalue == '0')
		{
			return false;
		}	
		else
		{
			return true;
		}
	}
}
	function validate14() {    //product image
		var fileInput = 
                document.getElementById('customFile');
              
            var filePath = fileInput.value;
          
            // Allowing file type
            var allowedExtensions = 
                    /(\.jpg|\.jpeg|\.png|\.gif)$/i;
              
            if (!allowedExtensions.exec(filePath)) {
            	$('#p13').html('Product Image Field Is Empty Or You Choose Wrong Format').css('color', 'red');
            	form.classList.add('invalid14')
				form.classList.remove('valid14')
               // alert('Invalid file type');
                fileInput.value = '';
                return false;
            } 
            else 
            {
            	$('#p13').html('Product Image Is Valid').css('color', 'Green');
            	form.classList.remove('invalid14')
				form.classList.add('valid14')
            }
	}
	
	$(document).ready(function(){
		var radio = $('input[name=exampleRadios1]:checked').length;
		if (radio == 0) {
			document.getElementById("submit").style.visibility = "hidden";
		}
		$('input[type="radio"]').click(function() {
			if($(this).attr('name') == 'exampleRadios1') {
				document.getElementById("submit").style.visibility = "visible";
	       }
		});
	});
	
	function validate1() {  //product name
			const form = document.getElementById('form');
			const pname = document.getElementById('pname').value;
			
			if (pname == "") 
			{
				$('#p5').html('Product Name Field Is Empty').css('color', 'red');
				form.classList.add('invalid')
				form.classList.remove('valid')
			}
			else
			{
				$('#p5').html('Product Name Is Valid').css('color', 'Green');
				form.classList.remove('invalid')
				form.classList.add('valid')
			}
			if($.isNumeric(pname))
			{
				$('#p5').html('Product Name Is Not Valid').css('color', 'red');
				form.classList.add('invalid')
				form.classList.remove('valid')
			}
		}
	function validate2() {  // product price
		const form = document.getElementById('form');
		const pprice = document.getElementById('pprice').value;
		const pattern = "^-?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)$";
		
		if (pprice == "") 
		{
			$('#p6').html('Product Price Field Is Empty').css('color', 'red');
			form.classList.add('invalid1')
			form.classList.remove('valid1')
		}
		else
		{
			if(pprice.match(pattern))
			{
				$('#p6').html('Product Price Is Valid').css('color', 'Green');
				form.classList.remove('invalid1')
				form.classList.add('valid1')
			}
			else
			{
				$('#p6').html('Product Price Is Not Valid').css('color', 'red');
				form.classList.add('invalid1')
				form.classList.remove('valid1')
			}
		}
	}
	function validate3() {		//Product qnt
		const form = document.getElementById('form');
		const pquentity = document.getElementById('pquentity').value;
		const pattern = "^-?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)$";
		
		if (pquentity == "") 
		{
			$('#p7').html('Product Quantity Field Is Empty').css('color', 'red');
			form.classList.add('invalid2')
			form.classList.remove('valid2')
		}
		else
		{
			if(pquentity.match(pattern))
			{
				$('#p7').html('Product Quantity Is Valid').css('color', 'Green');
				form.classList.remove('invalid2')
				form.classList.add('valid2')
			}
			else
			{
				$('#p7').html('Product Quantity Is Not Valid').css('color', 'red');
				form.classList.add('invalid2')
				form.classList.remove('valid2')
			}	
		}
	}
	function validate4() {     // Product Weight
		const form = document.getElementById('form');
		const pweight = document.getElementById('pweight').value;
		const pattern = "^-?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)$";
		if (pweight == "") 
		{
			$('#p8').html('Product Weight Field Is Empty').css('color', 'red');
			form.classList.add('invalid3')
			form.classList.remove('valid3')
		}
		else
		{
			if(pweight.match(pattern))
			{
				$('#p8').html('Product Weight Is Valid').css('color', 'Green');
				form.classList.remove('invalid3')
				form.classList.add('valid3')
			}
			else
			{
				$('#p8').html('Product Weight Is Not Valid').css('color', 'red');
				form.classList.add('invalid3')
				form.classList.remove('valid3')
			}
		}
	}
	function validate5() {    // Product Desc
		const form = document.getElementById('form');
		const pdescription = document.getElementById('pdescription').value;
		
		if (pdescription == "") 
		{
			$('#p9').html('Product Description Field Is Empty').css('color', 'red');
			form.classList.add('invalid4')
			form.classList.remove('valid4')
		}
		else
		{
			$('#p9').html('Product Description Is Valid').css('color', 'Green');
			form.classList.remove('invalid4')
			form.classList.add('valid4')
		}
	}
	function validate6() {  //Category Dropdown
		const form = document.getElementById('form');
		var e=document.getElementById('category');
		
		var value=e.options[e.selectedIndex].value;
		if (value!='0') 
		{
			$('#p2').html('Category Is Valid').css('color', 'Green');
			form.classList.add('valid5')
			form.classList.remove('invalid5')
		} else {
			$('#p2').html('Category Field Is Empty').css('color', 'red');
			form.classList.add('invalid5')
			form.classList.remove('valid5')
		}
	}
	function validate7() {
		const form = document.getElementById('form');
		var e=document.getElementById('subcategory');
		
		var value=e.options[e.selectedIndex].value;
		if (value == '-1') 
		{
			$('#p12').html('Sub-Category Field Is Empty').css('color', 'red');
			form.classList.add('invalid6')
			form.classList.remove('valid6')
		} 
		else 
		{
			$('#p12').html('Sub-Category Is Valid').css('color', 'Green');
			form.classList.add('valid6')
			form.classList.remove('invalid6')
			
		}
	}
	function validate8() {			// category
		const form = document.getElementById('form');
		const cname = document.getElementById('cname').value;
		
		if (cname == "") 
		{
			$('#p').html('Category Field Is Empty').css('color', 'red');
			form.classList.add('invalid7')
			form.classList.remove('valid7')
		}
		else
		{
			$('#p').html('Category Is Valid').css('color', 'Green');
			form.classList.remove('invalid7')
			form.classList.add('valid7')
		}
		if($.isNumeric(cname))
		{
			$('#p').html('Category Is Not Valid').css('color', 'red');
			form.classList.add('invalid7')
			form.classList.remove('valid7')
		}
		
	}
	
	function validate9() {  //subcategory
		const form = document.getElementById('form');
		const scname = document.getElementById('scname').value;
		
		if (scname == "") 
		{
			$('#p1').html('Sub-Category Field Is Empty').css('color', 'red');
			form.classList.add('invalid8')
			form.classList.remove('valid8')
		}
		else
		{
			$('#p1').html('Sub-Category Is Valid').css('color', 'Green');
			form.classList.remove('invalid8')
			form.classList.add('valid8')
		}
		if($.isNumeric(scname))
		{
			$('#p1').html('Sub-Category Is Not Valid').css('color', 'red');
			form.classList.add('invalid8')
			form.classList.remove('valid8')
		}
	}
	
	function validate10() {    // Product Owner drop
		const form = document.getElementById('form');
		var e=document.getElementById('ownername');
		
		var value=e.options[e.selectedIndex].value;
		if (value!='-1') 
		{
			$('#p10').html('Product Owner Is Valid').css('color', 'Green');
			form.classList.add('valid10')
			form.classList.remove('invalid10')
		} else {
			$('#p10').html('Product Owner Field Is Empty').css('color', 'red');
			form.classList.add('invalid10')
			form.classList.remove('valid10')
		}
	}
	
	function validate11() {    // Product Offer drop
		const form = document.getElementById('form');
		var e=document.getElementById('offer');
		
		var value=e.options[e.selectedIndex].value;
		if (value!='-1') 
		{
			$('#p11').html('Product Offer Is Valid').css('color', 'Green');
			form.classList.add('valid11')
			form.classList.remove('invalid11')
		} else {
			$('#p11').html('Product Offer Field Is Empty').css('color', 'red');
			form.classList.add('invalid11')
			form.classList.remove('valid11')
		}
	}
	
	function validate12() {  //Offer name
		const form = document.getElementById('form');
		const offername = document.getElementById('offername').value;
		
		if (offername == "") 
		{
			$('#p3').html('Offer Field Is Empty').css('color', 'red');
			form.classList.add('invalid12')
			form.classList.remove('valid12')
		}
		else
		{
			$('#p3').html('Offer Is Valid').css('color', 'Green');
			form.classList.remove('invalid12')
			form.classList.add('valid12')
		}
		if($.isNumeric(offername))
		{
			$('#p3').html('Offer Is Not Valid').css('color', 'red');
			form.classList.add('invalid12')
			form.classList.remove('valid12')
		}
	}
	
	function validate13() {  //Offer discount 
		const form = document.getElementById('form');
		const offerdiscount = document.getElementById('offerdiscount').value;
		const pattern = "^-?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)$";
		
		if (offerdiscount == "") 
		{
			$('#p4').html('Discount Field Is Empty').css('color', 'red');
			form.classList.add('invalid13')
			form.classList.remove('valid13')
		}
		else
		{
			if(offerdiscount.match(pattern))
			{
				$('#p4').html('Discount Is Valid').css('color', 'Green');
				form.classList.remove('invalid13')
				form.classList.add('valid13')
			}
			else
			{
				$('#p4').html('Discount Is Not Valid').css('color', 'red');
				form.classList.add('invalid13')
				form.classList.remove('valid13')
			}
		}
	}
	$("input[name='exampleRadios1']").change(function() 
	{
		
		if ($(this).val() == "category") 
		{
			$(".cname").show();
			$(".pname").hide();
			$(".pprice").hide();
			$(".pquentity").hide();
			$(".pweight").hide();
			$(".pdesc").hide();
			$(".category").hide();
			$(".subcategory").hide();
			$(".scname").hide();
			$(".image").hide();
			$(".ownername").hide();
			$(".offer").hide();
			$(".offername").hide();
			$(".offerdiscount").hide();
			$(".sendmail").hide();
			document.getElementById("pname").value = "";
			document.getElementById("offername").value = "";
			document.getElementById("offerdiscount").value = "";
			document.getElementById("pprice").value = "";
			document.getElementById("pquentity").value = "";
			document.getElementById("pweight").value = "";
			document.getElementById("pdescription").value = "";
			document.getElementById("ownername").value = "";
			document.getElementById("category").value = "";
			document.getElementById("offer").value = "";
			document.getElementById("subcategory").value = "";
			document.getElementById("scname").value = "";
			form.classList.remove('invalid')
			form.classList.remove('valid')
			form.classList.remove('invalid1')
			form.classList.remove('valid1')
			form.classList.remove('invalid2')
			form.classList.remove('valid2')	
			form.classList.remove('invalid3')
			form.classList.remove('valid3')
			form.classList.remove('invalid4')
			form.classList.remove('valid4')
			form.classList.remove('invalid5')
			form.classList.remove('valid5')
			form.classList.remove('invalid6')
			form.classList.remove('valid6')
			form.classList.remove('invalid8')
			form.classList.remove('valid8')
			form.classList.remove('invalid9')
			form.classList.remove('valid9')
			form.classList.remove('invalid10')
			form.classList.remove('valid10')
			form.classList.remove('invalid11')
			form.classList.remove('valid11')
			form.classList.remove('invalid12')
			form.classList.remove('valid12')
			form.classList.remove('invalid13')
			form.classList.remove('valid13')
				
		} 
		else if($(this).val() == "subcategory")
		{
			$(".category").show();
			$(".scname").show();
			$(".pname").hide();
			$(".cname").hide();
			$(".pprice").hide();
			$(".pquentity").hide();
			$(".pweight").hide();
			$(".pdesc").hide();
			$(".subcategory").hide();
			$(".image").hide();
			$(".ownername").hide();
			$(".offer").hide();
			$(".offername").hide();
			$(".offerdiscount").hide();
			$(".sendmail").hide();
			document.getElementById("pname").value = "";
			document.getElementById("category").value = "";
			document.getElementById("subcategory").value = "";
			document.getElementById("offername").value = "";
			document.getElementById("offerdiscount").value = "";
			document.getElementById("pprice").value = "";
			document.getElementById("pquentity").value = "";
			document.getElementById("pweight").value = "";
			document.getElementById("pdescription").value = "";
			document.getElementById("ownername").value = "";
			document.getElementById("offer").value = "";
			document.getElementById("cname").value = "";
			document.getElementById("scname").value = "";
			form.classList.remove('invalid')
			form.classList.remove('valid')
			form.classList.remove('invalid1')
			form.classList.remove('valid1')
			form.classList.remove('invalid2')
			form.classList.remove('valid2')	
			form.classList.remove('invalid3')
			form.classList.remove('valid3')
			form.classList.remove('invalid4')
			form.classList.remove('valid4')
			form.classList.remove('invalid5')
			form.classList.remove('valid5')
			form.classList.remove('invalid6')
			form.classList.remove('valid6')
			form.classList.remove('invalid7')
			form.classList.remove('valid7')
			form.classList.remove('invalid8')
			form.classList.remove('valid8')
			form.classList.remove('invalid9')
			form.classList.remove('valid9')
			form.classList.remove('invalid10')
			form.classList.remove('valid10')
			form.classList.remove('invalid11')
			form.classList.remove('valid11')
			form.classList.remove('invalid12')
			form.classList.remove('valid12')
			form.classList.remove('invalid13')
			form.classList.remove('valid13')
		}
		else if($(this).val() == "offer")
		{
			$(".offername").show();
			$(".offerdiscount").show();
			$(".category").hide();
			$(".scname").hide();
			$(".pname").hide();
			$(".cname").hide();
			$(".pprice").hide();
			$(".pquentity").hide();
			$(".pweight").hide();
			$(".pdesc").hide();
			$(".subcategory").hide();
			$(".image").hide();
			$(".ownername").hide();
			$(".offer").hide();
			$(".sendmail").hide();
			document.getElementById("pname").value = "";
			document.getElementById("category").value = "";
			document.getElementById("subcategory").value = "";
			document.getElementById("offername").value = "";
			document.getElementById("offerdiscount").value = "";
			document.getElementById("pprice").value = "";
			document.getElementById("pquentity").value = "";
			document.getElementById("pweight").value = "";
			document.getElementById("pdescription").value = "";
			document.getElementById("ownername").value = "";
			document.getElementById("offer").value = "";
			document.getElementById("cname").value = "";
			document.getElementById("scname").value = "";
			form.classList.remove('invalid')
			form.classList.remove('valid')
			form.classList.remove('invalid1')
			form.classList.remove('valid1')
			form.classList.remove('invalid2')
			form.classList.remove('valid2')	
			form.classList.remove('invalid3')
			form.classList.remove('valid3')
			form.classList.remove('invalid4')
			form.classList.remove('valid4')
			form.classList.remove('invalid5')
			form.classList.remove('valid5')
			form.classList.remove('invalid6')
			form.classList.remove('valid6')
			form.classList.remove('invalid7')
			form.classList.remove('valid7')
			form.classList.remove('invalid8')
			form.classList.remove('valid8')
			form.classList.remove('invalid9')
			form.classList.remove('valid9')
			form.classList.remove('invalid10')
			form.classList.remove('valid10')
			form.classList.remove('invalid11')
			form.classList.remove('valid11')
			form.classList.remove('invalid12')
			form.classList.remove('valid12')
			form.classList.remove('invalid13')
			form.classList.remove('valid13')
		}
		else 
		{
			$(".offername").hide();
			$(".offerdiscount").hide();
			$(".pname").show();
			$(".pprice").show();
			$(".pquentity").show();
			$(".pweight").show();
			$(".pdesc").show();
			$(".category").show();
			$(".subcategory").show();
			$(".cname").hide();
			$(".scname").hide();
			$(".image").show();
			$(".ownername").show();
			$(".offer").show();
			$(".sendmail").show();
			document.getElementById("pname").value = "";
			document.getElementById("category").value = "";
			document.getElementById("subcategory").value = "";
			document.getElementById("offername").value = "";
			document.getElementById("offerdiscount").value = "";
			document.getElementById("pprice").value = "";
			document.getElementById("pquentity").value = "";
			document.getElementById("pweight").value = "";
			document.getElementById("pdescription").value = "";
			document.getElementById("ownername").value = "";
			document.getElementById("offer").value = "";
			document.getElementById("cname").value = "";
			document.getElementById("scname").value = "";
			form.classList.remove('invalid')
			form.classList.remove('valid')
			form.classList.remove('invalid1')
			form.classList.remove('valid1')
			form.classList.remove('invalid2')
			form.classList.remove('valid2')	
			form.classList.remove('invalid3')
			form.classList.remove('valid3')
			form.classList.remove('invalid4')
			form.classList.remove('valid4')
			form.classList.remove('invalid5')
			form.classList.remove('valid5')
			form.classList.remove('invalid6')
			form.classList.remove('valid6')
			form.classList.remove('invalid7')
			form.classList.remove('valid7')
			form.classList.remove('invalid8')
			form.classList.remove('valid8')
			form.classList.remove('invalid9')
			form.classList.remove('valid9')
			form.classList.remove('invalid10')
			form.classList.remove('valid10')
			form.classList.remove('invalid11')
			form.classList.remove('valid11')
			form.classList.remove('invalid12')
			form.classList.remove('valid12')
			form.classList.remove('invalid13')
			form.classList.remove('valid13')
		}
	});
	$("#category").change(function() {
		
		const catid= document.getElementById('category').value;
		$.get( "SelectSubcategory", {category: catid } )
		  .done(function( data ) {
			  $('#subcategory').empty()
			 var list= jQuery.parseJSON( data);
			  $('#subcategory')
              .append($("<option></option>")
              .attr("value","-1")
              .text("Please Select"));
			 $.each(list, function( key, value ) {
				 $('#subcategory')
	                .append($("<option></option>")
	                .attr("value",value.sub_category_id)
	                .text(value.sub_category_name));  
				});
		  });
		
	});
// });
	
	</script>
</body>
</html>