package com.ikonique.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ikonique.bean.Area;
import com.ikonique.bean.Category;
import com.ikonique.bean.Offer;
import com.ikonique.bean.Order;
import com.ikonique.bean.OrderDetails;
import com.ikonique.bean.Product;
import com.ikonique.bean.SubCategory;
import com.ikonique.bean.User;
import com.ikonique.userService.impl.userServiceImpl;
//for pie chart
import com.itextpdf.awt.DefaultFontMapper;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
/*import org.jfree.data.general.DefaultPieDataset;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;*/
import java.awt.Color;

/**
 * Servlet implementation class GenerateReportForAdmin
 */
public class GenerateReportForAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userServiceImpl us = new userServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GenerateReportForAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Category> categoryList = us.fetchcategorydetails();
		List<SubCategory> subcategoryList = us.fetchsubcategorydetails();
		List<Product> productList = us.fetchproductdetails();
		List<User> designerList = us.fetchdesignerdetails();
		List<Offer> offerList = us.SelectOfferDetails();
		List<User> userList = us.fetchuserdetails();
		List<Area> area = us.fatcharea();
		List<Order> orderList = new ArrayList<>();
		orderList = us.selectOrderTableDetails();
		List<OrderDetails> orderdetailsList = (List) request.getAttribute("orderdetailsList");
		double earnings = 0, totalearning = 0;
		for (Order order : orderList) {
			if (order.getPaymentstatus().equalsIgnoreCase("success")) {
				earnings = earnings + order.getAmount();
			}
		}
		totalearning = Math.ceil(earnings);
		try {
			System.out.println("Hii");
			String filename = "E:\\IkoniqueReport.pdf"; 
			Document document = new Document();
//			response.setContentType("APPLICATION/OCTET-STREAM");
//			response.setHeader("Content-Disposition", "attachment; filename=\""+filename+"\"");
			// Simple Para....
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filename));
			document.open();
			Date date = new Date();
			java.sql.Date sqldate = new java.sql.Date(date.getTime());
			Paragraph paragraph = new Paragraph(
					"The Ikonique Interiors                                                                                         Date: "
							+ sqldate);
			document.add(paragraph);
			document.add(new Paragraph(" "));
			document.add(new Paragraph("Total Earnings Till Today:" + totalearning + " Rs."));
			document.add(new Paragraph(" "));
			document.add(new Paragraph(
					"Here Is The Detailed Report About The Information Of Customer,Product Stock,Earnings,And Interior Designer  "));
			document.add(new Paragraph(" "));
			document.add(new Paragraph(" "));
			document.add(
					new Paragraph("                                                            Category Information"));
			document.add(new Paragraph(" "));
			// category
			PdfPTable table = new PdfPTable(2);
			PdfPCell c1 = new PdfPCell(new Phrase("Category Name"));
			table.addCell(c1);
			c1 = new PdfPCell(new Phrase("Status"));
			table.addCell(c1);
			for (Category category : categoryList) {
				table.addCell(category.getCategory_name());
				if (category.getStatus() == 1) {
					table.addCell("Active");
				} else {
					table.addCell("InActive");
				}
			}

			document.add(table);
			document.add(new Paragraph(" "));
			document.add(new Paragraph(
					"                                                            Sub-Category Information"));
			document.add(new Paragraph(" "));
			// subcategory
			PdfPTable table1 = new PdfPTable(3);
			PdfPCell c2 = new PdfPCell(new Phrase("Sub-Category Name"));
			table1.addCell(c2);
			c2 = new PdfPCell(new Phrase("Category Name"));
			table1.addCell(c2);
			c2 = new PdfPCell(new Phrase("Status"));
			table1.addCell(c2);
			for (SubCategory subcategory : subcategoryList) {
				table1.addCell(subcategory.getSub_category_name());
				for (Category category : categoryList) {
					if (category.getCategory_id() == subcategory.getCategory_id()) {
						table1.addCell(category.getCategory_name());
					}
					/*
					 * else { table1.addCell("-"); }
					 */
				}
				if (subcategory.getStatus() == 1) {
					table1.addCell("Active");
				} else {
					table1.addCell("InActive");
				}
			}

			document.add(table1);
			document.add(new Paragraph(" "));
			document.add(new Paragraph(
					"                                                                 Product Information"));
			document.add(new Paragraph(" "));
			// product

			PdfPTable table2 = new PdfPTable(9);
			PdfPCell c3 = new PdfPCell(new Phrase("Product Name"));
			table2.addCell(c3);
			c3 = new PdfPCell(new Phrase("Product Price"));
			table2.addCell(c3);
			c3 = new PdfPCell(new Phrase("Quantity"));
			table2.addCell(c3);
			c3 = new PdfPCell(new Phrase("Weight"));
			table2.addCell(c3);
			c3 = new PdfPCell(new Phrase("Owner Name"));
			table2.addCell(c3);
			c3 = new PdfPCell(new Phrase("Offer"));
			table2.addCell(c3);
			c3 = new PdfPCell(new Phrase("Category Name"));
			table2.addCell(c3);
			c3 = new PdfPCell(new Phrase("Subcategory Name"));
			table2.addCell(c3);
			c3 = new PdfPCell(new Phrase("Status"));
			table2.addCell(c3);
			for (Product product : productList) {
				table2.addCell(product.getProduct_name());
				table2.addCell(product.getProduct_price());
				table2.addCell(product.getProduct_quantity());
				table2.addCell(product.getProduct_weight());
				String Owner = "By Ikonique";

				for (User user : designerList) {
					if (user.getUser_id() == product.getProduct_owner_id()) {
						Owner = user.getFirstname() + " " + user.getLastname();

					}
				}
				table2.addCell(Owner);
				String Offer = "No Offer";
				for (Offer offer : offerList) {
					if (offer.getOfferid() == product.getOfferid()) {
						Offer = offer.getOffername();

					}
				}
				table2.addCell(Offer);
				for (Category category : categoryList) {
					if (category.getCategory_id() == product.getCategory_id()) {
						table2.addCell(category.getCategory_name());
					}
				}
				for (SubCategory subCategory : subcategoryList) {
					if (subCategory.getSub_category_id() == product.getSubcategory_id()) {
						table2.addCell(subCategory.getSub_category_name());
					}
				}
				if (product.getStatus() == 1) {
					table2.addCell("Active");
				} else {
					table2.addCell("InActive");
				}
			}

			document.add(table2);
			document.add(new Paragraph(" "));
			document.add(
					new Paragraph("                                                            Customer Information"));
			document.add(new Paragraph(" "));
			// Customer Information
			PdfPTable table3 = new PdfPTable(7);
			PdfPCell c4 = new PdfPCell(new Phrase("Customer Name"));
			table3.addCell(c4);
			c4 = new PdfPCell(new Phrase("Address"));
			table3.addCell(c4);
			;
			c4 = new PdfPCell(new Phrase("MobileNo"));
			table3.addCell(c4);
			c4 = new PdfPCell(new Phrase("Email-Id"));
			table3.addCell(c4);
			c4 = new PdfPCell(new Phrase("Gender"));
			table3.addCell(c4);
			c4 = new PdfPCell(new Phrase("Area"));
			table3.addCell(c4);
			c4 = new PdfPCell(new Phrase("Status"));
			table3.addCell(c4);

			for (User user : userList) {
				table3.addCell(user.getFirstname() + " " + user.getLastname());
				table3.addCell(user.getAddress());
				table3.addCell(user.getMobileno());
				table3.addCell(user.getEmail());
				table3.addCell(user.getGender());
				for (Area a1 : area) {
					if (a1.getArea_id() == user.getArea_id()) {
						table3.addCell(user.getGender());
					}
				}
				if (user.getStatus() == 1) {
					table3.addCell("Active");
				} else {
					table3.addCell("InActive");
				}

			}
			document.add(table3);

			// Designer Information

			document.add(new Paragraph(" "));
			document.add(
					new Paragraph("                                                            Designer Information"));
			document.add(new Paragraph(" "));

			PdfPTable table4 = new PdfPTable(8);
			PdfPCell c5 = new PdfPCell(new Phrase("Designer Name"));
			table4.addCell(c5);
			c5 = new PdfPCell(new Phrase("Address"));
			table4.addCell(c5);
			c5 = new PdfPCell(new Phrase("Mobile-No"));
			table4.addCell(c5);
			c5 = new PdfPCell(new Phrase("Email-ID"));
			table4.addCell(c5);
			c5 = new PdfPCell(new Phrase("Gender"));
			table4.addCell(c5);
			c5 = new PdfPCell(new Phrase("Area"));
			table4.addCell(c5);
			c5 = new PdfPCell(new Phrase("Visiting Fees"));
			table4.addCell(c5);
			c5 = new PdfPCell(new Phrase("Status"));
			table4.addCell(c5);

			for (User user : designerList) {
				table4.addCell(user.getFirstname() + " " + user.getLastname());
				table4.addCell(user.getAddress());
				table4.addCell(user.getMobileno());
				table4.addCell(user.getEmail());
				table4.addCell(user.getGender());
				for (Area a1 : area) {
					if (a1.getArea_id() == user.getArea_id()) {
						table4.addCell(user.getGender());
					}
				}
				table4.addCell(user.getVisitingfees());
				if (user.getStatus() == 1) {
					table4.addCell("Active");
				} else {
					table4.addCell("InActive");
				}

			}
			document.add(table4);

			document.add(new Paragraph(" "));
			document.add(new Paragraph(" "));
			document.add(new Paragraph(" "));

			/*
			 * Create Pie Chart DefaultPieDataset myColoredPieChart = new
			 * DefaultPieDataset(); for(Order order:orderList) { for(OrderDetails
			 * od:orderdetailsList) { if(od.getOrderid()==order.getOrderid()) { for(Product
			 * product:productList) { if(product.getProduct_id()==od.getProductid()) {
			 * myColoredPieChart.setValue(product.getProduct_name(), order.getAmount()); } }
			 * } } } JFreeChart myColoredChart=ChartFactory.
			 * createPieChart("PieChart For Earning From Product",myColoredPieChart,true,
			 * true,false); Color Pie Chart PiePlot ColorConfigurator =
			 * (PiePlot)myColoredChart.getPlot(); for(Order order:orderList) {
			 * for(OrderDetails od:orderdetailsList) {
			 * if(od.getOrderid()==order.getOrderid()) { for(Product product:productList) {
			 * if(product.getProduct_id()==od.getProductid()) {
			 * ColorConfigurator.setSectionPaint(product.getProduct_name(), new Color(160,
			 * 160, 255)); ColorConfigurator.setSectionPaint("C++", Color.ORANGE); } } } } }
			 * 
			 * We have to insert this colored Pie Chart into the PDF file using iText now
			 * int width=640; Width of our chart int height=480; Height of our chart
			 * 
			 * Document PieChart=new Document(new Rectangle(width,height)); PdfWriter
			 * writer=PdfWriter.getInstance(PieChart,new
			 * FileOutputStream("E:\\My_Colored_Pie_Chart.pdf")); PieChart.open();
			 * 
			 * Add some Metadata to identify document later
			 * 
			 * PieChart.
			 * addTitle("How to color your Pie Chart and embed in a PDF file using iText");
			 * PieChart.addAuthor("Thinktibits");
			 * PieChart.addKeywords("iText,Color PieChart,JFreeChart,PDF,Example Tutorial");
			 * 
			 * PdfContentByte Add_Chart_Content= writer.getDirectContent(); PdfTemplate
			 * template_Chart_Holder=Add_Chart_Content.createTemplate(width,height);
			 * Graphics2D
			 * Graphics_Chart=template_Chart_Holder.createGraphics(width,height,new
			 * DefaultFontMapper()); Rectangle2D Chart_Region=new
			 * Rectangle2D.Double(0,0,540,380);
			 * myColoredChart.draw(Graphics_Chart,Chart_Region); Graphics_Chart.dispose();
			 * Add_Chart_Content.addTemplate(template_Chart_Holder,0,0); //
			 * PieChart.close();
			 */ document.close();

			System.out.println("File is generated");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
