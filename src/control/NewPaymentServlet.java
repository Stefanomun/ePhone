package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AddressModelDS;
import model.PymentModelDS;
import model.UserBean;

/**
 * Servlet implementation class NewPaymentServlet
 */
@WebServlet("/NewPaymentServlet")
public class NewPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String numero = request.getParameter("numero");
		String circuito = request.getParameter("circuito");
		String cvv = request.getParameter("cvv");
		String scadenza = request.getParameter("scadenza");
		String nome_titolare = request.getParameter("nome_titolare");
		String cognome_titolare = request.getParameter("cognome_titolare");
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		String id_utente = user.getUsername();
		PymentModelDS model = new PymentModelDS();
		model.insert(numero, circuito, cvv, scadenza, nome_titolare, cognome_titolare, id_utente);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PaymentsServlet?action=view&subaction=0");
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
