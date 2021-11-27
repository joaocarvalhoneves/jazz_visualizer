class Titulo {
  String str;       // texto
  float x;          // coordenada x do título
  float y;          // coordenada y do título
  float s;          // tamanho do texto
  color c;          // cor do texto
  boolean centrado; // true é desenhado centrado

  Titulo(float x, float y, float s, color c, boolean centrado, String str) {
    this.x        = x;
    this.y        = y;
    this.s        = s;
    this.c        = c;
    this.centrado = centrado;
    this.str      = str;
  }

  Titulo(float _x, float _y, String _str) {
    x   = _x;
    y   = _y;
    str = _str;
  }

  // desenho do título
  void desenha() {
    if (centrado)
      textAlign(CENTER, CENTER);
    else textAlign(CORNER, CENTER);
    textSize(s);
    fill(c);
    text(str, x, y);

  }

  // desenhos do título em formato de lista
  void desenhalista() {
    textAlign(CORNER, CENTER);
    textSize(18);
    fill(255);
    text(str, x, y);
  }

  // verifica se há colisão com o título
  boolean hit(float a, float b) {
    if (a > x && a < x+80 && b > y-10 && b < y+10)
      return true;
    else return false;
  }

  // permite alterar as coordenadas y
  void setY(float a) {
    y = a;
  }

  // permite alterar a cor do texto
  void setC(color a) {
    c = a;
  }

  // fade in do texto
  void desaparecer() {
    c = 80;
    y = 600;
  }

  // fade out do texto
  void aparecer() {
    if (c < 255)
      c+=1;
  }
}
