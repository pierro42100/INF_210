package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.NiveauQualificationDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.OffreEmploiDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Niveauqualif;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi;

/**
 * Session Bean implementation class IServiceCnadidature
 * 
 * @author Philippe TANGUY
 */
@Stateless
@LocalBean
public class ServiceOffreEmploi implements IServiceOffreEmploi
{
	@EJB
	private OffreEmploiDAO offreEmploiDAO;
	@EJB
	private NiveauQualificationDAO niveauQualifDAO;
	//-----------------------------------------------------------------------------
	
	@Override
	public Offreemploi getOffreEmploi(int id) {
		
		return offreEmploiDAO.findById(id) ;
	}
	@Override
	public List<Offreemploi> listeDesOffresEmploi() {
	
		List<Offreemploi> offres = offreEmploiDAO.findAll();
		
		return offres;
	}
	@Override
	public int addOffreEmploi(String titreString, String descriptifString, String profilString, String secteurString, int niveauId) {
		// TODO Auto-generated method stub
		Offreemploi o = new Offreemploi();
		o.setTitre(titreString);
		o.setDescriptifMission(descriptifString);
		o.setProfilRecherche(profilString);
		Niveauqualif niveau = niveauQualifDAO.findById(niveauId);	
		
		o.setNiveauqualif(niveau);
		offreEmploiDAO.persist(o);
		return o.getId();
	}
	@Override
	public void removeOffreEmploi() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void updateOffreEmploi(int idOffre, String titre, String desc, String profil) {
		// TODO Auto-generated method stub
		// TODO Secteurs et Niveaux
		
		Offreemploi oe = offreEmploiDAO.findById(idOffre);
		oe.setTitre(titre);
		oe.setDescriptifMission(desc);
		oe.setProfilRecherche(profil);
		
		offreEmploiDAO.update(oe);
	}
	
		
	
}
