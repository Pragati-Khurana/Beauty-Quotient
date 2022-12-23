package com.ikonique.userService.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.ikonique.bean.Area;
import com.ikonique.bean.Booking;
import com.ikonique.bean.BookingInfo;
import com.ikonique.bean.Cart;
import com.ikonique.bean.Category;
import com.ikonique.bean.FeedBack;
import com.ikonique.bean.Offer;
import com.ikonique.bean.Order;
import com.ikonique.bean.OrderDetails;
import com.ikonique.bean.Product;
import com.ikonique.bean.SubCategory;
import com.ikonique.bean.User;
import com.ikonique.bean.Wishlist;
import com.ikonique.bean.roomdesign;
import com.ikonique.dao.userDao;
import com.ikonique.dao.impl.userDaoImpl;
import com.ikonique.util.Main;


public class userServiceImpl {
	
	userDao userDao = new userDaoImpl();
	Connection connection = Main.getConnection();
	
	public String saveUserDetails(User user) {
		
		String msg=null;
		
		int insertedUserId= userDao.insertUserDetails(user,connection);
		if(insertedUserId>0) {
			ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
	        emailExecutor.execute(new Runnable() {
	            @Override
	            public void run() {
	                try {
	                	Main main=new Main();
	        			main.sendFromGMail("beautyquotient4@gmail.com", "vvoiqwaxlmewvzvk", new String[] {user.getEmail()}, "Registration Successfull", "Welcome to the world of BEAUTY QUOTIENT");
	                } catch (Exception e) {
//	                    logger.error("failed", e);
	                	e.printStackTrace();
	                }
	            }
	        });
	        emailExecutor.shutdown(); 
			
			msg="Registration Is Successfully";
		}
		else
		{
			msg="Registration Failed";
		}

		return msg;
	}
	
