package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PymentModelDS {
	
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
	
	public Collection<PaymentBean> paymentCatalogByID(String id_utente) throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		Collection<PaymentBean> carte = new LinkedList<PaymentBean>();
		String query = "SELECT * FROM metodo_pagamento WHERE id_utente = '" + id_utente + "'";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Indirizzo: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				PaymentBean bean = new PaymentBean();
				bean.setNumero(rs.getString("numero"));
				bean.setCircuito(rs.getString("circuito"));
				bean.setCvv(rs.getString("cvv"));
				bean.setId_utente(rs.getString("id_utente"));
				bean.setScadenza(rs.getString("scadenza"));
				bean.setNome_titolare(rs.getString("nome_titolare"));
				bean.setCognome_titolare(rs.getString("cognome_titolare"));
				carte.add(bean);
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return carte;
	}
	

	public PaymentBean paymentByID(String numero) throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		PaymentBean carta = null;
		String query = "SELECT * FROM metodo_pagamento WHERE numero = '" + numero + "'";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Indirizzo: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				carta = new PaymentBean();
				carta.setNumero(rs.getString("numero"));
				carta.setCircuito(rs.getString("circuito"));
				carta.setCvv(rs.getString("cvv"));
				carta.setId_utente(rs.getString("id_utente"));
				carta.setScadenza(rs.getString("scadenza"));
				carta.setNome_titolare(rs.getString("nome_titolare"));
				carta.setCognome_titolare(rs.getString("cognome_titolare"));
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return carta;
	}
	
	//metodo che aggiunge un indirizzo e lo collega ad un utente
	
	public boolean insert(String numero, String circuito, String cvv, String scadenza, String nome_titolare,
			String cognome_titolare, String id_utente) {
		
		Connection connessione = null;
		PreparedStatement statement = null;
		String query = "INSERT INTO metodo_pagamento (numero, circuito, cvv, scadenza, nome_titolare, cognome_titolare, id_utente)" +
				" VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			statement.setString(1, numero);
			statement.setString(2, circuito);
			statement.setString(3, cvv);
			statement.setString(4, scadenza);
			statement.setString(5, nome_titolare);
			statement.setString(6, cognome_titolare);
			statement.setString(7, id_utente);
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
