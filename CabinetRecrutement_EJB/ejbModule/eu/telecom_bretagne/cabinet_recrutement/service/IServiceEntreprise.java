package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;

/**
 * Interface du service gérant les entreprises.
 * @author Philippe TANGUY
 */
@Remote
public interface IServiceEntreprise
{
	//-----------------------------------------------------------------------------
	/**
	 * Obtention d'une entreprise suivant son id.
	 * @param id id de l'entreprise.
	 * @return l'instance de l'entreprise.
	 */
	//-----------------------------------------------------------------------------
	public Entreprise getEntreprise(int id);
	/**
	 * Obtention de la liste de toutes les entreprises référencées dans le système.
	 * @return la liste des candidatures dans une {@code List<Entreprise>}.
	 */
	public List<Entreprise> listeDesEntreprises();
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	public int addEntreprise(String nom, String descriptif, String adressepostale);
	//-----------------------------------------------------------------------------
	/**
	 * 
	 *///Suppression en cascade - que pour l'entreprise en question
	public void removeEntreprise(int id);
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	public void updateEntreprise(int id, String nom, String descriptif, String adressepostale);
	
		
	
}
