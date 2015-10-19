<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi,
                java.util.List"%>

<%
	// Récupération du service (bean session)
	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator
			.getInstance().getRemoteInterface("ServiceOffreEmploi");
	// Appel de la fonctionnalité désirée auprès du service
	List<Offreemploi> offres = serviceOffreEmploi.listeDesOffresEmploi();
%>
<%
  // Récupération du paramètre (id) passé par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
  // Attention : la valeur récupérée, même numérique, est sous la forme d'une chaîne de caractères.
  String titreString = request.getParameter("titre");
  String descriptifString = request.getParameter("descriptif");
  String profilString = request.getParameter("profil");
  String secteurString = request.getParameter("secteur");
  String niveauString = request.getParameter("niveau");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Referencer entreprise</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body style="text-align: center">

	<% if(titreString!=null){
			int niveauId=1;
			int id=serviceOffreEmploi.addOffreEmploi(titreString, descriptifString, profilString, secteurString, niveauId);
			
	%>
	<table id="affichage" style="text-align:center">
		<tr>
			<th>Identifiant</th>
			<th>Titre</th>
			<th>Descriptif</th>
			<th>Profil</th>
			<th>Secteur</th>
			<th>Niveau Qualif</th>
		</tr>
		<tr>
			<td><%=id%></td>
			<td><%=titreString%></td>
			<td><%=descriptifString%></td>
			<td><%=profilString%></td>
			<td><%=secteurString%></td>
			<td><%=niveauString%></td>
		
		</tr>
	</table>

	<% }%>

	<h2>Referencer offre</h2>
	<form action="referencer_offre.jsp" method="post">
		<h3>Titre</h3>
		<input type="text" name="titre">
		<h3>Descriptif</h3>
		<input type="text" name="descriptif">
		<h3>Profil</h3>
		<input type="text" name="profil">
		<h3>Secteur</h3>
		<select name="test">
			<option value="Coucou1">Coucou1</option>
			<option value="Coucou2">Coucou2</option>
			<option value="Coucou3">Coucou3</option>
			<option value="Coucou4">Coucou4</option>
		</select>
		<input type="text" name="secteur">
		<h3>Niveau Qualif</h3>
		<input type="text" name="niveau"> </br> <input
			type="submit" value="Envoyer">
	</form>



	<a href="index.jsp">Retour au menu</a>
</body>
</html>