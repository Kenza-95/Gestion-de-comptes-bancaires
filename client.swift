class Client{

  var nom : String = ""
  var prenom : String = ""
  var adress : String = ""
  var phone : String = ""
  
  var conseil : Conseil = Conseil()
  var compte_courant : Compte = Compte()
  var compte_epargne : CompteEpargne = CompteEpargne()
  var compte_livret : CompteLivret = CompteLivret()

  init(){}
  //constructeur d'initialisation des informations du client
  init(nom: String, prenom: String, adress: String, phone:String){
    self.nom = nom
    self.prenom = prenom
    self.adress = adress
    self.phone = phone
  }    
  // déclaration des getteur et setteur pour chaque attribut
  var getSetnom: String {
    get {
      return (self.nom)
    }
  }

  var getSetprenom: String {
    get {
      return (self.prenom)
    }
  }

  var getSetadress: String {
    get {
      return (self.adress)
    }
    set (newValue) {
      self.adress = newValue
    }
  }
  var getSetphone: String {
    get {
      return (self.phone)
    }
    set (newValue) {
      self.phone = newValue
    }
  }
  var getSetconseil: Conseil {
    get {
      return (self.conseil)
    }
    set(newConseil){
      self.conseil = newConseil
    }
  }

  
  var getSetCompte: Compte {
    get {
      return (self.compte_courant)
    }
    set (newValue) {
      self.compte_courant = newValue
    }
  }
  var getSetCompteLivret : CompteLivret {
    get {
      return (self.compte_livret)
    }
    set (newValue) {
      self.compte_livret = newValue
    }
  }
  var getSetCompteEpargne: CompteEpargne {
    get {
      return (self.compte_epargne)
    }
    set (newValue) {
      self.compte_epargne = newValue
    }
  }
  // fonction qui fait appel au conseiller pour cloturer le compte
  func demande_de_cloture(){
    self.conseil.cloture(client:self)
  }
  //afficher les informations du client
  func affichage(){
    print ("-----------compte---------------------")
    print ("nom : ", self.getSetnom)
    print ("prenom : ", self.getSetprenom)
    print ("phone : ", self.getSetphone)
    print ("adress : ", self.getSetadress)
    print ("compte courant : solde = ", self.getSetCompte.getSetsold)
    if (self.getSetCompteLivret.getSetCreated == true){
      print ("compte livretA : solde = ", self.getSetCompteLivret.getSetsold)
    }
    if (self.getSetCompteEpargne.getSetCreated == true){
      print ("compte epargne : solde = ", self.getSetCompteEpargne.getSetsold)
    }
    print ("--------------------------------------------")
  }
  //demander au conseiller de lui ouvrir un compte livretA
  func demande_ouverture_compte_livret(){
    self.getSetconseil.ajout_compte_livret_pour_client(client: self)
  }
// faire un virement depuis le compte courant vers le livrea(client)
  func virement_courant_livret(nb: Double){
    let rest = self.compte_courant.getSetsold - nb
    
    if (self.compte_livret.getSetCreated == false){
     print ("erreur : vous ne disposez pas de compte livret A, demandez a votre conseillé de vous ouvrir un compte livret A")
    }
    else if (rest < 0){
      print ("error : votre solde sera négatif ")
    }
    else{
      self.compte_courant.getSetsold -= nb
      self.compte_livret.getSetsold += nb
    }
  }
  // faire un virement depuis livrea vers courant (client)
  func virement_livret_courant(nb: Double){
    let rest = self.compte_livret.getSetsold - nb
    
    if (self.compte_livret.getSetCreated == false){
      print ("error : vous ne disposez pas de compte livret A, demandez a votre conseillé l'ouverture d'un compte livret A")
    }
    else if (rest < 0){
      print ("error : votre solde de livretA sera négatif ")
    }
    else{
      self.compte_courant.getSetsold += nb
      self.compte_livret.getSetsold -= nb
      if (self.compte_livret.getSetsold < 10){
        print ("le solde de votre compte est inferieure a 10euro, donc il sera cloturé")
        self.compte_livret.getSetCreated = false
      }
    }
  }
//demande au conseiller d'ouverture compte epargne 
  func demande_ouverture_compte_Epargne(){
    self.getSetconseil.ajout_compte_epargne_pour_client(client: self)
  }
// faire un virement depuis courant vers epargne (client)
  func virement_courant_epargne(nb: Double){
    let rest = self.compte_courant.getSetsold - nb
    
    if (self.compte_epargne.getSetCreated == false){
     print ("erreur : vous ne disposez pas de compte epargne, demandez a votre conseillé de vous ouvrir un compte epargne")
    }
    else if (rest < 0){
      print ("error : votre solde sera négatif ")
    }
    else{
      self.compte_courant.getSetsold -= nb
      self.compte_epargne.getSetsold += nb
    }
  }
  // faire un virement depuis livrea vers epargne (client)
  func virement_livret_epargne(nb: Double){
    let rest = self.compte_livret.getSetsold - nb
    
    if (self.compte_epargne.getSetCreated == false){
      print ("erreur : vous ne disposez pas de compte epargne, demandez a votre conseillé de vous ouvrir un compte epargne")
    }
    else if (self.compte_livret.getSetCreated == false){
      print ("erreur : vous ne disposez pas de compte livret A, demandez a votre conseillé de vous ouvrir un compte livret A")
    }
    else if (rest < 0){
      print ("error : votre solde de livretA sera négatif ")
    }
    else{
      self.compte_epargne.getSetsold += nb
      self.compte_livret.getSetsold -= nb
      if (self.compte_livret.getSetsold < 10){
        print ("le solde de votre compte est inferieure a 10euro, donc il sera cloturé")
        self.compte_livret.getSetCreated = false
      }
    }
  }
// faire un virement depuis epargne vers livrea (client)
  func virement_epargne_livret(){
    if (self.compte_livret.getSetCreated == false){
      print("erreur : vous ne disposez pas de compte livret A, demandez a votre conseillé de vous ouvrir un compte LivretA")
    }
    else if (self.compte_epargne.getSetCreated == false){
      print ("vous n'avez pas de compte, ou votre compte est cloturé ")
    }
    else{
      print ("la somme totale de votre compte epargne sera viré vers le compte livret")
      self.compte_livret.getSetsold += self.compte_epargne.getSetsold
      self.compte_epargne.getSetsold = 0
      self.compte_epargne.getSetCreated = false
    }
  }
  // faire un virement depuis epargne vers courant (client)
  func virement_epargne_courant(){
    if (self.compte_epargne.getSetCreated == false){
      print ("vous n'avez pas de compte, ou votre compte est cloturé ")
    }
    else{
      print ("la somme totale de votre compte epargne sera viré vers le compte courant")
      self.compte_courant.getSetsold += self.compte_epargne.getSetsold
      self.compte_epargne.getSetsold = 0
      self.compte_epargne.getSetCreated = false
    }
  }


}