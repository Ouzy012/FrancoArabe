package model;

/**
 *
 * @author ibrah
 */
public class Eleve implements Comparable<Eleve>{

    private String login;
    private String loginParent;
    private String annee;
    private int idInscription;
    private String nomClasse;
    private String dateNaissance;
    private String lieuNaissance;
    private String sexe;
    private int validerInsc;
    private String matriculeEleve;
    private String nom;
    private String prenom;
    private String adresse;
    private String niveau;
    private String motDePasse;
    private String matiere;
    private String classe;
    private float devoir1;
    private float devoir2;
    private String idEvaluation;
    private float composition;
    private String semestre;
    private float moyenne;
    private float moyCompo1FR;
    private float moyCompo2FR;
    private float moyCompo3FR;
     private float moyCompo1AR;
    private float moyCompo2AR;
    private float moyCompo3AR;
    private String tel;

    public Eleve() {
    }
    
    //inscrire eleve

    public Eleve(String login, String loginParent, String annee, int idInscription, String nomClasse, String dateNaissance, String lieuNaissance, String sexe) {
        this.login = login;
        this.loginParent = loginParent;
        this.annee = annee;
        this.idInscription = idInscription;
        this.nomClasse = nomClasse;
        this.dateNaissance = dateNaissance;
        this.lieuNaissance = lieuNaissance;
        this.sexe = sexe;
    }
    

    public Eleve(String nomClasse, String nom, String prenom, String adresse, String dateNaissance, String lieuNaissance, String annee, String login, String motDePasse) {
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.dateNaissance = dateNaissance;
        this.lieuNaissance = lieuNaissance;
        this.annee = annee;
        this.login = login;
        this.motDePasse = motDePasse;
        this.nomClasse = nomClasse;
    }
    public Eleve(String nomClasse, String nom, String prenom, String adresse, String tel, String dateNaissance, String lieuNaissance, String annee, String login, String motDePasse, String loginParent) {
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.dateNaissance = dateNaissance;
        this.lieuNaissance = lieuNaissance;
        this.annee = annee;
        this.login = login;
        this.motDePasse = motDePasse;
        this.nomClasse = nomClasse;
        this.tel = tel;
        this.loginParent= loginParent;
    }

    public Eleve(float devoir1, float devoir2, float composition, String matiere) {
        this.devoir1 = devoir1;
        this.devoir2 = devoir2;
        this.composition = composition;
        this.matiere = matiere;
        // this.annee= annee;
    }

    public Eleve(String nom, String prenom, String adresse, String tel) {
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.tel = tel;
    }

    public int getValiderInsc() {
        return validerInsc;
    }

    public void setValiderInsc(int validerInsc) {
        this.validerInsc = validerInsc;
    }

    
    public int getIdInscription() {
        return idInscription;
    }

    public void setIdInscription(int idInscription) {
        this.idInscription = idInscription;
    }

    
    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }
    

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getMatriculeEleve() {
        return matriculeEleve;
    }

    public void setMatriculeEleve(String matriculeEleve) {
        this.matriculeEleve = matriculeEleve;
    }

    public String getNomClasse() {
        return nomClasse;
    }

    public void setNomClasse(String nomClasse) {
        this.nomClasse = nomClasse;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getNiveau() {
        return niveau;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    public String getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(String dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getLieuNaissance() {
        return lieuNaissance;
    }

    public void setLieuNaissance(String lieuNaissance) {
        this.lieuNaissance = lieuNaissance;
    }

   
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    public float getMoyCompo1FR() {
        return moyCompo1FR;
    }

    public void setMoyCompo1FR(float moyCompo1FR) {
        this.moyCompo1FR = moyCompo1FR;
    }

    public float getMoyCompo2FR() {
        return moyCompo2FR;
    }

    public void setMoyCompo2FR(float moyCompo2FR) {
        this.moyCompo2FR = moyCompo2FR;
    }

    public float getMoyCompo3FR() {
        return moyCompo3FR;
    }

    public void setMoyCompo3FR(float moyCompo3FR) {
        this.moyCompo3FR = moyCompo3FR;
    }

    public float getMoyCompo1AR() {
        return moyCompo1AR;
    }

    public void setMoyCompo1AR(float moyCompo1AR) {
        this.moyCompo1AR = moyCompo1AR;
    }

    public float getMoyCompo2AR() {
        return moyCompo2AR;
    }

    public void setMoyCompo2AR(float moyCompo2AR) {
        this.moyCompo2AR = moyCompo2AR;
    }

    public float getMoyCompo3AR() {
        return moyCompo3AR;
    }

    public void setMoyCompo3AR(float moyCompo3AR) {
        this.moyCompo3AR = moyCompo3AR;
    }

   
    

    public String getMatiere() {
        
        return matiere;
    }

    public void setMatiere(String matiere) {
        this.matiere = matiere;
    }

    public String getClasse() {
        return classe;
    }

    public void setClasse(String classe) {
        this.classe = classe;
    }

    public String getIdEvaluation() {
        return idEvaluation;
    }

    public void setIdEvaluation(String idEvaluation) {
        this.idEvaluation = idEvaluation;
    }

    public float getDevoir1() {
        return devoir1;
    }

    public void setDevoir1(float devoir1) {
        this.devoir1 = devoir1;
    }

    public float getDevoir2() {
        return devoir2;
    }

    public void setDevoir2(float devoir2) {
        this.devoir2 = devoir2;
    }

    public float getComposition() {
        return composition;
    }

    public void setComposition(float composition) {
        this.composition = composition;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    public String getAnnee() {
        return annee;
    }

    public void setAnnee(String annee) {
        this.annee = annee;
    }

    public float getMoyenne() {
        return (((getDevoir1() + getDevoir2()) / 2) + getComposition()) / 2;
    }

    public void setMoyenne(float moyenne) {
        this.moyenne = moyenne;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getLoginParent() {
        return loginParent;
    }

    public void setLoginParent(String loginParent) {
        this.loginParent = loginParent;
    }

    @Override
    public int compareTo(Eleve o) {
        float prix = this.getMoyCompo1FR();
        float sonPrix = o.getMoyCompo1FR();
        return (new Float(prix)).compareTo(new Float(sonPrix));
    }

}
