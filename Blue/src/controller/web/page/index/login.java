package controller.web.page.index;

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

@WebServlet("/web/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login() {
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
        	return;
        }
        String pass = Tools.getParameter(request, "pass");
        System.out.println("pass: "+pass);
        if(!pass.matches("\\w{3,}")) {
        	return;
        }
        
        String sql = "Select * from account where USERNAME=? and PASSWORD=? and ACTIVE=1";
        ResultSet rs = null;
        try {
       	 pass=MD5.convertHashToString(pass);
		} catch (NoSuchAlgorithmException e) {
			System.out.println("MD5error");
			e.printStackTrace();
		}
        try {
        	PreparedStatement ps= ConnectionDB.prepareStatement(sql);
        	ps.setString(1, uname);
        	ps.setString(2, pass);
            rs = ps.executeQuery();
            rs.last();
            int i = rs.getRow();
            if (rs != null && i == 1) {
                rs.first();
                User u= new User();
                u.setId(rs.getString("ID_ACCOUNT"));
                u.setUname(rs.getString("USERNAME"));
                u.setPass(pass);
                u.setHoten(rs.getString("HO_TEN"));
                HttpSession session = request.getSession();
                session.setAttribute("user", u);
                String mess="";
                switch (rs.getInt("LEVEL")) {
				case 0:
					mess="OK, admin";
					break;
				case 5:
					mess="OK, customer";
					break;

				default:
					break;
				}
                ps.close();
                response.getWriter().print(mess);
                System.out.println("Đăng nhập thành công");
            } else {
                request.setAttribute("err", "Sai Username hoặc mật khẩu");
                System.out.println("Sai Username hoặc mật khẩu");
                response.getWriter().print("Sorry, error");
                
            }
            
        } catch ( ClassNotFoundException | SQLException e ) {
            e.printStackTrace();
            System.out.println("Lỗi kết nối tới CSDL");
            request.setAttribute("err", "Sai Username hoặc mật khẩu");
        }

    }

}
