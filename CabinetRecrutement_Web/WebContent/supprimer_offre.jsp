<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi"%>

<%
// Récupération du service (bean session)
IServiceOffreEmploi serviceOffre = (IServiceOffreEmploi) ServicesLocator
		.getInstance().getRemoteInterface("ServiceOffreEmploi");
	// Récupération du paramètre (id) passé par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
	// Attention : la valeur récupérée, même numérique, est sous la forme d'une chaîne de caractères.
	String idString = request.getParameter("id");
%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mettre à jour l'entreprise)</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body>
	<% if(idString != null){
			serviceOffre.removeOffreEmploi(Integer.parseInt(idString));
	}
	%>

	<h1>Entreprise suprimée</h1>


	<a href="liste_entreprises.jsp">Retour à la liste des entreprises</a>


</body>

</html>

