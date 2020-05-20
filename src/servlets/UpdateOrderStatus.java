package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UpdateOrderStatus")
@MultipartConfig
public class UpdateOrderStatus extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			java.util.HashMap userDetails=
			(java.util.HashMap)session.getAttribute("userDetails");

			String page=request.getParameter("page");
			if(userDetails!=null){
				int order_id=Integer.parseInt(request.getParameter("order_id"));
				String order_status=request.getParameter("order_status");
				db.DbConnect db=new db.DbConnect();
				db.updateOrderStatus(order_id, order_status);
				if(order_status.equalsIgnoreCase("cancel") || order_status.equalsIgnoreCase("reject") || order_status.equalsIgnoreCase("AcceptReturn"))
				{	
					ArrayList<HashMap> OrderItems=db.getOrderItems(order_id);
					for(HashMap orderItem:OrderItems) {
						db.updateItemQtyfromOrder((String)orderItem.get("item_name"));
					}
				}
				db.dbDisconnect();
				response.sendRedirect(page);
			}else{
				session.setAttribute("msg","Plz Login First!");
			    response.sendRedirect(page);
			}
		}catch(Exception e) {
			session.setAttribute("exception",e);
	        response.sendRedirect("exceptionPage2.jsp");
		}
	}
}
