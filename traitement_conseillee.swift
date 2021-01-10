//fct qui permert d'ouvrir un compte pour le client
func ouvrir_uncompte(){
  print ("ouvrir un compte :")

  print ("nom : ", terminator:"")
  let nom = readLine()!
  print ("prenom : ", terminator:"")
  let prenom = readLine()!
  print ("adress : ", terminator:"")
  let adress = readLine()!
  print ("tel : ", terminator:"")
  
  let tel = readLine()!
  // création d'un nouveau client 
  let newc_client : Client = Client(nom : nom, prenom: prenom, adress: adress, phone: tel)
  newc_client.getSetconseil = bank.getSetconseille
  
  print ("montant a déposé : ", terminator:"")
  var montant = Double(readLine()!)!
  while(montant < 0){
    print("erreur veuillez entrer une somme positive")
    print ("montant a déposé : ", terminator:"")
    montant = Double(readLine()!)!
  }
//mise à jour de la liste client dans la banque
  bank.getSetListclients = bank.getSetconseille.add_client(cpt: newc_client, nb: montant, list:bank.getSetconseille.getSetlist_client)

}
//fct qui permet de modifier l'@ du client
func modifier_info_adress(){
  //index pour vérifier que le client existe
  var index : Bool = false
  print ("Modification des informations (adress) :")
  print ("qui etes vous ?")

  print ("nom : ", terminator:"")
  let nom = readLine()!
  print ("prenom : ", terminator:"")
  let prenom = readLine()!
  for elem in bank.getSetListclients{
    if (nom == elem.nom && prenom == elem.prenom){
        print ("nouvelle adress : ", terminator:"")
        let adress = readLine()!
        bank.getSetconseille.modifier_le_adress(new_adress: adress, cpt: elem)
        index = true
        print ("**********informations du clients ont été mis a jour !!**********")
    }
  }
  if (index == false){
    print("-> erreur : le client n'existe pas dans la banque")
  }
}
//fct pour modifier le numéro de télephone 
func modifier_info_tel(){
  var index : Bool = false
  print ("Modification des informations (tel):")
  print ("qui etes vous ?")

  print ("nom : ", terminator:"")
  let nom = readLine()!
  print ("prenom : ", terminator:"")
  let prenom = readLine()!
  for elem in bank.getSetListclients{
    if (nom == elem.nom && prenom == elem.prenom){
        print ("nouvelle tel : ", terminator:"")
        let tel = readLine()!
        bank.getSetconseille.modifier_le_tel(new_tel: tel, cpt: elem)
        index = true
        print ("**********informations du clients ont été mis a jour !!**********")
    }
  }
  if (index == false){
    print("-> erreur : le client n'existe pas dans la banque")
  }
}
//fct pour cloturer le compte du client
func cloture_compte(){
  print ("Cloturer un compte :")
  print ("qui etes vous ?")

  print ("nom : ", terminator:"")
  let nom = readLine()!
  print ("prenom : ", terminator:"")
  let prenom = readLine()!
  print ("tel : ", terminator:"")
  let tel = readLine()!
  for elem in bank.getSetListclients{
    if (nom == elem.nom && prenom == elem.prenom && tel == elem.phone){
        bank.getSetconseille.cloture(client: elem)

        print ("**********Cloture d'un compte efféctué !!**********")
    }
  }
}



//fct qui permet de se connecter en tant que conseiller et affiches les différentes taches 
func je_suis_conseille(){
  print ("***************************")
  bank.getSetconseille.afficher_info_consil()
  print ("***************************")
  print ("----------------------------------------")
  print("les options dispo pour conseille")
  print("    1: ouvrir un compte pour le client")
  print("    2: cloturer le compte du client")
  print("    3: afficher la liste des clients")
  print("    4: modifier adress du client ") 
  print("    5: modifier tel du client") 
  print ("----------------------------------------")
  print ("choix: ", terminator:"")
  let i = readLine()!
  switch i {
    case "1": ouvrir_uncompte()
    case "2": cloture_compte()
    case "3": bank.getSetconseille.afficher_les_clients()
    case "4" : modifier_info_adress()
    case "5" : modifier_info_tel()
    default : print("erreur")
  }
  print ("----------------------------------------")
  print ("     0 : pour quitter")
  print ("     1 : pour continuer")
  print ("     2 : pour revenir au menu principale")
  print ("----------------------------------------")
  print ("choix: ", terminator:"")
  let _choix = readLine()!
  switch _choix {
    case "1" : je_suis_conseille()
    case "2" : main()
    default : return
  }

}
