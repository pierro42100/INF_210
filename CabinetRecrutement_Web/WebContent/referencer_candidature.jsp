<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceSecteurs,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                java.util.List,
                java.util.HashSet"%>

<%
//Récupération du service (bean session)
	IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator
			.getInstance().getRemoteInterface("ServiceCandidature");
//Récupération du service (bean session)
	IServiceSecteurs serviceSecteurActivite= (IServiceSecteurs) ServicesLocator
			.getInstance().getRemoteInterface("ServiceSecteurs");
	// Appel de la fonctionnalité désirée auprès du service
	List<Candidature> candidature = serviceCandidature.listeDesCandidatures();
%>
<%
  // Récupération du paramètre (id) passé par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
  // Attention : la valeur récupérée, même numérique, est sous la forme d'une chaîne de caractères.
  String nomString = request.getParameter("nom");
  String prenomString = request.getParameter("prenom");
  String dateNaissanceString = request.getParameter("dateNaissance");
  String adressePostaleString = request.getParameter("adressePostale");
  String addresseElecString = request.getParameter("adresseElec");
  String dateDepotString = request.getParameter("dateDepot");
  String cvString = request.getParameter("cv");
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

	<% if(nomString!=null){
			int id = serviceCandidature.addCandidature(nomString, prenomString, dateNaissanceString, adressePostaleString, addresseElecString, dateDepotString, cvString, secteursString, Integer.parseInt(niveauString));
			//int id =1;
	%>
	<table id="affichage" style="text-align: center">
		<tr>
			<th>Identifiant</th>
			<th>Nom</th>
			<th>Prenom</th>
			<th>Date de naissance</th>
			<th>Adresse postale</th>
			<th>Adresse electronique</th>
			<th>Date Depot</th>
			<th>CV</th>
			<th>Secteur</th>
			<th>Niveau Qualif</th>
		</tr>
		<tr>
			<td><%=id%></td>
			<td><%=nomString%></td>
			<td><%=prenomString%></td>
			<td><%=dateNaissanceString%></td>
			<td><%=adressePostaleString%></td>
			<td><%=addresseElecString%></td>
			<td><%=dateDepotString%></td>
			<td><%=cvString%></td>
			<%
			String secteurAffichage = "";
			for(int i = 0; i < secteursString.length ; i++){
				
				Secteuractivite sect = serviceSecteurActivite.getSecteur(Integer.parseInt(secteursString[i]));
				secteurAffichage += sect.toString() + " - ";
			}
			%>
			<td><%=secteurAffichage%></td>
			<td><%=niveauString%></td>

		</tr>
	</table>

	<% }%>

	<h2>Référencer candidature</h2>
	<form action="referencer_candidature.jsp" method="post">
		<h3>Nom</h3>
		<input type="text" name="nom">
		<h3>Prenom</h3>
		<input type="text" name="prenom">
		<h3>Date de naissance</h3>
		<input type="text" name="dateNaissance">
		<h3>Adresse postale</h3>
		<input type="text" name="adressePostale">
		<h3>Adresse electronique</h3>
		<input type="text" name="adresseElec">
		<h3>Date de depot</h3>
		<input type="text" name="dateDepot">
		<h3>CV</h3>
		<input type="textarea" name="cv"><br>

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
		</td> <input type="submit" value="Envoyer">
	</form>



	<a href="index.jsp">Retour au menu</a>
</body>
</html>