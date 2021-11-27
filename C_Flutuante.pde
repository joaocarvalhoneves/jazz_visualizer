class Flutuante {
  PImage inicio;          // imagem com a letra 
  float x;                // coordenada x do centro da imagem
  float y;                // coordenada y do centro da imagem
  float vx;               // velocidade da imagem em x
  float vy;               // velocidade da imagem em y
  boolean parado = true;  // true a imagem está imóvel


  Flutuante(PImage inicio, float x, float y) {
    this.inicio = inicio;
    this.x      = x;
    this.y      = y;
  }

  void desenha(float _vx, float _vy) {
    float o = dist(width/2, height/2, x, y);
    tint(255, map(o, 0, max(x, y), 255, 1));
    vx = _vx;
    vy = _vy;
    if (vx < 0.02)
      parado = true;
    else parado = false;
    if (parado) {
      vx = 0;
      vy = 0;
    } else {
      x = lerp(x, width/2, map(vx, 0, 1, 0, 0.8));
      y = lerp(y, height/2, map(vy, 0, 1, 0, 0.8));
    }
    imageMode(CENTER);
    image(inicio, x, y);
  }

  // devolve a distancia em proporção à cor
  float distancia() {
    return map(dist(width/2, height/2, x, y), 0, 50, 0, 255);
  }

  // devolve o valor de x da imagem
  float getX() {
    return x;
  }
}
