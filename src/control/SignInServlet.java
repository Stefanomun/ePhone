package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserBean;
import model.UserModelDS;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String admin = request.getParameter("admin");
		if(admin == null)
			admin = "false";
		UserModelDS model = new UserModelDS();
		HttpSession session = request.getSession();
		UserBean utente = new UserBean();
	
		try {
			utente = model.signIn(username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(utente != null) {
			if(session.getAttribute("user") == null) {
				if(admin.equals("true")) {
					if(utente.isAmministratore()) {
						session.setAttribute("user", utente);
						session.setAttribute("admin", "yes");
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductControl");
						dispatcher.forward(request, response);
					}
					else if(!utente.isAmministratore()) {
						response.sendRedirect("NoPermission.jsp");
					}
				}
				else {
					session.setAttribute("user", utente);
					session.setAttribute("admin", "no");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductControl");
					dispatcher.forward(request, response);
				}
			}
		}
		else {
			response.sendRedirect("loginErrato.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
