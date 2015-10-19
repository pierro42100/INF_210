package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.CandidatureDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;

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
	public void addCandidature(){
		
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
