QueasyCam camera;  // Déclare une variable "camera" de type QueasyCam, utilisée pour contrôler la caméra dans la scène 3D.
int decal = 0;  // Cette variable pourrait est utilisée pour gérer des décalages ou des déplacements.
PVector cameraPosition;  //  Cette variable est  utilisée pour stocker la position de la caméra dans l'espace 3D.

// Paramètres pour la taille des briques dans la scène
float briqueLargeurInitiale = 100;  //  Déclarer la largeur d'une brique 
float briqueHuateurInitiale = 50;  //  Déclarer la hauteur d'une brique 

float briqueProfondeurInitiale = 50; //épaisseur de la brique

int murLargeurInitiale = 10;       // Largeur du mur en briques
int murHauteurInitiale = 30;      // Hauteur du mur en briques
int dividende_meurtriere = murHauteurInitiale / 6;
int nb_Meurtriere = 3; 
// Déclaration des variables globales
float angle = 0; // Angle initial de rotation pour la porte principale (utilisé pour l'animation de la porte)
String statuPorte = "c"; // État de la porte : "c" pour "close" (fermée) et "o" pour "open" (ouverte)

PImage sol; // Déclaration de l'image du sol
Chateau c; // Déclaration d'un objet de type "Chateau" 

void setup() {
  size(800, 800, P3D); // Initialisation de la fenêtre de rendu 3D de taille 800x800 pixels
  smooth(5); // Lissage de la qualité de l'affichage pour de meilleures performances visuelles
  
  // Réglage de la caméra 3D via la bibliothèque QueasyCam
  camera = new QueasyCam(this); // Crée un objet "camera" pour gérer la vue de la caméra
  camera.position.x = 2500; // Positionne la caméra sur l'axe X à 2500 unités
  camera.position.y = 500;  // Positionne la caméra sur l'axe Y à 500 unités
  camera.position.z = 2000; // Positionne la caméra sur l'axe Z à 2000 unités
  
  // Chargement et redimensionnement de l'image du sol
  sol = loadImage("sol1.jpg"); // Charge l'image du sol depuis le fichier "sol1.jpg"
  sol.resize(500, 500); // Redimensionne l'image du sol à 500x500 pixels
  
  // Initialisation de l'objet "Chateau" avec des paramètres pour la taille des briques et des murs
  c = new Chateau(murLargeurInitiale, murHauteurInitiale, briqueLargeurInitiale, briqueHuateurInitiale, briqueProfondeurInitiale);
}

void draw() {
  background(135, 206, 235); // Dessine un fond de couleur bleu clair (ciel) à chaque frame
  
                    // Paramètres pour dessiner le sol en répétition
                    // Pour voir le sous-sol du château, utilisez la souris pour déplacer la caméra.
                    // Appuyez sur la touche "f" pour descendre . 
                    //Pour monter sur la touche "r"( image "castle\images des execution\plans-sous_sol.png"). 
                    // Le sol est placé très loin en utilisant une transformation 3D pour simuler le sol sous la scène
  
  
  pushMatrix(); // Sauvegarde l'état actuel de la transformation
  rotateX(-HALF_PI); // Applique une rotation sur l'axe X pour que le sol soit orienté correctement vers la caméra
  translate(0, 0, 1450); // Déplace l'ensemble du sol à une distance de 1450 unités sur l'axe Z (loin de la caméra)
  
  // Utilisation de deux boucles "for" pour répéter l'image du sol et couvrir toute la scène
  // Les boucles parcourent l'espace en X et Y et placent plusieurs images du sol en fonction de la taille de l'écran
  for (int x = -(width * murLargeurInitiale)/4; x < width * murLargeurInitiale; x += sol.width) {
    for (int y = -(width * murLargeurInitiale)/4; y < height * murLargeurInitiale; y += sol.height) {
      image(sol, x, y); // Place l'image du sol à la position donnée (x, y) sur l'écran
    }
  }
  
  popMatrix(); // Restaure l'état des transformations précédentes
  
  // Dessin de l'objet "Chateau" dans la scène
  c.dessiner(); // Appelle la méthode "dessiner" de l'objet "Chateau" pour afficher le château à l'écran
}

                // Fonction pour gérer les actions du clavier:
                //Ouverture de la porte(image "castle\images des execution\porte_ouverte.png").
                 //Fermeture de la porte("castle\images des execution\porte_fermé.png").
void keyPressed() {
  // Si la touche 'o' est pressée et que la porte est fermée ("c"), on l'ouvre
  if (key == 'o' && statuPorte == "c") { 
    angle += PI / 2; // Augmente l'angle de rotation de 90° (PI/2 radians)
    statuPorte = "o"; // Change l'état de la porte à "open" (ouverte)
  }
  
  // Si la touche 'c' est pressée et que la porte est ouverte ("o"), on la ferme
  if (key == 'c' && statuPorte == "o") {
    angle = 0; // Réinitialise l'angle de rotation à 0° pour fermer la porte
    statuPorte = "c"; // Change l'état de la porte à "close" (fermée)
  }
}
