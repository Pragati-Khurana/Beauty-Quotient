package com.ikonique.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ikonique.userService.impl.userServiceImpl;

import com.ikonique.bean.SubCategory;

/**
 * Servlet implementation class EditSubCategoryDetails
 */
public class EditSubCategoryDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userServiceImpl us = new userServiceImpl();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSubCategoryDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int subcatid=0;
		String subcategoryid = request.getParameter("subcategoryId");
		//System.out.println(categoryid+"hello");
		
			subcatid=Integer.parseInt(subcategoryid);
			
		
		SubCategory subcategory=new SubCategory();
		subcategory = us.fetchSubCategoryDetails(subcatid);
		
		request.setAttribute("subcategory", subcategory);
		
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
