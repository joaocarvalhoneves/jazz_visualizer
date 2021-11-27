class Barra {
  float x;            // coordenada x do canto da barra
  float y;            // coordenada y do canto da barra
  float l      = 35;  // comprimento atual da barra
  float a      = 7;   // altura da barra
  float ltotal = 70;  // comprimento total da barra

  Barra (float x, float y) {
    this.x = x;
    this.y = y;
  }

  void desenha() {
    rectMode(CORNER);
    noStroke();
    fill(200);
    rect(x, y, l, a, 3); // proporção para a realidade
    noFill();
    stroke(255);
    strokeWeight(2);
    rect(x, y, ltotal, a, 3); // contorno;
  }
 
  // verifica se há colisão com a barra
  boolean hit(float b, float c) {
    if (b > x && b < x + ltotal && c > y && c < y+a)
      return true;
    else return false;
  }

  // permite arrastar a barra
  void arrasta(float b) {
    l = b-x;
    if (l < 0)
      l = 0;
    if (l > 70)
      l = 70;
  }

  // devolve o valor de x da barra
  float getX() {
    return x;
  }

  // devolve o valor do comprimento máximo da barra
  float getMax() {
    return ltotal;
  }

  // devolve o valor do comprimento atual da barra
  float getCur() {
    return l;
  }
}
