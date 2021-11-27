class Liquido {
  float xa1, ya1, xa2, ya2; // coordenada dos pontos âncora
  float xc1, yc1, xc2, yc2; // coordenada dos pontos de controlo
  float x1, y1, x2, y2;     // coordenadas de referência laterais
  float x3, y3, x4;         // coordenadas de referência do topo
  float y4;                 // coordenada de referência de baixo
  float vel=0.1;            // velocidade da movimentação

  Liquido() {
    //âncoras
    xa1=527; ya1=410;
    xa2=616; ya2=410;
    
    // lados referência
    x1=533; y1=327;
    x2=612; y2=466;
    
    // meio referência
    x3=566.5;
    x4=576.5;
    
    y3=385; //topo
    y4=420; //repouso

    //controlo inicialmente (em repouso)
    xc1=x3;
    yc1=y4;
    xc2=x4;
    yc2=y4;

  }
  
// permite a ondulação do líquido dentro do copo
  void mover(float ay1, float ay2, float cx1, float cy1, float cx2, float cy2, float lado, float veloc) {
    ya1=lerp(ya1, ay1, 0.1);
    ya2=lerp(ya2, ay2, 0.1);
    xc1=lerp(xc1, cx1, map(lado, -1, 1, 0, veloc));
    yc1=lerp(yc1, cy1, map(lado, -1, 1, 0, veloc));
    xc2=lerp(xc2, cx2, map(lado, -1, 1, 0, veloc));
    yc2=lerp(yc2, cy2, map(lado, -1, 1, 0, veloc));
  }

  void desenha() {
    noTint();
    noStroke();
    fill(#EDB441, 100);
    beginShape();
    vertex(xa1, ya1);
    bezierVertex(xc1, yc1, xc2, yc2, xa2, ya2);
    vertex(xa2, ya2);
    vertex(612, 455);
    quadraticVertex(571, 466, 531, 455);
    endShape(CLOSE);
    if (musica.left.get(1)==0 && musica.right.get(1)==0) {
      mover(410, 410, x3, y4, x4, y4, musica.right.get(1), vel*2);
    } else if ((musica.left.get(1)>=0.6 && musica.right.get(1)>=0.6) || (musica.left.get(1)==musica.right.get(1))) {
      mover(410, 410, x3, y3, x4, y3, musica.right.get(1), vel*2);
    } else if (musica.left.get(1)>musica.right.get(1)) {
      mover(400, 410, x1, y1, x2, y2, musica.left.get(1), vel);
    } else if (musica.left.get(1)<musica.right.get(1)) {
      mover(410, 400, x2, y2, x1, y1, musica.right.get(1), vel);
    }
  }
}
