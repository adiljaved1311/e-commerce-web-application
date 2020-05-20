package db;
import java.io.InputStream;
import java.sql.*;
import java.util.*;
public class DbConnect {
	private Connection c ;
	private Statement st ;
	public DbConnect() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
	    c= DriverManager.getConnection(
	            "jdbc:mysql://localhost:3306/databasename", "root", "password");
	    st= c.createStatement();
	}
	public void setConnectionCommit(boolean a) throws Exception{
		c.setAutoCommit(a);
	}
	public void commit() throws Exception{
		c.commit();
	}
	public void rollback() throws Exception{
		c.rollback();
	}
	public void dbDisconnect()throws Exception {
		if(c!=null) {
			c.close();
		}
	}
	public String getUserPasswordByEmail(String email) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select password from users where email=? ");
		p.setString(1,email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
	        return rs.getString("password");
		}else {
			return null;
		}
	}
	public HashMap checkLogin(String email,String pass) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select * from users where email=? and password=?");
		p.setString(1,email);
		p.setString(2,pass);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			HashMap userDetails = new HashMap();
	        userDetails.put("name", rs.getString("name"));
	        userDetails.put("email", email);
	        userDetails.put("phone", rs.getString("phone"));
	        userDetails.put("gender", rs.getString("gender"));
	        userDetails.put("status", rs.getString("status"));
	        return userDetails;
		}else {
			return null;
		}
	}
	public HashMap checkOTP(String email,String otp) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select * from users where email=? and status=?");
		p.setString(1,email);
		p.setString(2,otp);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			st.executeUpdate("update users set status='Verified' where email='"+email+"'");
			HashMap userDetails = new HashMap();
	        userDetails.put("name", rs.getString("name"));
	        userDetails.put("email", email);
	        userDetails.put("phone", rs.getString("phone"));
	        userDetails.put("gender", rs.getString("gender"));
	        userDetails.put("status", rs.getString("status"));
	        return userDetails;
		}else {
			return null;
		}
	}
	public HashMap checkAdminLogin(String email,String pass) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select * from admin where email=? and password=?");
		p.setString(1,email);
		p.setString(2,pass);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			HashMap userDetails = new HashMap();
	        userDetails.put("name", rs.getString("name"));
	        userDetails.put("email", email);
	        return userDetails;
		}else {
			return null;
		}
	}
	public String addUser(HashMap userDetails, String otp) throws Exception{
		try{
		
		PreparedStatement p=c.prepareStatement(
	"insert into users values(?,?,?,?,?,?,'"+otp+"')");
		p.setString(1,(String)userDetails.get("email"));
		p.setString(3,(String)userDetails.get("name"));
		p.setString(4,(String)userDetails.get("phone"));
		p.setString(2,(String)userDetails.get("password"));
		p.setString(5,(String)userDetails.get("gender"));
		p.setString(6,null);
		p.executeUpdate();
		return "success";
		}catch(SQLIntegrityConstraintViolationException e) {
			return "already";
		}
	}
	public String addToCart(String name,String email) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"insert into cart (item_name,user_email) values(?,?)");
		p.setString(1,name);
		p.setString(2,email);
		p.executeUpdate();
		return "success";
	}
	public String uploadPhoto(InputStream is,String email) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update users set photo=? where email=?");
		p.setBinaryStream(1,is);
		p.setString(2,email);
		int x=p.executeUpdate();
		if(x!=0)
			return "success";
		else
			return "failed";
	}
	public byte[] getPhoto(String email) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select photo from users where email=?");
		p.setString(1,email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			byte b[]=rs.getBytes("photo");
			if(b!=null && b.length!=0) {
				return b;
			}else {
				return null;
			}
		}	
		else {
			return null;
		}
			
	}
	public byte[] getItemPhoto(String name,String img) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select * from items where name=?");
		p.setString(1,name);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			byte b[]=rs.getBytes(img);
			if(b.length!=0) {
				return b;
			}else {
				return null;
			}
		}	
		else {
			return null;
		}
			
	}
	public byte[] getOrderItemPhoto(int order_item_id) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select item_photo from order_items where order_item_id=?");
		p.setInt(1,order_item_id);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			byte b[]=rs.getBytes(1);
			if(b.length!=0) {
				return b;
			}else {
				return null;
			}
		}	
		else {
			return null;
		}
			
	}
	public String addItem(HashMap itemDetails) throws Exception{
		try{PreparedStatement p=c.prepareStatement(
	"insert into items values(?,?,?,?,?,?,?,?,?)");
		p.setString(1,(String)itemDetails.get("name"));
		p.setDouble(2,(double)itemDetails.get("price"));
		p.setInt(3,(int)itemDetails.get("qty"));
		p.setString(4,(String)itemDetails.get("info"));
		p.setBinaryStream(5, (InputStream)itemDetails.get("img1"));
		p.setBinaryStream(6, (InputStream)itemDetails.get("img2"));
		p.setBinaryStream(7, (InputStream)itemDetails.get("img3"));
		p.setBinaryStream(8, (InputStream)itemDetails.get("img4"));
		p.setBinaryStream(9, (InputStream)itemDetails.get("img5"));
		p.executeUpdate();
		return "success";
		}catch(SQLIntegrityConstraintViolationException e) {
			return "already";
		}
	}
	public ArrayList<HashMap> getAllItems() throws Exception{
		PreparedStatement p=c.prepareStatement(
				"select * from items");
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> items=new ArrayList();
		while(rs.next()) {
			HashMap item=new HashMap();
			item.put("name",rs.getString("name"));
			item.put("price",rs.getDouble("price"));
			item.put("qty",rs.getInt("qty"));
			item.put("info",rs.getString("info"));
			items.add(item);
		}
		return items;
	}
	public ArrayList<HashMap> getSearchItems(String in) throws Exception{
		PreparedStatement p=c.prepareStatement(
				"select * from items where name like ?");
		p.setString(1,"%"+in+"%");
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> items=new ArrayList();
		while(rs.next()) {
			HashMap item=new HashMap();
			item.put("name",rs.getString("name"));
			item.put("price",rs.getDouble("price"));
			item.put("qty",rs.getInt("qty"));
			item.put("info",rs.getString("info"));
			items.add(item);
		}
		return items;
	}
	public HashMap getItemByName(String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
				"select * from items where name=?");
		p.setString(1,n);
		ResultSet rs=p.executeQuery();
		HashMap item=null;
		if(rs.next()) {
			item=new HashMap();
			item.put("name",rs.getString("name"));
			item.put("price",rs.getDouble("price"));
			int q=rs.getInt("qty");
			if(q<=0) {
				return null;
			}
			item.put("qty",q);
			item.put("info",rs.getString("info"));
		}
		return item;
	}
	public String updatePrice(double pr,String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update items set price=? where name=?");
		p.setDouble(1,pr);
		p.setString(2,n);
		p.executeUpdate();
		return "success";
	}
	public String updateQty(int q,String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update items set qty=? where name=?");
		p.setInt(1,q);
		p.setString(2,n);
		p.executeUpdate();
		return "success";
	}
	public String updateInfo(String i,String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update items set info=? where name=?");
		p.setString(1,i);
		p.setString(2,n);
		p.executeUpdate();
		return "success";
	}
	public String updatePhoto1(InputStream is,String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update items set img1=? where name=?");
		p.setBinaryStream(1,is);
		p.setString(2,n);
		p.executeUpdate();
		return "success";
	}
	public String updatePhoto2(InputStream is,String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update items set img2=? where name=?");
		p.setBinaryStream(1,is);
		p.setString(2,n);
		p.executeUpdate();
		return "success";
	}
	public String updatePhoto3(InputStream is,String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update items set img3=? where name=?");
		p.setBinaryStream(1,is);
		p.setString(2,n);
		p.executeUpdate();
		return "success";
	}
	public String updatePhoto4(InputStream is,String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update items set img4=? where name=?");
		p.setBinaryStream(1,is);
		p.setString(2,n);
		p.executeUpdate();
		return "success";
	}
	public String updatePhoto5(InputStream is,String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update items set img5=? where name=?");
		p.setBinaryStream(1,is);
		p.setString(2,n);
		p.executeUpdate();
		return "success";
	}
	public String deleteItem(String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update items set qty=0 where name=?");
		p.setString(1,n);
		p.executeUpdate();
		return "success";
	}
	public String deleteItemCart(int itemId) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"delete from cart where cart_id=?");
		p.setInt(1,itemId);
		p.executeUpdate();
		return "success";
	}
	public int cartCount(String e) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select count(*) from cart where user_email=?");
		p.setString(1,e);
		ResultSet rs=p.executeQuery();
		int x=0;
		if(rs.next())
			x=rs.getInt(1);
		return x;
	}
	public HashMap getCart(String e) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select * from cart where user_email=?");
		p.setString(1,e);
		ResultSet rs=p.executeQuery();
		HashMap itemIdsNames=new HashMap();
		while(rs.next())
			itemIdsNames.put(rs.getInt("cart_id"),rs.getString("item_name"));
		return itemIdsNames;
	}
	public String addAddress(String e,String a) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"insert into addresses (email,address)values(?,?)");
		p.setString(1,e);
		p.setString(2,a);
		p.executeUpdate();
		return "success";
	}
	public HashMap getAddress(String e) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select * from addresses where email=?");
		p.setString(1,e);
		ResultSet rs=p.executeQuery();
		HashMap addresses=new HashMap();
		while(rs.next())
			addresses.put(rs.getInt("address_id"),rs.getString("address"));
		return addresses;
	}
	public String removeAddress(int addressId) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"delete from addresses where address_id=?");
		p.setInt(1,addressId);
		p.executeUpdate();
		return "success";
	}
	public String addOrder(HashMap orderDetails) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"insert into orders (email,address,name,phone,amount,gst,shipping_charge,payment_mode,order_date,order_time,order_status)values(?,?,?,?,?,?,?,?,CURDATE(),CURTIME(),'placed')");
		p.setString(1,(String)orderDetails.get("email"));
		p.setString(2,(String)orderDetails.get("address"));
		p.setString(3,(String)orderDetails.get("name"));
		p.setString(4,(String)orderDetails.get("phone"));
		p.setDouble(5,(Double)orderDetails.get("amount"));
		p.setDouble(6,(Double)orderDetails.get("gst"));
		p.setDouble(7,(Double)orderDetails.get("shippingCharge"));
		p.setString(8,(String)orderDetails.get("paymentMode"));
		p.executeUpdate();
		return "success";
		
	}
	public int getOrderID() throws Exception{
		PreparedStatement p=c.prepareStatement(
				"select max(order_id) from orders");
		ResultSet rs=p.executeQuery();
		rs.next();
		return rs.getInt(1);
	}
	public String addOrderItem(int oid,String name,double price,InputStream photo) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"insert into order_items (order_id,item_name,item_price,item_photo) values(?,?,?,?)");
		p.setInt(1,oid);
		p.setString(2,name);
		p.setDouble(3,price);
		p.setBinaryStream(4,photo);
		int x=p.executeUpdate();
		if(x!=0)
			return "success";
		else
			return "failed";
	}
	public ArrayList<HashMap> getUserOrders(String email) throws Exception{
		PreparedStatement p=c.prepareStatement(
				"select * from orders where email=? order by order_date DESC");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> orders=new ArrayList();
		while(rs.next()) {
			HashMap order=new HashMap();
			order.put("order_id",rs.getInt("order_id"));
			order.put("order_date",rs.getDate("order_date"));
			order.put("order_time",rs.getTime("order_time"));
			order.put("amount",rs.getDouble("amount"));
			order.put("status",rs.getString("order_status"));
			order.put("address",rs.getString("address"));
			order.put("phone",rs.getString("phone"));
			order.put("name",rs.getString("name"));
			order.put("delivery_date",rs.getDate("delivery_date"));
			orders.add(order);
		}
		return orders;
	}
	public ArrayList<HashMap> getOrderItems(int oid) throws Exception{
		PreparedStatement p=c.prepareStatement(
				"select * from order_items where order_id=?");
		p.setInt(1, oid);
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> orderItems=new ArrayList();
		while(rs.next()) {
			HashMap orderItem=new HashMap();
			orderItem.put("item_name",rs.getString("item_name"));
			orderItem.put("item_price",rs.getDouble("item_price"));
			orderItem.put("order_item_id",rs.getInt("order_item_id"));
			orderItems.add(orderItem);
		}
		return orderItems;
	}
	public ArrayList<HashMap> getAllOrders() throws Exception{
		PreparedStatement p=c.prepareStatement(
				"select * from orders order by order_date DESC");
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> orders=new ArrayList();
		while(rs.next()) {
			HashMap order=new HashMap();
			order.put("order_id",rs.getInt("order_id"));
			order.put("order_date",rs.getDate("order_date"));
			order.put("order_time",rs.getTime("order_time"));
			order.put("amount",rs.getDouble("amount"));
			order.put("status",rs.getString("order_status"));
			order.put("address",rs.getString("address"));
			order.put("phone",rs.getString("phone"));
			order.put("name",rs.getString("name"));
			order.put("delivery_date",rs.getDate("delivery_date"));
			orders.add(order);
		}
		return orders;
	}

	public ArrayList<HashMap> getOrdersByDate(java.sql.Date d) throws Exception{
		PreparedStatement p=c.prepareStatement(
				"select * from orders where order_date=? order by order_date DESC");
		p.setDate(1, d);
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> orders=new ArrayList();
		while(rs.next()) {
			HashMap order=new HashMap();
			order.put("order_id",rs.getInt("order_id"));
			order.put("order_date",rs.getDate("order_date"));
			order.put("order_time",rs.getTime("order_time"));
			order.put("amount",rs.getDouble("amount"));
			order.put("status",rs.getString("order_status"));
			order.put("address",rs.getString("address"));
			order.put("phone",rs.getString("phone"));
			order.put("name",rs.getString("name"));
			order.put("email",rs.getString("email"));
			order.put("delivery_date",rs.getDate("delivery_date"));
			orders.add(order);
		}
		return orders;
	}
	public String updateOrderStatus(int oid,String s) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update orders set order_status=? where order_id=?");
		p.setString(1,s);
		p.setInt(2,oid);
		p.executeUpdate();
		return "success";
	}
	public String updateItemQtyfromOrder(String n) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"update items set qty=qty+1 where name=?");
		p.setString(1,n);
		p.executeUpdate();
		return "success";
	}
	public String addSlide(InputStream is) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"insert into slides (img) values (?)");
		p.setBinaryStream(1,is);
		p.executeUpdate();
		return "success";
	}
	public ArrayList getAllSlideIds() throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select slide_id from slides");
		ResultSet rs=p.executeQuery();
		ArrayList ids=new ArrayList();
		while(rs.next()) {
			ids.add(rs.getInt(1));
		}
		return ids;
	}
	public byte[] getSlide(int id) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"select img from slides where slide_id=?");
		p.setInt(1,id);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			byte b[]=rs.getBytes(1);
			if(b.length!=0) {
				return b;
			}else {
				return null;
			}
		}	
		else {
			return null;
		}
			
	}
	public String deleteSlide(int id) throws Exception{
		PreparedStatement p=c.prepareStatement(
	"delete from slides where slide_id=?");
		p.setInt(1,id);
		p.executeUpdate();
		return "success";
	}
}
