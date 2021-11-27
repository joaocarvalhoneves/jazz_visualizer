class Tooltip {
  float x;           // coordenada x da tooltip
  float y;           // coordenada y da tooltip
  float l     = 110; // comprimento da tooltip
  float a     = 22;  // altura da tooltip
  float alpha = 0;   // transparência da tooltip
  String str1;       // texto da tooltip

  Tooltip(String str1) {
    this.str1 = str1;
  }

  void desenha(float _x, float _y) {
    x = _x;
    y = _y;
    noStroke();
    rectMode(CENTER);
    fill(180, alpha);
    rect(x+30, y-18, l, a, 4);
    textSize(14);
    textAlign(CENTER, CENTER);
    fill(255, alpha);
    text(str1, x+30, y-20);
  }

  // simula o fade in e out do texto
  void aparecer(boolean a) {
    if (a) {
      if (alpha < 255)
        alpha+= 10;
    } else {
      alpha = 0;
    }
  }
}
