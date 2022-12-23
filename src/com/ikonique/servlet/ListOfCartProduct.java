package com.ikonique.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ikonique.bean.Product;

/**
 * Servlet implementation class ListOfCartProduct
 */
public class ListOfCartProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListOfCartProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Product> productList = new ArrayList<>();
		int maximumid = Integer.parseInt(request.getParameter("maximumid"));
		System.out.println(maximumid);
		for(int i=1;i<=maximumid; i++)
		{
			if(request.getParameter("product"+i) != null)
			{
				Product product = new Product();
				int productid = Integer.parseInt(request.getParameter("product"+i));
				System.out.println("product id:-"+productid);
				
				product.setProduct_id(productid);
				product.setProduct_quantity(request.getParameter("quantity"+i));
				productList.add(product);
			}
		}
		request.setAttribute("productList", productList);
		RequestDispatcher requestDispatcher =  request.getRequestDispatcher("detailfillup.jsp");
		requestDispatcher.forward(request, response);
		//Gson gson = new Gson();
		//gson.toJson(productList);
		//request.setAttribute("productjson", gson.toJson(productList));
	}
}
