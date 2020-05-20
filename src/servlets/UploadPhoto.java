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

@WebServlet("/UploadPhoto")
@MultipartConfig
public class UploadPhoto extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			java.util.HashMap userDetails=
			(java.util.HashMap)session.getAttribute("userDetails");
			if(userDetails!=null){
				Part p=request.getPart("photo");
				InputStream is=p.getInputStream();
				String email=(String)userDetails.get("email");
				db.DbConnect db=new db.DbConnect();
			    String result=db.uploadPhoto(is, email);
			    db.dbDisconnect();
			    if (result.equalsIgnoreCase("success")) {
			    	session.setAttribute("msg","Photo Updated Successfully!");
			        response.sendRedirect("editProfile.jsp");
			    }else {
			    	session.setAttribute("msg","Photo Updation Failed!");
			        response.sendRedirect("editProfile.jsp");
			    }
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
