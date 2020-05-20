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

@WebServlet("/DeleteSlide")
@MultipartConfig
public class DeleteSlide extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			java.util.HashMap userDetails=
			(java.util.HashMap)session.getAttribute("userDetails");
			if(userDetails!=null){
				int id=Integer.parseInt(request.getParameter("slide_id"));
				db.DbConnect db=new db.DbConnect();
				String result=db.deleteSlide(id);
				db.dbDisconnect();
				if(result.equalsIgnoreCase("success")) {
					session.setAttribute("msg","Slide Deleted Successfully!");
				}else {
					session.setAttribute("msg","Slide Deletion Failed!");
				}
				response.sendRedirect("slides.jsp");
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
