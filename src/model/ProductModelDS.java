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

public class ProductModelDS {
	
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
	
	//questo metodo restituisce tutte le case_produttrici presenti nel database
	
	public Collection<BrandBean> brandCatalog() throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		Collection<BrandBean> brands = new LinkedList<BrandBean>();
		String query = "SELECT * FROM casa_produttrice";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Catalogo: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				BrandBean bean = new BrandBean();
				bean.setID(rs.getInt("ID"));
				bean.setName(rs.getString("nome"));
				bean.setLogo(rs.getString("logo"));
				brands.add(bean);
			}
		}finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.rilasciaConnessione(connessione);
			}
		}
		return brands;
	}
	
	//questo metodo restituisce il catalogo con tutti i cellulare in vendita
	
	public Collection<PhoneBean> phoneCatalog() throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		Collection<PhoneBean> phones = new LinkedList<PhoneBean>();
		String query = "SELECT * FROM "
				+ "telefono t JOIN casa_produttrice c "
				+ "ON t.id_casa_produttrice = c.id "
				+ "WHERE quantita > 0";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Catalogo: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				PhoneBean bean = new PhoneBean();
				bean.setID(rs.getInt("t.id"));
				bean.setNome(rs.getString("t.nome"));
				bean.setRam(rs.getInt("t.ram"));
				bean.setTaglia(rs.getInt("t.taglia"));
				bean.setEpoca(rs.getBoolean("t.epoca"));
				bean.setRicondizionato(rs.getBoolean("t.ricondizionato"));
				bean.setColore(rs.getString("t.colore"));
				bean.setPrezzo(rs.getDouble("t.prezzo"));
				bean.setIVA(rs.getDouble("t.IVA"));
				bean.setFoto(rs.getString("t.foto"));
				bean.setMarca(rs.getString("c.nome"));
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
	
	//questo metodo restituisce tutte le caratteristiche di un telefono a partire dal sui ID all'interno del DB
	
	public PhoneBean phoneById(int id) throws SQLException {
		Connection connessione = null;
		PhoneBean bean = new PhoneBean();
		PreparedStatement statement = null;
		String query = "SELECT * FROM "
				+ "telefono t JOIN casa_produttrice c "
				+ "ON t.id_casa_produttrice = c.id "
				+ "WHERE t.id = " + id;
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			System.out.println("Catalogo: " + statement);

			ResultSet rs = statement.executeQuery(query);

			while(rs.next()) {
				bean.setID(rs.getInt("id"));
				bean.setNome(rs.getString("t.nome"));
				bean.setRam(rs.getInt("t.ram"));
				bean.setTaglia(rs.getInt("t.taglia"));
				bean.setEpoca(rs.getBoolean("t.epoca"));
				bean.setRicondizionato(rs.getBoolean("t.ricondizionato"));
				bean.setColore(rs.getString("t.colore"));
				bean.setPrezzo(rs.getDouble("t.prezzo"));
				bean.setIVA(rs.getDouble("t.IVA"));
				bean.setFoto(rs.getString("t.foto"));
				bean.setMarca(rs.getString("c.nome"));
				bean.setQuantita(rs.getInt("quantita"));
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
}
