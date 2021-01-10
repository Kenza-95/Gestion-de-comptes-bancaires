class CompteLivret{
  var solde : Double = 0
  // le compte est crée ou pas => le compte est actif ou cloturé
  var created : Bool = false

  init(){}
  init(nb:Double){
    self.solde = nb
    self.created = true
  }

  var getSetCreated: Bool {
    get {
      return (self.created)
    }
    set (newsold) {
      self.created = newsold
    }
  }
  var getSetsold: Double {
    get {
      return (self.solde)
    }
    set (newsold) {
      self.solde = newsold
    }
  }
  //fct virement depuis le compte (client)
  func virement(cpt:Compte, nb:Double){
    cpt.getSetsold += nb
  }
   //fct virement depuis le compte epargne (client)
  func virement(cpt:CompteEpargne, nb: Double){
    cpt.getSetsold += nb
  }

//fct affichage de son solde (client)
  func affichage(){
    print(" dispose de ", self.getSetsold)
  }
}