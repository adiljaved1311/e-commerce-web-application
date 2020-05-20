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

@WebServlet("/GetItemPhoto")
public class GetItemPhoto extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			
				String name=request.getParameter("name");
				String img=request.getParameter("img");
				db.DbConnect db=new db.DbConnect();
			    byte []photo=db.getItemPhoto(name,img);
			    db.dbDisconnect();
				response.getOutputStream().write(photo);
			
		}catch(Exception e) {
			session.setAttribute("exception",e);
	        response.sendRedirect("exceptionPage2.jsp");
		}
	}

}
