package controller.web.page.index;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
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

@WebServlet("/web/signupweb")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//khởi tạo biến để lưu giá trị tạm
	String uname;
	String pass;
	String pass2;
	String nemail;
	String hoten;

	public signup() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		todo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		todo(request, response);
	}

	private void todo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
       if(validateData(request, response)==true) {
    	   checkAndCreateAccount(request, response);
       }
	}

	/**
	 * kiểm tra tài khoản đã tồn tại hay chưa, nếu hợp lệ cho đăng kí và đăng nhập
	 * vào hệ thống
	 */
	private void checkAndCreateAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String sql = "Select * from account where USERNAME=?";
	        String sqlcount = "SELECT COUNT(*) FROM `account`";
	        
	        ResultSet rs = null;
	        User userss = new User();
	        String sqlin = "INSERT INTO `account` VALUES (?,?,?,?,?,?);";
	        String sql_ct_account ="INSERT INTO `ct_account`(ID_ACCOUNT,EMAIL) VALUES (?,?);";
	        	try {
	        		Statement statement = ConnectionDB.createStatement();
	        		ResultSet rscount = statement.executeQuery(sqlcount);
	        		rscount.first();
	        		int count = rscount.getInt(1);
	        		System.out.println(count);
					PreparedStatement ps= ConnectionDB.prepareStatement(sql);
					ps.setString(1, uname);
					rs = ps.executeQuery();
					rs.last();
					int tmpcountaccount = rs.getRow();
					rs.first();
					// kiểm tra tài khoản đã tồn tại hay chưa
					if ((tmpcountaccount==0)&&pass.equals(pass2)) {
						PreparedStatement adddkDTB = ConnectionDB.prepareStatement(sqlin);
						PreparedStatement addCTACDTB = ConnectionDB.prepareStatement(sql_ct_account);
						String idAc = "TK"+(count+1);
						adddkDTB.setString(1, idAc);
						adddkDTB.setString(2,uname );
						try {
							pass= MD5.convertHashToString(pass) ;
						} catch (NoSuchAlgorithmException e) {
							e.printStackTrace();
						}
						adddkDTB.setString(3,pass );
						adddkDTB.setString(4,hoten );
						adddkDTB.setString(5,"5" );
						adddkDTB.setString(6,"1" );
						adddkDTB.executeUpdate();
						addCTACDTB.setString(1, idAc);
						addCTACDTB.setString(2, nemail);
						addCTACDTB.executeUpdate();
						HttpSession session = request.getSession();
						userss.setId("TK"+(count+1));
						userss.setUname(uname);
						userss.setPass(pass);
						userss.setHoten(hoten);
						userss.setLevel(5);
						userss.setActive(1);
						session.setAttribute("user", userss);
						//response.sendRedirect(request.getContextPath()+"/web/index");
						response.getWriter().print("OK");
					}else {
						// thông báo lỗi khi phát hiện tài khoản đã tồn tại
						response.getWriter().print("Tài Khoản Đã Tồn Tại");
					}
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}
	}

	/**
	 * kiểm tra thông tin người dùng nhập có đúng yêu cầu hay không, nếu đúng thì
	 * true tiến hành bước kiểm tra tài khoản tồn tại tại phương thức
	 * checkAndCreateAccount, nếu sai thì trả về thông báo lỗi cho người dùng.
	 */ 
	private boolean validateData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// lấy dữ liệu tài khoản và kiểm tra lỗi có ít hơn 3 kí tự hay không
		uname = Tools.getParameter(request, "uname");
		System.out.println("Username: " + uname);
		if (!uname.matches("\\w{3,}")) {
			response.getWriter().print("Username not corect");
			return false;
		}
		// lấy dữ liệu password và kiểm tra lỗi 2 mật khẩu có trùng nhau hay không
		pass = Tools.getParameter(request, "pass");
		pass2 = Tools.getParameter(request, "pass2");
		System.out.println("Password: " + (pass.equals(pass2)));
		if (!pass.equals(pass2) || !pass.matches(".{3,}")) {
			response.getWriter().print("Password not corect");
			return false;
		}
		// lấy dữ liệu họ tên và kiểm tra độ dài
		hoten = Tools.getParameter(request, "hoten");
		System.out.println("Họ và tên: " + hoten);
		if (!hoten.matches(".{3,}")) {
			response.getWriter().print("Họ tên chưa điền");
			return false;
		}
		// lấy dữ liệu email và kiểm tra định dạng
		nemail = Tools.getParameter(request, "nemail");
		System.out.println("nemail: " + nemail);
		if (!nemail.matches("^[a-z][a-z0-9_\\.]{5,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}$")) {
			response.getWriter().print("Email không đúng định dạng");
			return false;
		}
		return true;
	}
}
