<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	Collection<PhoneBean> products = (Collection<PhoneBean>) request.getAttribute("products");
%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.PhoneBean, model.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/Logo.png">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Catalogo</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/album/">

    

    <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
    body{
    padding-top:60px;
    }
    
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .parent{
		text-align:center;
		}
    </style>

</head>
<body>
	
	<%UserBean user = (UserBean)request.getSession().getAttribute("user");
	String admin = (String) request.getSession().getAttribute("admin");
	if(user == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>
	<%}else if(user != null && admin.equals("yes")){%>
		<%@include file="../fragments/AdminNavbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>
	
	<%@include file="../fragments/Carousel.jsp"  %>
	
	 <div class="album py-5 bg-light">
	    	<div class="container">
	    	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	    	<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					PhoneBean phone = (PhoneBean) it.next();
			%>
			<div class="col">
          		<div class="card shadow-sm">
          		<div class="parent">
            		<img src="<%=phone.getFoto() %>" width="200px" height="200px" >

            		<div class="card-body">
              		<p class="card-text">
              		
              			<b><%=phone.getNome() %></b>
              			<br>
              			<%=phone.getPrezzo() %>
              		</p>	
              		
              		
              <div class="d-flex justify-content-between align-items-center">
             <form action="PhoneServlet" method="post">
             	<input type="hidden" value="<%=phone.getID() %>" name="id">
              	<input type="submit" class="btn btn-sm btn-outline-secondary" value="Dettagli">
              </form>
              <%if((user == null) || (user != null && !admin.equals("yes"))){ %>
              <form action="CartServlet" method="post">
             	<input type="hidden" value="add" name="action">
             	<input type="hidden" value="<%=phone.getID() %>" name="id">
              	<input type="submit" class="btn btn-sm btn-outline-secondary" value="Aggiungi al carrello">
              	<%} %>
              </form>
              </div>
              </div>
            </div>
          </div>
        </div>
			<%}
			}%>
      	</div>
      	</div>
    </div>

	<%@include file="../fragments/Footer.jsp"  %>
	
</body>
</html>