package com.ikonique.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class DelectSubCategoryDetails
 */
public class DelectSubCategoryDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 userServiceImpl userservice = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelectSubCategoryDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String subcategory = request.getParameter("subcategoryId");
		int subcategoryId = Integer.parseInt(subcategory);
		String removesubcategorymsg = userservice.removesubcategoryDetails(subcategoryId);
		response.sendRedirect("subcategoryTable.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
