package com.ikonique.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ikonique.bean.Cart;
import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class InsertProductInCart
 */
public class InsertProductInCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductInCart() {
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
		// TODO Auto-generated method stub
		HttpSession httpSession = request.getSession(false);  
	  	User user = null;    
	  	if(null!=httpSession){ 
	  	   user = (User)httpSession.getAttribute("loginBean"); 
	     } 
	  	Date date=new Date();
	  	java.sql.Date sqldate=new java.sql.Date(date.getTime());
	  	int productid = Integer.parseInt(request.getParameter("productid"));
	  	String msg = null;
	  	Cart cart = new Cart();
	  	cart.setUserid(user.getUser_id());
	  	cart.setProductid(productid);
	  	cart.setCurrentdate(sqldate);
	  	msg = us.insertIntoCart(cart);
		System.out.println(msg);
		if(msg.equalsIgnoreCase("Insertion Is Successfully"))
		{
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
			requestDispatcher.forward(request, response);
		}
		else
		{
			
		}
	  	
	}

}
