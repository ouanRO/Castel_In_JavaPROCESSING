class Drapeau {
  float x, y, z;  // Position du drapeau dans l'espace 3D.
  float matHauteur;
  float flagHauteur; 
  float flagLargeur; 

  // Constructeur de la classe Drapeau
  Drapeau(float x, float y, float z, float matHauteur, float flagHauteur, float flagLargeur) {
    this.x = x;  // Initialiser la position X du drapeau
    this.y = y;  // Initialiser la position Y du drapeau
    this.z = z;  // Initialiser la position Z du drapeau
    this.matHauteur = matHauteur; 
    this.flagHauteur = flagHauteur; 
    this.flagLargeur = flagLargeur; 
  }

  // Méthode pour dessiner le drapeau
  void dessiner() {
    // Dessiner le mât du drapeau
    pushMatrix(); 
    rotateX(PI / 2);  // Rotation de 90 degrés autour de l'axe X pour que le mât soit vertical
    translate(0, briqueHuateurInitiale * 5, z);  // Translation pour positionner le mât à la bonne hauteur et à la bonne position en Z
    fill(10); // Couleur du mât (gris foncé)
    box(5, matHauteur, 5);  // Dessiner un cube pour représenter le mât du drapeau
    popMatrix();  

    // Dessiner le drapeau
    pushMatrix();  
    rotateX(PI / 2);  // Rotation de 90 degrés autour de l'axe X pour que le drapeau soit orienté horizontalement
    translate(0, briqueHuateurInitiale * 8, z);  // Translation pour positionner le drapeau à la bonne hauteur par rapport au mât

    // Calcul d'un effet de mouvement pour simuler le vent
    float waving = sin(radians(frameCount)) * 10; // Mouvement avec sinus en fonction du nombre de frames (effet de vent)

    // Largeur de chaque bande du drapeau (en 3 parties égales)
    float bandWidth = flagLargeur / 3;

    // Dessiner la première bande bleue du drapeau
    translate(flagLargeur / 2, 0, z);  // Translation pour positionner la première bande du drapeau à sa position
    fill(0, 0, 255); // Couleur bleue
    beginShape();  // Début de la forme polygonale
    vertex(-flagLargeur / 2, -matHauteur / 3, 0);  // Définir les coordonnées du premier sommet
    vertex(-flagLargeur / 2 + bandWidth, waving - matHauteur / 3, 0);  // Définir les coordonnées du deuxième sommet
    vertex(-flagLargeur / 2 + bandWidth, waving + flagHauteur, 0);  // Définir les coordonnées du troisième sommet
    vertex(-flagLargeur / 2, flagHauteur, 0);  // Définir les coordonnées du quatrième sommet
    endShape(CLOSE);  // Fermer la forme

    // Dessiner la deuxième bande blanche du drapeau
    fill(255);  // Couleur blanche
    beginShape();  // Début de la forme polygonale
    vertex(-flagLargeur / 2 + bandWidth, -matHauteur / 3, 0);  // Définir les coordonnées du premier sommet
    vertex(-flagLargeur / 2 + 2 * bandWidth, waving - matHauteur / 3, 0);  // Définir les coordonnées du deuxième sommet
    vertex(-flagLargeur / 2 + 2 * bandWidth, waving + flagHauteur, 0);  // Définir les coordonnées du troisième sommet
    vertex(-flagLargeur / 2 + bandWidth, flagHauteur, 0);  // Définir les coordonnées du quatrième sommet
    endShape(CLOSE);  

    // Dessiner la troisième bande rouge du drapeau
    fill(255, 0, 0);  // Couleur rouge
    beginShape();  // Début de la forme polygonale
    vertex(-flagLargeur / 2 + 2 * bandWidth, -matHauteur / 3, 0);  // Définir les coordonnées du premier sommet
    vertex(flagLargeur / 2, waving - matHauteur / 3, 0);  // Définir les coordonnées du deuxième sommet
    vertex(flagLargeur / 2, waving + flagHauteur, 0);  // Définir les coordonnées du troisième sommet
    vertex(-flagLargeur / 2 + 2 * bandWidth, flagHauteur, 0);  // Définir les coordonnées du quatrième sommet
    endShape(CLOSE); 

    popMatrix();  
  }
}
