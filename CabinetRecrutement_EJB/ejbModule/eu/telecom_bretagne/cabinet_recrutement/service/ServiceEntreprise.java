package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.HashSet;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.EntrepriseDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.OffreEmploiDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi;

/**
 * Session Bean implementation class ServiceEntreprise
 * 
 * @author Philippe TANGUY
 */
@Stateless
@LocalBean
public class ServiceEntreprise implements IServiceEntreprise
{
	//-----------------------------------------------------------------------------
	@EJB
	private EntrepriseDAO entrepriseDAO;
	@EJB
	private OffreEmploiDAO offreEmploiDAO;
	//-----------------------------------------------------------------------------
	/**
	 * Default constructor.
	 */
	public ServiceEntreprise()
	{
		// TODO Auto-generated constructor stub
	}
	//-----------------------------------------------------------------------------
	@Override
	public Entreprise getEntreprise(int id)
	{
		return entrepriseDAO.findById(id);
	}
	//-----------------------------------------------------------------------------
	@Override
	public List<Entreprise> listeDesEntreprises()
	{
		return entrepriseDAO.findAll();
	}
	// -----------------------------------------------------------------------------
	
	@Override
	public int addEntreprise(String nom, String descriptif, String adressePostale){
		Entreprise e = new Entreprise();
		e.setNom(nom);
		e.setDescriptif(descriptif);
		e.setAdressePostale(adressePostale);
		entrepriseDAO.persist(e);
		return e.getId();
	}
	
	@Override
	public void removeEntreprise(int id){
		
		Entreprise e = entrepriseDAO.findById(id);
		HashSet<Offreemploi> hs = (HashSet) e.getOffreemplois();
		
		for (Offreemploi oe : hs)
		{
			offreEmploiDAO.remove(oe);
			//e.removeOffreemploi(oe);
		}
		
		entrepriseDAO.remove(e);
		
	}
	
	@Override
	public void updateEntreprise(int id, String nom, String descriptif, String adressePostale){
		Entreprise e =  entrepriseDAO.findById(id);
		e.setNom(nom);
		e.setDescriptif(descriptif);
		e.setAdressePostale(adressePostale);
		entrepriseDAO.update(e);
	}
}
