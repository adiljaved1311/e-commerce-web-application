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

@WebServlet("/EditItem")
@MultipartConfig
public class EditItem extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			java.util.HashMap userDetails=
			(java.util.HashMap)session.getAttribute("userDetails");
			if(userDetails!=null){
				String name=request.getParameter("name");
				String price=request.getParameter("price");
				String qty=request.getParameter("qty");
				String info=request.getParameter("info");
				InputStream img1=request.getPart("img1").getInputStream();
				InputStream img2=request.getPart("img2").getInputStream();
				InputStream img3=request.getPart("img3").getInputStream();
				InputStream img4=request.getPart("img4").getInputStream();
				InputStream img5=request.getPart("img5").getInputStream();
				byte b[]=null;
				img1.read(b);
				PrintWriter out=response.getWriter();
				out.print(b);
				
//				String result="";
//				db.DbConnect db=new db.DbConnect();
//				if( !price.trim().equals("")) {
//					String r=db.updatePrice(Double.parseDouble(price), name);
//					if(r.equalsIgnoreCase("success"))
//						result+="Price ";
//				}
//				if( !qty.trim().equals("")) {
//					String r=db.updateQty(Integer.parseInt(qty), name);
//					if(r.equalsIgnoreCase("success"))
//						result+="Quantity ";
//				}
//				if( !info.trim().equals("")) {
//					String r=db.updateInfo(info, name);
//					if(r.equalsIgnoreCase("success"))
//						result+="Description ";
//				}
//				if( !img1.equals("")) {
//					String r=db.updatePhoto1(img1, name);
//					if(r.equalsIgnoreCase("success"))
//						result+="Image-1 ";
//				}
//				if( !img2.equals("")) {
//					String r=db.updatePhoto2(img2, name);
//					if(r.equalsIgnoreCase("success"))
//						result+="Image-2 ";
//				}
//				if( !img3.equals("")) {
//					String r=db.updatePhoto3(img3, name);
//					if(r.equalsIgnoreCase("success"))
//						result+="Image-3 ";
//				}
//				if( !img4.equals("")) {
//					String r=db.updatePhoto4(img4, name);
//					if(r.equalsIgnoreCase("success"))
//						result+="Image-4 ";
//				}
//				if( !img5.equals("")) {
//					String r=db.updatePhoto5(img5, name);
//					if(r.equalsIgnoreCase("success"))
//						result+="Image-5 ";
//				}
//				db.dbDisconnect();
//				if( !result.equalsIgnoreCase("")) {
//					session.setAttribute("msg","Following Entry Updated: "+result);
//				}
//				response.sendRedirect("adminItemDetails.jsp?name="+name);
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
