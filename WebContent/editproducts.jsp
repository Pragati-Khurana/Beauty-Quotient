<%@page import="com.ikonique.bean.Offer"%>
<%@page import="com.ikonique.bean.User"%>
<%@page import="com.ikonique.bean.SubCategory"%>
<%@page import="com.ikonique.bean.Category"%>
<%@page import="com.ikonique.bean.Product"%>
 
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
<title>Edit Category,Sub-category,Product & Offer</title>
</head>
<%boolean iscategory=request.getAttribute("category")!=null; %>
<%boolean issubcategory=request.getAttribute("subcategory")!=null; %>
<%boolean isproduct=request.getAttribute("product")!=null; %>
<%boolean isoffer=request.getAttribute("offer")!=null; %>
 <% Category cat=null; SubCategory subcategory=null; Product product=null; Offer offer=null;%>
 <%if(iscategory){ %>
 <%  cat = (Category)request.getAttribute("category"); %> 
 <%} %>
 <%if(issubcategory) {%>
 <% subcategory = (SubCategory)request.getAttribute("subcategory"); %> 
<%} %>
<%if(isproduct) {%>
 <% product = (Product)request.getAttribute("product"); %> 
<%} %>
<%if(isoffer){ %>
<%offer = (Offer)request.getAttribute("offer"); %>
<%} %>
 <jsp:include page="/SelectCategoryDetails"/> 
 <%List<Category> categorylist=(List)request.getAttribute("categoryList"); %> 
<jsp:include page="/SelectDesignerDetails"/> 
 <%List<User> designerList =(List)request.getAttribute("designerList"); %>
 <jsp:include page="/SelectSubCategoryDetails"/>
 <%List<SubCategory> subcategorylist =(List)request.getAttribute("subcategoryList"); %>
 <jsp:include page="/SelectOfferDetails"/>
 <%List<Offer> offerList =(List)request.getAttribute("offerList"); %>
 
