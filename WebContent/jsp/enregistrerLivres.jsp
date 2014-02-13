<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, JDBC.*, manager.*, config.*, bean.Livre, java.lang.Package" %>
<%@ page import="java.util.regex.Pattern"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean
			 id="manager"
			 scope="session" 
			 class="manager.Manager">
</jsp:useBean>

<%
		//Gestion d'accés
		if(!manager.isIdentifie()){
			//out.println("Accés Interdit");
			response.sendRedirect("connexion.jsp");
			return;
			
			//redirection
			
		}

%>
<html>

<%
		String titre = request.getParameter("titre");
		if(titre == null) titre = " ";
		
		String auteur = request.getParameter("auteur");
		if(auteur == null) auteur = " ";
		
		String annee = request.getParameter("annee");
		if(annee == null) annee = " ";
		
		
		String errTitre = " ";
		String errAuteur = " ";
		String errAnnee = " ";

		if(request.getParameter("submit")!= null){
			
			if(titre.trim().equals("")){
				errTitre = "Veuillez saisir un titre";
			}
			if(auteur.trim().equals("")){
				errAuteur = "Veuillez saisir le nom de l'auteur";
			}
			if(annee.trim().equals("")){
				errAnnee = "Veuillez saisir l'annnée";
			}
			else if(!Pattern.compile("[0-9]{4}").matcher(annee).matches()){
				errAnnee = "l'annee doit etre forme de 4 chiffres";
				
			}
		}
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Inserer livres</title>
</head>
<body>
	<h1>Enregistrer Livres </h1>
	
	<form action = "enregistrerLivres.jsp" method="get">
	 <table border=0>
	   <tr>
	    <td>Titre</td>
		<td><input type="text" value="<%=titre%>" name="titre"></td>
		<td><%=errTitre%></td>
	   </tr>
	   <tr>
	   	<td>Auteur</td>
		<td><input type="text" value ="<%=auteur%>" name = "auteur"></td>
		<td><%=errAuteur%></td>
	   </tr>
	   <tr>
	    <td>Annee</td>
		<td><input type="text" value= "<%=annee %>" name = "annee"></td>
		<td><%=errAnnee%></td>
	   </tr>
	   <tr>
	    <td></td>
		<td><input type = "submit" value = "Enregstrer"></td>
	   </tr>
	  </table>
	</form>
<%

		
		
		Livre livre = new Livre();
		livre.setAuteur(auteur);
		livre.setTitre(titre);
	//	livre.setAnnee(Integer.parseInt(annee));
		
		Base base = new Base();
		base.ouvrir();
		//base.enregistrer(livre);
		base.fermer();
		

%>


</body>
</html>