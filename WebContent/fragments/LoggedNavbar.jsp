<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
		<style>		
		  #result {
		   
		   position: absolute;
		   width: 100%;
		   max-width:206.8px;
		   cursor: pointer;
		   overflow-y: auto;
		   max-height: 200px;
		   box-sizing: border-box;
		   z-index: 1001;
		  }
		  .link-class:hover{
		   background-color:#f1f1f1;
		  }
		  </style>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark" style="background-color:rgba(255,69,69,255); ">
 
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a href="ProductControl"><img src="img/Logo.png" width="100" height="45" alt="not found"></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">  </a>
      </li>
      <li class="nav-item">
        <div class="dropdown">
		  <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    Area Personale
		  </button>
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		  	<a class="dropdown-item" href="PagesServlet?action=user">Dashboard</a>
		  	<a class="dropdown-item" href="PagesServlet?action=dp">I miei dati</a>
		    <a class="dropdown-item" href="AddressServlet?action=view&subaction=0">I miei indirizzi</a>
		    <a class="dropdown-item" href="PaymentsServlet?action=view&subaction=0">Le mie carte</a>
		    <a class="dropdown-item" href="OrderServlet?action=view">I miei ordini</a>
		    <a class="dropdown-item" href="LogoutServlet">Logout</a>
  		</div>
		</div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="CartServlet?action=view">Carrello</a>
      </li>
    </ul>
    <div>
				    	<form class="form-inline my-2 my-lg-0">
				      		<input class="form-control mr-sm-2" type="search" 
				      		id="inputSearch"  placeholder="Search" aria-label="Search">
				     	</form>
				     	<div class="list-group" id="result"></div>
				     </div>
  </div>
</nav>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script type="text/javascript" src="ajax/ricerca.js?2"></script> 
</body>
</html>