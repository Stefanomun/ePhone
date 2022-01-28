package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.PhoneBean;
import model.ProductModelDS;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		ProductModelDS model = new ProductModelDS();
		PhoneBean phone = new PhoneBean();
		String action = request.getParameter("action");

		//Visualizzazione pagina carrello
		if(action.equals("view")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
			dispatcher.forward(request, response);
		}
		//Aggiunta prodotto carrello
		else if(action.equals("add")) {
			synchronized(session) {
				try {
					phone = model.phoneById(Integer.parseInt(request.getParameter("id")));
					System.out.println("aggiungo " + request.getParameter("id"));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(cart == null) {
					cart = new Cart();
					cart.add(phone);
				}
				else
					cart.add(phone);

				session.setAttribute("cart", cart);
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductControl");
			dispatcher.forward(request, response);
		}
		//Quantità
		else if(action.equals("plus")) {
			for(int i = 0; i < cart.size(); i++) {
				PhoneBean phoneN = cart.returnPhoneById(i);
				if(phoneN.getID() == Integer.parseInt(request.getParameter("id"))) {
					cart.setClick(cart.returnClickById(i) + 1, i);
				}
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
			dispatcher.forward(request, response);
		}
		else if(action.equals("minus")) {
			for(int i = 0; i < cart.size(); i++) {
				PhoneBean phoneN = cart.returnPhoneById(i);
				if(phoneN.getID() == Integer.parseInt(request.getParameter("id"))) {
					if(cart.returnClickById(i) == 1) 
						cart.remove(i);
					else
						cart.setClick(cart.returnClickById(i) - 1, i);
				}
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
			dispatcher.forward(request, response);
		}
		else if(action.equals("remove")) {
			for(int i = 0; i < cart.size(); i++) {
				PhoneBean phoneN = cart.returnPhoneById(i);
				if(phoneN.getID() == Integer.parseInt(request.getParameter("id")))
					cart.remove(i);
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
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
