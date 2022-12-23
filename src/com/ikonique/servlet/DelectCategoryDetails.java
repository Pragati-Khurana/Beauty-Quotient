package com.ikonique.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class DelectCategoryDetails
 */
public class DelectCategoryDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl userservice = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelectCategoryDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String category = request.getParameter("categoryId");
		int categoryId = Integer.parseInt(category);
		String deletemsg=userservice.removechildsubcategory(categoryId);
		String removecategorymsg = userservice.removecategoryDetails(categoryId);
		response.sendRedirect("categoryTable.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
