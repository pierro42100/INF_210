package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.CandidatureDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.NiveauQualificationDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.SecteurActiviteDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Niveauqualif;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite;

/**
 * Session Bean implementation class IServiceCnadidature
 * 
 * @author Philippe TANGUY
 */
@Stateless
@LocalBean
public class ServiceCandidature implements IServiceCandidature
{
	@EJB
	private CandidatureDAO candidatureDAO;
	@EJB
	private SecteurActiviteDAO secteurActiviteDAO;
	@EJB
	private NiveauQualificationDAO niveauQualifDAO;
	//-----------------------------------------------------------------------------
	/**
	 * Obtention d'une candidature suivant son id.
	 * @param id id de l'entreprise.
	 * @return l'instance de l'entreprise.
	 */
	//-----------------------------------------------------------------------------
	public Candidature getCandidature(int id){
		return candidatureDAO.findById(id);
	}
	/**
	 * Obtention de la liste de toutes les candidatures référencées dans le système.
	 * @return la liste des candidatures dans une {@code List<Entreprise>}.
	 */
	public List<Candidature> listeDesCandidatures(){
	
		return candidatureDAO.findAll();
	}
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	public int addCandidature(String nomString, String prenomString, String dateNaissanceString, String adressePostaleString, String adresseElecString, String dateDepotString, String cvString, String secteursString[], int niveauId){
		Candidature c = new Candidature();
		c.setNom(nomString);
		c.setPrenom(prenomString); 
		Date dateNaissance=new Date(dateNaissanceString);
		c.setDateNaissance(dateNaissance);
		c.setAdressePostale(adressePostaleString);
		c.setAdresseEmail(adresseElecString);
		Date dateDepot=new Date(dateDepotString);
		c.setDateDepot(dateDepot);
		c.setCv(cvString);	
		Niveauqualif niveau = niveauQualifDAO.findById(niveauId);	
		c.setNiveauqualif(niveau);
		
		c.setSecteuractivites(new HashSet<Secteuractivite>());
		
		candidatureDAO.persist(c);
		for(int i = 0; i < secteursString.length ; i++){
			
			Secteuractivite sect = secteurActiviteDAO.findById(Integer.parseInt(secteursString[i]));
			
			c.getSecteuractivites().add(sect);

			secteurActiviteDAO.update(sect);
		}
		candidatureDAO.update(c);
		return c.getId();
	}
	//-----------------------------------------------------------------------------
	/**
	 * 
	 *///Suppression en cascade - que pour la candidature en question
	public void removeCandidature(){
		
	}
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	public void updateCandidature(){
		
	}
	
		
	
}