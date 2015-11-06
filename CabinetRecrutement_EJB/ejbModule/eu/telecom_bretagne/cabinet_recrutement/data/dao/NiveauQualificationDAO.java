package eu.telecom_bretagne.cabinet_recrutement.data.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Niveauqualif;

/**
 * Session Bean implementation class NiveauqualifDAO
 * @author Philippe TANGUY
 */
@Stateless
@LocalBean
public class NiveauQualificationDAO
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
	public NiveauQualificationDAO()
	{
		// TODO Auto-generated constructor stub
	}
	//-----------------------------------------------------------------------------
	public Niveauqualif findById(Integer id)
	{
		return entityManager.find(Niveauqualif.class, id);
	}
	//----------------------------------------------------------------------------
  public List<Niveauqualif> findAll()
	{
		Query query = entityManager.createQuery("select niveauqualif from Niveauqualif niveauqualif order by niveauqualif.id");
		List l = query.getResultList();

		return (List<Niveauqualif>) l;
	}
	//-----------------------------------------------------------------------------
  
  public Niveauqualif persist(Niveauqualif niveauqualif)
 	{
	    entityManager.persist(niveauqualif);
 		return niveauqualif;
 	}
 	//-----------------------------------------------------------------------------
  public Niveauqualif update(Niveauqualif niveauqualif)
	{
	   return entityManager.merge(niveauqualif);
	}
	//-----------------------------------------------------------------------------
  
}
