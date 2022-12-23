package com.ikonique.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.bean.FeedBack;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class SelectFeedbackLand
 */
public class SelectFeedbackLand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFeedbackLand() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int feedbackid = Integer.parseInt(request.getParameter("feedbackid"));
		
		FeedBack feedBack = new FeedBack();
		feedBack = us.getfeedbackland(feedbackid);
		
		
			request.setAttribute("feedBack",feedBack );
			RequestDispatcher dispatcher = request.getRequestDispatcher("feedbacklandpage.jsp");
			dispatcher.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
