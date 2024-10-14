class Bot {
  int force = 1;
  int sante = 100;

  int get vie {
    return sante;
  }

  void Degats(int degats) {
    sante -= degats;
  }
}
