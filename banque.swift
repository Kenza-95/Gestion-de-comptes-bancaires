class Banque{

  var list_clients : [Client] = []
  //var list_conseillee : [Conseil] = []
  var conseillee : Conseil = Conseil(nom:"Kenza", prenom:"Lila", list_clients: [])


  init(){}
  

  var getSetListclients: [Client] {
    get {
      return (self.list_clients)
    }
    set(newList){
      self.list_clients = newList
    }
  }

  var getSetconseille: Conseil {
    get {
      return (self.conseillee)
    }
    set(newList){
      self.conseillee = newList
    }
  }

}