package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class DriverManagerConnectionPool {
	
	private static List<Connection> connessioni;
	
	static {
		connessioni = new LinkedList<Connection>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(ClassNotFoundException e) {
			System.out.println(e);
		}
	}
	
	private static Connection creaConnessioneDB() throws SQLException{
		Connection nuovaCon = null;
		String username = "root";
		String password = "Daenerys";
		String nomeDB = "ephone";
		String ip = "localhost";
		String port = "3306";
		
		nuovaCon = DriverManager.getConnection("jdbc:mysql://"+ ip+":"+ port+"/"+nomeDB+"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", username, password);
		nuovaCon.setAutoCommit(false);
		return nuovaCon;
	}
	
	public static synchronized Connection getConnection() throws SQLException{
		Connection connessione = null;
		
		if(!connessioni.isEmpty()) {
			connessione = (Connection) connessioni.get(0);
			connessioni.remove(0);
			try{
				if(!connessione.isClosed())
					connessione = getConnection();
			}catch(SQLException e) {
				connessione.close();
				connessione = getConnection();
			}
		}else {
			connessione = DriverManagerConnectionPool.creaConnessioneDB();
		}
		return connessione;
	}
	
	public static synchronized void rilasciaConnessione(Connection connessione) {
		DriverManagerConnectionPool.connessioni.add(connessione);
	}

}
