import 'dart:math';
import 'dart:io';
import 'bot.dart';
import 'joueur.dart';

Random random = Random();

int De() {
  return random.nextInt(6) + 1; //+1 pour obtenir un dé de 1 à 6
}

// Procédure pour afficher les informations d'un Joueur
void afficherInfosJoueur(Joueur joueur) {
  print("${joueur.pseudo} - Santé: ${joueur.sante} PV, Force: ${joueur.force}");
}

// Procédure pour afficher les informations d'un Bot
void afficherInfosBot(Bot bot) {
  print("Bot - Santé: ${bot.vie} PV, Force: ${bot.force}");
}

// Procédure d'attaque du Joueur vers le Bot
void attaqueJoueurVersBot(Joueur joueur, Bot bot) {
  print("Appuyez sur 'Entrée' pour lancer le dé et attaquer !");
  stdin.readLineSync(); // Attente de l'entrée du joueur
  int degatsJoueur = joueur.force + De(); // Dégâts infligés par le joueur
  print("\nVous infligez $degatsJoueur points de dégâts au Bot !");
  bot.Degats(degatsJoueur); 
  joueur.ajouterScore(degatsJoueur); // Mise à jour du score du joueur
}

// Procédure d'attaque du Bot vers le Joueur
void attaqueBotVersJoueur(Bot bot, Joueur joueur) {
  print("Appuyez sur 'Entrée' pour que le Bot attaque !");
  stdin.readLineSync(); // Attente de l'entrée du joueur
  int degatsBot = bot.force + De(); // Dégât infligés par le bot
  print("Le Bot vous inflige $degatsBot points de dégâts !");
  joueur.sante -= degatsBot;
}

// Génère un nombre aléatoire à deviner
int genererNombreMystere() {
  return random.nextInt(100) + 1;
}

// Procédure pour deviner un nombre 
bool devinerNombre(Joueur joueur) {
  int nombreMystere = genererNombreMystere();

  
  print("\nDevinez un nombre entre 1 et 100:");
  int? devineJoueur = int.tryParse(stdin.readLineSync() ?? "0");

  // Le bot fait une supposition aléatoire
  int devineBot = random.nextInt(100) + 1;

  print("Le bot a deviné: $devineBot");
  print("Le nombre mystère était: $nombreMystere");

  // Calcule la différence entre les suppositions et le nombre mystère
  int diffJoueur = (nombreMystere - (devineJoueur ?? 0)).abs();
  int diffBot = (nombreMystere - devineBot).abs();

  // Détermine le gagnant
  if (diffJoueur < diffBot) {
    print("Vous avez deviné le plus proche ! Vous attaquez en premier !");
    return true; 
  } else {
    print("Le bot a deviné le plus proche. Il attaque en premier !");
    return false; 
  }
}