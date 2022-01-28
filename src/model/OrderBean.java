package model;

import java.util.ArrayList;

public class OrderBean {
	
	private int id;
	private ArrayList<PhoneBean> phones;
	private double somma;
	private double IVA;
	private String date;
	private String user;
	
	public OrderBean() {
		id = 0;
		phones = new ArrayList<PhoneBean>();
		somma = 0;
		IVA = 0;
		date = "";
		user = "";
	}
	
	

	public String getUser() {
		return user;
	}



	public void setUser(String user) {
		this.user = user;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public ArrayList<PhoneBean> getPhones() {
		return phones;
	}

	public void setPhones(ArrayList<PhoneBean> phones) {
		this.phones = phones;
	}

	public double getSomma() {
		return somma;
	}

	public void setSomma(double somma) {
		this.somma = somma;
	}

	public double getIVA() {
		return IVA;
	}

	public void setIVA(double iVA) {
		IVA = iVA;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
