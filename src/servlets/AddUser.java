package servlets;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			String email=request.getParameter("email");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String gender=request.getParameter("gender");
			String pass=request.getParameter("password");
			String cpass=request.getParameter("cpassword");
			
			if(pass.equals(cpass)) {
			java.util.HashMap userDetails = new java.util.HashMap();
	        userDetails.put("name", name);
	        userDetails.put("email", email);
	        userDetails.put("phone", phone);
	        userDetails.put("gender", gender);
	        userDetails.put("password", pass);
	        String otp=(int)(Math.random()*10000) +"";
	        
	        db.DbConnect db=new db.DbConnect();
		    String result=db.addUser(userDetails,otp);
		    db.dbDisconnect();
		    if (result.equalsIgnoreCase("success")) {
		    	
		    	//mail send code using GMAIL
		    	try {
		    	final String SEmail="YOUR Email";
                final String SPass="YOUR Password";
                final String REmail=email;
                final String Sub="Email Id verification OTP from SkyFoot!";
                final String Body="Your Email Id: "+email+" and OTP: "+otp;
                
	            Properties props=new Properties();
	            props.put("mail.smtp.host","smtp.gmail.com");
	            props.put("mail.smtp.socketFactory.port","465");
	            props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	            props.put("mail.smtp.auth","true");
	            props.put("mail.smtp.port","465");
	            Session ses=Session.getInstance(props,
	            new javax.mail.Authenticator() {
	                protected PasswordAuthentication getPasswordAuthentication(){
	                    return new PasswordAuthentication(SEmail,SPass);
	                }
	            }
	            );
	            Message message=new MimeMessage(ses);
	            message.setFrom(new InternetAddress(SEmail));
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(REmail));
	            message.setSubject(Sub);
	            message.setContent(Body,"text/html" );
	            Transport.send(message);
	            session.setAttribute("msg","Go Check your Email Account and verify email.!");
		    	}catch(Exception e) {
		    		session.setAttribute("msg","Go Check your Email Account and verify email.!"+e);	
		    	}
		    	response.sendRedirect("home.jsp");
		    	
		    }else if(result.equalsIgnoreCase("already")) {
		    	session.setAttribute("msg","Email ID Already Exist!");
		        response.sendRedirect("home.jsp");
		    }
			}else {
				session.setAttribute("msg","Password and Confirm-Password not matched!");
		        response.sendRedirect("home.jsp");
			}
		}catch(Exception e) {
			session.setAttribute("exception",e);
	        response.sendRedirect("exceptionPage2.jsp");
		}
	}

}
