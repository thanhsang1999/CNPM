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
import model.MD5;
import model.Tools;
import model.User;

@WebServlet("/web/confirmmailpassword")
public class confirmmailpassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public confirmmailpassword() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        todo(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        todo(request, response);
    }

    private void todo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html"); 
        
        String key = Tools.getParameter(request, "key");
        System.out.println("Key: "+key);
        if(!key.matches("\\w{3,}")) {
        	return;
        }
       
        String sql = "SELECT * from mailpassword WHERE `key`=?";
		PreparedStatement ps;
		ResultSet rs = null;
		try {
			ps = ConnectionDB.prepareStatement(sql);
			ps.setString(1, key);
			rs = ps.executeQuery();
			if(rs.next()) {
				String id = rs.getString("ID_ACCOUNT");
				System.out.println(id);
				sql = "DELETE FROM mailpassword WHERE `key`=?";
				ps = ConnectionDB.prepareStatement(sql);
				ps.setString(1, key);
				ps.executeUpdate();
				ps.close();
				sql = "UPDATE ACCOUNT SET PASSWORD=? WHERE `ID_ACCOUNT`=?";
				ps = ConnectionDB.prepareStatement(sql);
				try {
					ps.setString(1, MD5.convertHashToString(key));
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
				ps.setString(2, id);
				ps.executeUpdate();
				ps.close();
				
			}
			response.getWriter().print("Mật khẩu của bạn là: "+key);
		
		
		
		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
        

    }

}
