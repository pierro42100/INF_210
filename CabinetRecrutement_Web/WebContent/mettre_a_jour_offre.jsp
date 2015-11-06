<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceSecteurs,
                java.util.HashSet,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi,
                java.util.List"%>

<%
	//Récupération du service (bean session)
	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator
			.getInstance().getRemoteInterface("ServiceOffreEmploi");
	//Récupération du service (bean session)
	IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator
			.getInstance().getRemoteInterface("ServiceEntreprise");
	IServiceSecteurs serviceSecteurActivite= (IServiceSecteurs) ServicesLocator
			.getInstance().getRemoteInterface("ServiceSecteurs");
	// Récupération du paramètre (id) passé par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
	// Attention : la valeur récupérée, même numérique, est sous la forme d'une chaîne de caractères.
		
	String idStringEntreprise = request.getParameter("idEntreprise");
	String idStringOffre = request.getParameter("idOffre");
	String titreString = request.getParameter("titre");
	String descriptifString = request.getParameter("descMission");
	String profilString = request.getParameter("profil");
	String secteursString[]  = request.getParameterValues("secteur");  
	String niveauString = request.getParameter("niveau");
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mettre à jour une offre</title>
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

	<%
		if (titreString != null && descriptifString != null) {
			serviceOffreEmploi.updateOffreEmploi(Integer.parseInt(idStringOffre), titreString, descriptifString, profilString, secteursString, Integer.parseInt(niveauString));
		}
	%>

	<%
		// Test en cas d'appel incorrect
		if (idStringEntreprise == null) {
	%>
	<p class="erreur">Erreur : il n'y a aucune entreprise qui
		correspond.</p>
	<%
		} else // C'est à priori correct...
		{
			// Transformation de la chaine "idString" en un entier
			int idEntreprise = Integer.parseInt(idStringEntreprise);
			// Appel de la fonctionnalité désirée auprès du service
			Entreprise entreprise = serviceEntreprise.getEntreprise(idEntreprise);
	%>

	<h2>Liste des offres d'emloi pour cette entreprise.</h2>
	<h2>Sélectionner l'offre à mettre à jour</h2>
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
			HashSet<Offreemploi> oe = (HashSet) entreprise.getOffreemplois();
				for (Offreemploi oeTemp : oe) {
		%>
		<tr>
			<td>Offre d'emploi_<%=oeTemp.getId()%></td>
			<td><%=oeTemp.getTitre()%></a></td>
			<td><%=oeTemp.getEntreprise().getNom()%></a></td>
			<td><%=oeTemp.getNiveauqualif().getIntitule()%></a></td>
			<td><%=oeTemp.getDateDepot()%></a></td>
			<td>Liste candidats - TODO</a></td>
			<th><a href="mettre_a_jour_offre.jsp?idOffre=<%=oeTemp.getId()%>&idEntreprise=<%=idStringEntreprise%>">Mettre
					à jour</a></th>
		</tr>
		<%
			}
		}
		%>
	</table>

	<h2>Mettre à jour les information de l'offre <%=idStringOffre %></h2>

	<form action="mettre_a_jour_offre.jsp" method="post">

		<input type="hidden" name="idEntreprise" value="<%=idStringEntreprise%>">
		<input type="hidden" name="idOffre" value="<%=idStringOffre%>">
		<h3>Titre</h3>
		<input type="text" name="titre">
		<h3>description de la mission</h3>
		<input type="text" name="descMission">
		<h3>Profil recherché</h3>
		<input type="text" name="profil">
	<h3>Secteurs</h3>
		<th>Secteur(s) d'activité :</th>
		<td>
			<table id="tab_interne" class="table-bordered table-striped">
				<tr>
					<td><input type="checkbox" name="secteur" value="1">Achats/Logistique</td>
					<td><input type="checkbox" name="secteur" value="2">Assistanat/Secrétariat</td>
					<td><input type="checkbox" name="secteur" value="3">Agriculture</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="secteur" value="4">Agroalimentaire</td>
					<td><input type="checkbox" name="secteur" value="5">Assurance</td>
					<td><input type="checkbox" name="secteur" value="6">Audit/Conseil/Expertises</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="secteur" value="7">BTP/Immobilier</td>
					<td><input type="checkbox" name="secteur" value="8">Commercial</td>
					<td><input type="checkbox" name="secteur" value="9">Communication/Art/Média/Mode</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="secteur" value="10">Comptabilité</td>
					<td><input type="checkbox" name="secteur" value="11">Direction
						Générale/Executive</td>
					<td><input type="checkbox" name="secteur" value="12">Distribution/Commerce</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="secteur" value="13">Electronique/Microélectronique</td>
					<td><input type="checkbox" name="secteur" value="14">Environnement</td>
					<td><input type="checkbox" name="secteur" value="15">Finance/Banque</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="secteur" value="16">Formation/Enseignement</td>
					<td><input type="checkbox" name="secteur" value="17">Hôtellerie/Restauration/Tourisme</td>
					<td><input type="checkbox" name="secteur" value="18">Industrie/Ingénierie/Production</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="secteur" value="19">Informatique</td>
					<td><input type="checkbox" name="secteur" value="20">Juridique/Fiscal/Droit</td>
					<td><input type="checkbox" name="secteur" value="21">Marketing</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="secteur" value="22">Public/Parapublic</td>
					<td><input type="checkbox" name="secteur" value="23">Ressources
						Humaines</td>
					<td><input type="checkbox" name="secteur" value="24">Santé/Social/Biologie/Humanitaire</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="secteur" value="25">Télécom/Réseaux</td>
				</tr>
			</table>
		</td>
		<h3>Niveaux qualifications</h3>
		<td>
			<table id="tab_interne" class="table-bordered table-striped">
				<tr>
					<td><input type="radio" name="niveau" value="1">CAP/BEP</td>
					<td><input type="radio" name="niveau" value="2">Bac</td>
					<td><input type="radio" name="niveau" value="3">Bac+3</td>
					<td><input type="radio" name="niveau" value="4">Bac+5</td>
					<td><input type="radio" name="niveau" value="5">Doctorat</td>
				</tr>
			</table>
		</td>
		
		<input type="submit" value="Modifier">
	</form>
	<a href="index.jsp">Retour au menu</a>

</body>

</html>
