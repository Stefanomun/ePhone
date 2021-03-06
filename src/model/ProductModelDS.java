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

	public Collection<PhoneBean> AdminPhoneCatalog() throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		Collection<PhoneBean> phones = new LinkedList<PhoneBean>();
		String query = "SELECT * FROM "
				+ "telefono t JOIN casa_produttrice c "
				+ "ON t.id_casa_produttrice = c.id";

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
				bean.setQuantita(rs.getInt("t.quantita"));
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

	public boolean modifyPhone(String id, String prezzo, String quantita) throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		String query = null, ivaString = null;
		if(prezzo != null) {
			query = "UPDATE telefono SET prezzo = ?, IVA = ?, quantita = ? WHERE id = ?";
			double iva = (Double.parseDouble(prezzo) * 22) / 100;
			ivaString = String.valueOf(iva);
			try {
				connessione = DriverManagerConnectionPool.getConnection();
				statement = connessione.prepareStatement(query);
				statement.setString(1, prezzo);
				statement.setString(2, ivaString);
				statement.setString(3, quantita);
				statement.setString(4, id);
				System.out.println("Query " + statement);
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
		}else {
			query = "UPDATE telefono SET quantita = ? WHERE id = ?";
			try {
				connessione = DriverManagerConnectionPool.getConnection();
				statement = connessione.prepareStatement(query);
				statement.setString(1, quantita);
				statement.setString(2, id);
				System.out.println("Query " + statement);
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

	public boolean removePhone(String id) throws SQLException{
		Connection connessione = null;
		PreparedStatement statement = null;
		String query = null, ivaString = null;

		query = "UPDATE telefono SET quantita = " + 0 + " WHERE id = ?";
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			statement.setString(1, id);
			System.out.println("Query " + statement);
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
	
	public boolean insert(String nome, String ram, String taglia, String colore, String particolarita, String prezzo,
			String IVA , String foto, String id_casa_produttrice, String quantita) {
		
		Connection connessione = null;
		PreparedStatement statement = null;
		String query = "INSERT INTO telefono (nome, ram, taglia, colore, epoca, ricondizionato, prezzo, IVA, foto, id_casa_produttrice, quantita)" +
				" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			connessione = DriverManagerConnectionPool.getConnection();
			statement = connessione.prepareStatement(query);
			statement.setString(1, nome);
			statement.setString(2, ram);
			statement.setString(3, taglia);
			statement.setString(4, colore);
			if (particolarita.equals("epoca")) {
				statement.setString(5, "1");
				statement.setString(6, "0");
			} else if (particolarita.equals("ricondizionato")) {
				statement.setString(5, "0");
				statement.setString(6, "1");
			} else {
				statement.setString(5, "0");
				statement.setString(6, "0");
			}
			statement.setString(7, prezzo);
			statement.setString(8, IVA);
			statement.setString(9, foto);
			statement.setString(10, id_casa_produttrice);
			statement.setString(11, quantita);
			System.out.println("New Phone " + statement);
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
