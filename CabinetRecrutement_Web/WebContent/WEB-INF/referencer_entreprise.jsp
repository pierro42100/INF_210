<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                java.util.List"%>

<%
	// Récupération du service (bean session)
	IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator
			.getInstance().getRemoteInterface("ServiceEntreprise");
	// Appel de la fonctionnalité désirée auprès du service
	List<Entreprise> entreprises = serviceEntreprise
			.listeDesEntreprises();
%>
<%
  // Récupération du paramètre (id) passé par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
  // Attention : la valeur récupérée, même numérique, est sous la forme d'une chaîne de caractères.
  String nomString = request.getParameter("nom");
  String descriptifString = request.getParameter("descriptif");
  String adressepostaleString = request.getParameter("adressepostale");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Referencer entreprise</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body style="text-align: center">

	<% if(nomString!=null){
			int id=serviceEntreprise.addEntreprise(nomString, descriptifString, adressepostaleString);
			
	%>
	<table id="affichage" style="text-align:center">
		<tr>
			<th>Identifiant</th>
			<th>Nom</th>
			<th>Adresse postale (ville)</th>
		</tr>
		<tr>
			<td>ENT_<%=id%></td>
			<td><a href="infos_entreprise.jsp?id=<%=id%>"><%=nomString%></a></td>
			<td><%=adressepostaleString%></td>
		
		</tr>
	</table>

	<% }%>

	<h2>Referencer entreprise</h2>
	<form action="referencer_entreprise.jsp" method="post">
		<h3>Nom</h3>
		<input type="text" name="nom">
		<h3>Descriptif</h3>
		<input type="text" name="descriptif">
		<h3>Adresse postale</h3>
		<input type="text" name="adressepostale"> </br> <input
			type="submit" value="Envoyer">
	</form>



	<a href="index.jsp">Retour au menu</a>
</body>
</html>