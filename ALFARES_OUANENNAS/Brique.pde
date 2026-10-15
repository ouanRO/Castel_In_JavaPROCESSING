// Classe pour créer une brique, avec ses propriétés et une méthode pour la dessiner.
class Brique {
  float x, y, z;  // Déclaration des coordonnées (x, y, z) qui définissent la position de la brique dans l'espace 3D.
  float largeur, hauteur, profondeur;  // Déclaration des dimensions de la brique .
  color couleurBrique;  

  // Constructeur de la classe Brique
  // Le constructeur initialise les valeurs de position (x, y, z), les dimensions de la brique (largeur, hauteur, profondeur) et sa couleur.
  Brique(float x, float y, float z, float largeur, float hauteur, float profondeur, color couleurBrique) {
    this.x = x;  // Position de la brique sur l'axe X
    this.y = y;  // Position de la brique sur l'axe Y
    this.z = z;  // Position de la brique sur l'axe Z
    this.largeur = largeur;  // Largeur de la brique
    this.hauteur = hauteur;  // Hauteur de la brique
    this.profondeur = profondeur;  // Profondeur (ou épaisseur) de la brique
    this.couleurBrique = couleurBrique;  // Définition de la couleur de la brique
  }

  // Méthode pour dessiner la brique
  void dessiner() {
    fill(couleurBrique);  // Applique la couleur de la brique avant de la dessiner
    pushMatrix();  // Sauvegarde l'état actuel de la matrice de transformation (pour pouvoir la restaurer après)
    translate(x, y, z);  // Déplace le système de coordonnées de la scène pour positionner la brique aux coordonnées (x, y, z)
    box(largeur, hauteur, profondeur);  // Dessine la brique sous forme de boîte 3D avec les dimensions spécifiées
    popMatrix();  // Restaure l'état de la matrice de transformation après avoir dessiné la brique
  }
}
