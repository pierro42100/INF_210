package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.EntrepriseDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.NiveauQualificationDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.OffreEmploiDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.SecteurActiviteDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Niveauqualif;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Offreemploi;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Secteuractivite;

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
	private SecteurActiviteDAO secteurActiviteDAO;
	@EJB
	private NiveauQualificationDAO niveauQualifDAO;
	@EJB
	private EntrepriseDAO entrepriseDAO;
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
	public int addOffreEmploi(String titreString, String descriptifString, String profilString, String secteurs[], int niveauId, int idEntreprise) {
		// TODO Auto-generated method stub
		Offreemploi o = new Offreemploi();
		o.setTitre(titreString);
		o.setDescriptifMission(descriptifString);
		o.setProfilRecherche(profilString);
		o.setDateDepot(new Date());//DATE
		Entreprise e = entrepriseDAO.findById(idEntreprise);
		o.setEntreprise(e);//ENTREPRISE
		Niveauqualif niveau = niveauQualifDAO.findById(niveauId);	
		o.setNiveauqualif(niveau);
		
		o.setSecteuractivites(new HashSet<Secteuractivite>());
		
		offreEmploiDAO.persist(o);
		
		for(int i = 0; i < secteurs.length ; i++){
			
			Secteuractivite sect = secteurActiviteDAO.findById(Integer.parseInt(secteurs[i]));
			
			o.getSecteuractivites().add(sect);
			HashSet<Offreemploi> offres =(HashSet) sect.getOffreemplois();
			offres.add(o);
			sect.setOffreemplois(offres);
			secteurActiviteDAO.update(sect);
		}
		offreEmploiDAO.update(o);
		
		niveau.addOffreemploi(o);
		niveauQualifDAO.update(niveau);
		e.addOffreemploi(o);
		entrepriseDAO.update(e);
		return o.getId();
	}
	@Override
	public void removeOffreEmploi(int id) {
		// TODO Auto-generated method stub
		Offreemploi o = offreEmploiDAO.findById(id);
		Entreprise e = o.getEntreprise();
		e.removeOffreemploi2(o);
		Niveauqualif n = o.getNiveauqualif();
		Set<Secteuractivite> s = o.getSecteuractivites();
		e.removeOffreemploi2(o);
		n.removeOffreemploi2(o);
		for(Secteuractivite sec :s){
			sec.removeOffreemploi2(o);
		}
		
		offreEmploiDAO.remove(o);
		
	}
	@Override
	public void updateOffreEmploi(int idOffre, String titre, String desc, String profil,String secteursString[], int niveauId) {
		// TODO Auto-generated method stub
		// TODO Secteurs et Niveaux
		Offreemploi oe = offreEmploiDAO.findById(idOffre);
		Offreemploi o = offreEmploiDAO.findById(idOffre); 
		
		Entreprise e = entrepriseDAO.findById(oe.getEntreprise().getId());
		Niveauqualif niveau = niveauQualifDAO.findById(niveauId);
		
		oe.setNiveauqualif(niveau);
		oe.setSecteuractivites(new HashSet<Secteuractivite>());
		oe.setTitre(titre);
		oe.setDescriptifMission(desc);
		oe.setProfilRecherche(profil);
		
		for(int i = 0; i < secteursString.length ; i++){
			
			Secteuractivite sect = secteurActiviteDAO.findById(Integer.parseInt(secteursString[i]));
			
			oe.getSecteuractivites().add(sect);
			HashSet<Offreemploi> offres =(HashSet) sect.getOffreemplois();
			offres.remove(o);
			offres.add(oe);
			
			sect.setOffreemplois(offres);
			secteurActiviteDAO.update(sect);
		}
		offreEmploiDAO.update(oe);
		
		niveau.removeOffreemploi2(o);
		niveau.addOffreemploi(oe);
		niveauQualifDAO.update(niveau);
		e.removeOffreemploi2(o);
		e.addOffreemploi(oe);
		entrepriseDAO.update(e);
		
	}
	
		
	
}
