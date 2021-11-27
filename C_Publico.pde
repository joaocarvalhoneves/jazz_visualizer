class Publico {
  float x;  // coordenada x da cabeça de uma pessoa
  float y;  // coordenada y da cabeça de uma pessoa
  float x1; // coordenada x inicial da cabeça do público
  float y1; // coordenada y inicial da cabeça do público
  float r;  // raio da cabeça de uma pessoa
  color c;  // cor do corpo de uma pessoa

  Publico(float x, float y, float r) {
    this.r = r;
    this.x = x;
    this.y = y;
    this.x1 = x;
    this.y1 = y;
  }

  void desenha() {
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(x, y + (4/3)*r, r, 2.5*r);
    fill(255);
    ellipse(x, y, 2*r, 2*r);
  }

  // simula um salto de uma pessoa
  void saltar(float b) {
    boolean topo = false;

    if (abs(y-y1) > 2)
      topo = true;
    if (y == y1)
      topo = false;

    if (topo)
      y+=0.5;
    else y-=b/10;
  }

  // aumenta e diminuie a pessoa (com o beat)
  void aumentarbeat(float max, float min) {
    if (beats.isKick())
      r = max;
    r*= 0.99;
    if (r < min)
      r = min;
  }

  // aumenta e diminuie a pessoa (com os canais)
  void aumentarpan(float mais, float max, float min) {
    r+= mais;
    if ( r > max)
      r = max;
    if (r < min)
      r = min;
  }

  // simula pequeno movimento
  void chillar() {
    if (dist(x, y, x1, y1) < 1.5) {
      x = lerp(x, x+random(-2, 2), 0.05);
      y = lerp(y, y+random(-2, 2), 0.05);
    } else {
      x = x1;
      y = y1;
    }
  }

  // permite alterar a cor do corpo
  void setC(color c) {
    this.c = c;
  }

  // devolve o valor de x da cabeça
  float getX() {
    return x;
  }

  // devolve o valor de y da cabeça
  float getY() {
    return y;
  }

  // devolve o raio da cabeça
  float getR() {
    return r;
  }
}
