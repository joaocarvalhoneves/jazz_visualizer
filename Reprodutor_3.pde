void reprodutor3() {
  if (menu == 3) {
    if (visualizador == 0) {
      background(imgrep33);
      inferior();
      pai[5].lista(36+rep3.size()*17);

      for (int i = 0; i < rep3.size(); i++) {
        rep3.get(i).desenha(28, 15*i);    
        rep3.get(i).apagar(mouseX, mouseY);
      }
      b[11].setA(255);
    } else {
      background(imgvisualizador3);
      
      // reinicialização das variáveis
      TotalBaixo = 0;
      TotalMedio = 0;
      TotalAlto  = 0;
      TotalEsq = 0; 
      TotalDir = 0;
      
      // soma dos valores dos canais em tempo real
      for (int i =  0; i < musica.bufferSize(); i++) {
        TotalEsq+= musica.left.get(i);
        TotalDir+= musica.right.get(i);
      }

     // variável que calculam a média dos canais em tempo real
      MediaEsq = TotalEsq / musica.bufferSize();
      MediaDir = TotalDir / musica.bufferSize();

     // somas da banda na dita zona em tempo real
      for (int i = 0; i < fft.specSize()*RegistoBaixo; i++) {
        TotalBaixo += fft.getBand(i);
      }

      for (int i = (int)(fft.specSize()*RegistoBaixo); i < fft.specSize()*RegistoMedio; i++) {
        TotalMedio += fft.getBand(i);
      }
      for (int i = (int)(fft.specSize()*RegistoMedio); i < fft.specSize()*RegistoAlto; i++) {
        TotalAlto += fft.getBand(i);
      }

      // variáveis que calculam a média da banda na dita zona em tempo real
      float MediaBandaBaixo = TotalBaixo / (fft.specSize()*RegistoBaixo);
      float MediaBandaMedia = TotalMedio / ((fft.specSize()*RegistoMedio) - (fft.specSize()*RegistoBaixo));
      float MediaBandaAlto  = TotalAlto  / ((fft.specSize()*RegistoAlto) - (fft.specSize()*RegistoMedio));

     // desenhos e alterações ao público
      for (int i = 0; i < pbeat.length; i++) {
        pbeat[i].aumentarbeat(4, 3);
        pbeat[i].chillar();
        pbeat[i].desenha();
        pbeat[i].setC(color(255, 100, 200, 100));
      }

      for (int i = 0; i < pbaixo.length; i++) {
        pbaixo[i].saltar(MediaBandaBaixo);
        pbaixo[i].desenha();
        pbaixo[i].setC(color(0, 0, TotalBaixo, 200));
      }
      for (int i = 0; i < pmedio1.length; i++) {
        pmedio1[i].saltar(MediaBandaMedia);
        pmedio1[i].desenha();
        pmedio1[i].chillar();
        pmedio1[i].setC(color(100+TotalMedio, 100+TotalMedio, 0, 180));
      }
      for (int i = 0; i < pmedio2.length; i++) {
        pmedio2[i].saltar(MediaBandaMedia*2);
        pmedio2[i].desenha();
        pmedio2[i].chillar();
        pmedio2[i].setC(color(100+TotalMedio, 100+TotalMedio, 0, 255));
      }
      for (int i = 0; i < palto.length; i++) {
        palto[i].saltar(MediaBandaAlto*5);
        palto[i].desenha();
        palto[i].chillar();
        palto[i].setC(color(230+TotalAlto, 0, 0, 255));
      }
      for (int i = 0; i < pesq1.length; i++) {
        pesq1[i].aumentarpan(MediaEsq*25, 5, 3);
        pesq1[i].desenha();
        pesq1[i].chillar();
        pesq1[i].setC(color(255, 168, 80, 180));
      }
      for (int i = 0; i < pesq2.length; i++) {
        pesq2[i].aumentarpan(MediaEsq*25, 4, 2);
        pesq2[i].desenha();
        pesq2[i].chillar();
        pesq2[i].setC(color(255, 168, 80, 100));
      }
      for (int i = 0; i < pdir1.length; i++) {
        pdir1[i].aumentarpan(MediaDir*25, 5, 3);
        pdir1[i].desenha();
        pdir1[i].chillar();
        pdir1[i].setC(color(88, 255, 172, 180));
      }
      for (int i = 0; i < pdir2.length; i++) {
        pdir2[i].aumentarpan(MediaDir*25, 4, 2);
        pdir2[i].desenha();
        pdir2[i].chillar();
        pdir2[i].setC(color(88, 255, 172, 100));
      }

      b[11].desenha();
      b[11].setA(150);
    }
  }
}
