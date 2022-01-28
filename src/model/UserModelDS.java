package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserModelDS {
	
	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/ephone");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	//metodo per la registrazione
	
	public boolean signUp(String username, String pwd, String name, String surname, LocalDate data_nascita,
			String email,String contact) {
		
		Connection connessione = null;
		PreparedStatement statement = null;
		String query = "INSERT INTO utente (username, pwd, nome, cognome, contatto, email, data_nascita)" +
				" VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			statement.setString(1, username);
			statement.setString(2, pwd);
			statement.setString(3, name);
			statement.setString(4, surname);
			statement.setString(5, email);
			statement.setString(6, contact);
			statement.setDate(7, Date.valueOf(data_nascita));
			System.out.println("Registrazione " + statement);
			System.out.println(statement.executeUpdate());
			connessione.commit();
			return true;
		}
		catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getStackTrace());
		}
		finally {
			try {
				if (statement != null)
					try {
						statement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return false;
	}
	
	//restituisce lista utenti
	
	public Collection<UserBean> getUsers() throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		Collection<UserBean> users = new LinkedList<UserBean>();
		String query = "SELECT * FROM utente";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Utenti: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				UserBean bean = new UserBean();
				bean.setUsername(rs.getString("username"));
				bean.setName(rs.getString("nome"));
				bean.setSurname(rs.getString("cognome"));
				bean.setPwd(rs.getString("pwd"));
				bean.setData_nascita(rs.getString("data_nascita"));
				bean.setContact(rs.getString("contatto"));
				bean.setEmail(rs.getString("email"));
				users.add(bean);
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return users;
	}
	
	//restituisce utente dall'username
	
	public UserBean getUserByUsername(String username) throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		UserBean bean = null;
		String query = "SELECT * FROM utente WHERE username = '" + username + "'";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Utente: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				bean = new UserBean();
				bean.setUsername(rs.getString("username"));
				bean.setName(rs.getString("nome"));
				bean.setSurname(rs.getString("cognome"));
				bean.setPwd(rs.getString("pwd"));
				bean.setData_nascita(rs.getString("data_nascita"));
				bean.setContact(rs.getString("contatto"));
				bean.setEmail(rs.getString("email"));
				bean.setAmministratore(rs.getBoolean("amministratore"));
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return bean;
	}
	
	public UserBean signIn(String username, String password) throws SQLException {
		Connection connessione = null;
		PreparedStatement statement = null;
		UserBean utente;
		String query = "SELECT * FROM utente WHERE username = '" + username + "' && pwd = '" + password +"'";
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Utenti: " + statement);

			ResultSet rs = statement.executeQuery(query);

			if(rs.next()) {
				utente = new UserBean();
				utente.setUsername(rs.getString("username"));
				utente.setName(rs.getString("nome"));
				utente.setSurname(rs.getString("cognome"));
				utente.setPwd(rs.getString("pwd"));
				utente.setData_nascita(rs.getString("data_nascita"));
				utente.setContact(rs.getString("contatto"));
				utente.setEmail(rs.getString("email"));
				utente.setAmministratore(rs.getBoolean("amministratore"));
				return utente;
			}
			else 
				return null;
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		
	}
		
}
