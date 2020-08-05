package controller.web.page.index.mail;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import DB.ConnectionDB;
import model.Date;
import model.SendMail;
import model.MD5;
import model.Tools;
import model.User;

@WebServlet("/web/mailpassword")
public class mailpassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public mailpassword() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        todo(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        todo(request, response);
    }

    private void todo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        
        String uname = Tools.getParameter(request, "uname");
        System.out.println("Username: "+uname);
        if(!uname.matches("\\w{3,}")) {
        	response.getWriter().print("Username not corect");
        	return;
        }
        
        String sql = "SELECT ct_account.ID_ACCOUNT, account.HO_TEN,ct_account.EMAIL FROM ct_account JOIN account ON ct_account.ID_ACCOUNT= account.ID_ACCOUNT WHERE account.USERNAME=? ;";
        ResultSet  rs = null;
        try {
        	PreparedStatement ps= ConnectionDB.prepareStatement(sql);
        	ps.setString(1, uname);
        	rs= ps.executeQuery();
        	String id="";
        	String name="";
        	String mail="";
        	if(rs.next()) {
        		id= rs.getString("ID_ACCOUNT");
        		name= rs.getString("HO_TEN");
        		mail= rs.getString("EMAIL");
        		System.out.println(id);
        		System.out.println(name);
        		System.out.println(mail);
        		ps.close();
        		sql = "SELECT * from mailpassword WHERE ID_ACCOUNT=?";
        		ps= ConnectionDB.prepareStatement(sql);
        		ps.setString(1, id);
        		rs= ps.executeQuery();
        		String key=Date.getCurrentDay().getStringByFormat("DD-MM-YYYY hh:mm:ss");
				try {
					key = MD5.convertHashToString(key);
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
        		if(rs.next()) {
        			ps.close();
        			sql="UPDATE mailpassword SET `key` = ? WHERE ID_ACCOUNT=?";
        			ps =ConnectionDB.prepareStatement(sql);
        			ps.setString(1, key);
        			ps.setString(2, id);
        			ps.executeUpdate();
        			System.out.println("Update key");
        		}else {
        			ps.close();
        			sql ="INSERT INTO mailpassword(ID_ACCOUNT, `key`) VALUE (?, ?);";
        			ps =ConnectionDB.prepareStatement(sql);
        			ps.setString(1, id);
        			
        			ps.setString(2, key);
        			ps.executeUpdate();
        			System.out.println("Create key");
        		}
        		ps.close();
        		String htmlContent="<a href="+request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/web/confirmmailpassword?key="+key+">Bấm vào đây để lấy mật khẩu</a>";
        		SendMail.sendMail("Mail confirm", htmlContent, mail);
        	}
        	
            String mess="Gửi mail thành công";
            response.getWriter().print(mess);
            System.out.println(mess);
            
            
        } catch ( ClassNotFoundException | SQLException e ) {
            e.printStackTrace();
            System.out.println("Lỗi kết nối tới CSDL");
            request.setAttribute("err", "Sai Username hoặc mật khẩu");
        }

    }

}
