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

import model.AddressBean;
import model.AddressModelDS;
import model.Cart;
import model.OrderModelDS;
import model.PaymentBean;
import model.PymentModelDS;
import model.UserBean;
import model.UserModelDS;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckoutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String step = request.getParameter("step");
		String address = null;
		String carta = null;
		OrderModelDS model = new OrderModelDS();
		if(session.getAttribute("user") == null) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SignIn.jsp");
			dispatcher.forward(request, response);
		}
		else if(step.equals("acquisto")) {
			UserBean user = (UserBean) session.getAttribute("user");
			String id_utente = user.getUsername();
			PaymentBean cartaAcq = (PaymentBean) session.getAttribute("carta");
			String id_pagamento = cartaAcq.getNumero();
			boolean done = false;
			try {
				done = model.acquisto(cart.getPhones(), cart.getClick(), id_utente, id_pagamento);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(done) {
				session.setAttribute("cart", null);
				session.setAttribute("address", null);
				session.setAttribute("carta", null);
				response.sendRedirect("AcquistoEffettuato.jsp");
			}
			
		}
		else {
			if(step.equals("1")) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AddressServlet?action=view&subaction=checkout");
				dispatcher.forward(request, response);
			}
			else if(step.equals("2")) {
				address = request.getParameter("address");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PaymentsServlet?action=view&subaction=checkout");
				dispatcher.forward(request, response);
				AddressModelDS aModel = new AddressModelDS();
				AddressBean addressB;
				try {
					addressB = aModel.addressByID(address);
					session.setAttribute("address", addressB);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(step.equals("3")) {
				carta = request.getParameter("carta");
				PymentModelDS pModel = new PymentModelDS();
				try {
					PaymentBean cartaB = pModel.paymentByID(carta);
					session.setAttribute("carta", cartaB);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RiepilogoOrdine.jsp");
				dispatcher.forward(request, response);
			}
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
