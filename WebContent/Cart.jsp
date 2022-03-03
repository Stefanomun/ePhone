<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	Cart cart = (Cart) session.getAttribute("cart");
	double totOrdine = 0, totIvaOrdine = 0;

%>


<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,model.PhoneBean, model.Cart, model.UserBean"%>
<head>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/Logo.png">
<style>
body { 
    padding-top: 60px; 
   
}

a{
	text-decoration: none;
}
</style>
<meta charset="ISO-8859-1">
<title>Carrello</title>
</head>
<body>
	<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} 
		if(cart == null || cart.size() == 0){
	%>
	<section class="vh-100" style="background-color: rgba(57,95,151,255);">
		<div class="container py-5 h-100">
    		<div class="row d-flex justify-content-center align-items-center h-100">
      			<div class="col col-xl-10">
			        <div class="card" style="border-radius: 1rem;">
			          <div class="row g-0">
			            <div class="col-md-6 col-lg-5 d-none d-md-block">
			              <img
			                src="img/smartphones.jpg"
			                alt="Carrello Vuoto"
			                class="img-fluid" style="border-radius: 1rem 0 0 1rem;"
			              />
			            </div>
            			<div class="col-md-6 col-lg-7 d-flex align-items-center">    
             				<div class="card-body p-4 p-lg-5 text-black">
             					<h1>Oooops!<br>Il tuo carrello è vuoto</h1>
              					<a href="ProductControl" class="btn btn-dark btn-lg btn-block">Torna al catalogo</a>
							</div>
            			</div>
          			  </div>
        			</div>
      			</div>
    		</div>
  		</div>
	</section>
	<%
		}else{
	%>
	<h1 style="padding-left: 20px;">Il tuo carrello</h1>
	<table class="table">
		 <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Foto</th>
		      <th scope="col">Marca</th>
		      <th scope="col">Modello</th>
		      <th scope="col">Prezzo</th>
		      <th scope="col">Quantità</th>
		      <th scope="col"></th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <%
			ArrayList <PhoneBean> phones = cart.getPhones(); 
			ArrayList<Integer> click = cart.getClick(); 
			for (int i = 0; i < phones.size(); i++) {
				PhoneBean phone = phones.get(i); 
				int clicks = click.get(i);
			%>
				<tr>
			      	<th scope="row"><%=i+1%></th>
				    <td><img src="<%=phone.getFoto() %>" alt="<%=phone.getNome() %>" class="img-fluid" 
				    	 height="60" width="60"/>
				    </td>
					<td><%=phone.getMarca() %></td>
					<td><%=phone.getNome() %></td>
					<td><%=phone.getPrezzo() %></td>
					<td id="clicks"><%=clicks %></td>
					<td>
						<form action="CartServlet" method="post">
							<input type="hidden" value="plus" name="action">
							<input type="hidden" value="<%=phone.getID() %>" name="id">
							<input type="submit" class="btn btn-sm btn-outline-secondary" value="+">
						</form>
						<!-- <input type="submit" onclick="add()" class="btn btn-sm btn-outline-secondary" value="+"> -->
					</td>
					<td>
						<form action="CartServlet" method="post">
							<input type="hidden" value="minus" name="action">
							<input type="hidden" value="<%=phone.getID() %>" name="id">
							<input type="submit" class="btn btn-sm btn-outline-secondary" value="-">
						</form> 
						<!-- <input type="submit" onclick="remove()" class="btn btn-sm btn-outline-secondary" value="-"> -->
					</td>
					<td>
						<form action="CartServlet" method="post">
							<input type="hidden" value="remove" name="action">
							<input type="hidden" value="<%=phone.getID() %>" name="id">
							<input type="submit" class="btn btn-sm btn-outline-secondary" value="Rimuovi">
						</form>
					</td>
				</tr>
				<%totOrdine = totOrdine + (phone.getPrezzo() * clicks);
				totIvaOrdine = totIvaOrdine + (phone.getIVA() * clicks); %>
			
  		<%} %>
		</table>
		<hr>
	<div style="padding-left: 20px;">
		<p>Totale ordine: <b><%=totOrdine %></b></p>
		<p>di cui IVA: <%=totIvaOrdine %></p><br>
		<form action="CheckoutServlet" method="post">
			<input type="hidden" value="1" name="step">
			<input type="submit" class="btn btn-sm btn-outline-secondary" value="Procedi all'acquisto">
		</form>
	</div>
	
	<%} %>
	
	
	<%@include file="../fragments/Footer.jsp"  %>
	<script type="text/javascript" src="javascript/cart.js"></script>
</body>
</html>