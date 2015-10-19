package eu.telecom_bretagne.cabinet_recrutement.front.controlesDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.Set;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.EntrepriseDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.CandidatureDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.NiveauQualificationDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.SecteurActiviteDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.OffreEmploiDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Niveauqualif;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi;
import eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator;
import eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocatorException;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/ControlesDAO")
public class ControlesDAOServlet extends HttpServlet
{
	//-----------------------------------------------------------------------------
	private static final long serialVersionUID = 1L;
	//-----------------------------------------------------------------------------
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControlesDAOServlet()
	{
		super();
	}
	//-----------------------------------------------------------------------------
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// Flot de sortie pour écriture des résultats.
		PrintWriter out = response.getWriter();

		// Récupération de la réféence vers le(s) DAO(s)
		EntrepriseDAO entrepriseDAO = null;
		CandidatureDAO candidatureDAO = null;
		NiveauQualificationDAO niveauQualificationDAO = null;
		SecteurActiviteDAO secteurActiviteDAO = null;
		OffreEmploiDAO offreEmploiDAO = null;

		try
		{
			entrepriseDAO = (EntrepriseDAO) ServicesLocator.getInstance().getRemoteInterface("EntrepriseDAO");
			candidatureDAO = (CandidatureDAO) ServicesLocator.getInstance().getRemoteInterface("CandidatureDAO");
			niveauQualificationDAO = (NiveauQualificationDAO) ServicesLocator.getInstance().getRemoteInterface("NiveauQualificationDAO");
			secteurActiviteDAO = (SecteurActiviteDAO) ServicesLocator.getInstance().getRemoteInterface("SecteurActiviteDAO");
			offreEmploiDAO = (OffreEmploiDAO) ServicesLocator.getInstance().getRemoteInterface("OffreEmploiDAO");

		}
		catch (ServicesLocatorException e)
		{
			e.printStackTrace();
		}
		out.println("Contrôles de fonctionnement du DAO EntrepriseDAO");
		out.println("¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨");
		out.println();
		
		out.println("##################################################");
		out.println("Persist");
		out.println("##################################################");
		Entreprise ent1 = new Entreprise();
		ent1.setAdressePostale("AdressePostale");
		ent1.setNom("Entreprise1");
		ent1.setDescriptif("Descriptif");
		entrepriseDAO.persist(ent1);
		
		out.println("##################################################");
		out.println("Update");
		out.println("##################################################");
		
		Entreprise ent4 = entrepriseDAO.findById(5);
		if(ent4 != null){
		ent4.setNom("NouveauNom");
		entrepriseDAO.update(ent4);
		}
				
		out.println("##################################################");
		out.println("Remove");
		out.println("##################################################");
		if(ent4 != null){
		entrepriseDAO.remove(ent4);
		}
		 

		// Contrôle(s) de fonctionnalités.
		out.println("Liste des entreprises :");
		out.println("¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨");
		List<Entreprise> entreprises = entrepriseDAO.findAll();

		for(Entreprise entreprise : entreprises)
		{
			out.println("nom:"+entreprise.getNom());
		}
		out.println();

		out.println("Obtention de l'entreprise n° 1 :");
		Entreprise e = entrepriseDAO.findById(1);
		out.println("id: "+e.getId());
		out.println("nom: "+e.getNom());
		out.println("descriptif: "+e.getDescriptif());
		out.println("aderss postale: "+e.getAdressePostale());
		out.println();

		out.println("Obtention de l'entreprise n° 2 :");
		e = entrepriseDAO.findById(2);
		out.println("id: "+e.getId());
		out.println("nom: "+e.getNom());
		out.println("descriptif: "+e.getDescriptif());
		out.println("adresse postale: "+e.getAdressePostale());
		out.println();
		
		
				
		
		out.println("---------------------------------------------------------------------------------------------------");

		out.println("Contrôles de fonctionnement du DAO CandidatureDAO");
		out.println("¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨");
		out.println();
		
		out.println("##################################################");
		out.println("Persist");
		out.println("##################################################");
		
		Candidature can1 = new Candidature();
		can1.setNom("Chovelon");
		can1.setPrenom("Pierrick");
		can1.setAdresseEmail("adresseMail");
		can1.setAdressePostale("AdressePostale");
		can1.setCv("CV CV CV CV CV CV CV CV");
		@SuppressWarnings("deprecation")
		Date dateDepot = new Date(2015, 1, 1);
		can1.setDateDepot(dateDepot);
		can1.setDateNaissance(new Date(1994, 12, 11));
		can1.setDescriptif("BBLABLABLABLABLA");
		Niveauqualif niveauQualif = niveauQualificationDAO.findById(1);
		// update à faire sur le niveau
		can1.setNiveauqualif(niveauQualif);
		
