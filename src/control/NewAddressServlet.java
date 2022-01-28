package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AddressModelDS;
import model.UserBean;

/**
 * Servlet implementation class NewAddressServlet
 */
@WebServlet("/NewAddressServlet")
public class NewAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comune = request.getParameter("comune");
		String provincia = request.getParameter("provincia");
		String cap = request.getParameter("cap");
		String via = request.getParameter("via");
		int civico = Integer.parseInt(request.getParameter("civico"));
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		String id_utente = user.getUsername();
		AddressModelDS model = new AddressModelDS();
		model.insert(comune, civico, via, cap, provincia, id_utente);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AddressServlet?action=view&subaction=0");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
