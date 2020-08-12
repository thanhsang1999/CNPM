package controller.web.page.index.mail;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		todo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		todo(request, response);
	}

	private void todo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// set kiểm kiểu dữ liệu lấy và trả về là UTF-8
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		// lấy dữ liệu username và kiểm tra độ dài
		String uname = Tools.getParameter(request, "uname");
		System.out.println("Username: " + uname);
		if (!uname.matches("\\w{3,}")) {
			response.getWriter().print("Username not corect");
			return;
		}
		try {
			String sql1 = "Select * from account where USERNAME=?";
			PreparedStatement ps1;
			ps1 = ConnectionDB.prepareStatement(sql1);

			ps1.setString(1, uname);
			ResultSet rstmp = null;
			rstmp = ps1.executeQuery();
			rstmp.last();
			int tmpcountaccount = rstmp.getRow();
			rstmp.first();
			// kiểm tra tài khoản đã tồn tại hay chưa
			if ((tmpcountaccount == 0)) {
				response.getWriter().print("Tài Khoản Không Tồn Tại");
				return;
			}
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// câu query truy xuất database
		String sql = "SELECT ct_account.ID_ACCOUNT, account.HO_TEN,ct_account.EMAIL FROM ct_account JOIN account ON ct_account.ID_ACCOUNT= account.ID_ACCOUNT WHERE account.USERNAME=? ;";
		ResultSet rs = null;
		try {
			PreparedStatement ps = ConnectionDB.prepareStatement(sql);
			ps.setString(1, uname);
			rs = ps.executeQuery();
			// khởi tạo biết lưu trũ
			String id = "";
			String name = "";
			String mail = "";
			if (rs.next()) {
				// load dữ liệu từ database lên biến
				id = rs.getString("ID_ACCOUNT");
				name = rs.getString("HO_TEN");
				mail = rs.getString("EMAIL");
				System.out.println(id);
				System.out.println(name);
				System.out.println(mail);
				ps.close();
				sql = "SELECT * from mailpassword WHERE ID_ACCOUNT=?";
				ps = ConnectionDB.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				// khởi tạo chuỗi theo thời gian hiện tại
				String key = Date.getCurrentDay().getStringByFormat("DD-MM-YYYY hh:mm:ss");
				try {
					// mã hóa chuỗi bằng MD5
					key = MD5.convertHashToString(key);
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
				if (rs.next()) {
					// update key vào database mailpassword
					ps.close();
					sql = "UPDATE mailpassword SET `key` = ? WHERE ID_ACCOUNT=?";
					ps = ConnectionDB.prepareStatement(sql);
					ps.setString(1, key);
					ps.setString(2, id);
					ps.executeUpdate();
					System.out.println("Update key");
				} else {
					// thêm key vào database mailpassword
					ps.close();
					sql = "INSERT INTO mailpassword(ID_ACCOUNT, `key`) VALUE (?, ?);";
					ps = ConnectionDB.prepareStatement(sql);
					ps.setString(1, id);

					ps.setString(2, key);
					ps.executeUpdate();
					System.out.println("Create key");
				}
				ps.close();
				// tạo chuỗi để gửi qua mail
				String htmlContent = "<a href=" + request.getScheme() + "://" + request.getServerName() + ":"
						+ request.getServerPort() + request.getContextPath() + "/web/confirmmailpassword?key=" + key
						+ ">Bấm vào đây để lấy mật khẩu</a>";
				SendMail.sendMail("Mail confirm", htmlContent, mail);
			}
			// gửi mail thành công
			String mess = "Gửi mail thành công";
			response.getWriter().print(mess);
			System.out.println(mess);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("Lỗi kết nối tới CSDL");
			request.setAttribute("err", "Sai Username hoặc mật khẩu");
		}

	}

}
