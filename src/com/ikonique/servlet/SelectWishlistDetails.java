package com.ikonique.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ikonique.bean.Category;
import com.ikonique.bean.User;
import com.ikonique.bean.Wishlist;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class SelectWishlistDetails
 */
public class SelectWishlistDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userServiceImpl us = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectWishlistDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession httpSession = request.getSession(false);  
		  	User user = null;    
		  	if(null!=httpSession){ 
		  	   user = (User)httpSession.getAttribute("loginBean"); 
		     } 
		
		List<Wishlist> wishlistList = us.fetchWishlistDetails(user.getUser_id());
		List<Integer> wishlistint=new ArrayList<Integer>();
		for(Wishlist w: wishlistList) {
			wishlistint.add(w.getProductid());
		}
		System.out.println(wishlistList.size());
		request.setAttribute("wishlistList", wishlistList);
		request.setAttribute("wishlistint", wishlistint);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
