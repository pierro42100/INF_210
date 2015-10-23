<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature"%>

<%
  Object utilisateur = session.getAttribute("utilisateur");
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabinet de recrutement</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body>

<a href="connexion.jsp">CONNEXION</a>

	<h2>Menu principal</h2>

	<h3>Entreprise</h3>
	
	<ul>
		<li><a href="liste_entreprises.jsp">Liste des entreprises référencées</a></li>
		<li><a href="referencer_entreprise.jsp">Référencer une entreprise</a></li>
		<%
	  if(utilisateur != null && utilisateur instanceof Entreprise)
	  {
		  Entreprise e = (Entreprise) utilisateur;
	    %>
		<ul>
			<h4>Mode connecté entreprise</h4>
			<li><a href="liste_offres_entreprise.jsp?id=<%= e.getId()%>">Lister les offres d'emplois</a></li>
			<li><a href="">Envoyer un message à un candidat</a></li>
			<li><a href="">Lister les messages reçus des candidats</a></li>
			<li><a href="">Lister les messages envoyés aux candidats</a></li>
			<li><a href="mettre_a_jour_entreprise.jsp?id=<%= e.getId()%>">Mettre à jour une entreprise</a></li>
		    <li><a href="supprimer_entreprise.jsp?id=<%= e.getId()%>">Supprimer entreprise</a></li>
		</ul>
		<% } %>
	</ul>

	<h3>Offre emploi</h3>
	<ul>
		<li><a href="liste_offres.jsp">Lister les offres d'emploi</a></li>
		<% if(session.getAttribute("utilisateur") != null){
			Entreprise e = (Entreprise) utilisateur;
		%>
		<ul>
			<h4>Mode connecté entreprise</h4>
			<li><a href="referencer_offre.jsp">Référencer une offre d'emploi</a></li>
			<li><a href="mettre_a_jour_offre.jsp?idEntreprise=<%= e.getId()%>">Modifier une offre d'emploi</a></li>
			<li><a href="">Supprimer une offre d'emploi</a></li>
		</ul>
		<%} %>
		<ul>
			<h4>Mode connecté utilisateur</h4>
			<li><a href="">Liste des offres d'emplois</a></li>
		</ul>
	</ul>
	
	<h3>Candidatures</h3>
	<ul>
		<li><a href="">Liste des candidatures</a></li>
		<li><a href="">Référencer une candidature</a></li>
		<ul>
			<h4>Mode connecté utilisateur</h4>
			<li><a href="">Mettre à jour sa candidature</a></li>
			<li><a href="">Supprimer sa candidature</a></li>
			<li><a href="">Envoyer un message entreprise concernant offre emploi</a></li>
			<li><a href="">Lister messages reçus par entreprise</a></li>
			<li><a href="">Lister message envoyés aux entreprises</a></li>
		</ul>
	</ul>
</body>

</html>
