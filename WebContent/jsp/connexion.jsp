<%@page import="JDBC.Base"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean
			 id="manager"
			 scope="session" 
			 class="manager.Manager">
</jsp:useBean>
<%
	

	if(request.getParameter("submit")!= null){
		// si clic sur bouton Valider
		Base base = new Base();
		base.ouvrir();
		if(base.verifiId(request.getParameter("identifiant"),request.getParameter("mdp"))){
			base.fermer();
			manager.setIdentifie(true);
			response.sendRedirect("menu.jsp");
			return;
		}
		
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Identification</title>
</head>
<body>

<h1> Identification </h1>
	
<p>Veuillez vous identifier</p>

<form action="connexion.jsp" method="post">
	<table>
	<tr>
		<td>Identifiant : </td>
		<td>
			<input type="text" name="identifiant" 
				value="" />
		</td>
	</tr>
	<tr>
		<td>Mot de passe : </td>
		<td>
	<input type="password" name="mdp" 
			value="" />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
	<input type="submit" name="submit"
			value="Valider" />
		</td>
	</tr>
	</table>
</form>


</body>
</html>