package com.ikonique.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ikonique.bean.User;
import com.ikonique.bean.Wishlist;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class InsertProductInWishlist
 */
public class InsertDeleteProductInWishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDeleteProductInWishlist() {
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
		Wishlist wishlist = new Wishlist();
		wishlist.setUserid(user.getUser_id());
		wishlist.setProductid(productid);
		wishlist.setCurrentdate(sqldate);
//		System.out.println("List:-"+productid+" "+opname+" "+user.getUser_id());
		if(opname.equalsIgnoreCase("red"))
		{
			msg = us.insertIntoWishlist(wishlist);
			System.out.println("update:-"+msg);
		}
		else
		{
			msg = us.deleteIntoWishlist(wishlist);
			System.out.println("update:-"+msg);
			
		}
		
		
	}

}
