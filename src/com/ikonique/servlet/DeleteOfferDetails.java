package com.ikonique.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class DeleteOfferDetails
 */
public class DeleteOfferDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userServiceImpl userservice = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOfferDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String offer = request.getParameter("offerid");
		int offerid = Integer.parseInt(offer);
		String removeoffermsg = userservice.removeOfferDetails(offerid);
		response.sendRedirect("offertable.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
