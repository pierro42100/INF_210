<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                java.util.List"%>

<%
  // Récupération du service (bean session)
	IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
// Appel de la fonctionnalité désirée auprès du service
	List<Candidature> candidatures = serviceCandidature.listeDesCandidatures();
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabinet de recrutement : liste des candicatures</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script src="./js/bootstrap.min.js"></script>
</head>

<body class="container">

	<h2>Liste des candidatures référencées :</h2>

	<table id="affichage" class="table-striped table-bordered">
		<tr>
			<th>Numéro de candidature</th>
			<th>Nom</th>
			<th>Prénom</th>
			<th>Date de naissance</th>
			<th>Adresse électronique</th>
			<th>Adresse postale (ville)</th>
			<th>Date dépot</th>
			<th>CV</th>
			<th>Niveau de qualification</th>
		</tr>
		<%
		  for(Candidature candidature : candidatures)
		  {
		    %>
		<tr>
			<td>CAND_<%=candidature.getId()%></td>
			<td><a href="infos_candidature.jsp?id=<%=candidature.getId()%>"><%=candidature.getNom()%></a></td>
			<td><%=candidature.getPrenom()%></td>
			<td><%=candidature.getDateNaissance()%></td>
			<td><%=candidature.getAdresseEmail()%></td>
			<td><%=candidature.getAdressePostale()%></td>
			<td><%=candidature.getDateDepot()%></td>
			<td><%=candidature.getCv()%></td>
			<td><%=candidature.getNiveauqualif()%></td>
		</tr>
		<%
		  }
		  %>
	</table>

	<a href="index.jsp">Retour au menu</a>

</body>

</html>
