package com.ikonique.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class SelectDesignerDetails
 */
public class SelectDesignerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userServiceImpl us = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDesignerDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> designerList = us.fetchdesignerdetails();
		request.setAttribute("designerList", designerList);
		
		/*
		 * RequestDispatcher
		 * requestDispatcher=request.getRequestDispatcher("designerTable.jsp");
		 * requestDispatcher.forward(request, response);
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
