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

@WebServlet("/AddItem")
@MultipartConfig
public class AddItem extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			java.util.HashMap userDetails=
			(java.util.HashMap)session.getAttribute("userDetails");
			if(userDetails!=null){
				String name=request.getParameter("name");
				double price=Double.parseDouble(request.getParameter("price"));
				int qty=Integer.parseInt(request.getParameter("qty"));
				String info=request.getParameter("info");
				Part p=request.getPart("img1");
				InputStream img1=null;
				if(p!=null)
					img1=p.getInputStream();
				p=request.getPart("img2");
				InputStream img2=null;
				if(p!=null)
					img2=p.getInputStream();
				p=request.getPart("img3");
				InputStream img3=null;
				if(p!=null)
					img3=p.getInputStream();
				p=request.getPart("img4");
				InputStream img4=null;
				if(p!=null)
					img4=p.getInputStream();
				p=request.getPart("img5");
				InputStream img5=null;
				if(p!=null)
					img5=p.getInputStream();
				java.util.HashMap itemDetails=new java.util.HashMap();
				itemDetails.put("name",name);
				itemDetails.put("qty",qty);
				itemDetails.put("price",price);
				itemDetails.put("info",info);
				itemDetails.put("img1",img1);
				itemDetails.put("img2",img2);
				itemDetails.put("img3",img3);
				itemDetails.put("img4",img4);
				itemDetails.put("img5",img5);
				db.DbConnect db=new db.DbConnect();
			    String result=db.addItem(itemDetails);
			    db.dbDisconnect();
			    if (result.equalsIgnoreCase("success")) {
			    	session.setAttribute("msg","Item Added Successfully!");
			        response.sendRedirect("adminItems.jsp");
			    }else if(result.equalsIgnoreCase("already")){
			    	session.setAttribute("msg","Item Already Exist!");
			        response.sendRedirect("adminItems.jsp");
			    }else {
			    	session.setAttribute("msg","Item Insertion Failed");
			        response.sendRedirect("adminItems.jsp");
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
