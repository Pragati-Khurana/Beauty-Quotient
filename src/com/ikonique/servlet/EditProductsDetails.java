package com.ikonique.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.bean.Category;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class EditProductsDetails
 */
public class EditProductsDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductsDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			int catid=0;
			String categoryid = request.getParameter("categoryId");
			//System.out.println(categoryid+"hello");
			
				catid=Integer.parseInt(categoryid);
			
			Category category=new Category();
			category = us.fetchCategoryDetails(catid);
			request.setAttribute("category", category);
			
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
