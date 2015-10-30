<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi"%>

<%
  // Récupération du paramètre (id) passé par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
  // Attention : la valeur récupérée, même numérique, est sous la forme d'une chaîne de caractères.
  String idString = request.getParameter("id");
%>


<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Informations sur l'offre d'emploi</title>
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
		  // Test en cas d'appel incorrect
		  if(idString == null)
		  {
		    %>
		    <p class="erreur">Erreur : il n'y a aucune offre qui corresponde à cette recherche.</p>
		    <%
		  }
		  else // C'est à priori correct...
		  {
		  	// Transformation de la chaine "idString" en un entier
      		int id = Integer.parseInt(idString);
		  	// Récupération du service (bean session)
		    IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator.getInstance().getRemoteInterface("ServiceOffreEmploi");
		  	// Appel de la fonctionnalité désirée auprès du service
		  	Offreemploi oe = serviceOffreEmploi.getOffreEmploi(id);
		    %>
		    
		    <!-- Affichage des information récupérées -->
		    
		    <h2>Infos de l'offre :</h2>

		    <table id="affichage" class="table-striped table-bordered">
		      <tr>
		        <th style="width: 170px;">Numéro de l'offre :</th>
		        <td>
		          <%=oe.getId()%>
		        </td>
		      </tr>
		      <tr>
		        <th>Titre de l'offre :</th>
		        <td>
		          <%=oe.getTitre()%>
		        </td>
		      </tr>
		      <tr>
		        <th>Descriptif de la mission :</th>
		        <td>
		          <%=Utils.text2HTML(oe.getDescriptifMission())%>
		        </td>
		      </tr>
		      <tr>
		        <th>Descriptif de l'entreprise :</th>
		        <td>
		          <%=Utils.text2HTML(oe.getEntreprise().getDescriptif())%>
		        </td>
		      </tr>
		      <tr>
		        <th>Profil recherché :</th>
		        <td>
		          <%=oe.getProfilRecherche()%>
		        </td>
		      </tr>
		      <tr>
		        <th>Lieu de la mission :</th>
		        <td>
		          <%=oe.getEntreprise().getAdressePostale()%>
		        </td>
		      </tr>
		       <tr>
		        <th>Niveau de qualification demandé :</th>
		        <td>
		          <%=oe.getNiveauqualif().toString()%>
		        </td>
		      </tr>
		       <tr>
		        <th>Liste secteur activité :</th>
		        <td>
		          <%=oe.getSecteuractivites().toString()%>
		        </td>
		      </tr>
		       <tr>
		        <th>Date de dépôt :</th>
		        <td>
		          <%=oe.getDateDepot()%>
		        </td>
		      </tr>
		    </table>
        
        <a href="liste_offres.jsp">Retour à la liste des offres</a>

		    <%
		  }
		%>
		
  </body>
  
</html>

