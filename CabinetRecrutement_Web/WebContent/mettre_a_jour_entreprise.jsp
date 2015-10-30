<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise"%>

<%
// Récupération du service (bean session)
IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator
		.getInstance().getRemoteInterface("ServiceEntreprise");
	// Récupération du paramètre (id) passé par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
	// Attention : la valeur récupérée, même numérique, est sous la forme d'une chaîne de caractères.
	String idString = request.getParameter("id");
	String nomString = request.getParameter("nom");
	String descriptifString = request.getParameter("descriptif");
	String adressepostaleString = request
			.getParameter("adressepostale");
%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mettre à jour l'entreprise</title>
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
	<% if(nomString!=null && descriptifString != null && adressepostaleString != null){
			serviceEntreprise.updateEntreprise(Integer.parseInt(idString), nomString, descriptifString, adressepostaleString);
	}
	%>

	<%
		// Test en cas d'appel incorrect
		if (idString == null) {
	%>
	<p class="erreur">Erreur : il n'y a aucune entreprise qui
		corresponde.</p>
	<%
		} else // C'est à priori correct...
		{
			// Transformation de la chaine "idString" en un entier
			int id = Integer.parseInt(idString);
			// Appel de la fonctionnalité désirée auprès du service
			Entreprise entreprise = serviceEntreprise.getEntreprise(id);
	%>

	<!-- Affichage des information récupérées -->

	<h2>Infos entreprise :</h2>

	<table id="affichage" class="table-bordered table-striped">
		<tr>
			<th style="width: 170px;">Identifiant :</th>
			<td>ENT_<%=entreprise.getId()%>
			</td>
		</tr>
		<tr>
			<th>Nom :</th>
			<td><%=entreprise.getNom()%></td>
		</tr>
		<tr>
			<th>Descriptif :</th>
			<td><%=Utils.text2HTML(entreprise.getDescriptif())%></td>
		</tr>
		<tr>
			<th>Adresse postale (ville) :</th>
			<td><%=entreprise.getAdressePostale()%></td>
		</tr>
	</table>

	<h2>Mettre à jour les informations</h2>

	<form action="mettre_a_jour_entreprise.jsp" method="post">
		
		<input type="hidden" name="id" value="<%=entreprise.getId()%>">
		<h3>Nom</h3>
		<input type="text" name="nom">
		<h3>Descriptif</h3>
		<input type="text" name="descriptif">
		<h3>Adresse postale</h3>
		<input type="text" name="adressepostale"> </br> <input
			type="submit" value="Envoyer">
	</form>


	<a href="liste_entreprises.jsp">Retour à la liste des entreprises</a>

	<%
		}
	%>

</body>

</html>

