package eu.telecom_bretagne.cabinet_recrutement.data.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite;

/**
 * Session Bean implementation class SecteuractiviteDAO
 * @author Philippe TANGUY
 */
@Stateless
@LocalBean
public class SecteurActiviteDAO
{
	//-----------------------------------------------------------------------------
	/**
	 * Référence vers le gestionnaire de persistance.
	 */
	@PersistenceContext
	EntityManager entityManager;
	//-----------------------------------------------------------------------------
	/**
	 * Default constructor.
	 */
	public SecteurActiviteDAO()
	{
		// TODO Auto-generated constructor stub
	}
	//-----------------------------------------------------------------------------
	public Secteuractivite findById(Integer id)
	{
		return entityManager.find(Secteuractivite.class, id);
	}
	//----------------------------------------------------------------------------
  public List<Secteuractivite> findAll()
	{
		Query query = entityManager.createQuery("select secteuractivite from Secteuractivite secteuractivite order by secteuractivite.id");
		List l = query.getResultList();

		return (List<Secteuractivite>) l;
	}
	//-----------------------------------------------------------------------------
  
  public Secteuractivite persist(Secteuractivite secteuractivite)
 	{
	    entityManager.persist(secteuractivite);
 		return secteuractivite;
 	}
 	//-----------------------------------------------------------------------------
  public Secteuractivite update(Secteuractivite secteuractivite)
	{
	   entityManager.merge(secteuractivite);
	   return findById(secteuractivite.getId());
	}
	//-----------------------------------------------------------------------------
}
