<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                java.util.HashSet,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi,
                java.util.List"%>

<%
	// R�cup�ration du service (bean session)
	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator
			.getInstance().getRemoteInterface("ServiceOffreEmploi");
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabinet de recrutement : liste offres r�f�renc�es</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body>

	<h2>Liste des offres d'emloi pour cette entreprise :</h2>
	<table id="affichage">
		<tr>
			<th>Id</th>
			<th>Titre</th>
			<th>Entreprise</th>
			<th>Niveau qualification</th>
			<th>Date d�pot</th>
			<th>Liste candidats</th> 
			
		</tr>
		<%
			List<Offreemploi> oe = serviceOffreEmploi.listeDesOffresEmploi();
			for (Offreemploi oeTemp : oe) {
		%>
		<tr>
			<td>Offre d'emploi_<%=oeTemp.getId()%></td>
			<td><%=oeTemp.getTitre() %></a></td>
			<td><%=oeTemp.getEntreprise().getNom() %></a></td>
			<td><%=oeTemp.getNiveauqualif().getIntitule() %></a></td>
			<td><%=oeTemp.getDateDepot() %></a></td>
			<td>Liste candidats - TODO</a></td>
			<th><a href="infos_offre.jsp?id=<%=oeTemp.getId()%>">Plus d'informations</a></th>
		</tr>
		<%
			}
		%>
	</table>

	<a href="index.jsp">Retour au menu</a>

</body>

</html>