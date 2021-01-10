class Conseil{

  var nom : String = ""
  var prenom : String = ""
  var list_clients : [Client] = []

  init(){}
  init(nom: String, prenom: String, list_clients: [Client]){
    self.nom = nom
    self.prenom = prenom
    self.list_clients = list_clients
  }
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
  var getSetlist_client: [Client] {
    get {
      return (self.list_clients)
    }
    set(newVlaue){
      self.list_clients = newVlaue
    }
  }

// fct de vérification si le client existe dans la banque
  func check_if_client_exit(list: [Client], cpt: Client) -> Int{
    for client in list{
      if (client.getSetnom == cpt.getSetnom && client.getSetprenom == cpt.getSetprenom){
        return (0)
      }
    }
    return (1)
  }
// fct d'ajout du client
  func add_client(cpt: Client, nb: Double, list:[Client]) -> [Client]
  {
    if (check_if_client_exit(list:list, cpt:cpt) == 0){
      print ("--Erreur : Client deja existant dans la banque--")
      return (list) 
    }
    let newClient = cpt
   let newCompte = Compte(nb: nb)
   newClient.getSetCompte = newCompte
    var tmp_list = list
    tmp_list.append(newClient)
    self.list_clients.append(newClient)
    print ("**********client a bien été crée !!**********")
    return (tmp_list)
  }
// fct d'affichage de la liste client
  func afficher_les_clients(){
    if(self.list_clients.count == 0){
      print("il n'existe aucun client dans la banque")
    }
    for client in self.list_clients{
      print ("client : [nom] : ", client.getSetnom, " [prenom] : ", client.getSetprenom, " [Adress] : ", client.getSetadress, " [phone] : ", client.getSetphone)
    }
  }
  //fct modification d'@ du client
  func modifier_le_adress(new_adress: String, cpt: Client){
    if (check_if_client_exit(list:self.list_clients, cpt:cpt) != 0){
      print ("Client n'existe pas ") 
    }
    else{
      cpt.getSetadress = new_adress
    }
  }
// fct modicficatin de numéro de tel
  func modifier_le_tel(new_tel: String, cpt: Client){
    
    if (check_if_client_exit(list:self.list_clients, cpt:cpt) != 0){
      print ("Client n'existe pas ") 
    }
    else{
      cpt.getSetphone = new_tel
    }
  }

  // fonction de cloture a la demande d'un client
  func cloture(client:Client){
    var i : Int = 0
    var index : Int = -1//index du client dans le tb 
    var tmp : [Client] = self.list_clients
    for element in self.list_clients{
      if (element.nom == client.nom &&        element.prenom == client.prenom){
        index = i
      }
      i += 1
    }
    tmp.remove(at : index)
    self.getSetlist_client = tmp//mise à jour de la liste
    bank.getSetListclients = self.getSetlist_client
  }
// afficher les informations du conseiller
  func afficher_info_consil(){
    print ("Bonjour, je suis votre conseillé : ")
    print ("nom: ", self.nom)
    print ("prenom: ", self.prenom)
  }
//fct ajout du compte livrea pour le client
  func ajout_compte_livret_pour_client(client: Client){
    
    print ("entrz la somme que vous voulez :")
    let nb = Double(readLine()!)!
    if (nb < client.getSetCompte.getSetsold){
      let newCompteLivret = CompteLivret(nb: nb)
      if (newCompteLivret.getSetCreated == true){
        client.getSetCompteLivret = newCompteLivret
        client.getSetCompte.getSetsold = client.getSetCompte.getSetsold - nb
      }
    }
    else{
      print ("la somme a transferer de votre compte courant dépasse votre solde")
    }
  }

  //fct d'ajout un compte d epargne pour le client
  func ajout_compte_epargne_pour_client(client: Client){
    
    print ("entrz la somme que vous voulez :")
    let nb = Double(readLine()!)!
    if (nb < client.getSetCompte.getSetsold){
      let newCompteEpargne = CompteEpargne(nb: nb)
      if (newCompteEpargne.getSetCreated == true){
        client.getSetCompteEpargne = newCompteEpargne
        client.getSetCompte.getSetsold = client.getSetCompte.getSetsold - nb
      }
    }
    else{
      print ("la somme a transferer de votre compte courant dépasse votre solde")
    }
  }
    
}