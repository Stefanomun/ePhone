<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	Collection<OrderBean> ordini = (Collection<OrderBean>)request.getAttribute("ordini");
%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.OrderBean, model.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/Logo.png">
<style>
body { 
    padding-top: 65px; 
   
}
</style>
<meta charset="ISO-8859-1">
<title>Ordini Effettuati</title>
</head>
<body>

	<%@include file="../fragments/AdminNavbar.jsp"  %>
	
	<h2 style="padding-left: 15px">Ordini effettuati</h2>
	<hr>
	<div id="data" name="data" style="padding-left: 15px">
		<h5>Ricerca per data</h5>
		<form class="form-inline my-2 my-lg-0" action="SearchServlet">
			<input type="hidden" value="data" name="action">
			Ricerca ordini effettuati tra  
			 <input class="form-control mr-sm-2" type="date" id="data1" name = "data1"> 
			 <div class="invalid-feedback" id="errorid">Inserisci una data valida</div>
			 <div class="valid-feedback" id="errorName">Corretto</div>
			 e  
			 <input class="form-control mr-sm-2" type="date" id="data2" name = "data2">
			 <div class="invalid-feedback" id="errorid">Inserisci una data valida</div>
			 <div class="valid-feedback" id="errorName">Corretto</div>
      		 <button class="btn btn-outline-secondary" type="submit">Search</button>
		</form>
	</div>
	<hr>
	<div id="utente" name="utente" style="padding-left: 15px">
		<h5>Ricerca per utente</h5>
		<form class="form-inline my-2 my-lg-0" action="SearchServlet">
			<input type="hidden" value="utente" name="action">
			 <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="utente" name = "utente">
      		 <button class="btn btn-outline-secondary" type="submit">Search</button>
		</form>
	</div>
	<br>
	<table class="table">
		 <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Data</th>
		      <th scope="col">Importo pagato</th>
		      <th scope="col">Di cui IVA</th>
		      <th scope="col">Utente</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
	 	 	<%if (ordini != null && ordini.size() != 0) {
			Iterator<?> it = ordini.iterator();
			while (it.hasNext()) {
				OrderBean ordine = (OrderBean) it.next(); %>
				<tr>
			      	<th scope="row"><%=ordine.getId()%></th>
					<td><%=ordine.getDate() %></td>
					<td><%=ordine.getSomma() %></td>
					<td><%=ordine.getIVA() %></td>
					<td><%=ordine.getUser() %></td>
					<td>
					<form action="OrderServlet" method="post">
						<input type="hidden" value="detail" name="action">
						<input type="hidden" value="<%=ordine.getId() %>" name="id">
						<input type="submit" class="btn btn-outline-secondary" value="Dettagli">
					</form>
					</td>
				</tr>
  		<%} 
  		}%>
		</table>
		<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>