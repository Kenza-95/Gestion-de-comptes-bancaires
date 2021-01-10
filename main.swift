var bank : Banque = Banque()
func main(){
  print ("---------------------------")
  print("Vous etes :")
  print("    1:  conseiller") 
  print("    2:  client")
  print ("------------------------")
  print ("choix: ", terminator:"")
  var i = readLine()!
  switch i {
    case "1": je_suis_conseille()//appel à la fonction du traitement conseiller
    case "2": je_suis_client()//appel à la fonction du traitement client
    default : print("choix not exit ")
  }
  print ("------------------------")
  print ("voulez vous quitter ?")
  print("    1 : continuer")
  print("    autre:  quitter") 
  print ("------------------------")
  print ("choix: ", terminator:"")
  i = readLine()!
  switch i {
    case "1": main()
    default : print("au revoir ")
  }
}
main()