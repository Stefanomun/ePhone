package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductModelDS;

/**
 * Servlet implementation class PhoneServletù
 */
@WebServlet("/PhoneServlet")
public class PhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModelDS model = new ProductModelDS();
		String action = request.getParameter("action");
		if(action != null && action.equals("admin")) {
			try {
				request.setAttribute("phones", model.AdminPhoneCatalog());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminCatalog.jsp");
			dispatcher.forward(request, response);
			return;
		} else if(action != null && action.equals("modifyPage")) {
			try {
				int id = Integer.parseInt(request.getParameter("id"));
				request.setAttribute("phone", model.phoneById(id));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ModifyPhone.jsp");
			dispatcher.forward(request, response);
			return;
		} else if(action != null && action.equals("modify")) {
			String id = request.getParameter("id");
			String prezzo = request.getParameter("prezzo");
			String quantita = request.getParameter("quantita");
			try {
				model.modifyPhone(id, prezzo, quantita);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminDashboard.jsp");
			dispatcher.forward(request, response);
		} else if(action != null && action.equals("remove")) {
			String id = request.getParameter("id");
			try {
				model.removePhone(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminDashboard.jsp");
			dispatcher.forward(request, response);
		} else if(action != null && action.equals("addPage")) {
			try {
				request.setAttribute("marche", model.brandCatalog());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/NewPhone.jsp");
			dispatcher.forward(request, response);
		} else if(action != null && action.equals("add")) {
			String id_casa_produttrice = request.getParameter("marca");
			String nome = request.getParameter("modello");
			String ram = request.getParameter("ram");
			String taglia = request.getParameter("taglia");
			String particolarita = request.getParameter("particolarita");
			String colore = request.getParameter("colore");
			String prezzo = request.getParameter("prezzo");
			double IVA = (Double.parseDouble(prezzo) * 22) / 100;
			String IVAString = String.valueOf(IVA);
			String quantita = request.getParameter("quantita");
			String foto = request.getParameter("foto");
			model.insert(nome, ram, taglia, colore, particolarita, prezzo, IVAString, foto, id_casa_produttrice, quantita);
			
		} else {
			String id = request.getParameter("id");
			System.out.println(id);
			try {
				request.setAttribute("specif", model.phoneById(Integer.parseInt(id)));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DataSheet.jsp");
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
