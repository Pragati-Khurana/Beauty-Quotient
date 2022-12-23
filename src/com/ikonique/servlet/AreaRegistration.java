package com.ikonique.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.bean.Area;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class AreaRegistration
 */
public class AreaRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userServiceImpl u1=new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AreaRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */
		
		
		List<Area> area=u1.fatcharea();
//		for(Area abc: area) {
//			System.out.println(abc.getArea_name());
//		}
		request.setAttribute("area", area);
		/*
		 * RequestDispatcher
		 * requestdispatcher=request.getRequestDispatcher("register.jsp");
		 * requestdispatcher.forward(request, response);
		 */}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
