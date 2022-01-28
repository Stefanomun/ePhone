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

public class AddressModelDS {
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
	
	//questo metodo restituisce tutti gli indirizzi presenti nel database
	
	public Collection<AddressBean> addressCatalog() throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		Collection<AddressBean> indirizzi = new LinkedList<AddressBean>();
		String query = "SELECT * FROM indirizzo";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Indirizzo: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				AddressBean bean = new AddressBean();
				bean.setId(rs.getInt("id"));
				bean.setComune(rs.getString("comune"));
				bean.setCap(rs.getString("cap"));
				bean.setCivico(rs.getInt("civico"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setVia(rs.getString("via"));
				bean.setId_utente(rs.getString("id_utente"));
				indirizzi.add(bean);
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return indirizzi;
	}
	
	//questo metodo restituisce tutti gli indirizzi riferiti ad un utente
	
	public Collection<AddressBean> addressCatalogByID(String id_utente) throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		Collection<AddressBean> indirizzi = new LinkedList<AddressBean>();
		String query = "SELECT * FROM indirizzo WHERE id_utente = '" + id_utente + "'";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Indirizzo: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				AddressBean bean = new AddressBean();
				bean.setId(rs.getInt("id"));
				bean.setComune(rs.getString("comune"));
				bean.setCap(rs.getString("cap"));
				bean.setCivico(rs.getInt("civico"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setVia(rs.getString("via"));
				bean.setId_utente(rs.getString("id_utente"));
				indirizzi.add(bean);
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return indirizzi;
	}
	
	public AddressBean addressByID(String id) throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		AddressBean address = null;
		String query = "SELECT * FROM indirizzo WHERE id = '" + id + "'";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Indirizzo: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				address = new AddressBean();
				address.setId(rs.getInt("id"));
				address.setComune(rs.getString("comune"));
				address.setCap(rs.getString("cap"));
				address.setCivico(rs.getInt("civico"));
				address.setProvincia(rs.getString("provincia"));
				address.setVia(rs.getString("via"));
				address.setId_utente(rs.getString("id_utente"));
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return address;
	}
	
	//metodo che aggiunge un indirizzo e lo collega ad un utente
	
	public boolean insert(String comune, int civico, String via, String cap, String provincia,
			String id_utente) {
		
		Connection connessione = null;
		PreparedStatement statement = null;
		String query = "INSERT INTO indirizzo (comune, provincia, cap, via, civico, id_utente)" +
				" VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			statement.setString(1, comune);
			statement.setString(2, provincia);
			statement.setString(3, cap);
			statement.setString(4, via);
			statement.setLong(5, civico);
			statement.setString(6, id_utente);
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
}
