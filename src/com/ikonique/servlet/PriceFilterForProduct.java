package com.ikonique.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.bean.Product;
import com.ikonique.bean.SubCategory;
import com.ikonique.userService.impl.userServiceImpl;

/**
 * Servlet implementation class PriceFilterForProduct
 */
public class PriceFilterForProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us=new userServiceImpl();    /**
     * @see HttpServlet#HttpServlet()
     */
    public PriceFilterForProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subcategoryid=request.getParameter("subcatid");
		
		String[] arr = subcategoryid.split("-");
		int subcatid=Integer.parseInt(arr[0]);
		int minprice=Integer.parseInt(arr[1]);
		int maxprice=Integer.parseInt(arr[2]);
		String subcategoryname="";
		
		List<SubCategory> subcategoryList = us.fetchsubcategorydetails();
		for(SubCategory subcategory:subcategoryList) {
			if(subcategory.getSub_category_id()==subcatid) {
				subcategoryname=subcategory.getSub_category_name();
			}
		}
		List<Product> productlist=us.selectProductDetail(subcatid,minprice,maxprice);
		request.setAttribute("productlist", productlist);
		request.setAttribute("subcatid", subcatid);
		request.setAttribute("subcategoryname", subcategoryname);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("commonproduct.jsp");
		dispatcher.forward(request, response);
		 
		
		//List<Product> productlist=us.getFilterProducts(subcategoryid);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
