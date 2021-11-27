// comandos que correm no draw
void geral() {

  scrollingtext();

  beats.detect(musica.mix); // detecção de beats 
  fft.forward(musica.mix);  // fft do canal esquerdo e direito

  // controlar o volume de forma smooth
  if (ba.getCur() > 10) {
    musica.setGain(map(ba.getX() + ba.getCur(), ba.getX(), ba.getX() + ba.getMax(), -30, 6.021));
  } else {
    musica.setGain(map(ba.getX() + ba.getCur(), ba.getX(), ba.getX() + 10, -80, -30));
  }

  if (pan == 0)
    musica.setPan(0);
  if (pan == 1)
    musica.setPan(1);
  if (pan == 2)
    musica.setPan(-1);

  if (!tocar)
    musica.pause();

  // parar a música quando chega ao final
  if (musica.position() == musica.length())
    tocar = false;

  if (menu >= 1 && menu <= 4 && visualizador == 0) {
    for (int i = 7; i < 11; i++) {
      t[i].desenhalista();
    }
  }

  if (tocar && arrastarmusica == false) {
    video.volume(0);
    musica.play();
    video.play();
  } else
    video.pause();
}
