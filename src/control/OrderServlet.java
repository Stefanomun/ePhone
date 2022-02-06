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

import model.OrderBean;
import model.OrderModelDS;
import model.PhoneBean;
import model.PymentModelDS;
import model.UserBean;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equals("view")) {
			OrderModelDS model = new OrderModelDS();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			String username = user.getUsername();
			Collection<OrderBean> ordini = null;
			try {
				ordini = model.orderCatalogByUserID(username);
				request.setAttribute("ordini", ordini);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrderList.jsp");
			dispatcher.forward(request, response);
		}
		else if(action.equals("detail")) {
			OrderModelDS model = new OrderModelDS();
			String id = request.getParameter("id");
			OrderBean order = null;
			try {
				 order = model.orderDetailsByID(id);
				request.setAttribute("order", order);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PhoneDetail.jsp");
			dispatcher.forward(request, response);
		}
		else if(action.equals("admin")) {
			OrderModelDS model = new OrderModelDS();
			Collection<OrderBean> ordini = null;
			try {
				 ordini = model.orderCatalog();
				 request.setAttribute("ordini", ordini);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrderCatalog.jsp");
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
