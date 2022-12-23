package com.ikonique.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ikonique.bean.Offer;
import com.ikonique.bean.Order;
import com.ikonique.bean.OrderDetails;
import com.ikonique.bean.Product;
import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;
import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


/**
 * Servlet implementation class GenerateOrderInvoice
 */
public class GenerateOrderInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       userServiceImpl us=new userServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateOrderInvoice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderid=Integer.parseInt(request.getParameter("orderid"));
		System.out.println("OrderId_"+orderid);
		
		/*HttpSession httpSession1 = request.getSession(false);
		User user1 = null;
		if (null != httpSession1) {
			user1 = (User) httpSession1.getAttribute("loginBean");
		}*/
		
		List<Order> orderList=new ArrayList<>();
		orderList=us.selectOrderTableDetails();
		
		List<OrderDetails> orderdetailsList=new ArrayList<>();
		orderdetailsList=us.selectOrderDetails();
		
		List<Product> productList = us.fetchproductdetails();
		
		List<Offer> offerList = us.SelectOfferDetails();
		
		
		
		try {
			String filename = "E:\\invoice.pdf";
			Document document = new Document();
			 
			// Simple Para.... 
				PdfWriter.getInstance(document, new FileOutputStream(filename));
				document.open();
				
				Paragraph paragraph = new Paragraph("The Ikonique Interiors");
				document.add(paragraph);
				document.add(new Paragraph(" "));
				for(Order order:orderList) {
					if(order.getOrderid()==orderid) {
						document.add(new Paragraph("Hello, "+order.getFirstname()+" "+order.getLastname()));
					}
				}
				document.add(new Paragraph(" "));
				document.add(new Paragraph("Shipping Address: "));
				for(Order order:orderList) {
					if(order.getOrderid()==orderid) {
						document.add(new Paragraph(order.getAddress()));
					}
				}
				document.add(new Paragraph(" "));
				//document.add(Image.getInstance("TheIkoniqueInteriors/WebContent/images/icon/logo1.png"));
				
				// for space
				
				document.add(new Paragraph("Your OrderId Is:= "+" "+"OID_"+orderid));
				document.add(new Paragraph(" "));
				document.add(new Paragraph(" "));
				document.add(new Paragraph("Your Invoice "));
				document.add(new Paragraph(" "));
						
			// add table...
				
				PdfPTable table = new PdfPTable(8);
				/*
				 * PdfPCell c1 = new PdfPCell(); table.addCell(c1);
				 */
				
				PdfPCell c1 = new PdfPCell(new Phrase("Date"));
				table.addCell(c1);
				c1 = new PdfPCell(new Phrase("Product Name"));
				table.addCell(c1);
				c1 = new PdfPCell(new Phrase("Product Price Rs."));
				table.addCell(c1);
				c1 = new PdfPCell(new Phrase("Discount %"));
				table.addCell(c1);
				c1 = new PdfPCell(new Phrase("Quantity"));
				table.addCell(c1);
				c1 = new PdfPCell(new Phrase("Total Discount Rs."));
				table.addCell(c1);
				c1 = new PdfPCell(new Phrase("Total Price Rs."));
				table.addCell(c1);
				c1 = new PdfPCell(new Phrase("NET PRICE Rs."));
				table.addCell(c1);
				table.setHeaderRows(1);
				
				double totaldiscount=0,totaldis=0,discount=0,gt=0;
				for(Order order:orderList) {
					if(order.getOrderid()==orderid) {
						for(OrderDetails orderdetails:orderdetailsList) {
							if(orderdetails.getOrderid()==orderid) {
								for(Product product:productList) {
									if(product.getProduct_id()==orderdetails.getProductid()){
										System.out.println("ProductName:="+product.getProduct_name());
										System.out.println("ProductPrice:="+product.getProduct_price());
										System.out.println("ProductQuantity:="+orderdetails.getQuantity());
										System.out.println("GrandTotal:="+order.getAmount());
										
										table.addCell(String.valueOf(order.getOrderdate()));
										table.addCell(product.getProduct_name());
										table.addCell(product.getProduct_price());
										
										 for(Offer offer:offerList) { 
											 if(offer.getOfferid()==product.getOfferid()) {
												 table.addCell((Double.toString(offer.getDiscount()))+"%");
												 discount=offer.getDiscount();
											 }
											 else
											 {
												 table.addCell("-"); 
												 discount=0;
											 }
										 }
										 
										
										table.addCell(String.valueOf(orderdetails.getQuantity()));
										 totaldiscount=((Double.parseDouble(product.getProduct_price())) *discount)/100;
										 totaldis=(Math.ceil(totaldiscount))*orderdetails.getQuantity();
										table.addCell(Double.toString(totaldis));
										double total=orderdetails.getQuantity() *(Double.parseDouble( product.getProduct_price()));
										table.addCell(Double.toString(total));
										table.addCell(Double.toString(total-totaldis));
										gt=gt+(total-totaldis);
										
									}
								}	
									
							}
						}
						
						break;
					}
				}
				for(int i=1;i<=1;i++) {
					table.addCell("Total");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell(Double.toString(gt));
				}
				
				for(int i=1;i<=1;i++) {
					table.addCell("Tax(18%)");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell(Double.toString((gt*18)/100));
				}
				double ans=(gt*18)/100;
				double ans1=ans+gt;
				// Final Amount..
				for(int i=1;i<=1;i++) {
					table.addCell("Final Amount");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell("-");
					table.addCell((Double.toString(ans1)));
				}
				
				
				document.add(table);
				document.add(new Paragraph(" "));
				document.add(new Paragraph("Thanks For Shopping:) "));
				//add image
				//document.add(Image.getInstance("E:\\MEET DOC\\PIC-2.jpg"));
				
				document.close();
				System.out.println("File is generated");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("myorder.jsp");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println(e);
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
