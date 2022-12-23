package com.ikonique.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ikonique.bean.Cart;
import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;


/**
 * Servlet implementation class InsertDeleteProductInCart
 */
public class InsertDeleteProductInCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us=new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDeleteProductInCart() {
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
		
		 HttpSession httpSession = request.getSession(false);  
		  	User user = null;    
		  	if(null!=httpSession){ 
		  	   user = (User)httpSession.getAttribute("loginBean"); 
		     } 
		
		  	Date date=new Date();
		  	java.sql.Date sqldate=new java.sql.Date(date.getTime());
		  	System.out.println(sqldate);
		  	int productid = 0;
		try
		{
			productid = Integer.parseInt(request.getParameter("productid"));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		String opname = request.getParameter("operation");
		String msg = null;
		Cart cart=new Cart();
		cart.setProductid(productid);
		cart.setUserid(user.getUser_id());
		cart.setCurrentdate(sqldate);
	
		
		if (opname.equalsIgnoreCase("blue")) {
			msg = us.insertInCart(cart);
			System.out.println("update:-" + msg);
		}

		else {
			msg = us.deleteInCart(cart);
			System.out.println("update:-" + msg);

		}
		 

	}

}
