<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.io.*, JDBC.*, java.sql.Blob, javax.swing.text.html.CSS"%>
<%@ page import="java.util.*, servlet.ServletImages" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<jsp:useBean
			 id="manager"
			 scope="session" 
			 class="manager.Manager">
</jsp:useBean>

<%
		//Gestion d'accés
		if(manager.isIdentifie()){
			//out.println("Accés Interdit");
			response.sendRedirect("connexion.jsp");
			return;
			
			//redirection
			
		}


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Afficher Images</title>
</head>
<%@ include file="menu.jsp" %>
<body>
<form action="afficherImages.jsp" method="get">
<table id="affimg" border="1" align="center">
	<tr>
	<%
	int id;
		String idImage = request.getParameter("idImage");
		id = Integer.parseInt(idImage); 
	%>
		<td colspan="4">
			<img src="http://localhost:8080/TPIHM/ServletImages?idImage=<%=id%>" width="512" />

		</td>
	</tr>
	<tr>
		<td>
			<input type="button" name="precedent" value ="<<premier" onclick="">
			<input type = "hidden" name="idImage" value="1">
		</td>
		
		<td>
			<input type="button" name="suivant" value ="<precedent">
		</td>
		<td>
			<input type="button" name="suivant" value ="suivant>">
		</td>
		<td>
			<input type="button" name="suivant" value ="derniere>>">
		</td>
	</tr>
</table>
</form>
</body>
</html>