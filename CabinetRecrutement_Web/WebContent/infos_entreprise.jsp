<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise"%>

<%
  // R�cup�ration du param�tre (id) pass� par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
  // Attention : la valeur r�cup�r�e, m�me num�rique, est sous la forme d'une cha�ne de caract�res.
  String idString = request.getParameter("id");
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
  
		<%
		  // Test en cas d'appel incorrect
		  if(idString == null)
		  {
		    %>
		    <p class="erreur">Erreur : il n'y a aucune entreprise qui corresponde � cette recherche.</p>
		    <%
		  }
		  else // C'est � priori correct...
		  {
		  	// Transformation de la chaine "idString" en un entier
        int id = Integer.parseInt(idString);
		  	// R�cup�ration du service (bean session)
		    IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator.getInstance().getRemoteInterface("ServiceEntreprise");
		  	// Appel de la fonctionnalit� d�sir�e aupr�s du service
		    Entreprise entreprise = serviceEntreprise.getEntreprise(id);
		    %>
		    
		    <!-- Affichage des information r�cup�r�es -->
		    
		    <h2>Infos entreprise :</h2>

		    <table id="affichage" class="table-striped table-bordered">
		      <tr>
		        <th style="width: 170px;">Identifiant :</th>
		        <td>
		          ENT_<%=entreprise.getId()%>
		        </td>
		      </tr>
		      <tr>
		        <th>Nom :</th>
		        <td>
		          <%=entreprise.getNom()%>
		        </td>
		      </tr>
		      <tr>
		        <th>Descriptif :</th>
		        <td>
		          <%=Utils.text2HTML(entreprise.getDescriptif())%>
		        </td>
		      </tr>
		      <tr>
		        <th>Adresse postale (ville) :</th>
		        <td>
		          <%=entreprise.getAdressePostale()%>
		        </td>
		      </tr>
		    </table>
        
        <a href="liste_entreprises.jsp">Retour � la liste des entreprises</a>

		    <%
		  }
		%>
		
  </body>
  
</html>

