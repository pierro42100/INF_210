package eu.telecom_bretagne.cabinet_recrutement.data.model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.HashSet;
import java.util.Set;


/**
 * The persistent class for the secteuractivite database table.
 * 
 */
@Entity
@NamedQuery(name="Secteuractivite.findAll", query="SELECT s FROM Secteuractivite s")
public class Secteuractivite implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="SECTEURACTIVITE_ID_GENERATOR", sequenceName="SECTEURACTIVITE_ID_SEQ", allocationSize = 1 )
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SECTEURACTIVITE_ID_GENERATOR")
	private Integer id;

	private String intitule;

	//bi-directional many-to-many association to Candidature
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
			name="candidature_secteur"
			, joinColumns={
					@JoinColumn(name="idsecteur")
			}
			, inverseJoinColumns={
					@JoinColumn(name="idcandidature")
			}
			)
	
	private Set<Candidature> candidatures;

	//bi-directional many-to-many association to Offreemploi
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
			name="offre_secteur"
			, joinColumns={
					@JoinColumn(name="idsecteur")
			}
			, inverseJoinColumns={
					@JoinColumn(name="idoffre")
			}
			)
	private Set<Offreemploi> offreemplois;

	public Secteuractivite() {
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

	public void setCandidatures(HashSet<Candidature> candidatures) {
		this.candidatures = candidatures;
	}

	public Set<Offreemploi> getOffreemplois() {
		return this.offreemplois;
	}

	public void setOffreemplois(HashSet<Offreemploi> offreemplois) {
		this.offreemplois = (HashSet<Offreemploi>) offreemplois;
	}
	public void removeOffreemploi2(Offreemploi offreemploi) {
		getOffreemplois().remove(offreemploi);

	}
	public String toString(){

		return intitule;
	}


}