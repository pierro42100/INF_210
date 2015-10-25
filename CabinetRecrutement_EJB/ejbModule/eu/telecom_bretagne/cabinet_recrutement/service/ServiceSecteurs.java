package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.SecteurActiviteDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite;

/**
 * Interface du service gérant les secteurs
 * @author Philippe TANGUY
 */
@Stateless
@LocalBean
public class ServiceSecteurs implements IServiceSecteurs
{
	@EJB
	private SecteurActiviteDAO secteurActiviteDAO;
	//-----------------------------------------------------------------------------
	/**
	 * Obtention d'une offre suivant son id.
	 * @param id id de l'offre.
	 * @return l'instance de l'offre.
	 */
	//-----------------------------------------------------------------------------
	public ServiceSecteurs() {
		
	}
	@Override
	public Secteuractivite getSecteur(int id){
		
		return secteurActiviteDAO.findById(id) ;
		
	}
	/**
	 * Obtention de la liste de toutes les offres référencées dans le système.
	 * @return la liste des candidatures dans une {@code List<offre>}.
	 */
	@Override
	public List<Secteuractivite> listeDesSecteur(){
		
		return secteurActiviteDAO.findAll();
		
	}
	//-----------------------------------------------------------------------------
	/**
	 * 
	 */
	
	
}
