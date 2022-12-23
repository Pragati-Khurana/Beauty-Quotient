package com.ikonique.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.ikonique.util.Main;

import com.ikonique.bean.Category;
import com.ikonique.bean.Offer;
import com.ikonique.bean.Product;
import com.ikonique.bean.SubCategory;
import com.ikonique.userService.impl.userServiceImpl;


/**
 * Servlet implementation class UpdateProductsDetails
 */
public class UpdateProductsDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl userimpl = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductsDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String type=request.getParameter("edit");
		//String type1=request.getParameter("subcategory");
		//String type2=request.getParameter("product");
		//String type3=request.getParameter("offer"); 
		//System.out.println("Hello saleha");
		/* System.out.println(type3.equalsIgnoreCase("foroffer")); */
		String message = null;
		System.out.println("edit:-"+type);
		//System.out.println("edit:-"+type1);
		//System.out.println("edit:-"+type2);
		//System.out.println("edit:-"+type3);
		if(type.equalsIgnoreCase("forcategory")) {
			
			int categoryid = Integer.parseInt(request.getParameter("categoryId"));
			String categoryname = request.getParameter("cname");
			int categorystatus = Integer.parseInt(request.getParameter("exampleRadios2"));
			Category category = new Category();
			category.setCategory_id(categoryid);
			category.setCategory_name(categoryname);
			category.setStatus(categorystatus);
			
			message = userimpl.updateCategoryDetails(category);
			
			if(message!=null)
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("categoryTable.jsp");
				requestdispatcher.forward(request, response);
			}
			else
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("editproducts.jsp");
				requestdispatcher.forward(request, response);
			}
		
		}
		else if(type.equalsIgnoreCase("forsubcategory")) {
			int subcategoryid = Integer.parseInt(request.getParameter("subcategoryId"));
			String subcategoryname = request.getParameter("subcategoryname");
			int subcategorystatus = Integer.parseInt(request.getParameter("exampleRadios2"));
			int categoryid =Integer.parseInt(request.getParameter("category"));
			
			SubCategory subcategory=new SubCategory();
			subcategory.setCategory_id(categoryid);
			subcategory.setSub_category_id(subcategoryid);
			subcategory.setSub_category_name(subcategoryname);
			subcategory.setStatus(subcategorystatus);
			
			message = userimpl.updateSubCategoryDetails(subcategory);
			
			if(message!=null)
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("subcategoryTable.jsp");
				requestdispatcher.forward(request, response);
			}
			else
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("editproducts.jsp");
				requestdispatcher.forward(request, response);
			}
		}
		else if(type.equalsIgnoreCase("forproduct")) {
			System.out.println("You Are In Product");
			int productid = Integer.parseInt(request.getParameter("productId"));
			String productname = request.getParameter("productname");
			String productprice = request.getParameter("productprice");
			String productquantity = request.getParameter("productquantity");
			String productweight = request.getParameter("productweight");
			int productownerid = Integer.parseInt(request.getParameter("ownername"));
			String produdesc = request.getParameter("pdescription");
			int categoryid = Integer.parseInt(request.getParameter("category"));
			int subcatgoryid = Integer.parseInt(request.getParameter("subcategory"));
			int offerid = Integer.parseInt(request.getParameter("offer"));
			int productstatus = Integer.parseInt(request.getParameter("exampleRadios2"));
			String productimage=request.getParameter("photo");
			Part part = request.getPart("photo");
			InputStream is=part.getInputStream();
			
			Product product = new Product();
			product.setProduct_id(productid);
			product.setProduct_name(productname);
			product.setProduct_price(productprice);
			product.setProduct_quantity(productquantity);
			product.setProduct_weight(productweight);
			product.setProduct_owner_id(productownerid);
			product.setProduct_desc(produdesc);
			product.setCategory_id(categoryid);
			product.setSubcategory_id(subcatgoryid);
			product.setOfferid(offerid);
			product.setStatus(productstatus);
			if(part.getSize()!=0)
			{
				product.setProductpicStream(is);
				product.setProductpicString(Base64.getEncoder().encodeToString(Main.getBytesFromInputStream(part.getInputStream())));
				System.out.println("is Not Null...."+part.getSize());
			}
			
			message = userimpl.updateProductDetails(product);
			
			if(message!=null)
			{
				System.out.println(message);
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("productTable.jsp");
				requestdispatcher.forward(request, response);
			}
			else
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("editproducts.jsp");
				requestdispatcher.forward(request, response);
			}
		}
		else 
		{
			System.out.println("adfasdfaf");
			int offerid = Integer.parseInt(request.getParameter("offerid"));
			String offername = request.getParameter("Offername");
			String discount = request.getParameter("OfferDiscount");
			double discountoffer = Double.parseDouble(discount); 
			int offerstatus = Integer.parseInt(request.getParameter("exampleRadios2"));
			
			Offer offer = new Offer();
			offer.setOfferid(offerid);
			offer.setOffername(offername);
			offer.setDiscount(discountoffer);
			offer.setValidoffer(offerstatus);
			
			message = userimpl.updateOfferDetails(offer);
			
			if(message!=null)
			{
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("offertable.jsp");
				requestDispatcher.forward(request, response);
			}
			else
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("editproducts.jsp");
				requestdispatcher.forward(request, response);
			}		
		}			
	}
}
