class Painel {
  float x;         // coordenada x do painel
  float y1 = 700;  // coordenada y do painel do primeiro desenho 
  float y2 = 10;   // coordenada y do painel do segundo desenho
  float l;         // comprimento do painel
  float a;         // altura do painel
  float v;         // velocidade da animação do painel

  Painel(float x, float l, float a, float v) {
    this.x = x;
    this.l = l;
    this.a = a;
    this.v = v;
  }

  // desenhos do painel para o menu
  void desenha(color c, float yfinal) {
    rectMode(CENTER);
    noStroke();
    fill(c);
    y1 = lerp(y1, yfinal, v);
    rect(x, y1, l, a, 10);
  }

  // desenho do painel para os reprodutores
  void lista(float afinal) {
    rectMode(CORNER);
    noStroke();
    fill(80, 150);
    a = lerp(a, afinal, v);
    rect(x, y2, l, a, 10);
  }

  // permite esconder o painel
  void esconder(color c) {
    rectMode(CENTER);
    y1 = lerp(y1, 700, v);
    fill(c);
    rect(x, y1, l, a, 10);
  }

  // permite mudar a altura do painel
  void setA(float b) {
    a = b;
  }

  // devolve o valor do y do primeiro desenho
  float getY1() {
    return y1;
  }
  
  // devolve a coordenada y inferior do segundo desenho
  float getY2(){
    return y2+a;
  }
}
