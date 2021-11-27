void reprodutor2() {
  if (menu == 2) {
    if (visualizador == 0) {
      background(imgrep22);
      inferior();
      pai[4].lista(36+rep2.size()*17);

      for (int i = 0; i < rep2.size(); i++) {
        rep2.get(i).desenha(28, 15*i);
        rep2.get(i).apagar(mouseX, mouseY);
      }
      b[11].setA(255);
    } else {
      background(imgvisualizador2);

      TotalBaixo = 0;
      TotalMedio = 0;
      TotalAlto  = 0;

      for (int i = 0; i < fft.specSize()*RegistoBaixo; i++) {
        TotalBaixo += fft.getBand(i);
      }

      for (int i = (int)(fft.specSize()*RegistoBaixo); i < fft.specSize()*RegistoMedio; i++) {
        TotalMedio += fft.getBand(i);
      }
      for (int i = (int)(fft.specSize()*RegistoMedio); i < fft.specSize()*RegistoAlto; i++) {
        TotalAlto += fft.getBand(i);
      }
      stroke(100+TotalBaixo, 50+TotalMedio, 0);

      int MediaBandaBaixo = (int)(fft.specSize()*RegistoBaixo) / 2;
      int MediaBandaMedio = (int)(((fft.specSize()*RegistoMedio-fft.specSize()*RegistoBaixo) / 2) + fft.specSize()*RegistoBaixo);
      int MediaBandaAlto  = (int)(((fft.specSize()*RegistoAlto-fft.specSize()*RegistoMedio) / 2) + fft.specSize()*RegistoMedio);
      int MediaBandaSup   = (int)(((fft.specSize()-fft.specSize()*RegistoAlto) / 2) + fft.specSize()*RegistoAlto);

      noFill();
      for (int i = 0; i < fft.specSize()*RegistoBaixo; i++) {
        strokeWeight(1 + fft.getBand(MediaBandaBaixo) / 5);
        bezier(247 - fft.getBand(i)/15, height, 263, 285, 300, 120, 310 - fft.getBand(i)/15, 0);
        bezier(247 + fft.getBand(i)/15, height, 263, 285, 300, 120, 310 + fft.getBand(i)/15, 0);
      }

      for (int i = (int)(fft.specSize()*RegistoBaixo); i < fft.specSize()*RegistoMedio; i++) {
        strokeWeight(2 + fft.getBand(MediaBandaMedio) / 5);
        bezier(288 - fft.getBand(i)/15, height, 294, 308, 312, 185, 326 - fft.getBand(i)/15, 0);
        bezier(288 + fft.getBand(i)/15, height, 294, 308, 312, 185, 326 + fft.getBand(i)/15, 0);
      }

      for (int i = (int)(fft.specSize()*RegistoMedio); i < fft.specSize()*RegistoAlto; i++) {
        strokeWeight(3 + fft.getBand(MediaBandaAlto) / 5);
        bezier(341 - fft.getBand(i)/15, height, 330, 315, 337, 55, 341 - fft.getBand(i)/15, 0);
        bezier(341 + fft.getBand(i)/15, height, 330, 315, 337, 55, 341 + fft.getBand(i)/15, 0);
      }

      for (int i = (int)(fft.specSize()*RegistoAlto); i < fft.specSize(); i++) {
        strokeWeight(3 + fft.getBand(MediaBandaSup) / 5);
        bezier(388 - fft.getBand(i)/15, height, 367, 301, 360, 140, 356 - fft.getBand(i)/15, 0);
        bezier(388 + fft.getBand(i)/15, height, 367, 301, 360, 140, 356 + fft.getBand(i)/15, 0);
      }
      noStroke();
      noTint();
      image(imgvisualizador22, width/2, height/2);
      b[11].desenha();
      b[11].setA(150);
    }
  }
}
