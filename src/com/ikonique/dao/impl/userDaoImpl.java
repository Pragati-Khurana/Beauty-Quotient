package com.ikonique.dao.impl;

import java.sql.DriverManager;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

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

public class userDaoImpl implements userDao {

	@Override
	public int insertUserDetails(User user, Connection connection) {
		int i = 0, insertedUserId = 0;
		String insertQuery = "insert into user (c_first_name,c_last_name,c_address,c_contact_no,c_email,c_password,c_gender,i_role_id,i_area_id) values (?,?,?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,
				Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setString(1, user.getFirstname());
			preparedStatement.setString(2, user.getLastname());
			preparedStatement.setString(3, user.getAddress());
			preparedStatement.setString(4, user.getMobileno());
			preparedStatement.setString(5, user.getEmail());
			preparedStatement.setString(6, user.getPassword());
			preparedStatement.setString(7, user.getGender());

			/* preparedStatement.setString(8, user.getVisitingfees()); */
			preparedStatement.setInt(8, 1);
			preparedStatement.setInt(9, user.getArea_id());

			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) {
				insertedUserId = resultSet.getInt(1);
			}
			System.out.println(insertedUserId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}

		return insertedUserId;

	}

	@Override
	public int insertDesignerDetails(User user, Connection connection) {

		int i = 0, insertedUserId = 0;
		String insertQuery = "insert into user (c_first_name,c_last_name,c_address,c_contact_no,c_email,c_password,c_gender,i_role_id,i_visiting_fess,c_about_description,c_designation,i_area_id) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,
				Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setString(1, user.getFirstname());
			preparedStatement.setString(2, user.getLastname());
			preparedStatement.setString(3, user.getAddress());
			preparedStatement.setString(4, user.getMobileno());
			preparedStatement.setString(5, user.getEmail());
			preparedStatement.setString(6, user.getPassword());
			preparedStatement.setString(7, user.getGender());
			preparedStatement.setInt(8, 2);
			preparedStatement.setString(9, user.getVisitingfees());
			preparedStatement.setString(10, user.getAboutme());
			preparedStatement.setString(11, user.getDesignation());
			preparedStatement.setInt(12, user.getArea_id());

			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) {
				insertedUserId = resultSet.getInt(1);
			}
			System.out.println(insertedUserId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return insertedUserId;

	}

	@Override
	public List<Area> selectArea(Connection connection) {
		String selectQuery = "select * from area";
		List<Area> Area = new ArrayList<>();
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Area area = new Area();
				area.setArea_id(resultSet.getInt("i_area_id"));
				area.setArea_name(resultSet.getString("c_area_name"));
				area.setPincodde(resultSet.getInt("i_area_pincode"));
				Area.add(area);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Area;

	}

	@Override
	public User selectUserDetails(String email, String password, Connection connection) {
		User user = null;

		String selectQuery = "select * from user where c_email=? and c_password=? and i_status=?";

		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			preparedStatement.setInt(3, 1);
			//preparedStatement.setInt(4, 1);
			try (ResultSet resultSet = preparedStatement.executeQuery();) {

				while (resultSet.next()) {
					System.out.println(resultSet.getInt("i_user_id"));
					user = new User();

					
					  byte[] imageData = resultSet.getBytes("b_image"); String imageString=null;
					  
					  if(null!=imageData && imageData.length>0) { imageString =
					  Base64.getEncoder().encodeToString(imageData);
					  System.out.println("Length::"+imageData.length);
					  user.setUserProfilepicString(imageString);
					  //System.out.println(imageString); 
					  }
					  
					  
				else { System.out.println("balnk.............."); }
					  
					user.setRole_id(resultSet.getInt("i_role_id"));
					user.setUser_id(resultSet.getInt("i_user_id"));
					user.setFirstname(resultSet.getString("c_first_name"));
					user.setLastname(resultSet.getString("c_last_name"));
					user.setPassword(resultSet.getString("c_password"));
					user.setAddress(resultSet.getString("c_address"));
					user.setAboutme(resultSet.getString("c_about_description"));
					user.setDesignation(resultSet.getString("c_designation"));
					user.setVisitingfees(resultSet.getString("i_visiting_fess"));
					user.setMobileno(resultSet.getString("c_contact_no"));
					user.setEmail(resultSet.getString("c_email"));
					user.setArea_id(resultSet.getInt("i_area_id"));
					user.setGender(resultSet.getString("c_gender"));

				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public String fetchAreaName(int id, Connection connection) {

		String selectQuery = "select c_area_name from area where i_area_id=?";

		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, id);

			try (ResultSet resultSet = preparedStatement.executeQuery();) {

				while (resultSet.next()) {
					String name = resultSet.getString("c_area_name");
					return name;

				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public int modifyUserDetails(User user, Connection connection) {
		
		if(user.getRole_id()==2) {
			
			String updateQuery = "update user set c_first_name=?,c_last_name=?,c_address=?,c_contact_no=?,c_email=?,c_gender=?,i_area_id=?,c_about_description=?,i_visiting_fess=?,c_designation=?, b_image=? where i_user_id=?";
			String updateQuery2 = "update user set c_first_name=?,c_last_name=?,c_address=?,c_contact_no=?,c_email=?,c_gender=?,i_area_id=?,c_about_description=?,i_visiting_fess=?,c_designation=? where i_user_id=?";
			if(user.getUserProfilepicStream()!=null)
			{
				try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
					preparedStatement.setString(1, user.getFirstname());
					preparedStatement.setString(2, user.getLastname());
					preparedStatement.setString(3, user.getAddress());
					preparedStatement.setString(4, user.getMobileno());
					preparedStatement.setString(5, user.getEmail());
					preparedStatement.setString(6, user.getGender());
					preparedStatement.setInt(7, user.getArea_id());
					preparedStatement.setString(8, user.getAboutme());
					preparedStatement.setString(9, user.getVisitingfees());
					preparedStatement.setString(10, user.getDesignation());
					preparedStatement.setBlob(11, user.getUserProfilepicStream());
					preparedStatement.setInt(12, user.getUser_id());

					return preparedStatement.executeUpdate();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery2)) {
					preparedStatement.setString(1, user.getFirstname());
					preparedStatement.setString(2, user.getLastname());
					preparedStatement.setString(3, user.getAddress());
					preparedStatement.setString(4, user.getMobileno());
					preparedStatement.setString(5, user.getEmail());
					preparedStatement.setString(6, user.getGender());
					preparedStatement.setInt(7, user.getArea_id());
					preparedStatement.setString(8, user.getAboutme());
					preparedStatement.setString(9, user.getVisitingfees());
					preparedStatement.setString(10, user.getDesignation());
					preparedStatement.setInt(11, user.getUser_id());

					return preparedStatement.executeUpdate();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			

			return 0;

			
		}else {
		
		String updateQuery = "update user set c_first_name=?,c_last_name=?,c_address=?,c_contact_no=?,c_email=?,c_gender=?,i_area_id=?,b_image=? where i_user_id=?";
		String updateQuery2 = "update user set c_first_name=?,c_last_name=?,c_address=?,c_contact_no=?,c_email=?,c_gender=?,i_area_id=? where i_user_id=?";
		if(user.getUserProfilepicStream()!=null)
		{
			try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
				preparedStatement.setString(1, user.getFirstname());
				preparedStatement.setString(2, user.getLastname());
				preparedStatement.setString(3, user.getAddress());
				preparedStatement.setString(4, user.getMobileno());
				preparedStatement.setString(5, user.getEmail());
				preparedStatement.setString(6, user.getGender());
				preparedStatement.setInt(7, user.getArea_id());
				preparedStatement.setBlob(8, user.getUserProfilepicStream());
				preparedStatement.setInt(9, user.getUser_id());

				return preparedStatement.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery2)) {
				preparedStatement.setString(1, user.getFirstname());
				preparedStatement.setString(2, user.getLastname());
				preparedStatement.setString(3, user.getAddress());
				preparedStatement.setString(4, user.getMobileno());
				preparedStatement.setString(5, user.getEmail());
				preparedStatement.setString(6, user.getGender());
				preparedStatement.setInt(7, user.getArea_id());
				preparedStatement.setInt(8, user.getUser_id());

				return preparedStatement.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

		return 0;
		}
	}

	@Override
	public int removeUserDetails(int user_id, Connection connection) {
		String deleteQuery = "update user set i_status=? where i_user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setInt(2, user_id);

			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public User fetchEmailId(String email, Connection connection) {
		// TODO Auto-generated method stub
		String selectQuery = "select * from user where c_email=?";
		User user = new User();
		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setString(1, email);

			try (ResultSet resultSet = preparedStatement.executeQuery();) {

				while (resultSet.next()) {

					user.setUser_id(resultSet.getInt("i_user_id"));
					user.setFirstname(resultSet.getString("c_first_name"));
					user.setLastname(resultSet.getString("c_last_name"));
					user.setAddress(resultSet.getString("c_address"));
					user.setMobileno(resultSet.getString("c_contact_no"));
					user.setEmail(resultSet.getString("c_email"));
					user.setArea_id(resultSet.getInt("i_area_id"));
					user.setGender(resultSet.getString("c_gender"));

				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;

	}

	@Override
	public int modifyPass(Connection connection, String cpass, int user_id) {

		String updateQuery = "update user set c_password=? where i_user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, cpass);
			preparedStatement.setInt(2, user_id);

			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public List<User> selectDetails(Connection connection) {
		// TODO Auto-generated method stub
		String selectQuery="select * from user where i_role_id=1 ";
		List<User> userList = new ArrayList<User>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery);
				
				ResultSet resultSet=preparedStatement.executeQuery())
		{
			while(resultSet.next())
			{
				Integer id = resultSet.getInt("i_user_id");
				String fname = resultSet.getString("c_first_name");
				String lname = resultSet.getString("c_last_name");
				String address = resultSet.getString("c_address");
				String phoneno = resultSet.getString("c_contact_no");
				String email = resultSet.getString("c_email");
				String password = resultSet.getString("c_password");
				String gender = resultSet.getString("c_gender");
				Integer role = resultSet.getInt("i_role_id");
				Integer areaid = resultSet.getInt("i_area_id");
				Integer status = resultSet.getInt("i_status");
				//String visitingfess = resultSet.getString("i_visiting_fess");
				
				User user = new User();

				byte[] imageData = resultSet.getBytes("b_image"); 
				String imageString=null;
				 if(null!=imageData && imageData.length>0) 
				 { 
					 imageString = Base64.getEncoder().encodeToString(imageData);
					 user.setUserProfilepicString(imageString);
				 }
				user.setUser_id(id);
				user.setFirstname(fname);
				user.setLastname(lname);
				user.setAddress(address);
				user.setMobileno(phoneno);
				user.setEmail(email);
				user.setPassword(password);
				user.setGender(gender);
				user.setArea_id(areaid);
				user.setStatus(status);
				user.setRole_id(role);
				//user.setVisitingfees(visitingfess);	
				userList.add(user);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public List<User> selectDesignerDetails(Connection connection) {
		String selectQuery="select * from user where i_role_id=2";
		List<User> designerList = new ArrayList<User>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery);
				
				ResultSet resultSet=preparedStatement.executeQuery())
		{
			while(resultSet.next())
			{
				Integer id = resultSet.getInt("i_user_id");
				String fname = resultSet.getString("c_first_name");
				String lname = resultSet.getString("c_last_name");
				String address = resultSet.getString("c_address");
				String phoneno = resultSet.getString("c_contact_no");
				String email = resultSet.getString("c_email");
				String password = resultSet.getString("c_password");
				String gender = resultSet.getString("c_gender");
				//Integer role = resultSet.getInt("i_role_id");
				Integer areaid = resultSet.getInt("i_area_id");
				Integer status = resultSet.getInt("i_status");
				String visitingfess = resultSet.getString("i_visiting_fess");
				String designation = resultSet.getString("c_designation");
				String aboutme = resultSet.getString("c_about_description");
				
				User user = new User();
				
				 byte[] imageData = resultSet.getBytes("b_image"); String imageString=null;
				  
				  if(null!=imageData && imageData.length>0) { imageString =
				  Base64.getEncoder().encodeToString(imageData);
				 
				  user.setUserProfilepicString(imageString);}
				   
				
				user.setUser_id(id);
				user.setFirstname(fname);
				user.setLastname(lname);
				user.setAddress(address);
				user.setMobileno(phoneno);
				user.setEmail(email);
				user.setPassword(password);
				user.setGender(gender);
				user.setArea_id(areaid);
				user.setStatus(status);
				user.setVisitingfees(visitingfess);	
				user.setDesignation(designation);	
				user.setAboutme(aboutme);	
				designerList.add(user);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return designerList;

	}

	@Override
	public List<Category> selectCategoryDetails(Connection connection) {
		String selectQuery="select * from category";
		List<Category> categoryList = new ArrayList<Category>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery);
				
				ResultSet resultSet=preparedStatement.executeQuery())
		{
			while(resultSet.next())
			{
				
				Category category = new Category();
				category.setCategory_id(resultSet.getInt("i_category_id"));
				category.setCategory_name(resultSet.getString("c_category_name"));
				category.setStatus(resultSet.getInt("i_status"));
				categoryList.add(category);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return categoryList;

	}

	@Override
	public List<SubCategory> selectSubCategoryDetails(Connection connection) {
		String selectQuery="select * from sub_category";
		List<SubCategory> subcategoryList = new ArrayList<SubCategory>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery);
				
				ResultSet resultSet=preparedStatement.executeQuery())
		{
			while(resultSet.next())
			{
				
				SubCategory subcategory=new SubCategory();
				subcategory.setSub_category_id(resultSet.getInt("i_sub_category_id"));
				subcategory.setCategory_id(resultSet.getInt("i_category_id"));
				subcategory.setSub_category_name(resultSet.getString("c_sub_category_name"));
				subcategory.setStatus(resultSet.getInt("i_status"));
				subcategoryList.add(subcategory);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return subcategoryList;
	}

	@Override
	public int saveProductDetails(Product product, Connection connection) {
		System.out.println("arjun");
		int i = 0, insertedProductId = 0;
		String insertQuery = "insert into product (c_product_name,d_product_price,i_product_quantity,d_product_weight,c_product_description,i_main_category_id,i_sub_category_id,b_product_image,i_product_owner_id,i_offer_id) values(?,?,?,?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setString(1, product.getProduct_name());
			preparedStatement.setString(2, product.getProduct_price());
			preparedStatement.setString(3, product.getProduct_quantity());
			preparedStatement.setString(4, product.getProduct_weight());
			preparedStatement.setString(5, product.getProduct_desc());
			preparedStatement.setInt(6, product.getCategory_id());
			preparedStatement.setInt(7, product.getSubcategory_id());
			preparedStatement.setBlob(8, product.getProductpicStream());
			preparedStatement.setInt(9,product.getProduct_owner_id());
			preparedStatement.setInt(10, product.getOfferid());

			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) {
				insertedProductId = resultSet.getInt(1);
			}
			System.out.println(insertedProductId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return insertedProductId;

	}

	@Override
	public int saveCategoryDetails(Connection connection, Category category) {
		// TODO Auto-generated method stub
		int i = 0, insertedCategoryId = 0;
		String insertQuery = "insert into category (c_category_name)values (?)";
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setString(1, category.getCategory_name());

			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) {
				insertedCategoryId = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return insertedCategoryId;
	}

	@Override
	public int saveSubCategoryDetails(Connection connection, SubCategory subcategory) {
		// TODO Auto-generated method stub
		int i = 0, insertedsubCategoryId = 0;
		String insertQuery = "insert into sub_category (c_sub_category_name,i_category_id)values (?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setString(1, subcategory.getSub_category_name());
			preparedStatement.setInt(2, subcategory.getCategory_id());

			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) {
				insertedsubCategoryId = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return insertedsubCategoryId;
	}

	@Override
	public List<Product> selectProductDetails(Connection connection) {
		// TODO Auto-generated method stub
		String selectQuery="select * from product";
		List<Product> productList = new ArrayList<Product>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery);
				
				ResultSet resultSet=preparedStatement.executeQuery())
		{
			while(resultSet.next())
			{
				
				Product product=new Product();
				product.setProduct_id(resultSet.getInt("i_product_id"));
				product.setProduct_name(resultSet.getString("c_product_name"));
				product.setProduct_price(resultSet.getString("d_product_price"));
				product.setProduct_quantity(resultSet.getString("i_product_quantity"));
				product.setProduct_weight(resultSet.getString("d_product_weight"));
				product.setCategory_id(resultSet.getInt("i_main_category_id"));
				product.setSubcategory_id(resultSet.getInt("i_sub_category_id"));
				product.setProduct_desc(resultSet.getString("c_product_description"));
				product.setProduct_owner_id(resultSet.getInt("i_product_owner_id"));
				product.setOfferid(resultSet.getInt("i_offer_id"));
				product.setStatus(resultSet.getInt("i_status"));
				byte[] productpic = resultSet.getBytes("b_product_image");
				if(null!=productpic && productpic.length>0) 
				{
					String imageString = Base64.getEncoder().encodeToString(productpic);
					product.setProductpicString(imageString);
					System.out.println(imageString);
				}
				System.out.println(productpic);
				
				productList.add(product);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return productList;
		
	}

	@Override
	public List<SubCategory> getSubCategory(Connection connection, int categoryid) {
	
		String selectQuery="select * from sub_category where i_category_id=? and i_status=1";
		List<SubCategory> subcatlist= new ArrayList<SubCategory>();
		

		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			preparedStatement.setInt(1, categoryid);

			try (ResultSet resultSet = preparedStatement.executeQuery();) {

				while (resultSet.next()) {
					
					SubCategory subcategory=new SubCategory();
					  subcategory.setSub_category_id(resultSet.getInt("i_sub_category_id"));
					  subcategory.setSub_category_name(resultSet.getString("c_sub_category_name"));
					  subcatlist.add(subcategory);
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return subcatlist;
		

	}

	@Override
	public List<Offer> fetchOfferDetails(Connection connection) {
		// TODO Auto-generated method stub
		String selectQuery="select * from offer";
		List<Offer> offerList= new ArrayList<Offer>();
		

		try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
			
			try (ResultSet resultSet = preparedStatement.executeQuery();) {

				while (resultSet.next()) {
					
					Offer offer = new Offer();
					offer.setOfferid(resultSet.getInt("i_offer_id"));
					offer.setOffername(resultSet.getString("c_offer_name"));
					offer.setValidoffer(resultSet.getInt("i_is_valid"));
					offer.setDiscount(resultSet.getDouble("d_discount"));
					offerList.add(offer);	  
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return offerList;
	}

	@Override
	public int saveOfferDetails(Connection connection, Offer offer) {
		// TODO Auto-generated method stub
		int i = 0, insertedOfferId = 0;
		String insertQuery = "insert into offer (c_offer_name,i_is_valid,d_discount) values(?,?,?)";
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try(PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setString(1, offer.getOffername());
			preparedStatement.setInt(2, 1);
			preparedStatement.setDouble(3, offer.getDiscount());

			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) 
			{
				insertedOfferId = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return insertedOfferId;
	}

	@Override
	public int removeCategoryDetails(int categoryId, Connection connection) {
		// TODO Auto-generated method stub
		String deleteQuery = "update category set i_status=? where i_category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setInt(2, categoryId);

			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int removeSubCategoryDetails(int subcategoryId, Connection connection) {
		// TODO Auto-generated method stub
		String deleteQuery = "update sub_category set i_status=? where i_sub_category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setInt(2, subcategoryId);

			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int removeProduct(int productid, Connection connection) {
		// TODO Auto-generated method stub
		String deleteQuery = "update product set i_status=? where i_product_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setInt(2, productid);

			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int removeoffer(int offerid, Connection connection) {
		// TODO Auto-generated method stub
		String deleteQuery = "update offer set i_is_valid=? where i_offer_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setInt(2, offerid);

			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Category selectCategoryDetails(Connection connection, int categoryid) {
		// TODO Auto-generated method stub
		String selectQuery = "select * from category where i_category_id = ?";
		Category category=null;
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
			preparedStatement.setInt(1, categoryid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				category=new Category();
				category.setCategory_id(resultSet.getInt("i_category_id"));
				category.setCategory_name(resultSet.getString("c_category_name"));
				category.setStatus(resultSet.getInt("i_status"));
				
			}
			//System.out.println("name:-"+category.getCategory_name());
		}
		catch (Exception e)
		{
			e.printStackTrace();		
		}
		return category;
	}

	@Override
	public int modifyCategoryDetails(Category category, Connection connection) {
		String updateQuery = "update category set c_category_name=?,i_status=? where i_category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, category.getCategory_name());
			preparedStatement.setInt(2, category.getStatus());
			preparedStatement.setInt(3, category.getCategory_id());
			
			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public SubCategory selectSubCategory(Connection connection, int subcatid) {
		String selectQuery = "select * from sub_category where i_sub_category_id = ?";
		SubCategory subcategory=null;
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
			preparedStatement.setInt(1, subcatid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				subcategory=new SubCategory();
				subcategory.setSub_category_id(resultSet.getInt("i_sub_category_id"));
				subcategory.setCategory_id(resultSet.getInt("i_category_id"));
				subcategory.setSub_category_name(resultSet.getString("c_sub_category_name"));
				subcategory.setStatus(resultSet.getInt("i_status"));
				
				
			}
			//System.out.println("name:-"+category.getCategory_name());
		}
		catch (Exception e)
		{
			e.printStackTrace();		
		}
		return subcategory;
	}

	@Override
	public int modifySubCategoryDetails(SubCategory subcategory, Connection connection) {
		String updateQuery = "update sub_category set i_category_id=?,c_sub_category_name=?,i_status=? where i_sub_category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1,subcategory.getCategory_id());
			preparedStatement.setString(2, subcategory.getSub_category_name());
			preparedStatement.setInt(3, subcategory.getStatus());
			preparedStatement.setInt(4, subcategory.getSub_category_id());
			
			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public Product selectProductDetails(Connection connection, int productid) {
		String selectQuery = "select * from product where i_product_id = ?";
		Product product=null;
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
			preparedStatement.setInt(1, productid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				product=new Product();
				product.setProduct_id(resultSet.getInt("i_product_id"));
				product.setProduct_name(resultSet.getString("c_product_name"));
				product.setProduct_price(resultSet.getString("d_product_price"));
				product.setProduct_quantity(resultSet.getString("i_product_quantity"));
				product.setProduct_weight(resultSet.getString("d_product_weight"));
				product.setProduct_owner_id(resultSet.getInt("i_product_owner_id"));
				product.setProduct_desc(resultSet.getString("c_product_description"));
				product.setCategory_id(resultSet.getInt("i_main_category_id"));
				product.setOfferid(resultSet.getInt("i_offer_id"));
				product.setSubcategory_id(resultSet.getInt("i_sub_category_id"));
				product.setStatus(resultSet.getInt("i_status"));
				byte[] productimage = resultSet.getBytes("b_product_image"); 
				String imageString=null;
				  
				  if(null!=productimage && productimage.length>0) { 
					imageString = Base64.getEncoder().encodeToString(productimage);
				  product.setProductpicString(imageString);
			}
				  else
				  {
					  System.out.println("blank....");
				  }
			//System.out.println("name:-"+category.getCategory_name());
		}
		}
		catch (Exception e)
		{
			e.printStackTrace();		
		}
		return product;
	}

	@Override
	public int modifyProductDetails(Product product, Connection connection) {
		String updateQuery = "update product set c_product_name=?,d_product_price=?,i_product_quantity=?,d_product_weight=?,i_product_owner_id=?,c_product_description=?,i_main_category_id=?,i_sub_category_id=?,i_offer_id=?,i_status=?,b_product_image=? where i_product_id=?";
		String updateQuery2 = "update product set c_product_name=?,d_product_price=?,i_product_quantity=?,d_product_weight=?,i_product_owner_id=?,c_product_description=?,i_main_category_id=?,i_sub_category_id=?,i_offer_id=?,i_status=? where i_product_id=?";
		if(product.getProductpicStream()!=null)
		{
			try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
				preparedStatement.setString(1, product.getProduct_name());
				preparedStatement.setString(2, product.getProduct_price());
				preparedStatement.setString(3, product.getProduct_quantity());
				preparedStatement.setString(4, product.getProduct_weight());
				preparedStatement.setInt(5,product.getProduct_owner_id());
				preparedStatement.setString(6, product.getProduct_desc());
				preparedStatement.setInt(7, product.getCategory_id());
				preparedStatement.setInt(8, product.getSubcategory_id());
				preparedStatement.setInt(9, product.getOfferid());
				preparedStatement.setInt(10, product.getStatus());
				preparedStatement.setBlob(11, product.getProductpicStream());
				preparedStatement.setInt(12, product.getProduct_id());
				
				System.out.println("Not Null..."+product.getProductpicStream());
				
				return preparedStatement.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery2)) {
				preparedStatement.setString(1, product.getProduct_name());
				preparedStatement.setString(2, product.getProduct_price());
				preparedStatement.setString(3, product.getProduct_quantity());
				preparedStatement.setString(4, product.getProduct_weight());
				preparedStatement.setInt(5,product.getProduct_owner_id());
				preparedStatement.setString(6, product.getProduct_desc());
				preparedStatement.setInt(7, product.getCategory_id());
				preparedStatement.setInt(8, product.getSubcategory_id());
				preparedStatement.setInt(9, product.getOfferid());
				preparedStatement.setInt(10, product.getStatus());
				preparedStatement.setInt(11, product.getProduct_id());
				
				System.out.println("Null....");
				
				return preparedStatement.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return 0;
	}

	@Override
	public Offer selectOfferDetails(Connection connection, int offerid) {
		String selectQuery = "select * from offer where i_offer_id = ?";
		Offer offer=null;
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
			preparedStatement.setInt(1, offerid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				offer = new Offer();
				offer.setOffername(resultSet.getString("c_offer_name"));
				offer.setDiscount(resultSet.getDouble("d_discount"));
				offer.setValidoffer(resultSet.getInt("i_is_valid"));
				offer.setOfferid(resultSet.getInt("i_offer_id"));
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();		
		}
		return offer;
	}

	@Override
	public int modifyOfferDetails(Offer offer, Connection connection) {
		
		String updateQuery = "update offer set c_offer_name=?,d_discount=?,i_is_valid=? where i_offer_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, offer.getOffername());
			preparedStatement.setDouble(2, offer.getDiscount());
			preparedStatement.setInt(3, offer.getValidoffer());
			preparedStatement.setInt(4, offer.getOfferid());
			System.out.println("hy3...");
			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public Product fetchProductDetail(Connection connection, int productid) {
		String selectQuery = "select * from product where i_product_id = ?";
		Product product = null;
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
			preparedStatement.setInt(1, productid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				product=new Product();
				product.setProduct_id(resultSet.getInt("i_product_id"));
				product.setProduct_name(resultSet.getString("c_product_name"));
				product.setProduct_price(resultSet.getString("d_product_price"));
				product.setProduct_quantity(resultSet.getString("i_product_quantity"));
				product.setProduct_weight(resultSet.getString("d_product_weight"));
				product.setProduct_owner_id(resultSet.getInt("i_product_owner_id"));
				product.setProduct_desc(resultSet.getString("c_product_description"));
				product.setCategory_id(resultSet.getInt("i_main_category_id"));
				product.setOfferid(resultSet.getInt("i_offer_id"));
				product.setSubcategory_id(resultSet.getInt("i_sub_category_id"));
				product.setStatus(resultSet.getInt("i_status"));
				byte[] productimage = resultSet.getBytes("b_product_image"); 
				String imageString=null;
				  if(null!=productimage && productimage.length>0)
				  { 
					imageString = Base64.getEncoder().encodeToString(productimage);
					product.setProductpicString(imageString);
				  }
				  else
				  {
					  System.out.println("blank....");
				  }
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();		
		}
		return product;
	}

	@Override
	public int updatePass(Connection connection, String confirmpass, int user_id) {
		String updateQuery = "update user set c_password=? where i_user_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, confirmpass);
			preparedStatement.setInt(2, user_id);

			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public int saveWishlistDetails(Connection connection, Wishlist wishlist) {
		int i = 0, insertedWishlistid = 0;
		String insertQuery = "insert into wishlist (i_things_id,i_person_id,d_added_date) values(?,?,?)";
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try(PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setInt(1, wishlist.getProductid());
			preparedStatement.setInt(2, wishlist.getUserid());
			preparedStatement.setDate(3, (Date) wishlist.getCurrentdate());

			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) 
			{
				insertedWishlistid = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return insertedWishlistid;
	}

	@Override
	public int removeIntoWishlist(Wishlist wishlist, Connection connection) {
		// TODO Auto-generated method stub
		String deletequery = "delete from wishlist where i_things_id=? and i_person_id=?";
		try(PreparedStatement preparedStatement = connection.prepareStatement(deletequery)) {
			preparedStatement.setInt(1, wishlist.getProductid());
			preparedStatement.setInt(2, wishlist.getUserid());
			return preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Wishlist> selectWishlistDetails(Connection connection,int i) {
		String selectQuery="select * from wishlist where i_person_id=?";
		List<Wishlist> wishlistList = new ArrayList<Wishlist>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery)){
				preparedStatement.setInt(1, i);
				
				ResultSet resultSet=preparedStatement.executeQuery();
		
			while(resultSet.next())
			{
				
				Wishlist wishlist = new Wishlist();
				wishlist.setWishlistid(resultSet.getInt("i_wishlist_id"));
				wishlist.setProductid(resultSet.getInt("i_things_id"));
				wishlist.setUserid(resultSet.getInt("i_person_id"));
				wishlist.setCurrentdate(resultSet.getDate("d_added_date"));
				wishlistList.add(wishlist);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return wishlistList;

	}

	@Override
	public User selectUserDetails(Connection connection, int user_id) {
		String selectQuery = "select * from user where i_user_id = ?";
		User user=null;
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
			preparedStatement.setInt(1, user_id);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user=new User();
				user.setUser_id(resultSet.getInt("i_user_id"));
				user.setFirstname(resultSet.getString("c_first_name"));
				user.setLastname(resultSet.getString("c_last_name"));
				user.setAddress(resultSet.getString("c_address"));
				user.setAboutme(resultSet.getString("c_about_description"));
				user.setDesignation(resultSet.getString("c_designation"));
				user.setVisitingfees(resultSet.getString("i_visiting_fess"));
				user.setMobileno(resultSet.getString("c_contact_no"));
				user.setEmail(resultSet.getString("c_email"));
				user.setGender(resultSet.getString("c_gender"));
				user.setRole_id(resultSet.getInt("i_role_id"));
				user.setArea_id(resultSet.getInt("i_area_id"));
				
				 byte[] imageData = resultSet.getBytes("b_image"); String imageString=null;
				  
				  if(null!=imageData && imageData.length>0) { imageString =
				  Base64.getEncoder().encodeToString(imageData);
				 
				  user.setUserProfilepicString(imageString);}
				   
				
				
				
				
				
			}
			//System.out.println("name:-"+category.getCategory_name());
		}
		catch (Exception e)
		{
			e.printStackTrace();		
		}
		return user;
	}

	@Override
	public int saveFeedBackDetails(Connection connection, FeedBack feedBack) {
		int i = 0, insertedfeedbacktid = 0;
		String insertQuery = "insert into feedback (i_object_id,i_consumer_id,c_description,d_feedback_date) values(?,?,?,?)";
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try(PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) {
			
			preparedStatement.setInt(1, feedBack.getProductid());
			preparedStatement.setInt(2, feedBack.getUserid());
			preparedStatement.setString(3, feedBack.getFeedbackdesc());
			preparedStatement.setDate(4, (Date) feedBack.getFeedbackdate());
			

			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) 
			{
				insertedfeedbacktid = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return insertedfeedbacktid;
	}

	@Override
	public List<FeedBack> selectFeedbackDetails(Connection connection) {
		String selectQuery="select * from feedback";
		List<FeedBack> feedbackList = new ArrayList<FeedBack>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery);
		ResultSet resultSet=preparedStatement.executeQuery())
		{
			while(resultSet.next())
			{
				FeedBack feedBack = new FeedBack();
				feedBack.setFeedbackid(resultSet.getInt("i_feedback_id"));
				feedBack.setProductid(resultSet.getInt("i_object_id"));
				feedBack.setUserid(resultSet.getInt("i_consumer_id"));
				feedBack.setFeedbackdesc(resultSet.getString("c_description"));
				feedBack.setFeedbackdate(resultSet.getDate("d_feedback_date"));
				
				feedbackList.add(feedBack);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return feedbackList;
	}

	@Override
	public FeedBack selectfeedbackDetails(Connection connection, int feedbackid) {
		String selectQuery = "select * from feedback where i_feedback_id = ?";
		FeedBack feedBack = null;
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
			preparedStatement.setInt(1, feedbackid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				feedBack = new FeedBack();
				feedBack.setFeedbackid(resultSet.getInt("i_feedback_id"));
				feedBack.setProductid(resultSet.getInt("i_object_id"));
				feedBack.setUserid(resultSet.getInt("i_consumer_id"));
				feedBack.setFeedbackdesc(resultSet.getString("c_description"));
				feedBack.setFeedbackdate(resultSet.getDate("d_feedback_date"));	
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();		
		}
		return feedBack;
	}

	@Override
	public int removeIntoFeedback(int feedbackid, Connection connection) {
		String deletequery = "delete from feedback where i_feedback_id=?";
		try(PreparedStatement preparedStatement = connection.prepareStatement(deletequery)) {
			preparedStatement.setInt(1,feedbackid);
			
			return preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}

	@Override
	public List<Product> fetchProduct(Connection connection, int id) {
		String selectQuery = "select * from product where i_sub_category_id = ?";
		List<Product> productlist=new ArrayList<Product>();
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
			preparedStatement.setInt(1, id);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Product product=new Product();
				product.setProduct_id(resultSet.getInt("i_product_id"));
				product.setProduct_name(resultSet.getString("c_product_name"));
				product.setProduct_price(resultSet.getString("d_product_price"));
				product.setProduct_quantity(resultSet.getString("i_product_quantity"));
				product.setProduct_weight(resultSet.getString("d_product_weight"));
				product.setProduct_owner_id(resultSet.getInt("i_product_owner_id"));
				product.setProduct_desc(resultSet.getString("c_product_description"));
				product.setCategory_id(resultSet.getInt("i_main_category_id"));
				product.setOfferid(resultSet.getInt("i_offer_id"));
				product.setSubcategory_id(resultSet.getInt("i_sub_category_id"));
				product.setStatus(resultSet.getInt("i_status"));
				byte[] productimage = resultSet.getBytes("b_product_image"); 
				String imageString=null;
				  if(null!=productimage && productimage.length>0)
				  { 
					imageString = Base64.getEncoder().encodeToString(productimage);
					product.setProductpicString(imageString);
				  }
				  else
				  {
					  System.out.println("blank....");
				  }
				  productlist.add(product);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();		
		}
		return productlist;

	}

	@Override
	public User fetchDesigner(Connection connection, int designerid) {
		String selectQuery = "select * from user where i_user_id = ?";
		
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
			preparedStatement.setInt(1, designerid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer id = resultSet.getInt("i_user_id");
				String fname = resultSet.getString("c_first_name");
				String lname = resultSet.getString("c_last_name");
				String address = resultSet.getString("c_address");
				String phoneno = resultSet.getString("c_contact_no");
				String email = resultSet.getString("c_email");
				String password = resultSet.getString("c_password");
				String gender = resultSet.getString("c_gender");
				//Integer role = resultSet.getInt("i_role_id");
				Integer areaid = resultSet.getInt("i_area_id");
				//Integer status = resultSet.getInt("i_status");
				String visitingfess = resultSet.getString("i_visiting_fess");
				String designation = resultSet.getString("c_designation");
				String aboutme = resultSet.getString("c_about_description");
				
				User user = new User();
				 byte[] imageData = resultSet.getBytes("b_image"); String imageString=null;
				  
				  if(null!=imageData && imageData.length>0) { imageString =
				  Base64.getEncoder().encodeToString(imageData);
				 
				  user.setUserProfilepicString(imageString);}
				   
				
				user.setUser_id(id);
				user.setFirstname(fname);
				user.setLastname(lname);
				user.setAddress(address);
				user.setMobileno(phoneno);
				user.setEmail(email);
				user.setPassword(password);
				user.setGender(gender);
				user.setArea_id(areaid);
				user.setVisitingfees(visitingfess);	
				user.setDesignation(designation);	
				user.setAboutme(aboutme);	
				
				return user;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();		
		}
		return null;
}

	@Override
	public int removeIntoWishlist(int productcid, int user_id, Connection connection) {
		String deletequery = "delete from wishlist where i_things_id=? and i_person_id=?";
		try(PreparedStatement preparedStatement = connection.prepareStatement(deletequery)) {
			preparedStatement.setInt(1,productcid);
			preparedStatement.setInt(2,user_id);
			
			return preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int saveCartDetails(Connection connection, Cart cart) {
		int i = 0, insertedcartid = 0;
		String insertQuery = "insert into cart (i_goods_id,i_buyer_id,d_date) values(?,?,?)";
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try(PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) {
			
			preparedStatement.setInt(1, cart.getProductid());
			preparedStatement.setInt(2, cart.getUserid());
			preparedStatement.setDate(3, (Date) cart.getCurrentdate());
			
			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) 
			{
				insertedcartid = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return insertedcartid;
	}

	@Override
	public List<Cart> selectCartDetails(Connection connection, int user_id) {
		String selectQuery="select * from cart where i_buyer_id=?";
		List<Cart> cartList = new ArrayList<Cart>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery)){
				preparedStatement.setInt(1, user_id);
				
				ResultSet resultSet=preparedStatement.executeQuery();
		
			while(resultSet.next())
			{
				Cart cart = new Cart();
				cart.setCartid(resultSet.getInt("i_cart_id"));
				cart.setProductid(resultSet.getInt("i_goods_id"));
				cart.setUserid(resultSet.getInt("i_buyer_id"));
				cart.setCurrentdate(resultSet.getDate("d_date"));
				cartList.add(cart);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return cartList;
	}

	@Override
	public int removeIntoCart(int productid, int user_id, Connection connection) {
		String deletequery = "delete from cart where i_goods_id=? and i_buyer_id=?";
		try(PreparedStatement preparedStatement = connection.prepareStatement(deletequery)) {
			preparedStatement.setInt(1,productid);
			preparedStatement.setInt(2,user_id);
			
			return preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int saveBookingDetails(Connection connection, Booking booking) {
		int i = 0, insertedBookingId = 0;
		String insertQuery = "insert into booking (i_designer_id,i_fees,i_user_id,d_date,c_booking_status) values (?,?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,
				Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setInt(1, booking.getDesignerid());
			preparedStatement.setInt(2, booking.getVfees());
			preparedStatement.setInt(3, booking.getUserid());
			preparedStatement.setDate(4, booking.getBookingdate());
			preparedStatement.setString(5, "success");
			
			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) 
			{
				insertedBookingId = resultSet.getInt(1);
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insertedBookingId;
	}

	@Override
	public int saveBookingInfoDetails(Connection connection, BookingInfo bookingInfo) {
		int i = 0, insertedBooinginfoId = 0;
		String insertQuery = "insert into booking_info (i_book_id,c_booking_firstname,c_booking_lastname,c_booking_address,c_booking_contactno,c_booking_email,d_booking_date) values(?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setInt(1, bookingInfo.getBookingid());
			preparedStatement.setString(2, bookingInfo.getBookingfname());
			preparedStatement.setString(3, bookingInfo.getBookinglname());
			preparedStatement.setString(4, bookingInfo.getBookingaddress());
			preparedStatement.setString(5, bookingInfo.getBookingcno());
			preparedStatement.setString(6, bookingInfo.getBookingemail());
			preparedStatement.setDate(7, bookingInfo.getBookingdate());

			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) {
				insertedBooinginfoId = resultSet.getInt(1);
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insertedBooinginfoId;
	}

	@Override
	public int saveInCart(Connection connection, Cart cart) {
		int i = 0, insertedCartId = 0;
		String insertQuery = "insert into cart (i_goods_id,i_buyer_id,d_date) values(?,?,?)";
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try(PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setInt(1, cart.getProductid());
			preparedStatement.setInt(2, cart.getUserid());
			preparedStatement.setDate(3, (Date) cart.getCurrentdate());

			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();

			while (resultSet.next()) 
			{
				insertedCartId = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return insertedCartId;

	}

	@Override
	public int removeInCart(Cart cart, Connection connection) {
		String deletequery = "delete from cart where i_goods_id=? and i_buyer_id=?";
		try(PreparedStatement preparedStatement = connection.prepareStatement(deletequery)) {
			preparedStatement.setInt(1,cart.getProductid());
			preparedStatement.setInt(2, cart.getUserid());
			return preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<FeedBack> selectProductFeedbacks(Connection connection, int productId) {
		String selectQuery="select * from feedback where i_object_id=?";
		List<FeedBack> feedbackList = new ArrayList<FeedBack>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery)){
				preparedStatement.setInt(1, productId);
				
				ResultSet resultSet=preparedStatement.executeQuery();
		
			while(resultSet.next())
			{
				FeedBack feedBack=new FeedBack();
				feedBack.setFeedbackid(resultSet.getInt("i_feedback_id"));
				feedBack.setProductid(resultSet.getInt("i_object_id"));
				feedBack.setUserid(resultSet.getInt("i_consumer_id"));
				feedBack.setFeedbackdesc(resultSet.getString("c_description"));
				feedBack.setFeedbackdate(resultSet.getDate("d_feedback_date"));
				
				feedbackList.add(feedBack);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return feedbackList;
	}

	@Override
	public List<Booking> fetchBookingDetails(Connection connection) {
		String selectQuery="select * from booking ";
		List<Booking> bookingList = new ArrayList<Booking>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery)){
				
				
				ResultSet resultSet=preparedStatement.executeQuery();
		
			while(resultSet.next())
			{
				Booking booking=new Booking();
				booking.setBookingid(resultSet.getInt("i_booking_id"));
				booking.setDesignerid(resultSet.getInt("i_designer_id"));
				booking.setBookingdate(resultSet.getDate("d_date"));
				booking.setVfees(resultSet.getInt("i_fees"));
				booking.setPaymentstatus(resultSet.getString("c_payment_status"));
				booking.setBookingstatus(resultSet.getString("c_booking_status"));
				booking.setUserid(resultSet.getInt("i_user_id"));
				
				bookingList.add(booking);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return bookingList;
	}

	@Override
	public List<BookingInfo> fetchBookingInfoDetails(Connection connection) {
		String selectQuery="select * from booking_info where d_booking_date>=?";
		java.util.Date date=new java.util.Date();
		java.sql.Date sqldate=new java.sql.Date(date.getTime());
		List<BookingInfo> bookinginfoList = new ArrayList<BookingInfo>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery)){
			preparedStatement.setDate(1,sqldate );
				
				ResultSet resultSet=preparedStatement.executeQuery();
		
			while(resultSet.next())
			{
				BookingInfo bookinginfo=new BookingInfo();
				bookinginfo.setBookinginfoid(resultSet.getInt("i_booking_info_id"));
				bookinginfo.setBookingid(resultSet.getInt("i_book_id"));
				bookinginfo.setBookingfname(resultSet.getString("c_booking_firstname"));
				bookinginfo.setBookinglname(resultSet.getString("c_booking_lastname"));
				bookinginfo.setBookingaddress(resultSet.getString("c_booking_address"));
				bookinginfo.setBookingcno(resultSet.getString("c_booking_contactno"));
				bookinginfo.setBookingdate(resultSet.getDate("d_booking_date"));
				bookinginfo.setBookingemail(resultSet.getString("c_booking_email"));
				bookinginfoList.add(bookinginfo);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return bookinginfoList;
	}

	@Override
	public List<roomdesign> selectroomdesigndetails(Connection connection) {
		String selectQuery="select * from roomdesign";
		List<roomdesign> roomdesignList = new ArrayList<roomdesign>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery)){
				
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				roomdesign roomdesign = new roomdesign();
				roomdesign.setDesignid(resultSet.getInt("i_design_id"));
				roomdesign.setSampleimage(resultSet.getString("c_sample_image"));
				roomdesign.setCdesign(resultSet.getString("c_design"));
				roomdesignList.add(roomdesign);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return roomdesignList;
	}

	@Override
	public List<BookingInfo> fetchPreviousBookingInfoDetails(Connection connection) {
		String selectQuery="select * from booking_info where d_booking_date<?";
		java.util.Date date=new java.util.Date();
		java.sql.Date sqldate=new java.sql.Date(date.getTime());
		List<BookingInfo> bookinginfoList = new ArrayList<BookingInfo>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery)){
			preparedStatement.setDate(1,sqldate );
				
				ResultSet resultSet=preparedStatement.executeQuery();
		
			while(resultSet.next())
			{
				BookingInfo bookinginfo=new BookingInfo();
				bookinginfo.setBookinginfoid(resultSet.getInt("i_booking_info_id"));
				bookinginfo.setBookingid(resultSet.getInt("i_book_id"));
				bookinginfo.setBookingfname(resultSet.getString("c_booking_firstname"));
				bookinginfo.setBookinglname(resultSet.getString("c_booking_lastname"));
				bookinginfo.setBookingaddress(resultSet.getString("c_booking_address"));
				bookinginfo.setBookingcno(resultSet.getString("c_booking_contactno"));
				bookinginfo.setBookingdate(resultSet.getDate("d_booking_date"));
				bookinginfo.setBookingemail(resultSet.getString("c_booking_email"));
				bookinginfoList.add(bookinginfo);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return bookinginfoList;

	}

	@Override
	public int saveOrderDetails(Connection connection, Order order) {
		int i = 0;
		int insertedOrderId = 0;
		String insertQuery = "insert into order_table (i_customer_id,d_amount,d_order_date,c_order_status,c_firstname,c_lastname,c_address,c_contactno,c_email) values (?,?,?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setInt(1, order.getUserid());
			preparedStatement.setDouble(2, order.getAmount());
			preparedStatement.setDate(3, (Date)order.getOrderdate());
			preparedStatement.setString(4, "success");
			preparedStatement.setString(5, order.getFirstname());
			preparedStatement.setString(6, order.getLastname());
			preparedStatement.setString(7, order.getAddress());
			preparedStatement.setString(8, order.getContactnum());
			preparedStatement.setString(9, order.getEmail());
			
			i = preparedStatement.executeUpdate();
//			System.out.println("inside prepare....");
			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			
			while (resultSet.next()) 
			{
				insertedOrderId = resultSet.getInt(1);
//				System.out.println("order id:-"+insertedOrderId);
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insertedOrderId;

	}

	@Override
	public int modifyBookingPaymentStatus(int bookid, Connection connection) {
		String updateQuery = "update booking set c_payment_status=? where i_booking_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, "success");
			preparedStatement.setDouble(2,bookid);
			
			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;

	}

	@Override
	public int saveOrderInformation(Connection connection, OrderDetails orderDetails) {
		int i = 0;
		int insertedOrderInformationId = 0;
		String insertQuery = "insert into order_details (i_order_id,i_product_id,i_quantity) values (?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS)) 
		{
			preparedStatement.setInt(1, orderDetails.getOrderid());
			preparedStatement.setInt(2, orderDetails.getProductid());
			preparedStatement.setInt(3, orderDetails.getQuantity());
			
			i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			while (resultSet.next()) 
			{
				insertedOrderInformationId = resultSet.getInt(1);
//				System.out.println("order id:-"+insertedOrderId);
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insertedOrderInformationId;
	}

	@Override
	public List<Order> fetchOrderTableDetails(Connection connection) {
		String selectQuery="select * from order_table";
		List<Order> orderList = new ArrayList<>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery)){
				
				ResultSet resultSet=preparedStatement.executeQuery();
		
			while(resultSet.next())
			{
				Order order = new Order();
				order.setOrderid(resultSet.getInt("i_order_id"));
				order.setUserid(resultSet.getInt("i_customer_id"));
				order.setAmount(resultSet.getDouble("d_amount"));
				order.setOrderdate(resultSet.getDate("d_order_date"));
				order.setOrderstatus(resultSet.getString("c_order_status"));
				order.setPaymentstatus(resultSet.getString("c_payment_status"));
				order.setFirstname(resultSet.getString("c_firstname"));
				order.setLastname(resultSet.getString("c_lastname"));
				order.setAddress(resultSet.getString("c_address"));
				order.setContactnum(resultSet.getString("c_contactno"));
				order.setEmail(resultSet.getString("c_email"));
				
				orderList.add(order);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return orderList;
	}

	@Override
	public List<OrderDetails> fetchOrderDetails(Connection connection) {
		String selectQuery="select * from order_details";
		List<OrderDetails> orderdetailsList = new ArrayList<>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery)){
				
				ResultSet resultSet=preparedStatement.executeQuery();
		
			while(resultSet.next())
			{
				OrderDetails orderDetails = new OrderDetails();
				orderDetails.setOrderdetailid(resultSet.getInt("i_order_details_id"));
				orderDetails.setOrderid(resultSet.getInt("i_order_id"));
				orderDetails.setProductid(resultSet.getInt("i_product_id"));
				orderDetails.setQuantity(resultSet.getInt("i_quantity"));
				
				orderdetailsList.add(orderDetails);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return orderdetailsList;
	}

	@Override
	public int modifyOrderPaymentStatus(int bookid, Connection connection) {
		String updateQuery = "update order_table set c_payment_status=? where i_order_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setString(1, "success");
			preparedStatement.setDouble(2,bookid);
			
			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public int removeUserCart(int userid, Connection connection) {
		String deletequery = "delete from cart where i_buyer_id=?";
		try(PreparedStatement preparedStatement = connection.prepareStatement(deletequery)) {
			preparedStatement.setInt(1,userid);
			return preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<OrderDetails> fetchProductAndQuantity(Connection connection, int bookid) {
		
	
		String selectQuery="select * from order_details where i_order_id=?";
		List<OrderDetails> orderdetailslist = new ArrayList<OrderDetails>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectQuery)){
				preparedStatement.setInt(1, bookid);
				
				ResultSet resultSet=preparedStatement.executeQuery();
		
			while(resultSet.next())
			{
				
				OrderDetails od=new OrderDetails();
				od.setOrderid(resultSet.getInt("i_order_id"));
				od.setProductid(resultSet.getInt("i_product_id"));
				od.setQuantity(resultSet.getInt("i_quantity"));
				
				orderdetailslist.add(od);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return orderdetailslist;
		
	}

	@Override
	public int modifyQuantityInProduct(int productid, int quantity, Connection connection) {
		String updateQuery = "update product set i_product_quantity=? where i_product_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
			preparedStatement.setInt(1, quantity);
			preparedStatement.setInt(2, productid);
			
			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public List<Product> fetchFilterProduct(Connection connection, int subcatid, int minprice, int maxprice) {
		String selectQuery="select * from product where d_product_price>=? and d_product_price<=? and i_sub_category_id=?";
		List<Product> productlist=new ArrayList<Product>();
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
			preparedStatement.setDouble(1, minprice);
			preparedStatement.setDouble(2, maxprice);
			preparedStatement.setInt(3, subcatid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Product product=new Product();
				product.setProduct_id(resultSet.getInt("i_product_id"));
				product.setProduct_name(resultSet.getString("c_product_name"));
				product.setProduct_price(resultSet.getString("d_product_price"));
				product.setProduct_quantity(resultSet.getString("i_product_quantity"));
				product.setProduct_weight(resultSet.getString("d_product_weight"));
				product.setProduct_owner_id(resultSet.getInt("i_product_owner_id"));
				product.setProduct_desc(resultSet.getString("c_product_description"));
				product.setCategory_id(resultSet.getInt("i_main_category_id"));
				product.setOfferid(resultSet.getInt("i_offer_id"));
				product.setSubcategory_id(resultSet.getInt("i_sub_category_id"));
				product.setStatus(resultSet.getInt("i_status"));
				byte[] productimage = resultSet.getBytes("b_product_image"); 
				String imageString=null;
				  if(null!=productimage && productimage.length>0)
				  { 
					imageString = Base64.getEncoder().encodeToString(productimage);
					product.setProductpicString(imageString);
				  }
				  else
				  {
					  System.out.println("blank....");
				  }
				  productlist.add(product);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();		
		}
		return productlist;

	}

	@Override
	public int deletechildsubcategoryDetails(int categoryId, Connection connection) {
		String deleteQuery = "update sub_category set i_status=? where i_category_id=?";
		try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
			preparedStatement.setInt(1, 0);
			preparedStatement.setInt(2, categoryId);

			return preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}
}


	


	


