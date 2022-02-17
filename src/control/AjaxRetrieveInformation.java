package control;

import java.io.IOException;
import java.io.PrintWriter;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PhoneBean;
import model.ProductModelDS;


@WebServlet("/AjaxRetrieveInformation")
public class AjaxRetrieveInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public  AjaxRetrieveInformation() {
		super();
	}


	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out= response.getWriter();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

	
		ProductModelDS model = new ProductModelDS();
		Collection<PhoneBean> telefoni = null;
		
		try {
			telefoni = model.phoneCatalog();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		
		try {
		
		JSONArray jArray = new JSONArray();
		
		for(PhoneBean telefono: telefoni) {
			JSONObject json = new JSONObject();
			json.put("marca", telefono.getMarca());
			json.put("modello", telefono.getNome());
			json.put("ID", String.valueOf(telefono.getID()));
			
			jArray.put(json);
			}
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
		}
		
		
		out.print(jArray.toString()); //response.getWriter().write
		
		
	   System.out.println("JSON file created: "+jArray);
	
		
		
		} catch (JSONException e) {

		}
		

	}  
}
