class Compte{

  var solde : Double = 0

  init(){}
  
  init(nb:Double){
    self.solde = nb
  }


  var getSetsold: Double {
    get {
      return (self.solde)
    }
    set (newSolde) {
      self.solde = newSolde
    }
  }
  //fct retrait d'argent (client)
  func retrait(nb:Double){
    let rest : Double = self.solde - nb
    if (rest < 0){
      print("impossible de faire un retrait de cette somme, sold negative")
    }
    else{
      self.solde = rest
      print("vous avez retirez ", nb, " de votre compte")
    }    
  }
//fct dépot d'argent (client)
  func depot(nb:Double){
    self.solde += nb
  }
  
//fct affichage de son solde (client)
  func affichage(){
    print(" dispose de ", self.getSetsold)
  } 
}