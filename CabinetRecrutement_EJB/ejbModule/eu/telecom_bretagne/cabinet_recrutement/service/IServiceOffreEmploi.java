package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi;

/**
 * Interface du service gérant les entreprises.
 * @author Philippe TANGUY
 */
@Remote
public interface IServiceOffreEmploi
{
	//-----------------------------------------------------------------------------
	/**
	 * Obtention d'une entreprise suivant son id.
	 * @param id id de l'entreprise.
	 * @return l'instance de l'entreprise.
	 */
	//-----------------------------------------------------------------------------
	public Offreemploi getOffreEmploi(int id);
	/**
	 * Obtention de la liste de toutes les entreprises référencées dans le système.
	 * @return la liste des candidatures dans une {@code List<Entreprise>}.
	 */
	public List<Offreemploi> listeDesOffresEmploi();
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	public int addOffreEmploi(String titreString, String descriptifString, String profilString, String secteurString, int niveauId);
	//-----------------------------------------------------------------------------
	/**
	 * 
	 *///Suppression en cascade - que pour la candidature en question
	public void removeOffreEmploi();
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	public void updateOffreEmploi();
	
		
	
}
