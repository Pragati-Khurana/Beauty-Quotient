package com.ikonique.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class UpdatePassword
 */
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userServiceImpl u1= new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
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
		String confirmpass=request.getParameter("cpass");
		int roleid=Integer.parseInt(request.getParameter("role_id"));
		int user_id=0;
		try {
			 user_id=Integer.parseInt(request.getParameter("user_id"));
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		String msg=u1.modifyPass(confirmpass,user_id);
		System.out.println(msg);
		if(roleid==1)
		{
			if(msg=="Updation Of Password Successfully") 
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("customer.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				System.out.println("Not Update Pass");
			}
		}
		else if(roleid==2)
		{
			if(msg=="Updation Of Password Successfully") 
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("interiordesigner.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				System.out.println("Not Update Pass");
			}
		}
		else
		{
			if(msg=="Updation Of Password Successfully") 
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				System.out.println("Not Update Pass");
			}
		}
		
	}

}
