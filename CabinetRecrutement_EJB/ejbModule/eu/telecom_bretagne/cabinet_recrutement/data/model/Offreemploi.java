package eu.telecom_bretagne.cabinet_recrutement.data.model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * The persistent class for the offreemploi database table.
 * 
 */
@Entity
@NamedQuery(name="Offreemploi.findAll", query="SELECT o FROM Offreemploi o")
public class Offreemploi implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="OFFREEMPLOI_ID_GENERATOR", sequenceName="OFFREEMPLOI_ID_SEQ", allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="OFFREEMPLOI_ID_GENERATOR")
	private Integer id;

	@Temporal(TemporalType.DATE)
	@Column(name="date_depot")
	private Date dateDepot;

	@Column(name="descriptif_mission")
	private String descriptifMission;

	@Column(name="profil_recherche")
	private String profilRecherche;

	private String titre;

	//bi-directional many-to-many association to Secteuractivite
	@ManyToMany(mappedBy="offreemplois", fetch=FetchType.EAGER)
	private HashSet<Secteuractivite> secteuractivites = new HashSet<Secteuractivite>();

	//bi-directional many-to-one association to Entreprise
	@ManyToOne
	@JoinColumn(name="identreprise")
	private Entreprise entreprise;

	//bi-directional many-to-one association to Niveauqualif
	@ManyToOne
	@JoinColumn(name="idqualification")
	private Niveauqualif niveauqualif;

	public Offreemploi() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getDateDepot() {
		return this.dateDepot;
	}

	public void setDateDepot(Date dateDepot) {
		this.dateDepot = dateDepot;
	}

	public String getDescriptifMission() {
		return this.descriptifMission;
	}

	public void setDescriptifMission(String descriptifMission) {
		this.descriptifMission = descriptifMission;
	}

	public String getProfilRecherche() {
		return this.profilRecherche;
	}

	public void setProfilRecherche(String profilRecherche) {
		this.profilRecherche = profilRecherche;
	}

	public String getTitre() {
		return this.titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public Set<Secteuractivite> getSecteuractivites() {
		return this.secteuractivites;
	}

	public void setSecteuractivites(Set<Secteuractivite> secteuractivites) {
		this.secteuractivites = (HashSet<Secteuractivite>) secteuractivites;
	}

	public Entreprise getEntreprise() {
		return this.entreprise;
	}

	public void setEntreprise(Entreprise entreprise) {
		this.entreprise = entreprise;
	}

	public Niveauqualif getNiveauqualif() {
		return this.niveauqualif;
	}

	public void setNiveauqualif(Niveauqualif niveauqualif) {
		this.niveauqualif = niveauqualif;
	}

}