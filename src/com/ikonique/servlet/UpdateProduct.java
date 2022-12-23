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

import com.ikonique.bean.Product;
import com.ikonique.userService.impl.userServiceImpl;
import com.ikonique.util.Main;

/**
 * Servlet implementation class UpdateProduct
 */
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userServiceImpl userimpl = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
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
		String type=request.getParameter("editproduct");
		String message = null;
		System.out.println("edit:-"+type);
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

}
