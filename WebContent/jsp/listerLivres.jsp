<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, manager.*" %>
<%@ page import = "bean.Livre, annotation.Table, JDBC.*, config.*" %>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lister Livres</title>
</head>
<body>
<%
	out.println("<h1>lister livres</h1>");
		Base base = new Base();
		base.ouvrir();
		ArrayList <Livre> lst = base.listerLivres();
		base.fermer();
		out.println("<table border=1>");
		for(Livre l : lst){
			out.println("<tr>");
			out.println("<td>Titre</td>");
			out.println("<td>Titre : "+l.getTitre()+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
%>
</body>
</html>