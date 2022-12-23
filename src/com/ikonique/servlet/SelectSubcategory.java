package com.ikonique.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ikonique.bean.SubCategory;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class SelectSubcategory
 */
public class SelectSubcategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userServiceImpl s1 = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSubcategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String categoryname=request.getParameter("category");
		int categoryid=0;
		try {
			categoryid=Integer.parseInt(categoryname);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(categoryid);
		List<SubCategory> subcatList = s1.fetchSubCategory(categoryid);
		

		String json = new Gson().toJson(subcatList);
		response.getWriter().append(json);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
