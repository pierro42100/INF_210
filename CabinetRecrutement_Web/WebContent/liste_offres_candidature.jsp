<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                java.util.HashSet,
                java.util.Set,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Niveauqualif,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite,
                java.util.List"%>

<%
	// Récupération du service (bean session)
	IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator
	.getInstance().getRemoteInterface("ServiceCandidature");
	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator
	.getInstance().getRemoteInterface("ServiceOffreEmploi");
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

	<h2>Liste des offres d'emloi pour ce candidat :</h2>
	<table id="affichage" class="table-striped table-bordered">
		<tr>
			<th>Id</th>
			<th>Titre</th>
			<th>Entreprise</th>
			<th>Niveau qualification</th>
			<th>Date dépot</th>
			<th>Liste candidats</th>
		</tr>
		<%
			Candidature c = serviceCandidature.getCandidature(Integer.parseInt(idString));
				Set<Offreemploi> oen = c.getNiveauqualif().getOffreemplois();
				Set<Secteuractivite> secteurs = c.getSecteuractivites();
				Set<Offreemploi> oes = new HashSet<Offreemploi>();
				Set<Offreemploi> total = new HashSet<Offreemploi>();
				for(Secteuractivite s : secteurs){
			oes=s.getOffreemplois();
			for(Offreemploi oe1 : oes){
				for(Offreemploi oe2 : oen){
					if(oe1.equals(oe2)){
						total.add(oe1);
					}
				}
			}
				}
				
			//List<Offreemploi> oe = serviceOffreEmploi.listeDesOffresEmploi();

			for (Offreemploi oeTemp : total) {
				HashSet<Candidature> candtotal = new HashSet<Candidature>();
				HashSet<Secteuractivite> sect =(HashSet) oeTemp.getSecteuractivites();
				Niveauqualif niveau =oeTemp.getNiveauqualif();
				Set<Candidature> candNiv=niveau.getCandidatures();
		%>
		<tr>
			<td>Offre d'emploi_<%=oeTemp.getId()%></td>
			<td><%=oeTemp.getTitre()%></td>
			<td><%=oeTemp.getEntreprise().getNom()%></td>
			<td><%=oeTemp.getNiveauqualif().getIntitule()%></td>
			<td><%=oeTemp.getDateDepot()%></td>
			<td>
				<%
					for(Secteuractivite s : sect){
								Set<Candidature> cand = s.getCandidatures();
									for(Candidature ce : cand){
										for(Candidature ce2 : candNiv){
											if(ce.equals(ce2)){
				candtotal.add(ce);
 	}
 						}
 					}
 			}
				for(Candidature can : candtotal){
					%> -<%=can.getNom()%><br> <%
				}
 %>
			</td>
		</tr>
		<%
			}
		%>
	</table>

	<a href="index.jsp">Retour au menu</a>

</body>

</html>
