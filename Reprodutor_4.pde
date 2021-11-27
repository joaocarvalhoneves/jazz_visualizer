void reprodutor4() {
  if (menu == 4) {
    if (visualizador == 0) {
      background(imgrep44);
      inferior();
      pai[6].lista(36+rep4.size()*17);

      for (int i = 0; i < rep4.size(); i++) {
        rep4.get(i).desenha(28, 15*i);
        rep4.get(i).apagar(mouseX, mouseY);
      }
      b[11].setA(255);
    } else {
      b[11].desenha();
      b[11].setA(150);
      noTint();
      image(imgvisualizador4, width/2, height/2);
      l.desenha();
      image(imgvisualizador444, width/2, height/2);
      if (musica.mix.level()>0.06)
        filter(BLUR, map(musica.mix.level(), 0, 0.4, 0, 3));
      if (beats.isKick() || beats.isSnare() || beats.isHat()) {
        luz = true;
        if (beats.isKick()) {
          tint(255, 255, 255, 150);
        }
        if (beats.isSnare()) {
          tint(240, 199, 87, 150);
        }
        if (beats.isHat()) {
          tint(255, 159, 80, 150);
        }
      } else {
        luz = false;
      }

      for (int i=0; i<n.length; i++) {
        n[i].desenha(imgvisualizador4.get(int(n[i].pos.x), int(n[i].pos.y)), map(musica.mix.level(), 0, 1, 40, 110));
        if (musica.mix.level()>0.06) {
          n[i].alterna(true);
        } else n[i].alterna(false);
      }
      if (luz) {
        image(imgvisualizador44, width/2, height/2);
      }
    }
  }
}
