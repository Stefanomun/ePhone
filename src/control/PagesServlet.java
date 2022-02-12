package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AddressBean;
import model.AddressModelDS;
import model.UserBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/PagesServlet")
public class PagesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PagesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equals("signup")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SignUp.jsp");
			dispatcher.forward(request, response);
		}
		else if(action.equals("signin")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SignIn.jsp");
			dispatcher.forward(request, response);
		}
		else if(action.equals("user")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PrivateArea.jsp");
			dispatcher.forward(request, response);
		}
		else if(action.equals("dp")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Data.jsp");
			dispatcher.forward(request, response);
		}
		else if(action.equals("admin")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminDashboard.jsp");
			dispatcher.forward(request, response);
		}
		else if(action.equals("sm")){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Creator.jsp");
			dispatcher.forward(request, response);
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
