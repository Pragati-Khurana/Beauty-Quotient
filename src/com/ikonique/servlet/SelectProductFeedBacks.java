package com.ikonique.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ikonique.bean.FeedBack;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class SelectProductFeedBacks
 */
public class SelectProductFeedBacks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us=new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProductFeedBacks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId=0;
		try {
			productId=Integer.parseInt(request.getParameter("productid"));
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
				
		List<FeedBack> productfeedbacklist = us.fatchProductFeedbacks(productId);
		request.setAttribute("productfeedbackList", productfeedbacklist);
		
		String json = new Gson().toJson(productfeedbacklist);
		response.getWriter().append(json);
		
		for(FeedBack f1:productfeedbacklist) {
			System.out.println(f1.getFeedbackdesc());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
