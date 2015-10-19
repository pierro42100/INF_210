package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;

/**
 * Interface du service gérant les candidatures
 * @author Philippe TANGUY
 */
@Remote
public interface IServiceCandidature
{
	//-----------------------------------------------------------------------------
	/**
	 * Obtention d'une candidature suivant son id.
	 * @param id id de la candidature
	 * @return l'instance de la candidature
	 */
	//-----------------------------------------------------------------------------
	public Candidature getCandidature(int id);
	/**
	 * Obtention de la liste de toutes les candidatures référencées dans le système.
	 * @return la liste des candidatures dans une {@code List<Entreprise>}.
	 */
	public List<Candidature> listeDesCandidatures();
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	public void addCandidature();
	//-----------------------------------------------------------------------------
	/**
	 * 
	 *///Suppression en cascade - que pour la candidature en question
	public void removeCandidature();
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	public void updateCandidature();
	
		
	
}
