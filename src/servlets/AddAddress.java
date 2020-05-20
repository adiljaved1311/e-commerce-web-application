package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddAddress")
public class AddAddress extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			java.util.HashMap userDetails = (java.util.HashMap) session.getAttribute("userDetails");
			if (userDetails != null) {
				String address=request.getParameter("address");
				String email=(String)userDetails.get("email");
						
		        db.DbConnect db=new db.DbConnect();
			    String result=db.addAddress(email,address);
			    db.dbDisconnect();
			    if (result.equalsIgnoreCase("success")) {
			    	session.setAttribute("msg","Address Added Successfully!");
			    	
			    	response.sendRedirect("confirmCart.jsp");
			    	
			    }else {
			    	session.setAttribute("msg","Address Adding Failed!");
			        response.sendRedirect("confirmCart.jsp");
			    }
			}else {
				session.setAttribute("msg","Plz Login First!");
		        response.sendRedirect("home.jsp");
			}
		}catch(Exception e) {
			session.setAttribute("exception",e);
	        response.sendRedirect("exceptionPage2.jsp");
		}
	}

}
