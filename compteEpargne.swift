


class CompteEpargne{
  var solde : Double = 0
  // le compte est crée ou pas => le compte est actif ou cloturé
  var created : Bool = false  

  init(){}
  init(nb: Double){
    if (nb < 200){
      print ("please, le compte doit avoir 200e minimum a l'ouvertue")
    }
    else{
      self.solde = nb
      self.created = true
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


var getSetCreated: Bool {
    get {
      return (self.created)
    }
    set (newsold) {
      self.created = newsold
    }
  }
//fct affichage de son solde (client)
  func affichage(){
    print(" dispose de ", self.getSetsold)
  }

}