class Background {
  float mr = 0;            // média da cor vermelha
  float mg = 0;            // média da cor verde
  float mb = 0;            // média da cor azul
  float tr = 0;            // total da cor vermelha
  float tg = 0;            // total da cor verde
  float tb = 0;            // total da cor azul
  int p    = 0;            // contador 
  int a    = 8;            // variáveis da animação
  PImage imgfundo, fundo;  // imagens

  Background(PImage imgfundo, PImage fundo) {
    this.imgfundo = imgfundo;
    this.fundo    = fundo;
  }

  void desenha() {
    imageMode(CENTER);
    image(fundo, width/2, height/2);
    // a+=passo;
    // if (a>=10 || a <=0)
    //   passo*=-1;
  }

  void desfocar() {
    for (int x = 0; x < imgfundo.width; x++ ) {
      for (int y = 0; y < imgfundo.height; y++ ) {
        p  = 0;
        tr = 0;
        tg = 0;
        tb = 0;
        for (int i = x-a; i <= x+a; i++) {
          for (int j = y-a; j <= y+a; j++) {
            if (i > 0 && j > 0 && i < imgfundo.width && j < imgfundo.height) {
              color c = imgfundo.get(i, j);
              float r = red(c);
              float g = green(c);
              float b = blue(c);
              tr+= r;
              tg+= g;
              tb+= b;
              p++;
            }
          }
          mr = tr/p;
          mg = tg/p;
          mb = tb/p;
          fundo.set(x, y, color(mr, mg, mb));
        }
      }
    }
    imgfundo.updatePixels();
  }
}
