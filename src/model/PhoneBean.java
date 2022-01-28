package model;

public class PhoneBean {
	private int ID;
	private String nome;
	private int  ram;
	private int taglia;
	private String colore;
	private boolean epoca; 
	private boolean ricondizionato; 
	private double prezzo; 
	private double IVA;
	private String foto;
	private String marca;
	private int quantita;
	
	public PhoneBean() {
		ID = 0;
		nome = "";
		ram = 0;
		taglia = 0;
		colore = "";
		epoca = false;
		ricondizionato = false;
		prezzo = 0.0;
		IVA = 0.0;
		foto = "";
		marca = "";
		quantita = 0;
	}
	
	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getRam() {
		return ram;
	}
	public void setRam(int ram) {
		this.ram = ram;
	}
	public int getTaglia() {
		return taglia;
	}
	public void setTaglia(int taglia) {
		this.taglia = taglia;
	}
	public String getColore() {
		return colore;
	}
	public void setColore(String colore) {
		this.colore = colore;
	}
	public boolean isEpoca() {
		return epoca;
	}
	public void setEpoca(boolean epoca) {
		this.epoca = epoca;
	}
	public boolean isRicondizionato() {
		return ricondizionato;
	}
	public void setRicondizionato(boolean ricondizionato) {
		this.ricondizionato = ricondizionato;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	public double getIVA() {
		return IVA;
	}
	public void setIVA(double iVA) {
		IVA = iVA;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return (((PhoneBean)obj).getID() == ID); 
	}
	
	
}
