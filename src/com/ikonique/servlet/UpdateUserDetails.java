package com.ikonique.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;
import com.ikonique.util.Main;

/**
 * Servlet implementation class UpdateUserDetails
 */
public class UpdateUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	userServiceImpl u1=new userServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserDetails() {
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
		
		User user =new User();
		int roleid = Integer.parseInt(request.getParameter("role_id"));
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String aboutme=request.getParameter("aboutme");
		String designation=request.getParameter("designation");
		String vfees=request.getParameter("vfees");
		String contactno=request.getParameter("contactno");
		String exampleRadios = request.getParameter("exampleRadios");
		String photo=request.getParameter("photo");
		int areaId=Integer.parseInt(request.getParameter("area"));
		System.out.println(exampleRadios);
		Part part = request.getPart("photo");
		InputStream is=part.getInputStream();
		
		
		try
		{
			int user_id=Integer.parseInt(request.getParameter("user_id"));
			user.setUser_id(user_id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		user.setFirstname(fname);
		user.setLastname(lname);
		user.setEmail(email);
		user.setAddress(address);
		user.setAboutme(aboutme);
		user.setDesignation(designation);
		user.setVisitingfees(vfees);
		user.setMobileno(contactno);
		user.setArea_id(areaId);
		user.setGender(exampleRadios);
		user.setRole_id(roleid);
		
		if(part.getSize()!=0)
		{
			user.setUserProfilepicStream(is);
			user.setUserProfilepicString(Base64.getEncoder().encodeToString(Main.getBytesFromInputStream(part.getInputStream())));
			System.out.println("is Not Null...."+part.getSize());
		}
		String msg=u1.updateUserDetails(user);
		System.out.println(msg);
		System.out.println("");
		User user1=u1.getUserDetails(user.getUser_id());
		
		if(user.getRole_id()==1)
		{
			HttpSession httpSession = request.getSession(false);
			httpSession.setAttribute("loginBean", user1);
			RequestDispatcher dispatcher = request.getRequestDispatcher("customer.jsp");
			dispatcher.forward(request, response);
		}
		else if(user.getRole_id()==2)
		{
			HttpSession httpSession = request.getSession(false);
			httpSession.setAttribute("loginBean", user1);
			RequestDispatcher dispatcher = request.getRequestDispatcher("interiordesigner.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			HttpSession httpSession = request.getSession(false);
			httpSession.setAttribute("loginBean", user1);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
		
		
	}
}
