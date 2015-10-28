package eu.telecom_bretagne.cabinet_recrutement.data.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi;

/**
 * Session Bean implementation class OffreemploiDAO
 * @author Philippe TANGUY
 */
@Stateless
@LocalBean
public class OffreEmploiDAO
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
	public OffreEmploiDAO()
	{
		// TODO Auto-generated constructor stub
	}
	//-----------------------------------------------------------------------------
	public Offreemploi findById(Integer id)
	{
		return entityManager.find(Offreemploi.class, id);
	}
	
	//----------------------------------------------------------------------------
	public List<Offreemploi> findAll()
	{
		Query query = entityManager.createQuery("select Offreemploi from Offreemploi offreemploi order by offreemploi.id");
		List l = query.getResultList();

		return (List<Offreemploi>) l;
	}
	//-----------------------------------------------------------------------------

	public Offreemploi persist(Offreemploi offreemploi)
	{
		entityManager.persist(offreemploi);
		return offreemploi;
	}
	//-----------------------------------------------------------------------------
	public Offreemploi update(Offreemploi offreemploi)
	{
		return entityManager.merge(offreemploi);
	}
	//-----------------------------------------------------------------------------
	public void remove(Offreemploi offreemploi)
	{
		entityManager.remove(offreemploi);
	}
	//-----------------------------------------------------------------------------
	public List<Offreemploi> findByEntreprise(int idEntreprise)
	{
		Query query = entityManager.createQuery("select offreEmploi from OffreEmploi offreEmploi " +
				"where offreEmploi.entreprise.id = :idE " +
				"order by offreEmploi.id desc");
		query.setParameter("idE", idEntreprise);
		List<Offreemploi> l = query.getResultList();
		return l;
	}
	public List<Offreemploi> findBySecteurActiviteAndNiveauQualification(int idSecteurActivite, int idNiveauQualification)
	{
		Query query = entityManager.createQuery("select oe from OffreEmploi oe join oe.secteursActivite secteurs " +
				"where secteurs.id = :idSA and oe.niveauQualification.id = :idNQ " +
				"order by oe.id desc");
		query.setParameter("idSA", idSecteurActivite);
		query.setParameter("idNQ", idNiveauQualification);
		List<Offreemploi> l = query.getResultList();
		return l;
	}
}
