package eu.telecom_bretagne.cabinet_recrutement.data.model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Set;


/**
 * The persistent class for the niveauqualif database table.
 * 
 */
@Entity
@NamedQuery(name="Niveauqualif.findAll", query="SELECT n FROM Niveauqualif n")
public class Niveauqualif implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="NIVEAUQUALIF_ID_GENERATOR", sequenceName="NIVEAUQUALIF_ID_SEQ", allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="NIVEAUQUALIF_ID_GENERATOR")
	private Integer id;

	private String intitule;

	//bi-directional many-to-one association to Candidature
	@OneToMany(mappedBy="niveauqualif", fetch=FetchType.EAGER)
	private Set<Candidature> candidatures;

	//bi-directional many-to-one association to Offreemploi
	@OneToMany(mappedBy="niveauqualif", fetch=FetchType.EAGER)
	private Set<Offreemploi> offreemplois;

	public Niveauqualif() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getIntitule() {
		return this.intitule;
	}

	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}

	public Set<Candidature> getCandidatures() {
		return this.candidatures;
	}

	public void setCandidatures(Set<Candidature> candidatures) {
		this.candidatures = candidatures;
	}

	public Candidature addCandidature(Candidature candidature) {
		getCandidatures().add(candidature);
		candidature.setNiveauqualif(this);

		return candidature;
	}

	public Candidature removeCandidature(Candidature candidature) {
		getCandidatures().remove(candidature);
		candidature.setNiveauqualif(null);

		return candidature;
	}

	public Set<Offreemploi> getOffreemplois() {
		return this.offreemplois;
	}

	public void setOffreemplois(Set<Offreemploi> offreemplois) {
		this.offreemplois = offreemplois;
	}

	public Offreemploi addOffreemploi(Offreemploi offreemploi) {
		getOffreemplois().add(offreemploi);
		offreemploi.setNiveauqualif(this);

		return offreemploi;
	}

	public Offreemploi removeOffreemploi(Offreemploi offreemploi) {
		getOffreemplois().remove(offreemploi);
		offreemploi.setNiveauqualif(null);

		return offreemploi;
	}
	
	public String toString(){
		
		return intitule;
	}
	

}