package servlets;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			String email = request.getParameter("email");
		    String password = request.getParameter("password");
		    
		    db.DbConnect db=new db.DbConnect();
		    java.util.HashMap userDetails=db.checkAdminLogin(email, password);
		    db.dbDisconnect();
		    if (userDetails!=null) {
		        
		        session.setAttribute("userDetails", userDetails);
		        response.sendRedirect("adminHome.jsp");
		    } else {
		        session.setAttribute("msg","Wrong Entries!");
		        response.sendRedirect("adminLogin.jsp");
		    }
		}catch(Exception e) {
			session.setAttribute("exception",e);
	        response.sendRedirect("exceptionPage2.jsp");
		}
	}

}