<style>
#form .indicator1   /*category name*/
{
	position: absolute;
	top: 70px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid .indicator1   /*category name*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid .indicator1   /*category name*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator2   /*subcategory name(sub)*/
{
	position: absolute;
	top: 70px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid1 .indicator2   /*subcategory name(sub)*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid1 .indicator2   /*subcategory name(sub)*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator3		/*Offer name*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid2 .indicator3    /*Offer name*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid2 .indicator3   /*Offer name*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator4			/*Offer Discount*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid3 .indicator4   /*Offer Discount*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid3 .indicator4   /*Offer Discount*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator5   /*product image*/
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

#form.invalid4 .indicator5  /*product image*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid4 .indicator5   /*product image*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator6		/*caterogy name(sub)*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid5 .indicator6   /*caterogy name(sub)*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid5 .indicator6   /*caterogy name(sub)*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator7   /*product name(pr)*/
{
	position: absolute;
	top: 95px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid6 .indicator7   /*product name(pr)*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid6 .indicator7   /*product name(pr)*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}
#form .indicator8  /*product price(pr)*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid7 .indicator8   /*product price(pr)*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid7 .indicator8  /*product price(pr)*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator9   /*product qunt*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}
  
#form.invalid8 .indicator9  /*product qunt*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid8 .indicator9   /*product qunt*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator10    /*product weight*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid10 .indicator10   /*product weight*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid10 .indicator10   /*product weight*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator11   /*product owner*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid11 .indicator11  /*product owner*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid11 .indicator11   /*product owner*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator12   /*product desc*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid12 .indicator12   /*product desc*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid12 .indicator12   /*product desc*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

#form .indicator13    /*product offer (pr)*/
{
	position: absolute;
	top: 50px;
	right: 20px;
	width: 10px;
	height:10px;
	background: #555;
	border-radius: 50%;
}

#form.invalid13 .indicator13   /*product offer (pr)*/
{
	background: #f00;
	box-shadow: 0 0 5px #f00,
				0 0 10px #f00,
				0 0 20px #f00,
				0 0 40px #f00;
}

#form.valid13 .indicator13   /*product offer (pr)*/
{
	background: #0f0;
	box-shadow: 0 0 5px #0f0,
				0 0 10px #0f0,
				0 0 20px #0f0,
				0 0 40px #0f0;
}

</style>

<body>

<h1 align="center" style="margin-top: 50px;">Edit Category,
		Sub-Category ,Offer & Product</h1>
	<hr class="my-5" style="background-color: #d4d4d4;">
	<%if(iscategory){ %>
	<form action="UpdateProductsDetails" class="w-50 ml-10" class="box" class="form" id="form"
		method="post" onsubmit=" login()" enctype="multipart/form-data">
		
		 <div class="form-group mb-3 ml-10 inputBox cname">
		 <input type="hidden" name="edit" value="forcategory">
			<input type="hidden" name="categoryId" value="<%=String.valueOf(cat.getCategory_id()) %>"> <br>
			<label for="cname">Category Name</label> 
			<input type="text" value="<%=cat.getCategory_name() %>" name="cname" class="form-control" id="cname" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate1();"> <span
				class="indicator1"></span>
		</div>
		<div class="form-group mb-3 ml-10 inputBox status">
			<div class="form-check">
			<%if(cat.getStatus()==1){ %>
				<input class="form-check-input" type="radio" name="exampleRadios2"
						id="exampleRadios21" value="1" checked> 
				<label class="form-check-label" for="exampleRadios21"> <b>Active</b></label>
				<input class="form-check-input" type="radio" name="exampleRadios2"
				id="exampleRadios11" value="0"> 
				<label class="form-check-label" for="exampleRadios11"> <b>Inactive</b></label>
			<%}else{ %>
				<input class="form-check-input" type="radio" name="exampleRadios2"
						id="exampleRadios21" value="1"> 
				<label class="form-check-label" for="exampleRadios21"> <b>Active</b></label>
				<input class="form-check-input" type="radio" name="exampleRadios2"
				id="exampleRadios11" value="0" checked> 
				<label class="form-check-label" for="exampleRadios11"> <b>Inactive</b></label>
			<%} %>
			</div>
		</div> 
		
		<div align="center">
			<button type="submit" name="submit" class="btn form-group btn-primary ml-10">Submit</button>
		</div>
	</form>
		<%} else if(issubcategory){%>
			<form action="UpdateProductsDetails" class="w-50 ml-10" class="box" class="form" id="form"
		method="post" onsubmit=" login()" enctype="multipart/form-data">
		
			<div class="form-group mb-3 ml-10 inputBox subcatgeoryname">
			<input type="hidden" name="edit" value="forsubcategory">
			<input type="hidden" name="subcategoryId" value="<%=String.valueOf(subcategory.getSub_category_id()) %>"> <br>
			<label for="subcategoryname">Sub-Category Name</label> 
			<input type="text" value="<%=subcategory.getSub_category_name() %>" name="subcategoryname" class="form-control" id="subcategory" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate2();"> <span
				class="indicator2"></span>
		</div> 
		
			<div class="form-group mb-3 ml-10 inputBox category">
			<label for="category">Category</label> <select name="category"
				class="form-control" id="category" aria-describedby="emailHelp"
				onchange="validate6()">
				<!-- <option value="0" selected></option> -->
				
												<%for (Category category : categorylist) {%>
													<%if(category.getCategory_id()==subcategory.getCategory_id() ){ %>
														<option value="<%=category.getCategory_id()%>" selected><%=category.getCategory_name()%></option>
													<%} else{ %>
													<option value="<%=category.getCategory_id()%>"><%=category.getCategory_name()%></option>
													<%}%> 
												<%}%>
			</select> <span class="indicator6"></span>

		</div>
		 <div class="form-group mb-3 ml-10 inputBox status">
			<div class="form-check">
			<%if(subcategory.getStatus()==1){ %>
				<input class="form-check-input" type="radio" name="exampleRadios2"
						id="exampleRadios21" value="1" checked> 
				<label class="form-check-label" for="exampleRadios21"> <b>Active</b></label>
				<input class="form-check-input" type="radio" name="exampleRadios2"
				id="exampleRadios11" value="0"> 
				<label class="form-check-label" for="exampleRadios11"> <b>Inactive</b></label>
			<%}else{ %>
				<input class="form-check-input" type="radio" name="exampleRadios2"
						id="exampleRadios21" value="1"> 
				<label class="form-check-label" for="exampleRadios21"> <b>Active</b></label>
				<input class="form-check-input" type="radio" name="exampleRadios2"
				id="exampleRadios11" value="0" checked> 
				<label class="form-check-label" for="exampleRadios11"> <b>Inactive</b></label>
			<%} %>
			</div>
			</div>
		
		<div align="center">
			<button type="submit" name="submit" class="btn form-group btn-primary ml-10">Submit</button>
		</div>
		</form>
		<%}else if(isproduct){ %>
			<form action="UpdateProduct" class="w-50 ml-10" class="box" class="form" id="form"
			method="post" onsubmit=" login()" enctype="multipart/form-data">
			<input type="hidden" name="editproduct" value="forproduct"> <br>
			<div class="profile-image1 bg-primary shadow-inset border border-light rounded ml-10 p-3 ">
				<img src="data:image/jpg;base64,<%=product.getProductpicString() %>" height="365px" width="150px" 
				class="card-img-top rounded" alt="Leos Portrait">
			</div>
			<br>
			<div class="custom-file ml-10 col-lg-8 col-sm-6">
				<input type="file" class="custom-file-input" id="customFile"
				aria-label="File upload" name="photo"  onchange="return validate5()"><span class="indicator5"></span> 
				<label class="custom-file-label" for="customFile">Choose file</label>
			</div>
								
			<div class="form-group mb-3 ml-10 inputBox productname">
			
			<input type="hidden" name="productId" value="<%=String.valueOf(product.getProduct_id()) %>"> <br>
			<label for="productname">Product Name</label> 
			<input type="text" value="<%=product.getProduct_name() %>" name="productname" class="form-control" id="productname" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate7();"> <span
				class="indicator7"></span>
			</div>
			<div class="form-group mb-3 ml-10 inputBox productprice">
			<label for="productprice">Product Price</label> 
			<input type="text" value="<%=product.getProduct_price() %>" name="productprice" class="form-control" id="productprice" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate8();"> <span
				class="indicator8"></span>
			</div>
			<div class="form-group mb-3 ml-10 inputBox productquantity">
			<label for="productquantity">Product Quantity</label> 
			<input type="text" value="<%=product.getProduct_quantity() %>" name="productquantity" class="form-control" id="productquantity" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate9();"> <span
				class="indicator9"></span>
			</div>
			<div class="form-group mb-3 ml-10 inputBox productprice">
			<label for="productweight">Product Weight</label> 
			<input type="text" value="<%=product.getProduct_weight() %>" name="productweight" class="form-control" id="productweight" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate10();"> <span
				class="indicator10"></span>
			</div>
			<div class="form-group mb-3 ml-10 inputBox ownername">
			<label for="category">Owner Name</label> 
			<select name="ownername" class="form-control" id="ownername" 
			aria-describedby="emailHelp" onchange="validate11()">
			<!-- <option value="0" selected>Select Owner</option> -->
				
												<%for (User user : designerList) {%>
													<%if(user.getUser_id() == product.getProduct_owner_id()){ %>
														<option value="<%=user.getUser_id()%>" selected><%=user.getFirstname()%> <%=user.getLastname()%></option>
													<%} else{%>
														<option value="<%=user.getUser_id()%>"><%=user.getFirstname()%> <%=user.getLastname()%></option>
													<%} %>
												<%}%> 
			</select> <span class="indicator11"></span>

			</div> 
			<div class="form-group mb-3 ml-10 inputBox pdesc">
			<label for="pdescription">Product Description</label>
			<textarea rows="5" name="pdescription" class="form-control"
				id="pdescription" autocomplete="off" aria-describedby="emailHelp"
				onkeyup="validate12();"><%=product.getProduct_desc() %></textarea>
			<span class="indicator12"></span>
			</div>
			<div class="form-group mb-3 ml-10 inputBox category">
			<label for="category">Category</label> 
			<select name="category" class="form-control" id="category" 
			aria-describedby="emailHelp" onchange="validate6()">
			<!-- <option value="0" selected>Select category</option> -->
				
												<%for (Category category : categorylist) {%>
													<%if(category.getCategory_id()==product.getCategory_id()){ %>
														<option value="<%=category.getCategory_id()%>" selected><%=category.getCategory_name()%></option>
													<%} else{%>
															<option value="<%=category.getCategory_id()%>"><%=category.getCategory_name()%></option>
													<%} %>
												<%}%>
												 
			</select> <span class="indicator6"></span>
			</div> 
			<div class="form-group mb-3 ml-10 inputBox subcategory">
			<label for="subcategory">Sub-Category</label> 
			<select name="subcategory" class="form-control" id="subcategory" 
			aria-describedby="emailHelp" onchange="validate6()">
			<option value="0" selected>Select sub-category</option>	
										
			</select> <span class="indicator6"></span>

			</div> 
			<div class="form-group mb-3 ml-10 inputBox category">
			<label for="offer">Offer</label> 
			<select name="offer" class="form-control" id="offer" 
			aria-describedby="emailHelp" onchange="validate13()">
			<!-- <option value="0" selected>Select category</option> -->
				
												<%for (Offer offer1 : offerList){%>
													<%if(offer1.getOfferid()==product.getOfferid()){ %>
														<option value="<%=offer1.getOfferid()%>" selected><%=offer1.getOffername()%></option>
													<%} else{%>
														<option value="<%=offer1.getOfferid()%>" selected><%=offer1.getOffername()%></option>
													<%} %>
												<%}%> 
			</select> <span class="indicator13"></span>
			</div>
			
			<div class="form-group mb-3 ml-10 inputBox status">
			<div class="form-check">
			<%if(product.getStatus()==1){ %>
				<input class="form-check-input" type="radio" name="exampleRadios2"
						id="exampleRadios21" value="1" checked> 
				<label class="form-check-label" for="exampleRadios21"> <b>Active</b></label>
				<input class="form-check-input" type="radio" name="exampleRadios2"
				id="exampleRadios11" value="0"> 
				<label class="form-check-label" for="exampleRadios11"> <b>Inactive</b></label>
			<%}else{ %>
				<input class="form-check-input" type="radio" name="exampleRadios2"
						id="exampleRadios21" value="1"> 
				<label class="form-check-label" for="exampleRadios21"> <b>Active</b></label>
				<input class="form-check-input" type="radio" name="exampleRadios2"
				id="exampleRadios11" value="0" checked> 
				<label class="form-check-label" for="exampleRadios11"> <b>Inactive</b></label>
			<%} %>
			</div>
		</div>
			
		<div align="center">
			<button type="submit" name="submit" class="btn form-group btn-primary ml-10">Submit</button>
		</div>
		</form>
		<%}else{ %>
			<form action="UpdateProductsDetails" class="w-50 ml-10" class="box" class="form" id="form"
			method="post" onsubmit=" login()" enctype="multipart/form-data">
			<input type="hidden" name="edit" value="foroffer">
			<input type="hidden" name="offerid" value="<%=String.valueOf(offer.getOfferid()) %>">
			<div class="form-group mb-3 ml-10 inputBox Offername">
			<label for="Offername">Offer Name</label> 
			<input type="text" value="<%=offer.getOffername() %>" name="Offername" class="form-control" id="offername" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate3();"> <span
				class="indicator3"></span>
			</div>
			<div class="form-group mb-3 ml-10 inputBox OfferDiscount">
			<label for="OfferDiscount">Offer Discount</label> 
			<input type="text" value="<%=offer.getDiscount() %>" name="OfferDiscount" class="form-control" id="offerdiscount" autocomplete="off"
				aria-describedby="emailHelp" onkeyup="validate4();"> <span
				class="indicator4"></span>
			</div>
			<div class="form-group mb-3 ml-10 inputBox status">
			<div class="form-check">
			<%if(offer.getValidoffer()==1){ %>
				<input class="form-check-input" type="radio" name="exampleRadios2"
						id="exampleRadios21" value="1" checked> 
				<label class="form-check-label" for="exampleRadios21"> <b>Active</b></label>
				<input class="form-check-input" type="radio" name="exampleRadios2"
				id="exampleRadios11" value="0"> 
				<label class="form-check-label" for="exampleRadios11"> <b>Inactive</b></label>
			<%}else{ %>
				<input class="form-check-input" type="radio" name="exampleRadios2"
						id="exampleRadios21" value="1"> 
				<label class="form-check-label" for="exampleRadios21"> <b>Active</b></label>
				<input class="form-check-input" type="radio" name="exampleRadios2"
				id="exampleRadios11" value="0" checked> 
				<label class="form-check-label" for="exampleRadios11"> <b>Inactive</b></label>
			<%} %>
			</div>
		</div>
		<div align="center">
			<button type="submit" name="submit" class="btn form-group btn-primary ml-10">Submit</button>
		</div>
			</form>
		<%} %>
		
		
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
$("#category").change(function() {
		
		const catid= document.getElementById('category').value;
		$.get( "SelectSubcategory", {category: catid } )
		  .done(function( data ) {
			  $('#subcategory').empty()
			 var list= jQuery.parseJSON( data);
			  $('#subcategory')
              .append($("<option></option>")
              .attr("value","-1")
              .text("Select Sub-category"));
			 $.each(list, function( key, value ) {
				 $('#subcategory')
	                .append($("<option></option>")
	                .attr("value",value.sub_category_id)
	                .text(value.sub_category_name));  
				});
		  });
		
	});
	
 	function validate1() {			
		const form = document.getElementById('form');
		const cname = document.getElementById('cname').value;
		
		if (cname == "") 
		{
			form.classList.add('invalid')
			form.classList.remove('valid')
		}
		else
		{
			form.classList.remove('invalid')
			form.classList.add('valid')
		}
		if($.isNumeric(cname))
		{
			form.classList.add('invalid')
			form.classList.remove('valid')
		}
		
	}
 	
 	function validate2() {  //subcategory
		const form = document.getElementById('form');
		const subcategory = document.getElementById('subcategory').value;
		
		if (subcategory == "") 
		{
			form.classList.add('invalid1')
			form.classList.remove('valid1')
		}
		else
		{
			form.classList.remove('invalid1')
			form.classList.add('valid1')
		}
		if($.isNumeric(subcategory))
		{
			form.classList.add('invalid1')
			form.classList.remove('valid1')
		}
	}
 	
 	function validate3() {  //Offer name
		const form = document.getElementById('form');
		const offer = document.getElementById('offername').value;
		
		if (offer == "") 
		{
			form.classList.add('invalid2')
			form.classList.remove('valid2')
		}
		else
		{
			form.classList.remove('invalid2')
			form.classList.add('valid2')
		}
		if($.isNumeric(offer))
		{
			form.classList.add('invalid2')
			form.classList.remove('valid2')
		}
	}
 	
 	function validate4() {  //Offer discount 
		const form = document.getElementById('form');
		const offerdiscount = document.getElementById('offerdiscount').value;
		const pattern = "^-?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)$";
		
		if (offerdiscount == "") 
		{
			form.classList.add('invalid3')
			form.classList.remove('valid3')
		}
		else
		{
			form.classList.remove('invalid3')
			form.classList.add('valid3')
		}
		if(offerdiscount.match(pattern))
		{
			form.classList.remove('invalid3')
			form.classList.add('valid3')
		}
		else
		{
			form.classList.add('invalid3')
			form.classList.remove('valid3')
		}
	}
 	
 	function validate5() {    //product image
		var fileInput = 
                document.getElementById('customFile');
              
            var filePath = fileInput.value;
          
            // Allowing file type
            var allowedExtensions = 
                    /(\.jpg|\.jpeg|\.png|\.gif)$/i;
              
            if (!allowedExtensions.exec(filePath)) {
            	form.classList.add('invalid4')
				form.classList.remove('valid4')
               // alert('Invalid file type');
                fileInput.value = '';
                return false;
            } 
            else 
            {
            	form.classList.remove('invalid4')
				form.classList.add('valid4')
            }
	}
 	
 	function validate6() {    // category drop (sub)
		const form = document.getElementById('form');
		var e=document.getElementById('category');
		
		var value=e.options[e.selectedIndex].value;
		if (value!='0') 
		{
			form.classList.add('valid5')
			form.classList.remove('invalid5')
		} else {
			form.classList.add('invalid5')
			form.classList.remove('valid5')
		}
	}
 	
 	function validate7() {  //product name
		const form = document.getElementById('form');
		const pname = document.getElementById('productname').value;
		
		if (pname == "") 
		{
			form.classList.add('invalid6')
			form.classList.remove('valid6')
		}
		else
		{
			form.classList.remove('invalid6')
			form.classList.add('valid6')
		}
		if($.isNumeric(pname))
		{
			form.classList.add('invalid6')
			form.classList.remove('valid6')
		}
	}
 	
 	function validate8() {  // product price
		const form = document.getElementById('form');
		const pprice = document.getElementById('productprice').value;
		const pattern = "^-?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)$";
		
		if (pprice == "") 
		{
			form.classList.add('invalid7')
			form.classList.remove('valid7')
		}
		else
		{
			form.classList.remove('invalid7')
			form.classList.add('valid7')
		}
		if(pprice.match(pattern))
		{
			form.classList.remove('invalid7')
			form.classList.add('valid7')
		}
		else
		{
			form.classList.add('invalid7')
			form.classList.remove('valid7')
		}
	}
 	
 	function validate9() {		//Product qnt
		const form = document.getElementById('form');
		const pquentity = document.getElementById('productquantity').value;
		const pattern = "^-?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)$";
		
		if (pquentity == "") 
		{
			form.classList.add('invalid8')
			form.classList.remove('valid8')
		}
		else
		{
			form.classList.remove('invalid8')
			form.classList.add('valid8')
		}
		
		if(pquentity.match(pattern))
		{
			form.classList.remove('invalid8')
			form.classList.add('valid8')
		}
		else
		{
			form.classList.add('invalid8')
			form.classList.remove('valid8')
		}
	}
 	
 	function validate10() {     // Product Weight
		const form = document.getElementById('form');
		const pweight = document.getElementById('productweight').value;
		const pattern = "^-?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)$";
		if (pweight == "") 
		{
			form.classList.add('invalid10')
			form.classList.remove('valid10')
		}
		else
		{
			form.classList.remove('invalid10')
			form.classList.add('valid10')
		}
		if(pweight.match(pattern))
		{
			form.classList.remove('invalid10')
			form.classList.add('valid10')
		}
		else
		{
			form.classList.add('invalid10')
			form.classList.remove('valid10')
		}
	}
 	
 	function validate11() {    // Product Owner drop
		const form = document.getElementById('form');
		var e=document.getElementById('ownername');
		
		var value=e.options[e.selectedIndex].value;
		if (value!='0') 
		{
			form.classList.add('valid11')
			form.classList.remove('invalid11')
		} else {
			form.classList.add('invalid11')
			form.classList.remove('valid11')
		}
	}
 	
 	function validate12() {    // Product Desc
		const form = document.getElementById('form');
		const pdescription = document.getElementById('pdescription').value;
		
		if (pdescription == "") 
		{
			form.classList.add('invalid12')
			form.classList.remove('valid12')
		}
		else
		{
			form.classList.remove('invalid12')
			form.classList.add('valid12')
		}
	}
 	
 	
 	function validate13() {    // Product Offer drop
		const form = document.getElementById('form');
		var e=document.getElementById('offer');
		
		var value=e.options[e.selectedIndex].value;
		if (value!='0') 
		{
			form.classList.add('valid13')
			form.classList.remove('invalid13')
		} else {
			form.classList.add('invalid13')
			form.classList.remove('valid13')
		}
	}
 	
$("#category").change(function() {
		
		const catid= document.getElementById('category').value;
		//alert(catid);
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
 	
	</script>
	
	
</body>
</html>