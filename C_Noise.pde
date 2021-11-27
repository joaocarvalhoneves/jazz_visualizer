class Noise {
  float r;                 // raio de cada círculo
  PVector pos, vel;        // vetores que controlam o movimento de cada circulo
  color c;                 // cor de cada círculo
  boolean desenha = false; // true o círculo é desenhado

  Noise(float vx, float vy) {
    r=random(10, 30);
    pos= new PVector(random(r, width-r), random(r, height-r));
    vel= new PVector(vx, vy);
  }
  
  void desenha(color _c, float t) {
    if (desenha) {
      fill(_c, t);
      ellipse(pos.x, pos.y, 2*r, 2*r);
    }
    pos.add(vel);
    if (pos.x>=width-r || pos.x<=r)
      vel.x*=-1;
    if (pos.y>=height-r || pos.y<=r)
      vel.y*=-1;
  }
  
  // permite alternar entre desenhar e não desenhar
  void alterna(boolean t) {
    desenha=t;
  }
}
