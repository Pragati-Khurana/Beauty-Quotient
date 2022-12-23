package com.ikonique.servlet;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;
import com.ikonique.util.*;

/**
 * Servlet implementation class GenarateOtp
 */
public class GenerateOtpPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
      userServiceImpl u1=new userServiceImpl(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateOtpPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	     
			
			  
		/*
		 * otp = new GenerateOtp(); String otpstring = otp.generateOTP();
		 * 
		 * Main main = new Main(); main.sendOtp("ikoniqueinteriors@gmail.com",
		 * "SAM@616263",new String[] {user.getEmail()}, "OTP FOR FORGOT-PASSWORD",
		 * otpstring); request.setAttribute("otpstring", otpstring); RequestDispatcher
		 * dispatcher = request.getRequestDispatcher("otp.jsp");
		 * dispatcher.forward(request, response);
		 * 
		 */
		
		
	 		String email=request.getParameter("email");
	 		User user=u1.getEmailId(email);
	 		HttpSession httpSession = request.getSession(true);
			httpSession.setAttribute("user", user);
			/*
			 * RequestDispatcher dispatcher = request.getRequestDispatcher("customer.jsp");
			 * dispatcher.forward(request, response);
			 */
			
	 		if(user.getEmail().equalsIgnoreCase(email)) {
	 			GenerateOtp otp = new GenerateOtp();
		 		String otpstring = otp.generateOTP();
		 		ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
		        emailExecutor.execute(new Runnable() {
		            @Override
		            public void run() {
		                try {
		                		Main main = new Main();
		                		main.sendOtp("beautyquotient4@gmail.com", "vvoiqwaxlmewvzvk", new String[] {user.getEmail()}, "OTP FOR FORGOT-PASSWORD", "Yours Otp Is:- "+otpstring);
		                } catch (Exception e) {
//		                    logger.error("failed", e);
		                	e.printStackTrace();
		                }
		            }
		        });
		        emailExecutor.shutdown(); 
		 		
		         request.setAttribute("otpstring", otpstring); 
		         RequestDispatcher dispatcher = request.getRequestDispatcher("otp.jsp");
				 dispatcher.forward(request, response);
		 		 
	 			
	 		}
	 		
	 		
	     }
	     
}


