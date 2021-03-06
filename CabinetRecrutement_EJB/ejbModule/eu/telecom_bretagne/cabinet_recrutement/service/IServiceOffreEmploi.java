package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.HashSet;
import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite;

/**
 * Interface du service gérant les offres.
 * @author Philippe TANGUY
 */
@Remote
public interface IServiceOffreEmploi
{
	//-----------------------------------------------------------------------------
	/**
	 * Obtention d'une offre suivant son id.
	 * @param id id de l'offre.
	 * @return l'instance de l'offre.
	 */
	//-----------------------------------------------------------------------------
	public Offreemploi getOffreEmploi(int id);
	/**
	 * Obtention de la liste de toutes les offres référencées dans le système.
	 * @return la liste des candidatures dans une {@code List<offre>}.
	 */
	public List<Offreemploi> listeDesOffresEmploi();
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	public int addOffreEmploi(String titreString, String descriptifString, String profilString, String secteursString[], int niveauId, int idEntreprise);
	//-----------------------------------------------------------------------------
	/**
	 * 
	 *///Suppression en cascade - que pour la candidature en question
	public void removeOffreEmploi(int id);
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	public void updateOffreEmploi(int idOffre, String titre, String desc, String profil,String secteursString[], int niveauId);
		
	
}
