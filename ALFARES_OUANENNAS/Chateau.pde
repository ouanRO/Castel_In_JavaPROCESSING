// Classe représentant un Château, qui contient des murs et des forts à dessiner.
// Image du chateu pour une vue en heut :castle\images des execution\vue_du_chateau_en_haut.png"
public class Chateau {
  int murLargeur;      
  int murHauteur;      
  float briqueLargeur; 
  float briqueHauteur; 
  float briqueProfondeur; 

  // Constructeur de la classe Chateau
  Chateau(int murLargeur, int murHauteur, float briqueLargeur, float briqueHauteur, float briqueProfondeur) {
    this.murLargeur = murLargeur;      
    this.murHauteur = murHauteur;      
    this.briqueLargeur = briqueLargeur; 
    this.briqueHauteur = briqueHauteur; 
    this.briqueProfondeur = briqueProfondeur; 
  }

  // Méthode pour dessiner le château
  void dessiner() {
    // Premier Fort (gauche) - C'est la base du fort.
    Fort fort1 = new Fort(murLargeur, murHauteur, briqueLargeur, briqueHauteur, briqueProfondeur, "devant", "gauche", "droite");
    fort1.dessiner(); // Dessiner le premier fort

    // Mur central avant avec porte
    pushMatrix(); 
    translate(-murLargeur * 300, murLargeur * 10, briqueHauteur * 2); // Déplacement de la scène pour positionner le mur
    rotateY(-PI / 2);  // Rotation de -90 degrés autour de l'axe Y, ce qui fait pivoter l'objet sur l'axe vertical (gauche-droite).
    rotateX(-PI / 2);  // Rotation de -90 degrés autour de l'axe X, ce qui fait pivoter l'objet sur l'axe horizontal (haut-bas).
    rotateZ(HALF_PI);  // Rotation de +90 degrés autour de l'axe Z, ce qui fait pivoter l'objet sur l'axe de la profondeur (avant-arrière).

    Mur murCentralA = new Mur(murLargeur * 3, murHauteur, briqueLargeur, briqueHauteur, briqueProfondeur);
    murCentralA.dessinerMurAvecPorte(10, true); // Dessiner le mur avec une porte
    popMatrix(); // Restaure l'état des transformations

    // Mur central gauche
    pushMatrix(); 
    translate((murLargeur - murLargeur / 3 + 1) * briqueLargeur, (murLargeur) * briqueLargeur + briqueProfondeur, briqueHauteur * 2);
    rotateY(-PI / 2); 
    rotateZ(HALF_PI); 
    Mur murCentralG = new Mur((murLargeur * 3) + 1, murHauteur, briqueLargeur, briqueHauteur, briqueProfondeur);
    murCentralG.dessinerMur(10); // Dessiner le mur gauche
    popMatrix(); 

    // Fort derrière gauche
    translate(0, (murLargeur * 5 + 1) * briqueLargeur + briqueProfondeur, briqueHauteur * 2);
    rotateX(-HALF_PI); // Rotation autour de l'axe X
    Fort fort2 = new Fort(murLargeur, murHauteur, briqueLargeur, briqueHauteur, briqueProfondeur, "devant", "droite", "gauche");
    fort2.dessiner(); // Dessiner le fort derrière à gauche

    // Fort à droite
    translate(murLargeur * 400, 510 * murLargeur + briqueProfondeur, briqueHauteur * 2);
    rotateX(-HALF_PI); // Rotation autour de l'axe X
    Fort fort3 = new Fort(murLargeur, murHauteur, briqueLargeur, briqueHauteur, briqueProfondeur, "devant", "droite", "gauche");
    fort3.dessiner(); // Dessiner le fort à droite

    // Mur central droite
    pushMatrix(); // Sauvegarde de l'état actuel des transformations
    translate((murLargeur / 3 - 2) * briqueLargeur, (murLargeur) * briqueLargeur + briqueProfondeur, briqueHauteur * 2);
    rotateY(-PI / 2); // Rotation autour de l'axe Y
    rotateZ(HALF_PI); // Rotation autour de l'axe Z
    Mur murCentralD = new Mur((murLargeur * 3) + 1, murHauteur, briqueLargeur, briqueHauteur, briqueProfondeur);
    murCentralD.dessinerMur(10); // Dessiner le mur central à droite
    popMatrix(); // Restaure l'état des transformations

    // Fort derrière à droite
    translate(0, (murLargeur * 5 + 1) * briqueLargeur + briqueProfondeur, briqueHauteur * 2);
    rotateX(-HALF_PI); // Rotation autour de l'axe X
    Fort fort4 = new Fort(murLargeur, murHauteur, briqueLargeur, briqueHauteur, briqueProfondeur, "devant", "gauche", "droite");
    fort4.dessiner(); // Dessiner le fort derrière à droite

    // Mur derrière central
    pushMatrix(); // Sauvegarde de l'état actuel des transformations
    translate(-(murLargeur * 3) * briqueLargeur, (murLargeur / 3 - 2) * briqueLargeur, briqueHauteur * 2);
    rotateX(-HALF_PI); // Rotation autour de l'axe X
    Mur murCentralDC = new Mur(murLargeur * 3, murHauteur, briqueLargeur, briqueHauteur, briqueProfondeur);
    murCentralDC.dessinerMur(10); // Dessiner le mur central derrière
    popMatrix(); // Restaure l'état des transformations
  }
}
