package com.ikonique.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class RegistrationServlet
 */
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	userServiceImpl s1 = new userServiceImpl();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * doGet(request, response);
		 */

		String role = request.getParameter("exampleRadios1");
		System.out.println(role);
		String message = null;

		if (role.equalsIgnoreCase("option11")==true) {

			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String address = request.getParameter("address");
			String mno = request.getParameter("mno");
			String exampleRadios = request.getParameter("exampleRadios");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String areaname=request.getParameter("area");
			
	
			
			/* String vfees = request.getParameter("vfees1"); */

			User user = new User();

			user.setFirstname(fname);
			user.setLastname(lname);
			user.setAddress(address);
			user.setMobileno(mno);
			user.setGender(exampleRadios);
			user.setEmail(email);
			user.setPassword(password);
			try {
				user.setArea_id(Integer.parseInt(areaname));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			/* user.setVisitingfees(vfees); */
			message = s1.saveUserDetails(user);
			System.out.println(message);
		}
		else
		{
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String address = request.getParameter("address");
			String mno = request.getParameter("mno");
			String exampleRadios = request.getParameter("exampleRadios");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String vfees = request.getParameter("vfees1");
			String aboutme = request.getParameter("aboutme");
			String designation = request.getParameter("designation");
			String areaname=request.getParameter("area");

			User user = new User();

			user.setFirstname(fname);
			user.setLastname(lname);
			user.setAddress(address);
			user.setMobileno(mno);
			user.setGender(exampleRadios);
			user.setEmail(email);
			user.setPassword(password);
			user.setVisitingfees(vfees); 
			user.setAboutme(aboutme);
			user.setDesignation(designation);
			try {
				user.setArea_id(Integer.parseInt(areaname));
			}
			catch(Exception e) {
				e.printStackTrace();
			}

			userServiceImpl s1 = new userServiceImpl();

			message = s1.saveDesignerDetails(user);


		}

		if (message.equalsIgnoreCase("Registration Failed")) 
		{
			System.out.println("hello if con");
			  message=null;
			  RequestDispatcher requestdispatcher =
			  request.getRequestDispatcher("register.jsp");
			  requestdispatcher.forward(request, response);
			 
		} 
		else 
		{ 
			  RequestDispatcher requestdispatcher =
			  request.getRequestDispatcher("login.jsp"); requestdispatcher.forward(request,response);
		} 

	}

}
