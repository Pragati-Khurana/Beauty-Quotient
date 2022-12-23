package com.ikonique.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ikonique.bean.Category;
import com.ikonique.bean.Offer;
import com.ikonique.bean.Product;
import com.ikonique.bean.SubCategory;
import com.ikonique.bean.User;
import com.ikonique.userService.userService;
import com.ikonique.userService.impl.userServiceImpl;
import com.ikonique.util.Main;

/**
 * Servlet implementation class InsertCategoryDetails
 */
public class InsertProductsDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl serviceimpl = new userServiceImpl(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductsDetails() {
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
		System.out.println("kjbhbew");
		String name = request.getParameter("exampleRadios1");
		String message = null;
		System.out.println(name);
		if(name.equalsIgnoreCase("category"))
		{
			String categoryname = request.getParameter("cname");
			Category category = new Category();
			category.setCategory_name(categoryname);
			message = serviceimpl.insertCategoryDetails(category);
			
			if(message!=null)
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("categoryTable.jsp");
				requestdispatcher.forward(request, response);
			}
			else
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("insertproduct.jsp");
				requestdispatcher.forward(request, response);
			}
		}
		else if(name.equalsIgnoreCase("subcategory"))
		{
			String subcategoryname = request.getParameter("scname");
			String categoryname = request.getParameter("category");
			int categoryid = Integer.parseInt(categoryname);
			SubCategory subcategory = new SubCategory();
			subcategory.setSub_category_name(subcategoryname);
			subcategory.setCategory_id(categoryid);
			
			message = serviceimpl.insertSubCategoryDetails(subcategory);
			
			if(message!=null)
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("subcategoryTable.jsp");
				requestdispatcher.forward(request, response);
			}
			else
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("insertproduct.jsp");
				requestdispatcher.forward(request, response);
			}
		}
		else if(name.equalsIgnoreCase("offer"))
		{
			String offername = request.getParameter("offername");
			String discount = request.getParameter("offerdiscount");
			double discountoffer = Double.parseDouble(discount); 
			Offer offer = new Offer();
			offer.setOffername(offername);
			offer.setDiscount(discountoffer);
			
			message = serviceimpl.insertOfferDetails(offer);
			 
			
			if(message!=null)
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("offertable.jsp");
				requestdispatcher.forward(request, response);
			}
			else
			{
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("insertproduct.jsp");
				requestdispatcher.forward(request, response);
			}
		}
		else
		{
				System.out.println("arjun");
				String togglevalue = request.getParameter("togglevalue");
				System.out.println("togal value:-"+togglevalue);
				String productname=request.getParameter("pname");
				String productprice=request.getParameter("pprice");
				String productqty=request.getParameter("pquentity");
				String productweight=request.getParameter("pweight");
				String ownername=request.getParameter("ownername");
				int ownerid = Integer.parseInt(ownername);
				String offername=request.getParameter("offer");
				int offerid = Integer.parseInt(offername);
				String produtdesc=request.getParameter("pdescription");
				String productcategory=request.getParameter("category");
				int categoryid = Integer.parseInt(productcategory);
				String productsubcategory=request.getParameter("subcategory");
				int subcategoryid = Integer.parseInt(productsubcategory);
				String photo=request.getParameter("photo");
				Part part = request.getPart("photo");
				InputStream is=null;
				if(null!=part)
				{
					//System.out.println(part.getSubmittedFileName());
					is = part.getInputStream();
				}
				else
				{
					System.out.println("null image");
				}
				
// 				System.out.println(productname+""+productprice+""+productqty+""+productweight+""+ownerid+""+offerid+""+produtdesc+""+categoryid+""+subcategoryid+""+part.getSubmittedFileName());
				Product product=new Product();
				product.setProduct_name(productname);
				product.setProduct_price(productprice);
				product.setProduct_quantity(productqty);
				product.setProduct_weight(productweight);
				product.setProduct_desc(produtdesc);
				product.setCategory_id(categoryid);
				product.setSubcategory_id(subcategoryid);
				product.setProductpicStream(is);
				product.setProduct_owner_id(ownerid);
				product.setOfferid(offerid);
				product.setProductpicString(Base64.getEncoder().encodeToString(Main.getBytesFromInputStream(part.getInputStream())));
				message=serviceimpl.insertProductDetails(product);
				
				if(message!=null)
				{
					if(togglevalue.equals("true"))
					{
						System.out.println("toggle condition called...");
						
						List<User> userList = serviceimpl.fetchuserdetails();
						
						for(User user: userList) {
							
							if(user.getStatus()==1) {
								StringBuilder builder = new StringBuilder();
								builder.append("Product Name Is :- "+productname);
								builder.append("\n");
								builder.append("Product Price Is :-"+productprice);
								builder.append("\n");
								builder.append("About Product :-"+produtdesc);
								
								ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
						        emailExecutor.execute(new Runnable() {
						            @Override
						            public void run() {
						                try {
						                	Main main=new Main();
						                	main.sendFromGMail("beautyquotient4@gmail.com", "vvoiqwaxlmewvzvk", new String[] {user.getEmail()}, "Notification For New Arrival Product",builder.toString());
						                } catch (Exception e) {
//						                    logger.error("failed", e);
						                	e.printStackTrace();
						                }
						            }
						        });
						        emailExecutor.shutdown(); 
							}
						}
						
						RequestDispatcher requestdispatcher = request.getRequestDispatcher("productTable.jsp");
						requestdispatcher.forward(request, response);
					}
					else
					{
						RequestDispatcher requestdispatcher = request.getRequestDispatcher("productTable.jsp");
						requestdispatcher.forward(request, response);
					}
					
				}
				else
				{
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("insertproduct.jsp");
					requestdispatcher.forward(request, response);
				}
		}	
	}
}


