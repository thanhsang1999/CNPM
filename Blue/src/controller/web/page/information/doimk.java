package controller.web.page.information;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/web/doimatkhau")
public class doimk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public doimk() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		User u = (User) request.getSession().getAttribute("user");
		if(u==null) {
			System.out.println("Chưa đăng nhập.");
			return;
		}
		try {
			u=u.checkUpdateDatabase(request.getSession());
			if(u==null) {
				System.out.println("Tài khoản bị vô hiệu hoá.");
				return;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/web/doimk.jsp").forward(request, response);
	}

}
