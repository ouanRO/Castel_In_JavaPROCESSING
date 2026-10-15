color couleurMur = color(200, 180, 140);
color couleurPorte = color(210, 180, 140);

class Mur {
  int murLargueur;
  int murHauteur;
  float briqueLargueur;
  float briqueHauteur;
  float briqueProfondeur;
  color couleur;

  // Constructeur de la classe Mur
  Mur(int murLargueur, int murHauteur, float briqueLargueur, float briqueHauteur, float briqueProfondeur) {
    this.murLargueur = murLargueur;
    this.murHauteur = murHauteur;
    this.briqueLargueur = briqueLargueur;
    this.briqueHauteur = briqueHauteur;
    this.briqueProfondeur = briqueProfondeur;
  }

// Méthode pour dessiner le mur normal
void dessinerMur(int Hauteur) {
  
  // Parcours des lignes du mur à partir de la hauteur spécifiée
  for (int i = Hauteur; i < murHauteur; i++) {

    // Parcours des colonnes de chaque ligne (chaque brique)
    for (int j = 0; j < murLargueur; j++) {

      // Si la ligne est dans les 2 premières lignes (créneaux)
      if (i < 2 + Hauteur) { 
        // Espace entre les briques (ici une demi-largeur de brique)
        float spaceBetween = briqueLargueur / 2;
        
        // Si la position actuelle dépasse la largeur totale du mur, sortir de la boucle
        if (j * (briqueLargueur + spaceBetween) > (murLargueur - 1) * briqueLargueur) break;

        // Position en X de la brique (décalage pour la première brique)
        float x = (j == 0) ? 0 : j * (briqueLargueur + spaceBetween);
        // Position en Y de la brique (en fonction de la ligne)
        float y = i * briqueHauteur;
        // Position en Z (toujours à 0 dans ce cas)
        float z = 0;
        
        // Création de la brique avec la couleur du mur et ses dimensions
        Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
        // Dessiner la brique
        brique.dessiner();
      } else {
        // Si la ligne est impaire (création de moitiés de briques)
        if (i % 2 == 0) {
          // Si on est dans la première colonne, on place deux moitiés de briques
          if (j == 0) { 
            // Position de la première moitié de brique (décalée sur la gauche)
            float x = j * (briqueLargueur / 2) - briqueLargueur / 4;
            float y = i * briqueHauteur;
            float z = 0;
            // Création et dessin de la première moitié de brique
            Brique brique1 = new Brique(x, y, z, briqueLargueur / 2, briqueHauteur, briqueProfondeur, couleurMur);
            brique1.dessiner();

            // Position de la deuxième moitié de brique (décalée sur la droite)
            x = (murLargueur - 1) * briqueLargueur + briqueLargueur / 4;
            // Création et dessin de la deuxième moitié de brique
            Brique brique2 = new Brique(x, y, z, briqueLargueur / 2, briqueHauteur, briqueProfondeur, couleurMur);
            brique2.dessiner();
          } else {
            // Pour les autres colonnes, on dessine une brique entière, mais décalée
            float x = j * briqueLargueur - briqueLargueur / 2;
            float y = i * briqueHauteur;
            float z = 0;
            // Création et dessin de la brique entière
            Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
            brique.dessiner();
          }
        } else { // Si la ligne est paire, on dessine des briques entières
          float x = j * briqueLargueur;
          float y = i * briqueHauteur;
          float z = 0;
          // Création et dessin de la brique entière
          Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
          brique.dessiner();
        }
      }
    }
  }
}




// Méthode pour dessiner un mur avec des meurtrières
void dessinerMeurtriere() {
  
  // Parcours des lignes du mur
  for (int i = 0; i < murHauteur; i++) {
    
    // Parcours des colonnes du mur (chaque brique)
    for (int j = 0; j < murLargueur; j++) {

      // Condition qui vérifie si l'on se trouve dans les zones des meurtrières
      // Il y a trois zones où des meurtrières peuvent être dessinées sur le mur
      boolean verifier = ( 
          ((i >= dividende_meurtriere) && i < dividende_meurtriere + nb_Meurtriere) || 
          ((i >= (dividende_meurtriere * 3)) && (i < (dividende_meurtriere * 3) + nb_Meurtriere)) ||
          ((i >= (dividende_meurtriere * 5)) && i < (dividende_meurtriere * 5) + nb_Meurtriere)
      );
      
      // Si on est dans les deux premières lignes, on dessine des briques classiques
      if (i < 2) { 
        // Calcul de l'espace entre les briques (une demi-largeur de brique)
        float spaceBetween = briqueLargueur / 2;
        
        // Si on dépasse la largeur du mur, on arrête de dessiner
        if (j * (briqueLargueur + spaceBetween) > murLargueur * (briqueLargueur - 1)) break;
        
        // Positionnement de la brique en X, Y et Z
        float x = (j == 0) ? 0 : j * (briqueLargueur + spaceBetween);
        float y = i * briqueHauteur;
        float z = 0;

        // Création de la brique avec ses dimensions et couleur
        Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
        // Dessiner la brique
        brique.dessiner();
      } else {
        // Si la ligne est paire, dessiner des moitiés de briques pour décaler les lignes
        if (i % 2 == 0) { 
          // Si on est dans la première colonne
          if (j == 0) { 
            // Création et dessin de la première moitié de la brique à gauche
            float x = j * (briqueLargueur / 2) - briqueLargueur / 4;
            float y = i * briqueHauteur;
            float z = 0;
            Brique brique1 = new Brique(x, y, z, briqueLargueur / 2, briqueHauteur, briqueProfondeur, couleurMur);
            brique1.dessiner();

            // Création et dessin de la deuxième moitié de la brique à droite
            x = (murLargueur - 1) * briqueLargueur + briqueLargueur / 4;
            Brique brique2 = new Brique(x, y, z, briqueLargueur / 2, briqueHauteur, briqueProfondeur, couleurMur);
            brique2.dessiner();
          } else {
            // Si on est dans la colonne centrale et que c'est une ligne de meurtrière (vérifié par "verifier")
            if (j == murLargueur / 2 && verifier) {
              // Dessiner deux moitiés de briques pour former une meurtrière (gauche et droite)
              float xG = j * briqueLargueur - briqueLargueur + (briqueLargueur - briqueLargueur / 8 - briqueLargueur / 16 - briqueLargueur / 2 - briqueLargueur / 8);
              float yG = i * briqueHauteur;
              float zG = 0;
              // Brique gauche de la meurtrière
              Brique briqueG = new Brique(xG, yG, zG, (briqueLargueur / 2) - briqueLargueur / 8, briqueHauteur, briqueProfondeur, couleurMur);
              briqueG.dessiner();
              
              // Brique droite de la meurtrière
              float xD = j * briqueLargueur - briqueLargueur + (briqueLargueur - briqueLargueur / 8 - briqueLargueur / 16);
              float yD = i * briqueHauteur;
              float zD = 0;
              Brique briqueD = new Brique(xD, yD, zD, (briqueLargueur / 2) - briqueLargueur / 8, briqueHauteur, briqueProfondeur, couleurMur);
              briqueD.dessiner();
            } else {
              // Sinon, dessiner une brique entière
              float x = j * briqueLargueur - briqueLargueur / 2;
              float y = i * briqueHauteur;
              float z = 0;
              Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
              brique.dessiner();
            }
          }
        } else { // Si la ligne est impaire, dessiner des briques complètes
          // Si on est dans la colonne du milieu et que c'est une ligne de meurtrière
          if (j == (murLargueur / 2 - 1) && verifier) {
            // Brique gauche de la meurtrière
            float xG = (j) * briqueLargueur - briqueLargueur / 16;
            float yG = i * briqueHauteur;
            float zG = 0;
            Brique briqueG = new Brique(xG, yG, zG, briqueLargueur - briqueLargueur / 8, briqueHauteur, briqueProfondeur, couleurMur);
            briqueG.dessiner();
          } else if (j == murLargueur / 2 && verifier) {
            // Brique droite de la meurtrière
            float xD = (j) * briqueLargueur + briqueLargueur / 16;
            float yD = i * briqueHauteur;
            float zD = 0;
            Brique briqueD = new Brique(xD, yD, zD, briqueLargueur - briqueLargueur / 8, briqueHauteur, briqueProfondeur, couleurMur);
            briqueD.dessiner();
          } else {
            // Sinon, dessiner une brique entière
            float x = j * briqueLargueur;
            float y = i * briqueHauteur;
            float z = 0;
            Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
            brique.dessiner();
          }
        }
      }
    }
  }
}





// Méthode pour dessiner un mur avec une porte, en fonction de la hauteur du mur à dessiner (Hauteur)
// et de l'état de la porte (ouverte ou non)
void dessinerMurAvecPorte(int Hauteur, boolean porteOuvrante) {

  // Boucle pour parcourir chaque ligne du mur à partir de la hauteur spécifiée (Hauteur) jusqu'à la hauteur totale du mur
  for (int i = Hauteur; i < murHauteur; i++) {

    // Boucle pour parcourir chaque colonne du mur (de gauche à droite)
    for (int j = 0; j < murLargueur; j++) {

      // Vérification si nous sommes dans la zone inférieure du mur où la porte doit être dessinée
      boolean verifier = (i >= murHauteur - murHauteur / 4) && (i < murHauteur);

      // Si nous sommes dans les lignes du haut du mur (celles des créneaux)
      if (i < 2 + Hauteur) {
        // Espace entre chaque brique
        float spaceBetween = briqueLargueur / 2;
        
        // Si l'index j dépasse la largeur du mur, on s'arrête de dessiner
        if (j * (briqueLargueur + spaceBetween) > murLargueur * (briqueLargueur - 1)) break;
        
        // Calcul des positions de la brique (x, y, z) pour la dessiner
        float x = (j == 0) ? 0 : j * (briqueLargueur + spaceBetween);  // Décale les briques horizontalement
        float y = i * briqueHauteur; // Position verticale des briques
        float z = 0; // Profondeur constante pour dessiner les briques sur le même plan

        // Création d'une nouvelle brique et appel de la méthode pour la dessiner
        Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
        brique.dessiner();
      } else { // Si on est au-delà des lignes des créneaux

        // Si la ligne (i) est paire (étage impair)
        if (i % 2 == 0) {

          // Si on est dans la première colonne
          if (j == 0) {
            // Positionne la première brique à gauche, avec une largeur réduite
            float x = j * (briqueLargueur / 2) - briqueLargueur / 4;
            float y = i * briqueHauteur;
            float z = 0;
            Brique brique1 = new Brique(x, y, z, briqueLargueur / 2, briqueHauteur, briqueProfondeur, couleurMur);
            brique1.dessiner();

            // Positionne la deuxième brique à droite
            x = (murLargueur - 1) * briqueLargueur + briqueLargueur / 4;
            Brique brique2 = new Brique(x, y, z, briqueLargueur / 2, briqueHauteur, briqueProfondeur, couleurMur);
            brique2.dessiner();
          } else {
            
            // Si on est dans la zone de la porte, on crée un espace vide pour la porte
            if ((j == murLargueur / 2 - 1) && verifier) {
              // Briques à gauche de l'ouverture de la porte (réduites)
              float xG = j * briqueLargueur - briqueLargueur + (briqueLargueur - briqueLargueur / 8 - briqueLargueur / 16 - briqueLargueur / 2 - briqueLargueur / 8);
              float yG = i * briqueHauteur;
              float zG = 0;
              Brique briqueG = new Brique(xG, yG, zG, (briqueLargueur / 2) - briqueLargueur / 8, briqueHauteur, briqueProfondeur, couleurMur);
              briqueG.dessiner();

              // Briques à droite de l'ouverture de la porte (réduites)
              float xD = (j + 2) * briqueLargueur - briqueLargueur + (briqueLargueur - briqueLargueur / 8 - briqueLargueur / 16);
              float yD = i * briqueHauteur;
              float zD = 0;
              Brique briqueD = new Brique(xD, yD, zD, (briqueLargueur / 2) - briqueLargueur / 8, briqueHauteur, briqueProfondeur, couleurMur);
              briqueD.dessiner();

              // Saute deux indices de colonnes pour laisser un espace pour la porte
              j += 2;
            } else {
              // Sinon, dessine une brique normale
              float x = j * briqueLargueur - briqueLargueur / 2;
              float y = i * briqueHauteur;
              float z = 0;
              Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
              brique.dessiner();
            }
          }
        } else { // Si la ligne est impair (étage pair), dessiner des briques complètes

          // Si l'on est dans la zone de la porte, crée un espace pour la porte et dessine les briques autour
          if (j == (murLargueur / 2 - 2) && (j < murLargueur / 2 + 2) && verifier) {
            // Brique à gauche de la porte
            float xG = (j) * briqueLargueur - briqueLargueur / 16;
            float yG = i * briqueHauteur;
            float zG = 0;
            Brique briqueG = new Brique(xG, yG, zG, briqueLargueur - briqueLargueur / 8, briqueHauteur, briqueProfondeur, couleurMur);
            briqueG.dessiner();

            // Brique à droite de la porte
            float xD = ((j + 3) * briqueLargueur) + briqueLargueur / 16;
            float yD = i * briqueHauteur;
            float zD = 0;
            Brique briqueD = new Brique(xD, yD, zD, briqueLargueur - briqueLargueur / 8, briqueHauteur, briqueProfondeur, couleurMur);
            briqueD.dessiner();

            // Avance de 3 colonnes pour laisser un espace vide pour la porte
            j += 3;
          } else {
            // Sinon, dessine une brique complète
            float x = j * briqueLargueur;
            float y = i * briqueHauteur;
            float z = 0;
            Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
            brique.dessiner();
          }
        }
      }
    }
  }





 // Calcule la position horizontale (x) de la brique, centrée sur le mur.
float x = ((murLargueur / 2) * briqueLargueur) - briqueLargueur / 2;

// Calcule la position verticale (y) de la brique, positionnée trois-quarts de la hauteur du mur, avec un décalage de 3 briques.
float y = (murHauteur - murHauteur / 4 + 3) * briqueHauteur;


    // Largeur totale de la porte
    float porteLargeur = 2 * briqueLargueur + briqueLargueur / 4;

    pushMatrix();
    // Positionne l'origine au coin gauche de la porte
    translate(x - porteLargeur / 2, y, 0); // Place le coin gauche comme point de rotation

    // Applique la rotation si la porte est ouverte
    if (porteOuvrante) {
      rotateY(-angle); // Applique la rotation autour du coin gauche de la porte
    }

    // Création de la porte entière
    Brique porte = new Brique(porteLargeur / 2, 0, 0, porteLargeur, briqueHauteur * (murHauteur / 4), briqueProfondeur, couleurPorte);
    porte.dessiner();

    // Ajout des sphères adaptées à la porte
    // Position relative des sphères par rapport à la porte
    pushMatrix();
    translate(porteLargeur / 2 + 75, 0, -briqueProfondeur / 2);
    sphere(20);
    popMatrix();

    pushMatrix();
    translate(porteLargeur / 2 + 75, 0, briqueProfondeur / 2);
    sphere(20);
    popMatrix();

    popMatrix(); // Termine la transformation de la porte et des sphères
  }




void toit() {
  // Effectue une rotation de 90 degrés autour de l'axe X pour orienter correctement le toit.
  rotateX(PI / 2);
  
  // Déplace la position de départ du toit sur l'axe Y et Z.
  translate(0, -(briqueHauteur * murLargueur * 2), -briqueHauteur * 2);

  // Boucle pour créer chaque brique du toit en fonction de la largeur et de la hauteur du mur.
  for (int i = 0; i < murLargueur * 2; i++) { // Loop pour les briques en largeur (murLargueur * 2 pour un toit plus large)
    for (int j = 0; j < murHauteur / 3; j++) { // Loop pour les briques en hauteur (un tiers de la hauteur totale)

      if (i % 2 == 0) { // Vérifie si c'est un étage impair (briques décalées)
        if (j == 0) { // Première ligne du toit, avec des briques décalées
          // Position de la première brique de la ligne (première moitié)
          float x = j * (briqueLargueur / 2) - briqueLargueur / 4;
          float y = i * briqueHauteur;
          float z = 0;
          Brique brique1 = new Brique(x, y, z, briqueLargueur / 2, briqueHauteur, briqueProfondeur, couleurMur);
          brique1.dessiner(); // Dessine la première brique

          // Position de la deuxième brique de la ligne (autre moitié)
          x = (murLargueur - 1) * briqueLargueur + briqueLargueur / 4;
          Brique brique2 = new Brique(x, y, z, briqueLargueur / 2, briqueHauteur, briqueProfondeur, couleurMur);
          brique2.dessiner(); // Dessine la deuxième brique
        } else {
          // Si ce n'est pas la première ligne, dessiner des briques complètes.
          float x = j * briqueLargueur - briqueLargueur / 2;
          float y = i * briqueHauteur;
          float z = 0;
          Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
          brique.dessiner(); // Dessine une brique complète
        }
      } else { // Étages pairs (briques complètes sans décalage)
        float x = j * briqueLargueur;
        float y = i * briqueHauteur;
        float z = 0;
        Brique brique = new Brique(x, y, z, briqueLargueur, briqueHauteur, briqueProfondeur, couleurMur);
        brique.dessiner(); // Dessine une brique complète pour un étage pair
      }
    }
  }
}
}
