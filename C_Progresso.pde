class Progresso extends Barra {

  Progresso(float _x, float _y) {
    super(_x, _y);
    ltotal = 800-(2*x);
  }

  void desenha() {
    rectMode(CORNER);
    noStroke();
    fill(200);
    rect(x, y, map(musica.position(), 0, musica.length(), 0, ltotal), a, 3); // proporção para a realidade
    noFill();
    strokeWeight(2);
    stroke(255);
    rect(x, y, ltotal, a, 3); // contorno;
  }

  // permite escolher o ponto de reprodução da música
  void arrasta (float b) {
    musica.cue(int(map(b, x, width-x, 0, musica.length())));
    video.jump(int(map(b, x, width-x, 0, video.duration())));
    fill(255);
    if (b > width-x)
      b = width - x;
    if (b < x)
      b = x;
    ellipse(b, y+3, 13, 13);
  }

  // verifica se há colisão com a barra de progresso
  boolean hit(float b, float c) {
    if (c > y && c < y+a && b > x && b < width-x)
      return true;
    else return false;
  }
}
