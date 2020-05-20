package servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/GetPhoto")
public class GetPhoto extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			java.util.HashMap userDetails=
			(java.util.HashMap)session.getAttribute("userDetails");
			if(userDetails!=null){
				
				String email=request.getParameter("email");
				db.DbConnect db=new db.DbConnect();
			    byte []photo=db.getPhoto(email);
			    db.dbDisconnect();
				if(photo==null) {
					ServletContext application=getServletContext();
					InputStream is=application.getResourceAsStream("/img/xyz.jpg");
					photo=new byte[3500];
					is.read(photo);
				}
				response.getOutputStream().write(photo);
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
