<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature"%>

<%
	Object utilisateur = session.getAttribute("utilisateur");
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabinet de recrutement</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script src="./js/bootstrap.min.js"></script>
</head>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp"> Accueil </a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<%
					if (utilisateur != null && utilisateur instanceof Entreprise) {
						Entreprise e = (Entreprise) utilisateur;
				%>
				<li><a href="deconnexion.jsp">DECONNEXION(ENT_<%=e.getId()%>)
				</a></li>
				<%
					} else if (utilisateur != null
							&& utilisateur instanceof Candidature) {
						Candidature c = (Candidature) utilisateur;
				%>
				<li><a href="deconnexion.jsp">DECONNEXION(CAND_<%=c.getId()%>)
				</a></li>
				<%
					} else {
				%>
				<li><a href="connexion.jsp">CONNEXION</a></li>
				<%
					}
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">ENTREPRISE <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="liste_entreprises.jsp">Liste des entreprises
								référencées</a></li>
						<li><a href="referencer_entreprise.jsp">Référencer une
								entreprise</a></li>
						<%
							if (utilisateur != null && utilisateur instanceof Entreprise) {
								Entreprise e = (Entreprise) utilisateur;
						%>
						<li role="separator" class="divider"></li>
						<li><a href="liste_offres_entreprise.jsp?id=<%=e.getId()%>">Lister
								les offres d'emplois</a></li>
						<li><a href="">Envoyer un message à un candidat</a></li>
						<li><a href="">Lister les messages reçus des candidats</a></li>
						<li><a href="">Lister les messages envoyés aux candidats</a></li>
						<li><a href="mettre_a_jour_entreprise.jsp?id=<%=e.getId()%>">Mettre
								à jour une entreprise</a></li>
						<li><a href="supprimer_entreprise.jsp?id=<%=e.getId()%>">Supprimer
								entreprise</a></li>
						<%
							}
						%>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">OFFRE EMPLOI <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="liste_offres.jsp">Lister les offres d'emploi</a></li>
						<%
							if (utilisateur != null && utilisateur instanceof Entreprise) {
								Entreprise e = (Entreprise) utilisateur;
						%>
						<li role="separator" class="divider"></li>
						<li><a
							href="referencer_offre.jsp?idEntreprise=<%=e.getId()%>">Référencer
								une offre d'emploi</a></li>
						<li><a
							href="mettre_a_jour_offre.jsp?idEntreprise=<%=e.getId()%>">Modifier
								une offre d'emploi</a></li>
						<%
							}
						%>
						<%
							if (utilisateur != null && utilisateur instanceof Candidature) {
								Candidature c = (Candidature) utilisateur;
						%>
						<li role="separator" class="divider"></li>
						<li><a href="liste_offres_candidature.jsp?id=<%=c.getId()%>">Liste
								des offres d'emplois</a></li>
						<%
							}
						%>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">CANDIDATURE <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="liste_candidatures.jsp">Liste des
								candidatures</a></li>
						<li><a href="referencer_candidature.jsp">Référencer une
								candidature</a></li>
						<%
							if (utilisateur != null && utilisateur instanceof Candidature) {
								Candidature c = (Candidature) utilisateur;
						%>
						<li role="separator" class="divider"></li>
						<li><a href="">Mettre à jour sa candidature</a></li>
						<li><a href="">Supprimer sa candidature</a></li>
						<li><a href="">Envoyer un message entreprise concernant
								offre emploi</a></li>
						<li><a href="">Lister messages reçus par entreprise</a></li>
						<li><a href="">Lister message envoyés aux entreprises</a></li>
						<%
							}
						%>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
<body class="container">
	<a href="cabinet_recrutement_offres_rss.jsp">RSS - Offres</a><br>
	<a href="cabinet_recrutement_candidatures_rss.jsp">RSS - Candidature</a>
</body>

</html>
