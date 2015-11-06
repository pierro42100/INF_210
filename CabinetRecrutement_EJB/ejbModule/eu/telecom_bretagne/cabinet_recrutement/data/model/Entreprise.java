package eu.telecom_bretagne.cabinet_recrutement.data.model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.HashSet;
import java.util.Set;
import static javax.persistence.FetchType.EAGER;


/**
 * The persistent class for the entreprise database table.
 * 
 */
@Entity
@NamedQuery(name="Entreprise.findAll", query="SELECT e FROM Entreprise e")
public class Entreprise implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="ENTREPRISE_ID_GENERATOR", sequenceName="ENTREPRISE_ID_SEQ", allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="ENTREPRISE_ID_GENERATOR")
	private Integer id;

	@Column(name="adresse_postale")
	private String adressePostale;

	private String descriptif;

	private String nom;

	//bi-directional many-to-one association to Offreemploi
	@OneToMany(mappedBy="entreprise", fetch = EAGER)
	private Set<Offreemploi> offreemplois;

	public Entreprise() {
		this.offreemplois=new HashSet<Offreemploi>();
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAdressePostale() {
		return this.adressePostale;
	}

	public void setAdressePostale(String adressePostale) {
		this.adressePostale = adressePostale;
	}

	public String getDescriptif() {
		return this.descriptif;
	}

	public void setDescriptif(String descriptif) {
		this.descriptif = descriptif;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Set<Offreemploi> getOffreemplois() {
		return this.offreemplois;
	}
	
	public int getNombreOffreemplois(){
		
		if(this.offreemplois == null){
			return 0;
		}
		return this.offreemplois.size();
	}

	public void setOffreemplois(Set<Offreemploi> offreemplois) {
		this.offreemplois = offreemplois;
	}

	public Offreemploi addOffreemploi(Offreemploi offreemploi) {
		getOffreemplois().add(offreemploi);
		offreemploi.setEntreprise(this);

		return offreemploi;
	}

	public Offreemploi removeOffreemploi(Offreemploi offreemploi) {
		getOffreemplois().remove(offreemploi);
		offreemploi.setEntreprise(null);

		return offreemploi;
	}
	
	public void removeOffreemploi2(Offreemploi offreemploi) {
		getOffreemplois().remove(offreemploi);

	}
	
	public String toString(){
		return nom;
	}

}