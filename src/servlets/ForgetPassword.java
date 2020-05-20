package servlets;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=null;
		try {
			session=request.getSession();
			String email=request.getParameter("email");

	        db.DbConnect db=new db.DbConnect();
		    String password=db.getUserPasswordByEmail(email);
		    db.dbDisconnect();
		    if (password!=null) {
		    	//mail send code using GMAIL
		    	try {
		    	final String SEmail="YOUR Email";
                final String SPass="YOUR Password";
                final String REmail=email;
                final String Sub="Your Password is Here from SkyFoot!";
                final String Body="Your Email Id: "+email+" and Password: "+password;
                
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
		    	}catch(Exception e) {
		    		session.setAttribute("msg","Password Send Failed! "+e.getMessage());
		    	}
		    	session.setAttribute("msg","Password Send Successfully to your registered Email ID! ");
		    	response.sendRedirect("home.jsp");
		    	
		    }else {
				session.setAttribute("msg","Email Id Does not Exist!");
		        response.sendRedirect("home.jsp");
			}
		}catch(Exception e) {
			session.setAttribute("exception",e);
	        response.sendRedirect("exceptionPage2.jsp");
		}
	}

}
