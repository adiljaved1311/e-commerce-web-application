package servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/AddSlide")
@MultipartConfig
public class AddSlide extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			java.util.HashMap userDetails=
			(java.util.HashMap)session.getAttribute("userDetails");
			if(userDetails!=null){
				Part p=request.getPart("slide");
				InputStream is=p.getInputStream();
				db.DbConnect db=new db.DbConnect();
			    String result=db.addSlide(is);
			    db.dbDisconnect();
			    if (result.equalsIgnoreCase("success")) {
			    	session.setAttribute("msg","Slide Inserted Successfully!");
			        response.sendRedirect("slides.jsp");
			    }else {
			    	session.setAttribute("msg","Slide Insertion Failed!");
			        response.sendRedirect("slides.jsp");
			    }
			}else{
				session.setAttribute("msg","Plz Login First!");
			    response.sendRedirect("adminLogin.jsp");
			}
		}catch(Exception e) {
			session.setAttribute("exception",e);
	        response.sendRedirect("exceptionPage2.jsp");
		}
	}

}
