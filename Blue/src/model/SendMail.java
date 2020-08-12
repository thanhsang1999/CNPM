package model;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendMail {
	public static void init() {
		// khai báo thư viện và host name, công gửi, địa chỉ email gửi
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", SendMail.HOST_NAME);
        props.put("mail.smtp.socketFactory.port", SendMail.SSL_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", SendMail.SSL_PORT);
 
        // khai báo session email để gửi gồm tài khoản password
        session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SendMail.APP_EMAIL, SendMail.APP_PASSWORD);
            }
        });
 
	}
	public static Session session;
	public static final String HOST_NAME = "smtp.gmail.com";
	 
    public static final int SSL_PORT = 465; // Port for SSL
 
    public static final int TSL_PORT = 587; // Port for TLS/STARTTLS
 
    public static final String APP_EMAIL = "block33011@gmail.com"; // your email
 
    public static final String APP_PASSWORD = "sing3301"; // your password
 
    public static final String RECEIVE_EMAIL = "block33011@gmail.com"; 

	/**
	 *  gửi mail 
	 *  @param subject utf-8
	 *  @param htmlContent tiêu đề của email
	 *  @param receive_email nội dung của email
	 *  */
	public static void sendMail(String subject, String htmlContent, String receive_email) {
		// khởi tạo cấu hình email
		init();
        // 2) compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SendMail.APP_EMAIL));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(receive_email));
 
            // 3) create HTML content
            message.setSubject(subject,"UTF-8");
            message.setContent(htmlContent, "text/html;charset=UTF-8");
             
            // 4) send message -  gửi mail và kết thúc
            Transport.send(message);
            
            System.out.println("Message sent successfully");
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }
	 public static void main(String[] args) {
		 String subject="HTML Message";
		 String htmlContent = "<h1>Welcome to <a href=\"localhost:8080:ProgramWebProject\">GP Coder</a></h1>" +
                 "<img src=\"https://gpcoder.com/wp-content/uploads/2017/10/Facebook_Icon_GP_2-300x180.png\" " + " width=\"300\" " + " height=\"180\" " + " border=\"0\" " + " alt=\"gpcoder.com\" />";
        
		 sendMail(subject, htmlContent , SendMail.RECEIVE_EMAIL);
	 }
		 
	        

}
