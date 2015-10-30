<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                java.util.HashSet,
                java.util.Set,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite,
                java.util.List"%>

<%
	// Récupération du service (bean session)
	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator
			.getInstance().getRemoteInterface("ServiceOffreEmploi");
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabinet de recrutement : liste offres référencées</title>
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
			<th>Date dépot</th>
			<th>Liste candidats</th> 
			
		</tr>
		<%
			List<Offreemploi> oe = serviceOffreEmploi.listeDesOffresEmploi();
			for (Offreemploi oeTemp : oe) {
				HashSet<Secteuractivite> sect =(HashSet) oeTemp.getSecteuractivites();
		%>
		<tr>
			<td>Offre d'emploi_<%=oeTemp.getId()%></td>
			<td><%=oeTemp.getTitre() %></td>
			<td><%=oeTemp.getEntreprise().getNom() %></td>
			<td><%=oeTemp.getNiveauqualif().getIntitule() %></td>
			<td><%=oeTemp.getDateDepot() %></td>
			<td><%
					for(Secteuractivite s : sect){
						Set<Candidature> cand = s.getCandidatures();
							for(Candidature c : cand){
						%>
						-<%=c.getNom()%><br>
						<%
							}
					}
				%></td>
			<th><a href="infos_offre.jsp?id=<%=oeTemp.getId()%>">Plus d'informations</a></th>
		</tr>
		<%
			}
		%>
	</table>

	<a href="index.jsp">Retour au menu</a>

</body>

</html>
