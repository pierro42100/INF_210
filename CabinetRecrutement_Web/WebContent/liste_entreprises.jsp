<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                java.util.List"%>

<%
  // R�cup�ration du service (bean session)
	IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator.getInstance().getRemoteInterface("ServiceEntreprise");
// Appel de la fonctionnalit� d�sir�e aupr�s du service
	List<Entreprise> entreprises = serviceEntreprise.listeDesEntreprises();
%>

<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Cabinet de recrutement : liste des entreprises r�f�renc�es</title>
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
  
		<h2>Liste des entreprises r�f�renc�es :</h2>

		<table id="affichage" class="table-striped table-bordered">
		  <tr>
		    <th>Identifiant</th>
		    <th>Nom</th>
		    <th>Adresse postale (ville)</th>
		    <th>Nombre offre emploi</th>
		  </tr>
		  <%
		  for(Entreprise entreprise : entreprises)
		  {
		    %>
		    <tr>
		     <td>ENT_<%=entreprise.getId()%></td>
		     <td><a href="infos_entreprise.jsp?id=<%=entreprise.getId()%>"><%=entreprise.getNom()%></a></td>
		     <td><%=entreprise.getAdressePostale()%></td>
		     <td><%=entreprise.getNombreOffreemplois()%></td>
		    </tr>
		    <%
		  }
		  %>
		</table>

    <a href="index.jsp">Retour au menu</a>

  </body>
  
</html>
