class Botao {
  float x;        // coordenada x do centro do botão
  float y;        // coordenada y do centro do botão
  float r;        // raio botão
  float s;        // cor do botão
  float a = 255;  // transparência do botão
  float ang = 0;  // ângulo para rotação na função mouseover
  boolean cheio;  // true o bolão é desenhado opaco

  Botao (float x, float y, float r, float s, boolean cheio) {
    this.x     = x;
    this.y     = y;
    this.r     = r;
    this.s     = s;
    this.cheio = cheio;
  }

  void desenha() {
    if (cheio)
      fill(s, a);
    else {
      noFill();
      strokeWeight(2);
      stroke(s);
    }
    ellipse(x, y, 2*r, 2*r);
  }

  // simula o fade in do botão
  void aparecer() {
    if (s < 255)
      s+= 1;
  }

  // simula o fade out do botão
  void desaparecer() {
    s = 80;
    y = 600;
  }

  // permite alterar a altura da barra
  void setA(float b) {
    a = b;
  }

  // permite alterar as coordenadas y
  void setY(float a) {
    y = a;
  }

  // permite adicionar um pequeno detalhe de preenchimento do botão
  void mouseover() {
    fill(80);
    pushMatrix();
    translate(x, y);
    rotate(ang);
    rectMode(CENTER);
    rect(0,0,6,6);
    ang+=0.05;
    popMatrix();
  }

  // verifica se há colisão com o botão
  boolean hit(float a, float b) {
    if (dist(a, b, x, y) < r)
      return true;
    else return false;
  }

  // devolve a cor do botão
  float getS() {
    return s;
  }
}
