package model;

//Crea l'oggetto che definisce la marca

public class BrandBean {
	private int ID;
	private String name;
	private String logo;
	
	public BrandBean() {
		name = "";
		logo = "";
	}

	
	public int getID() {
		return ID;
	}


	public void setID(int iD) {
		ID = iD;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	
}
