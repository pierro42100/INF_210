<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                java.util.HashSet,
                java.util.Set,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Niveauqualif,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                java.util.List"%>

<%
	// Récupération du service (bean session)
	IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator
			.getInstance().getRemoteInterface("ServiceEntreprise");
IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator
.getInstance().getRemoteInterface("ServiceCandidature");
	String idString = request.getParameter("id");
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabinet de recrutement : liste des entreprises
	référencées</title>
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

	<h2>Liste des offres d'emloi pour cette entreprise :</h2>
	<table id="affichage" class="table-striped table-bordered">
		<tr>
			<th>Id</th>
			<th>Titre</th>
			<th>Entreprise</th>
			<th>Niveau qualification</th>
			<th>Date dépot</th>
			<th>Liste candidats</th>
			<th>MAJ/DEL</th>
		</tr>
		<%
			Entreprise e = serviceEntreprise.getEntreprise(Integer.parseInt(idString));
			HashSet<Offreemploi> oe = (HashSet) e.getOffreemplois();
			for (Offreemploi oeTemp : oe) {
				HashSet<Candidature> candtotal = new HashSet<Candidature>();
				HashSet<Secteuractivite> sect =(HashSet) oeTemp.getSecteuractivites();
				Niveauqualif niveau =oeTemp.getNiveauqualif();
				Set<Candidature> candNiv=niveau.getCandidatures();
		%>
		<tr>
			<td>Offre d'emploi_<%=oeTemp.getId()%></td>
			<td><%=oeTemp.getTitre() %></td>
			<td><%=oeTemp.getEntreprise().getNom() %></td>
			<td><%=oeTemp.getNiveauqualif().getIntitule() %></td>
			<td><%=oeTemp.getDateDepot() %></td>
			<td>
				<%
					for(Secteuractivite s : sect){
						Set<Candidature> cand = s.getCandidatures();
							for(Candidature c : cand){
								for(Candidature ce2 : candNiv){
									if(c.equals(ce2)){
						candtotal.add(c);
									}
								}
							}
					}
				for(Candidature can : candtotal){
					%> -<%=can.getNom()%><br> <%
				}
				%>
			</td>
			<td><a href="index.jsp">MAJ</a>/<a
				href="supprimer_offre.jsp?id=<%= oeTemp.getId()%>">DEL</a></td>
		</tr>
		<%
			}
		%>
	</table>

	<a href="index.jsp">Retour au menu</a>

</body>

</html>
