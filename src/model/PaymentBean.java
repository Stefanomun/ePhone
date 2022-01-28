package model;

public class PaymentBean {
	private String numero;
	private String circuito;
	private String cvv;
	private String scadenza;
	private String id_utente;
	private String nome_titolare;
	private String cognome_titolare;

	public PaymentBean() {
		numero = "";
		circuito = "";
		cvv = "";
		scadenza = "";
		id_utente = "";
		nome_titolare = "";
		cognome_titolare = "";
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getCircuito() {
		return circuito;
	}

	public void setCircuito(String circuito) {
		this.circuito = circuito;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public String getScadenza() {
		return scadenza;
	}

	public void setScadenza(String scadenza) {
		this.scadenza = scadenza;
	}

	public String getId_utente() {
		return id_utente;
	}

	public void setId_utente(String id_utente) {
		this.id_utente = id_utente;
	}

	public String getNome_titolare() {
		return nome_titolare;
	}

	public void setNome_titolare(String nome_titolare) {
		this.nome_titolare = nome_titolare;
	}

	public String getCognome_titolare() {
		return cognome_titolare;
	}

	public void setCognome_titolare(String cognome_titolare) {
		this.cognome_titolare = cognome_titolare;
	}
	
	
}
