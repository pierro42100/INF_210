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
  
  System.out.println(request.getParameter("secteur"));
  String secteurStringTab[] = null;
  if(request.getParameter("secteur") != null){
	 secteurStringTab = request.getParameter("secteur").split(" ");//tous les id des secteurs récupérés dans un tableau
  }
  
  HashSet<Secteuractivite> secteuractivites = new HashSet<Secteuractivite>(); 
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
			int niveauId=1;//test
			
			//création de la liste des secteurs d'activités
			for(int i = 0 ; i < secteurStringTab.length ; i++)
			{
				secteuractivites.add(serviceSecteurActivite.getSecteur(Integer.parseInt(secteurStringTab[i])));
			}
			
			int id = serviceOffreEmploi.addOffreEmploi(titreString, descriptifString, profilString, secteuractivites, niveauId);
			
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
			<td><%=secteuractivites.toString()%></td>
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
		
		<select name="liste_secteurs" onChange="javascript:this.form.secteur.value = this.form.secteur.value + this.form.liste_secteurs.value + ' ';">
			<option value=""></option>
			<% 
		
			List<Secteuractivite> secteurs = serviceSecteurActivite.listeDesSecteur();
			for(Secteuractivite sec : secteurs){

		%>
			<option value="<%= sec.getId()%>"><%= sec.getIntitule()%></option>
			<%
			}
		%>
		</select> <input type="text" name="secteur">
		<h3>Niveaux qualifications</h3>
		<input type="text" name="niveau"> </br> <input type="submit"
			value="Envoyer">
	</form>



	<a href="index.jsp">Retour au menu</a>
</body>
</html>