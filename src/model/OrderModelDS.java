package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderModelDS {
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

	public Collection<OrderBean> orderCatalogByUserID(String id) throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		Collection<OrderBean> ordini = new LinkedList<OrderBean>();
		String query = "SELECT * FROM ordine WHERE id_utente = '" + id + "'";

		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Ordini: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				OrderBean bean = new OrderBean();
				bean.setId(rs.getInt("id"));
				bean.setDate(rs.getString("data_ordine"));
				bean.setSomma(rs.getDouble("somma_pagata"));
				bean.setIVA(rs.getDouble("IVA_complessiva"));
				ordini.add(bean);
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return ordini;
	}

	public Collection<OrderBean> orderCatalog() throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		Collection<OrderBean> ordini = new LinkedList<OrderBean>();
		String query = "SELECT * FROM ordine";

		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Ordini: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				OrderBean bean = new OrderBean();
				bean.setId(rs.getInt("id"));
				bean.setDate(rs.getString("data_ordine"));
				bean.setSomma(rs.getDouble("somma_pagata"));
				bean.setIVA(rs.getDouble("IVA_complessiva"));
				bean.setUser(rs.getString("id_utente"));
				ordini.add(bean);
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return ordini;
	}

	public ArrayList<PhoneBean> phonesCatalogByOrderID(String id) throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		ArrayList<PhoneBean> phones = new ArrayList<PhoneBean>();
		String query = "SELECT t.*, cp.nome, c.prezzo_acquisto, c.iva_acquisto, c.quantita "
				+ "FROM ((ordine o JOIN contenuto c ON o.id = c.id_ordine) "
				+ "JOIN telefono t ON c.id_telefono = t.id) "
				+ "JOIN casa_produttrice cp ON t.id_casa_produttrice = cp.id " 
				+ "WHERE o.id = '" + id + "'";

		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Ordini: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				PhoneBean bean = new PhoneBean();
				bean.setMarca(rs.getString("cp.nome"));
				bean.setNome(rs.getString("t.nome"));
				bean.setFoto(rs.getString("t.foto"));
				bean.setPrezzo(rs.getDouble("c.prezzo_acquisto"));
				bean.setIVA(rs.getDouble("c.iva_acquisto"));
				bean.setEpoca(rs.getBoolean("t.epoca"));
				bean.setRicondizionato(rs.getBoolean("t.ricondizionato"));
				bean.setQuantita(rs.getInt("c.quantita"));
				bean.setTaglia(rs.getInt("taglia"));
				bean.setRam(rs.getInt("ram"));
				bean.setColore(rs.getString("colore"));
				phones.add(bean);
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return phones;
	}

	public OrderBean orderDetailsByID(String id) throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		OrderBean order = null;
		String query = "SELECT * FROM ordine WHERE id = ' " + id + "'";

		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Ordine: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				order = new OrderBean();
				order.setId(rs.getInt("id"));
				order.setDate(rs.getString("data_ordine"));
				order.setSomma(rs.getDouble("somma_pagata"));
				order.setIVA(rs.getDouble("IVA_complessiva"));
				order.setPhones(phonesCatalogByOrderID(id));
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return order;
	}
	
	public void setQuantita(int quantity, int id_telefono) {
		Connection connessione = null;
		PreparedStatement statement = null;
		String query = "UPDATE telefono "
						+ "SET quantita = (quantita - " + quantity + ") "
						+ "WHERE id = " + id_telefono;
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Set: " + statement);
			System.out.println(statement.executeUpdate());
			connessione.commit();
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
	}

	@SuppressWarnings("resource")
	public boolean acquisto(ArrayList<PhoneBean> phones, ArrayList<Integer> clicks, String id_utente, String id_pagamento) throws SQLException {
		double totOrdine = 0, totIva = 0;
		for(int i = 0; i < phones.size(); i++) {
			PhoneBean phone = phones.get(i);
			totOrdine = (totOrdine + (phone.getPrezzo() * clicks.get(i)));
			totIva = (totIva + (phone.getIVA() * clicks.get(i)));
		}
		Connection connessione = null;
		PreparedStatement statement = null;
		int id_order = 0 ;
		String query1 = "INSERT INTO ordine (somma_pagata, IVA_complessiva, data_ordine, id_utente, id_pagamento) "
				+ "VALUES (?, ?, ?, ? ,?)";
		String query2 = "SELECT max(id) FROM ordine WHERE id_utente = '" + id_utente + "'";
		String query3 = "INSERT INTO contenuto (id_telefono, id_ordine, quantita, prezzo_acquisto, iva_acquisto) "
				+ "VALUES (?, ?, ?, ?, ?)";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			//Inserisco l'ordine nel DB
			statement = connessione.prepareStatement(query1);
			statement.setDouble(1, totOrdine);
			statement.setDouble(2, totIva);
			SimpleDateFormat dtf = new SimpleDateFormat("yyyy/MM/dd");
			LocalDate todaysDate = LocalDate.now();
			statement.setDate(3, Date.valueOf(todaysDate));
			statement.setString(4, id_utente);
			statement.setString(5, id_pagamento);
			System.out.println("Query1 " + statement);
			System.out.println(statement.executeUpdate());
			connessione.commit();
			//Prendo il numero dell'ordine appena inserito
			statement = connessione.prepareStatement(query2);
			System.out.println("ID: " + statement);
			ResultSet rs = statement.executeQuery(query2);
			while(rs.next())
				id_order = rs.getInt("max(id)");
			System.out.println("ID ORDINE: " + id_order);
			//Aggiungo articolo per articolo all'interno dell'ordine
			statement = connessione.prepareStatement(query3);
			for(int i = 0 ; i < phones.size(); i++) {
				PhoneBean phone = phones.get(i);
				statement.setInt(1, phone.getID());
				statement.setInt(2, id_order);
				statement.setInt(3, clicks.get(i));
				statement.setDouble(4, phone.getPrezzo());
				statement.setDouble(5, phone.getIVA());
				System.out.println("Query3 " + statement);
				System.out.println(statement.executeUpdate());
				connessione.commit();
				setQuantita(clicks.get(i), phone.getID());
			}
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
