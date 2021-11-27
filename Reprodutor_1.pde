// reprodutor e visualizador 1
void reprodutor1() {
  if (menu == 1) {
    if (visualizador == 0) {
      background(imgrep11);
      inferior();
      pai[3].lista(36+rep1.size()*17);

      for (int i = 0; i < rep1.size(); i++) {
        rep1.get(i).desenha(28, 15*i);
        rep1.get(i).apagar(mouseX, mouseY);
      }

      b[11].setA(255);
    } else {
      background(150);

      // imagens do vídeo a serem apresentadas em quadrados no fundo
      tint(255, 255, 255, 120);
      imageMode(CORNER);
      image(video, 0, 0);
      filter(INVERT); // inversão das cores da informação até aqui apresentada
      int specSize = int(map(fft.specSize(), 0, 513, 0, 400));
      for (int i = 0; i < specSize; i++) {
        freq = int(fft.getBand(i)*30); // aumentar a frequência

        // apresentação de partes do vídeo consoante a frequência
        copy(video, i+width/2, height/2-freq+10, 45, 45, i+width/2, height/2-freq+10, 45, 45);
        copy(video, specSize-1-i, height/2-freq+10, 45, 45, specSize-1-i, height/2-freq+10, 45, 45);
        copy(video, i+width/2, height/2+freq+10, 45, 45, i+width/2, height/2+freq+10, 45, 45);
        copy(video, specSize-1-i, height/2+freq+10, 45, 45, specSize-1-i, height/2+freq+10, 45, 45);
      }
      b[11].desenha();
      b[11].setA(150);
    }
  }
}
