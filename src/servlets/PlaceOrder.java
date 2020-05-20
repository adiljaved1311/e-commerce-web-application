package servlets;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			java.util.HashMap userDetails=
			(java.util.HashMap)session.getAttribute("userDetails");
			if(userDetails!=null){

		String address=request.getParameter("address");
		if(address!=null) {
		String paymentMode=request.getParameter("paymentMode");
		String email=(String)userDetails.get("email");
		String name=(String)userDetails.get("name");
		String phone=(String)userDetails.get("phone");
		
		db.DbConnect db=new db.DbConnect();
		HashMap itemIdsNames=db.getCart(email);
		double total=0;
		Iterator i=itemIdsNames.entrySet().iterator();
		while(i.hasNext()){
			Map.Entry entry=(Map.Entry)i.next();
			String itemName=(String)entry.getValue();
			HashMap iDetail=db.getItemByName(itemName);
			if(iDetail==null){
				continue;
			}
			double price=(double)iDetail.get("price");
			total+=price;
		}
		double shippingCharge=40;
		double gst=(total+shippingCharge)*0.18;
		double netAmount=total+gst+shippingCharge;
		java.util.HashMap orderDetails = new java.util.HashMap();
		orderDetails.put("email", email);
		orderDetails.put("name", name);
		orderDetails.put("phone", phone);
		orderDetails.put("address", address);
		orderDetails.put("amount", netAmount);
		orderDetails.put("gst", gst);
		orderDetails.put("shippingCharge", shippingCharge);
		orderDetails.put("paymentMode", paymentMode);
		String result=db.addOrder(orderDetails);
	    if (result.equalsIgnoreCase("success")) {
	    	int orderID=db.getOrderID();
	    	itemIdsNames=db.getCart(email);
			i=itemIdsNames.entrySet().iterator();
			while(i.hasNext()){
				Map.Entry entry=(Map.Entry)i.next();
				int cartId=(Integer)entry.getKey();
				String itemName=(String)entry.getValue();
				HashMap iDetail=db.getItemByName(itemName);
				if(iDetail==null){
					continue;
				}
				byte b[]=db.getItemPhoto(itemName, "img1");
				InputStream iPhoto = new ByteArrayInputStream(b);
				double itemPrice=(double)iDetail.get("price");
				db.addOrderItem(orderID, itemName, itemPrice, iPhoto);
				db.deleteItemCart(cartId);
				int qty=(int)iDetail.get("qty");
				db.updateQty(qty-1, itemName);
			}
			db.dbDisconnect();
			
			try {
			//send SMS Code
			String apiKey = "apikey=" + "YourAPI Key goes here";
			String message = "&message=" + "MESSAGE CONTENT goes here";
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + "PHONE NO";
			
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			session.setAttribute("msg","Order Placed Successfully!<br> "+stringBuffer);
			
			}catch(Exception e) {
				session.setAttribute("msg","Order Placed Successfully! "+e);
			}
	    	response.sendRedirect("profile.jsp");
	    }else {
			session.setAttribute("msg","Something went wrong while ordering!");
	        response.sendRedirect("confirmCart.jsp");
		}
		}else{
			session.setAttribute("msg","Plz Select the Address!");
		    response.sendRedirect("confirmCart.jsp");
		}
			}else{
				session.setAttribute("msg","Plz Login First!");
			    response.sendRedirect("home.jsp");
			}
		}catch(Exception e) {
			session.setAttribute("exception",e);
	        response.sendRedirect("exceptionPage2.jsp");
		}
	}

}
