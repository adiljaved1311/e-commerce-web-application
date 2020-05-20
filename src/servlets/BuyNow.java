package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BuyNow")
public class BuyNow extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			String name=request.getParameter("name");
			java.util.HashMap userDetails=
			(java.util.HashMap)session.getAttribute("userDetails");
			if(userDetails!=null){
		db.DbConnect db=new db.DbConnect();
		String email=(String)userDetails.get("email");
	    String result=db.addToCart(name,email);
	    db.dbDisconnect();
	    if(result.equalsIgnoreCase("success")) {
	    	response.sendRedirect("cart.jsp");
	    }else {
	    	session.setAttribute("msg","Out of Stock!");
		    response.sendRedirect("itemDetails.jsp?name="+name);
	    }
			}else{
				session.setAttribute("msg","Plz Login First!");
			    response.sendRedirect("itemDetails.jsp?name="+name);
			}
		}catch(Exception e) {
			session.setAttribute("exception",e);
	        response.sendRedirect("exceptionPage2.jsp");
		}
	}

}
