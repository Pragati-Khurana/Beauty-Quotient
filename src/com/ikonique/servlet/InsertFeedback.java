package com.ikonique.servlet;

import java.io.IOException;
import java.util.Date;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ikonique.bean.FeedBack;
import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class InsertFeedback
 */
public class InsertFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession httpSession = request.getSession(false);  
	  	User user = null;    
	  	if(null!=httpSession){ 
	  	   user = (User)httpSession.getAttribute("loginBean"); 
	     } 
		int productid = Integer.parseInt(request.getParameter("productid"));
		Date date=new Date();
	  	java.sql.Date sqldate=new java.sql.Date(date.getTime());
	  	String feedbackdesc = request.getParameter("feedback");
	  	System.out.println("The Feedback:-"+feedbackdesc);
	  	FeedBack feedBack = new FeedBack();
	  	feedBack.setProductid(productid);
	  	feedBack.setUserid(user.getUser_id());
	  	feedBack.setFeedbackdate(sqldate);
	  	feedBack.setFeedbackdesc(feedbackdesc);
	  	
	  	
	  	String message = null;
	  	
	  	message=us.insertFeedbackDetails(feedBack);
	  	System.out.println(message);
	  	if(message.equalsIgnoreCase("Insertion Is Successfully"))
	  	{
	  		RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer.jsp");
	  		requestDispatcher.forward(request, response);
	  	}
	  	else
	  	{
	  		System.out.println("Faileddddd..........");
//	  		RequestDispatcher requestDispatcher = request.getRequestDispatcher(".jsp");
//	  		requestDispatcher.forward(request, response);
	  	}
	  	
		
	}

}
