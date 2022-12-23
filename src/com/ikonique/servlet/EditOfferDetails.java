package com.ikonique.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.bean.Offer;
import com.ikonique.bean.SubCategory;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class EditOfferDetails
 */
public class EditOfferDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditOfferDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int offerid=0;
		String offername = request.getParameter("offerid");
		//System.out.println(categoryid+"hello");
		
		offerid=Integer.parseInt(offername);
			
		Offer offer = new Offer();
		offer = us.fetchOfferDetails(offerid);
		
		request.setAttribute("offer", offer);
		
		  RequestDispatcher requestdispacher=request.getRequestDispatcher("editproducts.jsp");
		  requestdispacher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
