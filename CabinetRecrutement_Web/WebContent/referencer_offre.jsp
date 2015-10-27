<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceSecteurs,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi,
                java.util.List,
                java.util.HashSet"%>

<%
//Récupération du service (bean session)
	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator
			.getInstance().getRemoteInterface("ServiceOffreEmploi");
//Récupération du service (bean session)
	IServiceSecteurs serviceSecteurActivite= (IServiceSecteurs) ServicesLocator
			.getInstance().getRemoteInterface("ServiceSecteurs");
	// Appel de la fonctionnalité désirée auprès du service
	List<Offreemploi> offres = serviceOffreEmploi.listeDesOffresEmploi();
%>
<%
  // Récupération du paramètre (id) passé par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
  // Attention : la valeur récupérée, même numérique, est sous la forme d'une chaîne de caractères.
  String titreString = request.getParameter("titre");
  String descriptifString = request.getParameter("descriptif");
  String profilString = request.getParameter("profil");
  String idEntreprise = request.getParameter("idEntreprise");
  String secteursString[]  = request.getParameterValues("secteur");  
  String niveauString = request.getParameter("niveau");
  
  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Référencer offre</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body style="text-align: center">

	<% if(titreString!=null){
		
			int id = serviceOffreEmploi.addOffreEmploi(titreString, descriptifString, profilString, secteursString, Integer.parseInt(niveauString), Integer.parseInt(idEntreprise));
	%>
	<table id="affichage" style="text-align: center">
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
			<td><%=secteursString.toString()%></td>
			<td><%=niveauString%></td>

		</tr>
	</table>

	<% }%>

	<h2>Référencer offre</h2>
	<form action="referencer_offre.jsp" method="post">
		<h3>Titre</h3>
		<input type="text" name="titre">
		<h3>Descriptif</h3>
		<input type="text" name="descriptif">
		<h3>Profil</h3>
		<input type="text" name="profil">
		<h3>Secteurs</h3>
		<th>Secteur(s) d'activité :</th>
		<td>
			<table id="tab_interne">
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
			<table id="tab_interne">
				<tr>
					<td><input type="radio" name="niveau" value="1">CAP/BEP</td>
					<td><input type="radio" name="niveau" value="2">Bac</td>
					<td><input type="radio" name="niveau" value="3">Bac+3</td>
					<td><input type="radio" name="niveau" value="4">Bac+5</td>
					<td><input type="radio" name="niveau" value="5">Doctorat</td>
				</tr>
			</table>
		</td>

		<input type="hidden" name="idEntreprise" value="<%=idEntreprise%>">
		<input type="submit" value="Envoyer">
	</form>



	<a href="index.jsp">Retour au menu</a>
</body>
</html>