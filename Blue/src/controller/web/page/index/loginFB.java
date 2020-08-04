package controller.web.page.index;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;


@WebServlet("/web/loginFB")
public class loginFB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public loginFB() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
        
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        response.setContentType("text/html;charset=utf-8");
        
			String id=request.getParameter("idFace");
			String name = request.getParameter("nameFace");
			if(id!=null&&name!=null) {
				User u= new User();
				u.setId(id);
				u.setHoten(name);
	            HttpSession session = request.getSession();
	            session.setAttribute("user", u);
	            response.getWriter().write("okFB");
			}
			
	}
}
