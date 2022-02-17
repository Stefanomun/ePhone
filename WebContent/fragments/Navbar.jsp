<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>		
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
			        	<a class="nav-link" href="PagesServlet?action=signin">Login</a>
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
		<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
		<script
	  		src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	</body>
</html>