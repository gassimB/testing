<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="JDBC.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	// test sur le clic bouton Enregistrer
	if (ServletFileUpload.isMultipartContent(request)) {

	System.out.println("upload");
	
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);

	List items = upload.parseRequest(request);
	Iterator iter = items.iterator();
	while (iter.hasNext()) {
		FileItem item = (FileItem) iter.next();

		if (item.isFormField()) {
				System.out.println("item name = " + item.getFieldName() + " val = "+(item.getString()));
		} else {
			System.out.println("item file = "+(item.getFieldName()));
			Base base = new Base();
			base.ouvrir();
			base.enregistrerImage(item.getInputStream());
			base.fermer();
		}
}

}
%>

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
<link rel="stylesheet" type="text/css" href="css/form.css" />
<title>Enregistrer images</title>
</head>
<%@ include file="menu.jsp" %>
<body>
<form action="enregistrerPhoto.jsp" method="post" enctype="multipart/form-data" >
	<input type="file" name="fic" value="" />
	<input type="submit" name="enregistrerPhoto" value="Enregistrer la photo" />
</form>

</body>
</html>