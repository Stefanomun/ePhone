package model;

import java.util.ArrayList;
import java.util.HashMap;

public class Cart {
	private ArrayList<PhoneBean> phones;
	private ArrayList<Integer> click;

	public Cart() {
		phones = new ArrayList<PhoneBean>();
		click = new ArrayList<Integer>();
	}

	public void add(PhoneBean phoneP) {
		for(int i = 0; i < phones.size(); i++) {
			PhoneBean phone = phones.get(i);
			if(phone.getID() == phoneP.getID()) {
				Integer numClick = click.get(i);
				numClick++;
				click.add(i, numClick);
				return;
			}
		}
		phones.add(phoneP);
		click.add(1);
		
	}


	public ArrayList<PhoneBean> getPhones(){
		return phones;
	}

	public ArrayList<Integer> getClick(){
		return click;
	}
	
	public void remove(int index) {
		phones.remove(index);
		click.remove(index);
	}
	
	public void setClick(int clickP, int pos) {
		click.set(pos, clickP);
	}

	public void removeAll() {
		phones.removeAll(phones);
		click.removeAll(click);
	}
	
	public int size() {
		return phones.size();
	}
	
	public PhoneBean returnPhoneById(int id) {
		return(phones.get(id));
	}
	
	public int returnClickById(int id) {
		return(click.get(id));
	}
}
