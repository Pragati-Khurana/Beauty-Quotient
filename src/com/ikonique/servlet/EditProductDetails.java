package com.ikonique.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.bean.Product;
import com.ikonique.bean.SubCategory;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class EditProductDetails
 */
public class EditProductDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us=new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productid=0;
		String productname = request.getParameter("productId");
		productid=Integer.parseInt(productname);
		
		System.out.println("Product Id:-"+productid);
		
		  
		  
		  
		  Product product=new Product(); 
		  product =us.fetchProductDetails(productid);
		  
		  request.setAttribute("product",product );
		  
		  RequestDispatcher requestdispacher=request.getRequestDispatcher("editproducts.jsp");
		  requestdispacher.forward(request, response);
		 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
