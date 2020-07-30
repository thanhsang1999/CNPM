package controller.web.page.information;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ConnectionDB;
import model.MD5;
import model.User;

/**
 * Servlet implementation class thaydoimk
 */
@WebServlet("/web/thaydoimk")
public class thaydoimk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thaydoimk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		todo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		todo(request, response);
	}

	private void todo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String passold = request.getParameter("passold");
				String passnew1 = request.getParameter("passnew1");
				String passnew2 = request.getParameter("passnew2");
				String sqlDOIMK = "UPDATE account set `PASSWORD`=? WHERE ID_ACCOUNT=?;";
				String error = "";
				try {
					String tmppassUserInput = MD5.convertHashToString(passold);
					User u = (User)request.getSession().getAttribute("user");
					if (u!=null) {
						if (tmppassUserInput.equals(u.getPass())) {
							if (passnew1.equals(passnew2)) {
								try {
									PreparedStatement pre = ConnectionDB.prepareStatement(sqlDOIMK);
									passnew1 = MD5.convertHashToString(passnew1);
									pre.setString(1, passnew1);
									pre.setString(2, u.getId());
									pre.executeUpdate();
									u.setPass(passnew1);
									request.getSession().setAttribute("user", u);
									
								} catch (ClassNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								
							}else {
								error = "Password Mới Không Trùng Nhau";
							}
						}else {
							error = "Password Cũ Không Đúng";
						}
					}else {
						response.sendRedirect(request.getContextPath());
					}
				} catch (NoSuchAlgorithmException e) {
					
					e.printStackTrace();
				}
				request.setAttribute("error", error);
				request.getRequestDispatcher("/web/doimk.jsp").forward(request, response);
	}

}
