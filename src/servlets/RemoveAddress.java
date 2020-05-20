package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/RemoveAddress")
@MultipartConfig
public class RemoveAddress extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			java.util.HashMap userDetails=
			(java.util.HashMap)session.getAttribute("userDetails");
			if(userDetails!=null){
				int addressId=Integer.parseInt(request.getParameter("addressId"));
				db.DbConnect db=new db.DbConnect();
				String result=db.removeAddress(addressId);
				db.dbDisconnect();
				if( !result.equalsIgnoreCase("")) {
					session.setAttribute("msg","Address Removed Successfully");
				}
				response.sendRedirect("confirmCart.jsp");
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