	public String saveDesignerDetails(User user) {
		userDao userDao = new userDaoImpl();
		
		String msg=null;
		
		int insertedUserId= userDao.insertDesignerDetails(user,connection);
		if(insertedUserId>0) {
			msg="Registration Is Successfully";
			ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
	        emailExecutor.execute(new Runnable() {
	            @Override
	            public void run() {
	                try {
	                	Main main=new Main();
		            	main.sendFromGMail("beautyquotient4@gmail.com", "vvoiqwaxlmewvzvk", new String[] {user.getEmail()}, "Registration Successfull", "Welcome to the world of BEAUTY QUOTIENT");
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
			msg="Registration Failed";
		}

		return msg;

	}
	public List<Area> fatcharea() {
		
		return userDao.selectArea(connection);
	
	}
	public User getUser(String email, String password) {
		
		return userDao.selectUserDetails(email,password,connection);
		
	}
	public String getAreaName(int id) {
		
		return userDao.fetchAreaName(id,connection);
		
	}
	public String updateUserDetails(User user) {
		
		int updateCount=0;
		String msg=null;
		updateCount=userDao.modifyUserDetails(user,connection);
		if(updateCount>0) {
			msg="Updation Successfully";
		}
		else
		{
			msg="Updation Failed";
		}
		return msg;
	}
	public String deleteUserDetails(int user_id) {
		
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeUserDetails(user_id,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;
		
		
	}
	public User getEmailId(String email) {
		// TODO Auto-generated method stub
		
		return userDao.fetchEmailId(email,connection);
	}
	public String updatePass(String cpass, int user_id) {
		String msg=null;
		
		int count=0;
		count=userDao.modifyPass(connection,cpass,user_id);
		if(count>0) {
			msg="Updation Of Password Successfully";
		}
		else
		{
			msg="Updation Of Password Failed";
		}
		
		return msg;
		
	}
	
	public List<User> fetchuserdetails()
	{
	  return userDao.selectDetails(connection);
	}
	public List<User> fetchdesignerdetails() {
			 return userDao.selectDesignerDetails(connection);

	}
	public List<Category> fetchcategorydetails() {
			 return userDao.selectCategoryDetails(connection);
	}
	public List<SubCategory> fetchsubcategorydetails() {
			 return userDao.selectSubCategoryDetails(connection);
	}
	public String insertProductDetails(Product product) {
		
		
		String msg=null;
		
		int insertedUserId= userDao.saveProductDetails(product,connection);
		if(insertedUserId>0) {
			msg="Insertion Is Successfully";
			
		}
		else
		{
			msg="Insertion Is Failed";
		}

		return msg;
	}
	public String insertCategoryDetails(Category category) {
		// TODO Auto-generated method stub
		
		String msg=null;
		int insertCategory = userDao.saveCategoryDetails(connection , category);
		if(insertCategory>0) {
			msg="Insertion Is Successfully";
		}
		else
		{
			msg="Insertion Is Failed";
		}
		return msg;
	}
	public String insertSubCategoryDetails(SubCategory subcategory) {
		// TODO Auto-generated method stub
		
		String msg=null;
		int insertsubCategory = userDao.saveSubCategoryDetails(connection , subcategory);
		if(insertsubCategory>0) {
			msg="Insertion Is Successfully";
		}
		else
		{
			msg="Insertion Is Failed";
		}
		return msg;
	}
	public List<Product> fetchproductdetails() {
		// TODO Auto-generated method stub
		return userDao.selectProductDetails(connection);
		
	}
	public List<SubCategory> fetchSubCategory(int categoryid) {
		return userDao.getSubCategory(connection , categoryid);
	}
	public List<Offer> SelectOfferDetails() {
		// TODO Auto-generated method stub
		return userDao.fetchOfferDetails(connection);
	}
	public String insertOfferDetails(Offer offer) {
		// TODO Auto-generated method stub
		
		String msg=null;
		int insertofferconunt = userDao.saveOfferDetails(connection , offer);
		if(insertofferconunt>0) {
			msg="Insertion Is Successfully";
		}
		else
		{
			msg="Insertion Is Failed";
		}
		return msg;
	}
	public String removecategoryDetails(int categoryId) {
		// TODO Auto-generated method stub
		
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeCategoryDetails(categoryId,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;
	}
	public String removesubcategoryDetails(int subcategoryId) {
		// TODO Auto-generated method stub
		
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeSubCategoryDetails(subcategoryId,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;
	}
	public String removeProductDetails(int productid) {
		// TODO Auto-generated method stub
		
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeProduct(productid,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;
	}
	public String removeOfferDetails(int offerid) {
		// TODO Auto-generated method stub
		
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeoffer(offerid,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;
	}
	public Category fetchCategoryDetails(int catid) {
		// TODO Auto-generated method stub
		Category category =new Category();
		category = userDao.selectCategoryDetails(connection,catid);
		return category;
	}

	public String updateCategoryDetails(Category category) {
		
		int updateCount=0;
		String msg=null;
		updateCount=userDao.modifyCategoryDetails(category,connection);
		if(updateCount>0) {
			msg="Updation Successfully";
		}
		else
		{
			msg="Updation Failed";
		}
		return msg;
	}

	public SubCategory fetchSubCategoryDetails(int subcatid) {
		SubCategory subcategory =new SubCategory();
		subcategory = userDao.selectSubCategory(connection,subcatid);
		return subcategory;
	}

	public String updateSubCategoryDetails(SubCategory subcategory) {
		int updateCount=0;
		String msg=null;
		updateCount=userDao.modifySubCategoryDetails(subcategory,connection);
		if(updateCount>0) {
			msg="Updation Successfully";
		}
		else
		{
			msg="Updation Failed";
		}
		return msg;
	
	}

	public Product fetchProductDetails(int productid) {
		Product product =new Product();
		product = userDao.selectProductDetails(connection,productid);
		return product;
	}

	public String updateProductDetails(Product product) {
		int updateCount=0;
		String msg=null;
		updateCount=userDao.modifyProductDetails(product,connection);
		if(updateCount>0) {
			msg="Updation Successfully";
		}
		else
		{
			msg="Updation Failed";
		}
		return msg;
	}

	public Offer fetchOfferDetails(int offerid) 
	{
		Offer offer = new Offer();
		offer = userDao.selectOfferDetails(connection,offerid);
		return offer;
	}

	public String updateOfferDetails(Offer offer) {
		System.out.println("hy1...");
		int updateCount=0;
		String msg=null;
		updateCount=userDao.modifyOfferDetails(offer,connection);
		if(updateCount>0) {
			msg="Updation Successfully";
		}
		else
		{
			msg="Updation Failed";
		}
		return msg;
	}

	public Product SelectProductDetail(int productid) {
		Product product = new Product();
		product = userDao.fetchProductDetail(connection,productid);
		return product;
	}

	public String modifyPass(String confirmpass, int user_id) {
		String msg=null;
		
		int count=0;
		count=userDao.updatePass(connection,confirmpass,user_id);
		if(count>0) {
			msg="Updation Of Password Successfully";
		}
		else
		{
			msg="Updation Of Password Failed";
		}
		
		return msg;
		
	}

	public String insertIntoWishlist(Wishlist wishlist) {
		String msg=null;
		int insertintowishlist = userDao.saveWishlistDetails(connection , wishlist);
		if(insertintowishlist>0) {
			msg="Insertion Is Successfully";
		}
		else
		{
			msg="Insertion Is Failed";
		}
		return msg;
	}

	public String deleteIntoWishlist(Wishlist wishlist) {
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeIntoWishlist(wishlist,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;
	}

	public List<Wishlist> fetchWishlistDetails(int i) {
		return userDao.selectWishlistDetails(connection,i);
	}

	public User getUserDetails(int user_id) {
		User user =new User();
		user= userDao.selectUserDetails(connection,user_id);
		return user;
	}

	public String insertFeedbackDetails(FeedBack feedBack) {
		String msg=null;
		int insertintofeedback = userDao.saveFeedBackDetails(connection , feedBack);
		if(insertintofeedback>0) {
			msg="Insertion Is Successfully";
		}
		else
		{
			msg="Insertion Is Failed";
		}
		return msg;
	}

	public List<FeedBack> fetchfeedbackdetails() {
		// TODO Auto-generated method stub
		return userDao.selectFeedbackDetails(connection);
	}

	public FeedBack getfeedbackland(int feedbackid) {
		FeedBack feedBack =new FeedBack();
		feedBack = userDao.selectfeedbackDetails(connection,feedbackid);
		return feedBack;
	}

	public String deleteFromFeedback(int feedbackid) {
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeIntoFeedback(feedbackid,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;
	}

	public List<Product> selectProductDetail(int id) {
		
		return  userDao.fetchProduct(connection,id);
		
	}

	public User getDesigner(int designerid) {
		User user =new User();
		user = userDao.fetchDesigner(connection,designerid);
		return user;
	}

	public String deleteFromWishlist(int productcid, int user_id) {
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeIntoWishlist(productcid,user_id,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;
	}

	public String insertIntoCart(Cart cart) {
		String msg=null;
		int insertintocart = userDao.saveCartDetails(connection , cart);
		if(insertintocart>0) {
			msg="Insertion Is Successfully";
		}
		else
		{
			msg="Insertion Is Failed";
		}
		return msg;
	}

	public List<Cart> fetchCartDetails(int user_id) {
		return userDao.selectCartDetails(connection,user_id);
	}

	public String deleteFromCart(int productid, int user_id) {
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeIntoCart(productid,user_id,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;
	}

	public int insertBookingDetails(Booking booking) {
		String msg=null;
		int insertintobooking = userDao.saveBookingDetails(connection , booking);
		if(insertintobooking>0) 
		{
			msg="Insertion Is Successfully";
			
		}
		else
		{
			msg="Insertion Is Failed";
		}
		return insertintobooking;
	}

	public String insertBookingInfo(BookingInfo bookingInfo) {
		String msg=null;
		int insertintobookinginfo = userDao.saveBookingInfoDetails(connection , bookingInfo);
		if(insertintobookinginfo>0) 
		{
			msg="Insertion Is Successfully";
			ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
	        emailExecutor.execute(new Runnable() {
	            @Override
	            public void run() {
	                try {
	                	Main main=new Main();
	        			main.sendFromGMail("beautyquotient4@gmail.com", "vvoiqwaxlmewvzvk", new String[] {bookingInfo.getBookingemail()}, "Booking Successfull", "Your Booking For Beauty Quotient artist Is Successfull...Artist Will Contact You..Thank You For Using Beauty Quotient...Have A Good Day!!");
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
			msg="Insertion Is Failed";
		}
		return msg;
	}

	public String insertInCart(Cart cart) {
		String msg=null;
		int insertintocart = userDao.saveInCart(connection , cart);
		if(insertintocart>0) {
			msg="Insertion Is Successfully";
		}
		else
		{
			msg="Insertion Is Failed";
		}
		return msg;
	}

	public String deleteInCart(Cart cart) {
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeInCart(cart,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;
	
	}

	public List<FeedBack> fatchProductFeedbacks(int productId) {
		return userDao.selectProductFeedbacks(connection,productId);
	}

	public List<Booking> selectBookingDetails() {
		return userDao.fetchBookingDetails(connection);
	}

	public List<BookingInfo> selectBookingInfoDetails() {
		return userDao.fetchBookingInfoDetails(connection);
	}

	public List<roomdesign> fetchroomdesigndetails() {
		return userDao.selectroomdesigndetails(connection);
	}
	
	public List<BookingInfo> selectPreviousBookingInfo() {
		return userDao.fetchPreviousBookingInfoDetails(connection);
	}

	public int insertOrderDetails(Order order) {
		String msg=null;
		int insertinorder = userDao.saveOrderDetails(connection , order);
		if(insertinorder>0) 
		{
			msg="Insertion Is Successfully";
		}
		else
		{
			msg="Insertion Is Failed";
		}
		return insertinorder;
	}
	
	public int updatePaymentStatus(int bookid) {
		int updateCount=0;
		String msg=null;
		updateCount=userDao.modifyBookingPaymentStatus(bookid,connection);
		if(updateCount>0) {
			msg="Updation Successfully";
		}
		else
		{
			msg="Updation Failed";
		}
		return updateCount;
	}

	public String insertOrderInformation(OrderDetails orderDetails) {
		String msg=null;
		int insertIntoOrderInformation = userDao.saveOrderInformation(connection , orderDetails);
		if(insertIntoOrderInformation>0) {
			msg="Insertion Is Successfully";
		}
		else
		{
			msg="Insertion Is Failed";
		}
		return msg;
	}

	public List<Order> selectOrderTableDetails() {
		return userDao.fetchOrderTableDetails(connection);
	}

	public List<OrderDetails> selectOrderDetails() {
		return userDao.fetchOrderDetails(connection);
	}
	
	public int updateOrderPaymentStatus(int bookid)
	{
		int updateOrderCount=0;
		String msg=null;
		updateOrderCount=userDao.modifyOrderPaymentStatus(bookid,connection);
		if(updateOrderCount>0) {
			msg="Updation Successfully";
		}
		else
		{
			msg="Updation Failed";
		}
		return updateOrderCount;
	}
	
	public int deleteUserCart(int userid)
	{
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.removeUserCart(userid,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return deleteCount;
	}

	public List<OrderDetails> getProductAndQuantity(int bookid) {
		
		return userDao.fetchProductAndQuantity(connection,bookid);
	}

	public int updateQuantityInProduct(int productid, int quantity) {
		int updateQuantityCount=0;
		String msg=null;
		updateQuantityCount=userDao.modifyQuantityInProduct(productid,quantity,connection);
		if(updateQuantityCount>0) {
			msg="Updation Successfully";
		}
		else
		{
			msg="Updation Failed";
		}
		return updateQuantityCount;
	}

	public List<Product> selectProductDetail(int subcatid, int minprice, int maxprice) {
		return userDao.fetchFilterProduct(connection,subcatid,minprice,maxprice);
	}

	public String removechildsubcategory(int categoryId) {
		int deleteCount=0;
		String msg=null;
		deleteCount=userDao.deletechildsubcategoryDetails(categoryId,connection);
		if(deleteCount>0) {
			msg="Deletion Successfully";
		}
		else
		{
			msg="Deletion Failed";
		}
		return msg;

	}

}

		

