package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite;

/**
 * Interface du service gérant les offres.
 * @author Philippe TANGUY
 */
@Remote
public interface IServiceSecteurs
{
	//-----------------------------------------------------------------------------
	/**
	 * Obtention d'une offre suivant son id.
	 * @param id id de l'offre.
	 * @return l'instance de l'offre.
	 */
	//-----------------------------------------------------------------------------
	public Secteuractivite getSecteur(int id);
	/**
	 * Obtention de la liste de toutes les offres référencées dans le système.
	 * @return la liste des candidatures dans une {@code List<offre>}.
	 */
	public List<Secteuractivite> listeDesSecteur();
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	
	
}
