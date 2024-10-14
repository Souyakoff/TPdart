class Joueur {
  String pseudo; 
  int score;     
  int sante;    
  int force;     

  Joueur(this.pseudo, {this.sante = 100, this.force = 5}) : score = 0;

  void ajouterScore(int points) {
    score += points;
  }
}
