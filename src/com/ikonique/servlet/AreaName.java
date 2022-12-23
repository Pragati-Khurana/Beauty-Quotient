package com.ikonique.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ikonique.bean.User;
import com.ikonique.userService.userService;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class AreaName
 */

public class AreaName extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userServiceImpl u1= new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AreaName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession httpSession = request.getSession(true);
		User user = null;   
		if(null!=httpSession){
		   user = (User)httpSession.getAttribute("loginBean");
	   }
		
		int id=user.getArea_id();
		String areaname=u1.getAreaName(id);
		
		
		request.setAttribute("name",areaname);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
