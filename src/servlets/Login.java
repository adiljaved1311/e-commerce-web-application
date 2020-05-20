package servlets;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			String email = request.getParameter("email");
		    String password = request.getParameter("password");
		    
		    db.DbConnect db=new db.DbConnect();
		    java.util.HashMap userDetails=db.checkLogin(email, password);
		    db.dbDisconnect();
		    if (userDetails!=null) {
		        String status=(String)userDetails.get("status");
		        if(status.equalsIgnoreCase("Verified")) {
		        	session.setAttribute("userDetails", userDetails);
		        	response.sendRedirect("profile.jsp");
		        }else {
		        	response.sendRedirect("emailVerification.jsp");
		        }
		    } else {
		        session.setAttribute("msg","Wrong Entries!");
		        response.sendRedirect("home.jsp");
		    }
		}catch(Exception e) {
			session.setAttribute("exception",e);
	        response.sendRedirect("exceptionPage2.jsp");
		}
	}

}
