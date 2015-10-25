<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi"%>

<%
  // R�cup�ration du param�tre (id) pass� par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
  // Attention : la valeur r�cup�r�e, m�me num�rique, est sous la forme d'une cha�ne de caract�res.
  String idString = request.getParameter("id");
%>


<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Informations sur la candidature</title>
    <link rel="stylesheet" href="styles.css" type="text/css" />
  </head>

  <body>
  
		<%
		  // Test en cas d'appel incorrect
		  if(idString == null)
		  {
		    %>
		    <p class="erreur">Erreur : il n'y a aucune offre qui corresponde � cette recherche.</p>
		    <%
		  }
		  else // C'est � priori correct...
		  {
		  	// Transformation de la chaine "idString" en un entier
      		int id = Integer.parseInt(idString);
		  	// R�cup�ration du service (bean session)
		    IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
			// Appel de la fonctionnalit� d�sir�e aupr�s du service
		  	Candidature candidature = serviceCandidature.getCandidature(id);
		    %>
		    
		    <!-- Affichage des information r�cup�r�es -->
		    
		    <h2>Infos de la candidature :</h2>

		    <table id="affichage">
		      <tr>
		        <th style="width: 170px;">Identifiant :</th>
		        <td>
		          CAND_<%=candidature.getId()%>
		        </td>
		      </tr>
		      <tr>
		        <th>Nom :</th>
		        <td>
		          <%=candidature.getNom()%>
		        </td>
		      </tr>
		      <tr>
		        <th>Pr�nom :</th>
		        <td>
		          <%=candidature.getPrenom()%>
		        </td>
		      </tr>
		      <tr>
		        <th>Date naissance :</th>
		        <td>
		          <%=candidature.getDateNaissance()%>
		        </td>
		      </tr>
		      <tr>
		        <th>Adresse postale:</th>
		        <td>
		          <%=candidature.getAdressePostale()%>
		        </td>
		      </tr>
		      <tr>
		        <th>Adresse email :</th>
		        <td>
		          <%=candidature.getAdresseEmail()%>
		        </td>
		      </tr>
		       <tr>
		        <th>Niveau de qualification poss�d� :</th>
		        <td>
		          <%=candidature.getNiveauqualif().toString()%>
		        </td>
		      </tr>
		       <tr>
		        <th>Liste secteur activit� :</th>
		        <td>
		          <%=candidature.getSecteuractivites().toString()%>
		        </td>
		      </tr>
		       <tr>
		        <th>Date de d�p�t :</th>
		        <td>
		          <%=candidature.getDateDepot()%>
		        </td>
		      </tr>
		    </table>
        
        <a href="liste_offres.jsp">Retour � la liste des offres</a>

		    <%
		  }
		%>
		
  </body>
  
</html>

