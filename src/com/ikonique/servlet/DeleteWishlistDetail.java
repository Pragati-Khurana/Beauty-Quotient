package com.ikonique.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class DeleteWishlistDetail
 */
public class DeleteWishlistDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us=new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWishlistDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession(false);  
	  	User user = null;    
	  	if(null!=httpSession){ 
	  	   user = (User)httpSession.getAttribute("loginBean"); 
	     } 
	
	  	int productid=Integer.parseInt(request.getParameter("productid"));
	  	
	  	String msg=null;
	  	msg=us.deleteFromWishlist(productid,user.getUser_id());
	  	if(msg.equalsIgnoreCase("Deletion Successfully")) {
	  		RequestDispatcher requestdispatcher=request.getRequestDispatcher("wishlist.jsp");
	  		requestdispatcher.forward(request, response);
	  	}
	  	else
	  	{
	  		
	  	}
	}

}
