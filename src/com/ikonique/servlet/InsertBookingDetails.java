package com.ikonique.servlet;

import java.awt.print.Book;
import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ikonique.bean.Booking;
import com.ikonique.bean.BookingInfo;
import com.ikonique.bean.User;
import com.ikonique.dao.userDao;
import com.ikonique.dao.impl.userDaoImpl;
import com.ikonique.userService.impl.userServiceImpl;
import com.ikonique.util.Main;

/**
 * Servlet implementation class InsertBookingDetails
 */
public class InsertBookingDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us = new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBookingDetails() {
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
		// TODO Auto-generated method stub
		HttpSession httpSession = request.getSession(false);
		User user = null;   
		if(null!=httpSession){
		   user = (User)httpSession.getAttribute("loginBean");
	   }
		userDao userDao = new userDaoImpl();
		Connection connection = Main.getConnection();
		Date date=new Date();
		String bookdate = request.getParameter("bookdate");
			try {
				date = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("bookdate"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			java.sql.Date sqldate=new java.sql.Date(date.getTime());
			 
		
	  	int designerid = Integer.parseInt(request.getParameter("designerid"));
	  	int visitingfees = Integer.parseInt(request.getParameter("visitingfees"));
	  	
	  	Booking booking = new Booking();
	  	booking.setDesignerid(designerid);
	  	booking.setBookingdate(sqldate);
	  	booking.setVfees(visitingfees);
	  	booking.setUserid(user.getUser_id());
	  	
	  	int id = us.insertBookingDetails(booking);
	  	System.out.println("id is:"+id);
	  	/*----------------------------------------*/
	  	String fname = request.getParameter("fname");
	  	String lname = request.getParameter("lname");
	  	String address = request.getParameter("address");
	  	String mno = request.getParameter("mno");
	  	String email = request.getParameter("email");
	  	
	  	BookingInfo bookingInfo = new BookingInfo();
	  	bookingInfo.setBookingid(id);
	  	bookingInfo.setBookingfname(fname);
	  	bookingInfo.setBookinglname(lname);
	  	bookingInfo.setBookingaddress(address);
	  	bookingInfo.setBookingcno(mno);
	  	bookingInfo.setBookingemail(email);
	  	bookingInfo.setBookingdate(sqldate);
	  	String msg2 = us.insertBookingInfo(bookingInfo);
	  	if(msg2.equalsIgnoreCase("Insertion Is Successfully"))
	  	{
	  		RequestDispatcher requestDispatcher= request.getRequestDispatcher("designerpaymentform.jsp");
	  		requestDispatcher.forward(request, response);
	  		
//	  		User user2=userDao.selectUserDetails(connection,booking.getUserid());
			User user1=userDao.selectUserDetails(connection,designerid);
			
	  		StringBuilder builder = new StringBuilder();
			builder.append("Customer Name:- "+fname+" "+lname);
			builder.append("\n");
			builder.append("Booking Date:- "+sqldate);
			builder.append("\n");
			builder.append("Contact No:- "+mno);
			builder.append("\n");
			builder.append("Email-Id:- "+email);
			builder.append("\n");
			builder.append("Address:- "+address);
			ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
	        emailExecutor.execute(new Runnable() {
	            @Override
	            public void run() {
	                try {
	                	Main main=new Main();
	        			main.sendFromGMail("beautyquotient4@gmail.com", "vvoiqwaxlmewvzvk", new String[] {user1.getEmail()}, "Notification For Booking",builder.toString());
	                } catch (Exception e) {
//	                    logger.error("failed", e);
	                	e.printStackTrace();
	                }
	            }
	        });
	        emailExecutor.shutdown(); 
			
	  	}
	  	else
	  	{
	  		RequestDispatcher requestDispatcher= request.getRequestDispatcher("bookdesigner.jsp");
	  		requestDispatcher.forward(request, response);
	  	}
	}

}
