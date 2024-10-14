import 'dart:math';
import 'dart:io';
import 'bot.dart';
import 'joueur.dart';
import 'procedure.dart';

Random random = Random();

void main() {
  print("Saisissez votre pseudo:");
  String? pseudoInput = stdin.readLineSync();

  // Crée une instance de "Joueur" avec le pseudo saisi
  Joueur joueur = Joueur(pseudoInput ?? "Inconnu");
  
  print("Bienvenue, oOooOOOooh Grand ${joueur.pseudo} destructeur de bots !");
  
  int compteur = 1;
  Bot b1 = Bot(); 

  while (true) {
    print("Tours : $compteur");
    afficherInfosJoueur(joueur);
    afficherInfosBot(b1);        

    // Phase de devinette pour déterminer qui attaque en premier
    bool joueurAttaqueEnPremier = devinerNombre(joueur);

    if (joueurAttaqueEnPremier) {
      // Le joueur attaque en premier
      attaqueJoueurVersBot(joueur, b1);

      // Vérifie si le bot est vaincu
      if (b1.sante <= 0) {
        print("\nFélicitations ${joueur.pseudo} ! Vous avez vaincu le Bot en $compteur tours !");
        break;
      }

      // Le bot attaque ensuite
      attaqueBotVersJoueur(b1, joueur);
    } else {
      // Le bot attaque en premier
      attaqueBotVersJoueur(b1, joueur);

      // Vérifie si le joueur est vaincu
      if (joueur.sante <= 0) {
        print("${joueur.pseudo}, vous avez été vaincu par le Bot en $compteur tours. Rejouez pour tenter de le vaincre !");
        break;
      }

      // Le joueur attaque ensuite
      attaqueJoueurVersBot(joueur, b1);
    }
    compteur++;
  }
}