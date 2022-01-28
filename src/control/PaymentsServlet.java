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
import model.PaymentBean;
import model.PymentModelDS;
import model.UserBean;

/**
 * Servlet implementation class PaymentsServlet
 */
@WebServlet("/PaymentsServlet")
public class PaymentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equals("view")) {
			PymentModelDS model = new PymentModelDS();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			String username = user.getUsername();
			Collection<PaymentBean> carte = null;
			try {
				carte = model.paymentCatalogByID(username);
				request.setAttribute("payment", carte);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Payment.jsp");
			dispatcher.forward(request, response);
		}
		else if(action.equals("add")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/NewPayment.jsp");
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
