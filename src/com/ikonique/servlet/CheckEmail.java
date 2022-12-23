package com.ikonique.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class CheckEmail
 */
public class CheckEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl u1=new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * String mail = request.getParameter("email"); User user=new User();
		 * user=u1.getEmailId(mail); if(user.getEmail()!=null) { String
		 * mailid=user.getEmail(); request.setAttribute("mailid", mailid);
		 * 
		 * }
		 */
	}

}
