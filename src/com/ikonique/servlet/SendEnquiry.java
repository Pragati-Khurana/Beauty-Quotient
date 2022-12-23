package com.ikonique.servlet;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.util.Main;

/**
 * Servlet implementation class SendEnquiry
 */
public class SendEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEnquiry() {
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
		
		String name = request.getParameter("customername");
		String email = request.getParameter("emailid");
		String message =  request.getParameter("message");
		
		StringBuilder builder = new StringBuilder();
		builder.append("Customer Name :-" +name);
		builder.append("\n");
		builder.append("Customer Email-Id :-" +email);
		builder.append("\n");
		builder.append("Customer Message :-" +message);
		ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
        emailExecutor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                	Main main=new Main();
            		main.sendFromGMail("beautyquotient4@gmail.com", "vvoiqwaxlmewvzvk",new String[] {"beautyquotient4@gmail.com"} , "Enquiry From User",builder.toString());
                } catch (Exception e) {
//                    logger.error("failed", e);
                	e.printStackTrace();
                }
            }
        });
        emailExecutor.shutdown(); 
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("contactus.jsp");
		requestDispatcher.forward(request, response);
		
	}

}
