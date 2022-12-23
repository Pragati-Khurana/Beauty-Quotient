package com.ikonique.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class DeleteFeedback
 */
public class DeleteFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us=new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFeedback() {
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
		int feedbackid=Integer.parseInt(request.getParameter("feedbackid"));
		String message=null;
		message=us.deleteFromFeedback(feedbackid);
		
		if(message=="Deletion Successfully") {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("managefeedback.jsp");
	  		requestDispatcher.forward(request, response);
		}
		else {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("feedbacklandpage.jsp");
	  		requestDispatcher.forward(request, response);
		}
	}

}
