//fct qui vérifier si le client existe dans la banque
func verifier_si_sa_exist(nom : String, prenom: String, tel: String) -> Bool {
  for elem in bank.getSetconseille.getSetlist_client{
    if (elem.getSetnom == nom && elem.getSetprenom == prenom && elem.getSetphone == tel){
      return (true)
    }
  }
  return (false)
}
// fct de connection pour le client
func conexion(nom : String, prenom: String, tel: String) -> Client {

  for elem in bank.getSetconseille.getSetlist_client{
    if (elem.getSetnom == nom && elem.getSetprenom == prenom && elem.getSetphone == tel){
      return (elem)
    }
  }
  return (Client())
}

//fct faire un virement pour un client
func virement_client_client(client: Client){
  var index : Bool = false
  print ("virement du compte courant vers le client :")

  print ("nom du destinataire: ", terminator:"")
  let nom = readLine()!
  print ("prenom du destinataire: ", terminator:"")
  let prenom = readLine()!
  print ("tel du destinataire : ", terminator:"")
  let tel = readLine()!
  print ("le montant a envoyer : ", terminator:"")
  let montant = Double(readLine()!)!
  if (montant > client.getSetCompte.getSetsold){
    print("erreur : le montant à envoyé est suppérieure au solde disponible sur le compte")
  }
  else{
    for elem in bank.getSetListclients{
      if (nom == elem.nom && prenom == elem.prenom && tel == elem.phone){
        client.getSetCompte.getSetsold -= montant
        elem.getSetCompte.getSetsold += montant
        index = true
          print ("**********la somme a bien été envoyé !!**********")
      }
    }
  }
  if (index == false){
    print("le destinataire n'existe pas")
  }
}


//fct d'éspace du client qui représente les choix possibles
func espace_client(client: Client){
  print ("----------------------------------------")
  print("les options disponibles pour clients")
  print("    1: Affichage des informations de mon compte")
  print("    2: Consulter mon solde")
  print("    3: Déposer une somme d'argent")
  print("    4: Retirer une somme d'argent")
  print("    5: Demander au conseillé la cloture de mon compte")
  print("    6: Demander au conseillé la modification d'adress")
  print("    7: Demander au conseillé la modification de tel")
  print("    8: Demander au conseillé l'ouverture d'un compte livretA")
  print("    9: virement compte_courant -> compte_livretA")
  print("    10: virement  compte_livretA -> compte_courant")
  print("    11: Demander au conseillé l'ouverture d'un compte epargne")
  print("    12: virement compte_courant -> compte_epargne")
  print("    13: virement  compte_livretA -> compte_epargne")
  print("    14: virement  compte_epargne -> compte_livretA")
  print("    15: virement  compte_epargne -> compte_courant")
  print("    16: virement  vers un client")
  
  print ("----------------------------------------")
  print ("choix: ", terminator:"")
  let i =  readLine()!
  switch i {
    case "1": client.affichage()
    case "2": print("votre solde est : ",client.getSetCompte.getSetsold)
    case "3" : do {
      print("entrer la somme que vous désirez déposer")
      let somme = Double(readLine()!)!
      if(somme < 0 ){
        print("erreur : la somme à déposer est négative!")
      }
      else{
        client.getSetCompte.depot(nb:somme)
        print ("votre depot a bien été effectué :)")
      }
    }

    case "4" : do {
      print("Rentrer la somme que vous désirez retirer")
      let somme = Double(readLine()!)!
      client.getSetCompte.retrait(nb:somme)
    }
    case "5" : do {
      print ("appel au conseillé....")
      client.demande_de_cloture()
      print("Conseillé : Votre compte a bien été cloture")
      print("Merci et au plaisir de vous revoir")
      main()
    }
    case "6" : do {
      print ("appel au conseillé....")
      print ("conseillé : quel est votre nouvelle adress ?")
      let add = readLine()!
      client.getSetconseil.modifier_le_adress(new_adress: add, cpt:client)
      print("Conseillé : Votre adresss a bien été modifier")
    }

    case "7" : do {
      print ("appel au conseillé....")
      print ("conseillé : quel est votre nouveau tel ?")
      let tel = readLine()!
      client.getSetconseil.modifier_le_tel(new_tel: tel, cpt:client)
      print("Conseillé : Votre tel a bien été modifier")
    }

    case "8" : do {
      if (client.getSetCompteLivret.getSetCreated == false)
      {
        client.demande_ouverture_compte_livret()
        if (client.getSetCompteLivret.getSetCreated == true){
          print(" votre compte livretA a bien été créer ")
        }
      }
      else{
        print ("vous avez déja un compte livretA")
        print ("compte livretA -> solde : ",client.getSetCompteLivret.getSetsold)
      }
      
    }
    case "9" : do {
      print ("entrez la somme que vous voulez transferer :")
      let nb = Double(readLine()!)!
      client.virement_courant_livret(nb:nb)
    }
    case "10" : do {
      print ("entrez la somme que vous voulez transferer :")
      let nb = Double(readLine()!)!
      client.virement_livret_courant(nb:nb)
    }
    case "11" : do {
      if (client.getSetCompteEpargne.getSetCreated == false)
      {
        client.demande_ouverture_compte_Epargne()
        if (client.getSetCompteEpargne.getSetCreated == true){
          print(" votre compte epargne a bien été créer ")
        }
      }
      else{
        print ("vous avez déja un compte epargne")
        print ("compte epargne -> solde : ",client.getSetCompteEpargne.getSetsold)
      }
    }
    case "12" : do {
      print ("entrez la somme que vous voulez transferer :")
      let nb = Double(readLine()!)!
      client.virement_courant_epargne(nb:nb)
    }
    case "13" : do {
      print ("entrez la somme que vous voulez transferer :")
      let nb = Double(readLine()!)!
      client.virement_livret_epargne(nb:nb)
    }
    case "14" : do {
      client.virement_epargne_livret()
    }
    case "15" : do {
      client.virement_epargne_courant()
    }
    case "16": virement_client_client(client: client)


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
    case "1" : espace_client(client: client)
    case "2" : main()
    default : return
  }

}
//fct qui permet se connecter au compte client
func je_suis_client(){
  print ("***************************")
  print ("connexion a mon espace client :")
  print ("***************************")
  
  print ("nom : ", terminator:"")
  let nom = readLine()!
  print ("prenom : ", terminator:"")
  let prenom = readLine()!
  print ("tel : ", terminator:"")
  let tel = readLine()!
//vérifie la connection
  if (verifier_si_sa_exist(nom: nom, prenom: prenom, tel: tel) == false){
    print ("utilisateur n'existe pas ")
  }
  else{
    let client = conexion(nom: nom, prenom: prenom, tel: tel)
    espace_client(client: client)
  }
}