		can1.setSecteuractivites(new HashSet<Secteuractivite>());//initialise le secteuractivites de la candidature

		Secteuractivite s1 = secteurActiviteDAO.findById(1);
		can1.getSecteuractivites().add(s1);
		s1.getCandidatures().add(can1);
		//secteurActiviteDAO.update(s1);

		Secteuractivite s2 = secteurActiviteDAO.findById(2);
		can1.getSecteuractivites().add(s2);
		s2.getCandidatures().add(can1);
		//secteurActiviteDAO.update(s2);

		
		//can1.setSecteuractivites(secteurs);
					
		candidatureDAO.persist(can1);
		secteurActiviteDAO.update(s1);
		secteurActiviteDAO.update(s2);
		
		out.println("##################################################");
		out.println("Update");
		out.println("##################################################");
		
		Candidature can2 = candidatureDAO.findById(14);
		if(can2 != null){
		can2.setNom("NewName");
		candidatureDAO.update(can2);
		}
		
		out.println("##################################################");
		out.println("Remove");
		out.println("##################################################");
		if(can2 != null){
		candidatureDAO.remove(can2);
		}
		
		/*
		out.println("##################################################");
		out.println("Update");
		out.println("##################################################");
		
		Entreprise can2 = entrepriseDAO.findById(3);
		if(can2 != null){
		can2.setNom("NouveauNom");
		entrepriseDAO.update(can2);
		}
					
		out.println("##################################################");
		out.println("Remove");
		out.println("##################################################");
		if(can2 != null){
		entrepriseDAO.remove(can2);
		}*/


		// Contrôle(s) de fonctionnalités.
		out.println("Liste des candidatures :");
		out.println("¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨");
		List<Candidature> candidatures = candidatureDAO.findAll();

		for(Candidature candidature : candidatures)
		{
			out.println("id: "+candidature.getId());
			out.println("nom: "+candidature.getNom());
			out.println("prenom: "+candidature.getPrenom());
			out.println("adresse mail: "+candidature.getAdresseEmail());
			out.println("adresse postale: "+candidature.getAdressePostale());
			out.println("cv: "+candidature.getCv());
			out.println("date depot: "+candidature.getDateDepot());
			out.println("date naissance: "+candidature.getDateNaissance());
			out.println("descriptif: "+candidature.getDescriptif());
			out.println("niveau qualif: "+candidature.getNiveauqualif());
			out.println("secteur activite: "+candidature.getSecteuractivites());
			out.println();
		}
		out.println("Contrôles de fonctionnement du DAO NiveauQualigficationDAO");
		out.println("---------------------------------------------------------------------------------------------------");
		// Contrôle(s) de fonctionnalités.
		out.println("Liste des qualifications :");
		out.println("¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨");
		List<Niveauqualif> niveauxQualifs = niveauQualificationDAO.findAll();

		for(Niveauqualif niveauxQualif : niveauxQualifs)
		{
			out.println("intitule: "+niveauxQualif.getIntitule());
			out.println();
		}
		
		out.println("Contrôles de fonctionnement du DAO SecteurActiviteDAO");
		out.println("---------------------------------------------------------------------------------------------------");

		// Contrôle(s) de fonctionnalités.
		out.println("Liste des secteurs :");
		out.println("¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨");
		List<Secteuractivite> secteurActivites= secteurActiviteDAO.findAll();

		for(Secteuractivite secteurActivite: secteurActivites)
		{
			out.println("intitule: "+secteurActivite.getIntitule());
			out.println();
		}
	
		out.println("Contrôles de fonctionnement du DAO OffreEmploiDAO");
		out.println("---------------------------------------------------------------------------------------------------");
		
		// Contrôle(s) de fonctionnalités.
		out.println("Liste des offres :");
		out.println("¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨");
		List<Offreemploi> offreEmplois = offreEmploiDAO.findAll();

		for(Offreemploi offreEmploi : offreEmplois)
		{
			out.println("id: "+offreEmploi.getId());
			out.println("titre: "+offreEmploi.getTitre());
			out.println("date depot: "+offreEmploi.getDateDepot());
			out.println("descriptif mission: "+offreEmploi.getDescriptifMission());
			out.println("profil recherche: "+offreEmploi.getProfilRecherche());
			out.println("secteur activites: "+offreEmploi.getSecteuractivites());
			out.println("entreprise: "+offreEmploi.getEntreprise());
			out.println("niveau qualif: "+offreEmploi.getNiveauqualif());
			out.println();
		}
		out.println("---------------------------------------------------------------------------------------------------");

	}
	//-----------------------------------------------------------------------------
}
