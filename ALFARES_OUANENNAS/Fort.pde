class Fort {
  // Attributs représentant les dimensions du fort et des briques, ainsi que les positions des faces et de la porte
  int murLargueur;  
  int murHauteur;   
  float briqueLargueur;  
  float briqueHauteur;   
  float briqueProfondeur; 
  String face1;     // Position de la première face (devant, gauche, droite, derrière)
  String face2;     // Position de la deuxième face (devant, gauche, droite, derrière)
  String porte;     // Position de la porte (devant, gauche, droite, derrière)

  // Constructeur de la classe Fort qui initialise les attributs avec les valeurs passées en paramètre
  Fort(int murLargueur, int murHauteur, float briqueLargueur, float briqueHauteur, float briqueProfondeur, String face1, String face2, String porte) {
    this.murLargueur = murLargueur;
    this.murHauteur = murHauteur;
    this.briqueLargueur = briqueLargueur;
    this.briqueHauteur = briqueHauteur;
    this.briqueProfondeur = briqueProfondeur;
    this.face1 = face1;
    this.face2 = face2;
    this.porte = porte;
  }

  // Méthode pour dessiner le fort en 3D
  void dessiner() {
    // MUR 1 - Face avant
    // Si la face avant est définie sur "devant" ou "face1" ou "face2", on dessine un mur avec des meurtrières
    if (face1 == "devant" || face2 == "devant") {
      Mur mur1 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur1.dessinerMeurtriere();  // Dessin d'un mur avec meurtrière
    } else if (porte == "devant") {
      Mur mur1 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur1.dessinerMurAvecPorte(0, false);  // Dessine un mur avec une porte
    } else {
      Mur mur1 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur1.dessinerMur(0);  // Dessine un mur.
    }

    // MUR 2 - Face gauche
    if (face1 == "gauche" || face2 == "gauche") {
      // Déplacement et rotation pour placer le mur sur la face gauche
      translate(-murLargueur / 4 - briqueLargueur / 4 + briqueLargueur / 50, 0, -briqueLargueur + briqueLargueur / 4);
      rotateY(PI / 2);  // Rotation de 90° pour aligner les murs
      Mur mur2 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur2.dessinerMeurtriere();  // Dessin d'un mur avec meurtrière
    } else if (porte == "gauche") {
      // Déplacement et rotation pour placer un mur avec une porte sur la face gauche
      translate(-briqueLargueur / 4, 0, -briqueLargueur + briqueLargueur / 4);
      rotateY(PI / 2);  // Rotation de 90° pour aligner les murs
      Mur mur2 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur2.dessinerMurAvecPorte(0, false);  // Dessin d'un mur avec une porte
    } else {

      translate(-briqueLargueur / 4, 0, -briqueLargueur + briqueLargueur / 4);
      rotateY(PI / 2); 
      Mur mur2 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur2.dessinerMur(0);  // Dessin d'un mur classique
    }

    // MUR 3 - Face droite
    if (face1 == "droite" || face2 == "droite") {
      // Déplacement pour positionner le mur sur la face droite
      translate(-(1 / 2) * briqueLargueur, 0, briqueLargueur * murLargueur - briqueProfondeur);
      Mur mur3 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur3.dessinerMeurtriere();  // Dessin d'un mur avec meurtrière
    } else if (porte == "droite") {
      // Déplacement pour positionner un mur avec une porte sur la face droite
      translate(-(1 / 2) * briqueLargueur, 0, briqueLargueur * murLargueur - briqueProfondeur);
      Mur mur3 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur3.dessinerMurAvecPorte(0, false);  // Dessin d'un mur avec porte
    } else {
      // Déplacement pour positionner un mur classique sur la face droite
      translate(-(1 / 2) * briqueLargueur, 0, briqueLargueur * murLargueur - briqueProfondeur);
      Mur mur3 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur3.dessinerMur(0);  // Dessin d'un mur classique
    }

    // MUR 4 - Face arrière
    if (face1 == "deriere" || face2 == "deriere") {
      // Déplacement pour positionner le mur à l'arrière
      translate((murLargueur * briqueLargueur) - briqueLargueur / 2, 0, -briqueLargueur / 4);
      rotateY(PI / 2);  // Rotation de -90° pour aligner les murs
      Mur mur4 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur4.dessinerMeurtriere();  // Dessin d'un mur avec meurtrière
    } else if (porte == "deriere") {
      // Déplacement pour positionner un mur avec une porte à l'arrière
      translate((murLargueur * briqueLargueur) - briqueProfondeur / 2, 0, -briqueLargueur / 4);
      rotateY(PI / 2);  
      Mur mur4 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur4.dessinerMurAvecPorte(0, false);  
    } else {
      // Déplacement pour positionner un mur classique à l'arrière
      translate((murLargueur * briqueLargueur) - briqueProfondeur / 2, 0, -briqueLargueur / 4);
      rotateY(PI / 2); 
      Mur mur4 = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
      mur4.dessinerMur(0);  // Dessin d'un mur classique
    }

    // Dessin du toit
    Mur toit = new Mur(murLargueur, murHauteur, briqueLargueur, briqueHauteur, briqueProfondeur);
    toit.toit();  // Dessin du toit du fort

    // Dessin du drapeau sur le fort
    Drapeau drapeau = new Drapeau(0, 0, 0, 500, 100, 350);
    drapeau.dessiner();  // Dessin du drapeau
  }
}
