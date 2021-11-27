// rato
void cliques() {

  ////  ALTERAR O VOLUME  ////
  if (menu != 5 && visualizador == 0 && ba.hit(mouseX, mouseY))
    arrastarvolume = true;

  ////  ALTERAR O PROGRESSO DA MÚSICA  ////
  if (menu != 5 && visualizador == 0 && p.hit(mouseX, mouseY)) {
    arrastarmusica = true;
    musica.pause();
    video.pause();
  }

  ////  INTERCALAR ENTRE PLAY E PAUSE  ////
  if (menu != 5 && visualizador == 0 && b[0].hit(mouseX, mouseY))
    tocar = !tocar;

  ////  ABRIR MENU DOS REPRODUTORES  ////
  if (menu != 5 && visualizador == 0 && b[1].hit(mouseX, mouseY)) {
    reprodutor = !reprodutor;
    equalizador = false;
    playlist = false;
  }

  ////  ABRIR EQUALIZADOR  ////
  if (menu != 5 && visualizador == 0 && b[2].hit(mouseX, mouseY)) {
    equalizador = !equalizador;
    reprodutor = false;
    playlist = false;
  }

  ////  REWIND  ////
  if (menu != 5 && visualizador == 0 && b[3].hit(mouseX, mouseY)) {
    musica.rewind();
  }

  /*
  ////  ABRIR PLAYLIST  ////
   if (menu != 5 && visualizador == 0  && b[4].hit(mouseX, mouseY)) {
   playlist = !playlist;
   reprodutor = false;
   equalizador = false;
   }
   */

  ////  DEFINIR PAN  ////
  if (menu != 5 && visualizador == 0  && b[4].hit(mouseX, mouseY)) {
    pan++;
    if (pan>2)
      pan = 0;
  }

  ////  ABRIR REPRODUTOR 1  ////
  if (reprodutor && b[5].hit(mouseX, mouseY)) {
    back[0].desfocar();
    menu = 1;
    reprodutor = false;
    equalizador = false;
    playlist = false;
  }

  ////  ABRIR VISUALIZADOR 1  ////
  boolean a1 = false;
  for (int i = 0; i < rep1.size(); i++) {
    if (rep1.get(i).getS())
      a1 = true;
  }
  if (menu == 1 && b[11].hit(mouseX, mouseY) && a1) {
    if (visualizador == 0)
      visualizador = 1; 
    else visualizador = 0;
  } 

  ////  ABRIR REPRODUTOR 2  ////
  if (reprodutor && b[6].hit(mouseX, mouseY)) {
    back[1].desfocar();
    menu = 2;
    reprodutor = false;
    equalizador = false;
    playlist = false;
  }

  ////  ABRIR VISUALIZADOR 2  ////
  boolean a2 = false;
  for (int i = 0; i < rep2.size(); i++) {
    if (rep2.get(i).getS())
      a2 = true;
  }
  if (menu == 2 && b[11].hit(mouseX, mouseY) && a2) {
    if (visualizador == 0)
      visualizador = 2; 
    else visualizador = 0;
  } 

  ////  ABRIR REPRODUTOR 3  ////
  if (reprodutor && b[7].hit(mouseX, mouseY)) {
    back[2].desfocar();
    menu = 3;
    reprodutor = false;
    equalizador = false;
    playlist = false;
  }

  ////  ABRIR VISUALIZADOR 3  ////
  boolean a3 = false;
  for (int i = 0; i < rep3.size(); i++) {
    if (rep3.get(i).getS())
      a3 = true;
  }
  if (menu == 3 && b[11].hit(mouseX, mouseY) && a3) {
    if (visualizador == 0)
      visualizador = 3; 
    else visualizador = 0;
  } 

  ////  ABRIR REPRODUTOR 4  ////
  if (reprodutor && b[8].hit(mouseX, mouseY)) {
    back[3].desfocar();
    menu = 4;
    reprodutor = false;
    equalizador = false;
    playlist = false;
  }

  ////  ABRIR VISUALIZADOR 4  ////
  boolean a4 = false;
  for (int i = 0; i < rep4.size(); i++) {
    if (rep4.get(i).getS())
      a4 = true;
  }
  if (menu == 4 && b[11].hit(mouseX, mouseY) && a4) {
    if (visualizador == 0)
      visualizador = 4; 
    else visualizador = 0;
  } 

  ////  ADICIONAR MÚSICAS  ////
  if (menu != 5 && visualizador == 0 && b[9].hit(mouseX, mouseY)) {
    selectInput("Select a file to process:", "escolhermusica");
  }

  ////  SELECIONAR A MÚSICA REPRODUTOR 1  ////
  if (menu == 1) {
    for (k1 = 0; k1 < rep1.size(); k1++) {
      if (rep1.get(k1).hit(mouseX, mouseY) && mouseX < 762) {
        String str1 = rep1.get(k1).getD();
        String [] str2 = split(str1, '.');
        String str3 = new String("");
        for (int i = 0; i < str2.length-1; i++) {
          str3+= str2[i];
        }
        tocar = false;
        musica.pause();
        video.pause();
        musica.rewind();
        video.jump(0);
        video =  new Movie(this, str3+".mp4");
        musica = minim.loadFile(str1);
        tocar = true;
        r1 = k1;
        rep1.get(k1).setS(true);
        r2 = -1;
        r3 = -1;
        r4 = -1;
      }
    }
    for (int j = 0; j < rep1.size(); j++) {
      if (j != r1)
        rep1.get(j).setS(false);
    }
  }


  ////  SELECIONAR A MÚSICA REPRODUTOR 2  ////
  if (menu == 2) {
    for (k2 = 0; k2 < rep2.size(); k2++) {
      if (rep2.get(k2).hit(mouseX, mouseY) && mouseX < 762) {
        tocar = false;
        musica.pause();
        musica.rewind();
        musica = minim.loadFile(rep2.get(k2).getD());
        tocar = true;
        r2 = k2;
        rep2.get(k2).setS(true);
        r1 = -1;
        r3 = -1;
        r4 = -1;
      }
    }
    for (int j = 0; j < rep2.size(); j++) {
      if (j != r2)
        rep2.get(j).setS(false);
    }
  }


  ////  SELECIONAR A MÚSICA REPRODUTOR 3  ////
  if (menu == 3) {
    for (k3 = 0; k3 < rep3.size(); k3++) {
      if (rep3.get(k3).hit(mouseX, mouseY) && mouseX < 762) {
        tocar = false;
        musica.pause();
        musica.rewind();
        musica = minim.loadFile(rep3.get(k3).getD());
        tocar = true;
        r3 = k3;
        rep3.get(k3).setS(true);
        r1 = -1;
        r2 = -1;
        r4 = -1;
      }
    }
    for (int j = 0; j < rep3.size(); j++) {
      if (j != r3)
        rep3.get(j).setS(false);
    }
  }


  ////  SELECIONAR A MÚSICA REPRODUTOR 4  ////
  if (menu == 4) {
    for (k4 = 0; k4 < rep4.size(); k4++) {
      if (rep4.get(k4).hit(mouseX, mouseY) && mouseX < 762) {
        tocar = false;
        musica.pause();
        musica.rewind();
        musica = minim.loadFile(rep4.get(k4).getD());
        tocar = true;
        r4 = k4;
        rep4.get(k4).setS(true);  
        r1 = -1;
        r2 = -1;
        r3 = -1;
      }
    }
    for (int j = 0; j < rep4.size(); j++) {
      if (j != r4)
        rep4.get(j).setS(false);
    }
  }


  ////  REMOVER MÚSICAS DO REPRODUTOR 1  ////
  if (menu == 1) {
    for (k1 = 0; k1 < rep1.size(); k1++) {
      if (rep1.get(k1).hit(mouseX, mouseY) && mouseX > 762 && mouseX < 768 && rep1.get(k1).getC() == 255)
        rep1.remove(k1);
    }
  }

  ////  REMOVER MÚSICAS DO REPRODUTOR 2  ////
  if (menu == 2) {
    for (k2 = 0; k2 < rep2.size(); k2++) {
      if (rep2.get(k2).hit(mouseX, mouseY) && mouseX > 762 && mouseX < 768 && rep2.get(k2).getC() == 255)
        rep2.remove(k2);
    }
  }

  ////  REMOVER MÚSICAS DO REPRODUTOR 3  ////
  if (menu == 3) {
    for (k3 = 0; k3 < rep3.size(); k3++) {
      if (rep3.get(k3).hit(mouseX, mouseY) && mouseX > 762 && mouseX < 768 && rep3.get(k3).getC() == 255)
        rep3.remove(k3);
    }
  }

  ////  REMOVER MÚSICAS DO REPRODUTOR 4  ////
  if (menu == 4) {
    for (k4 = 0; k4 < rep4.size(); k4++) {
      if (rep4.get(k4).hit(mouseX, mouseY) && mouseX > 762 && mouseX < 768 && rep4.get(k4).getC() == 255)
        rep4.remove(k4);
    }
  }

  ////  SHUFFLE  ////
  if (b[10].hit(mouseX, mouseY)) {

    ////  REPRODUTOR 1  ////
    if (menu == 1) {
      if (rep1.size() > 0) {
        int random = int(random(0, rep1.size()));
        String str1 = rep1.get(random).getD();
        String [] str2 = split(str1, '.');
        String str3 = new String("");
        for (int i = 0; i < str2.length-1; i++) {
          str3+= str2[i];
        }
        tocar = false;
        musica.pause();
        video.pause();
        musica.rewind();
        video.jump(0);
        video =  new Movie(this, str3+".mp4");
        musica = minim.loadFile(str1);
        tocar = true;
        r1 = random;
        rep1.get(random).setS(true);
        r2 = -1;
        r3 = -1;
        r4 = -1;
      } 
      for (int j = 0; j < rep1.size(); j++) {
        if (j != r1)
          rep1.get(j).setS(false);
      }
    }

    ////  REPRODUTOR 2 ////
    if (menu == 2) {
      if (rep2.size() > 0) {
        int random = int(random(0, rep2.size()));
        String str1 = rep2.get(random).getD();
        String [] str2 = split(str1, '.');
        String str3 = new String("");
        for (int i = 0; i < str2.length-1; i++) {
          str3+= str2[i];
        }
        tocar = false;
        musica.pause();
        musica.rewind();
        musica = minim.loadFile(str1);
        tocar = true;
        r2 = random;
        rep2.get(random).setS(true);
        r1 = -1;
        r3 = -1;
        r4 = -1;
      } 
      for (int j = 0; j < rep2.size(); j++) {
        if (j != r2)
          rep2.get(j).setS(false);
      }
    }

    ////  REPRODUTOR 3 ////
    if (menu == 3) {
      if (rep3.size() > 0) {
        int random = int(random(0, rep3.size()));
        String str1 = rep3.get(random).getD();
        String [] str2 = split(str1, '.');
        String str3 = new String("");
        for (int i = 0; i < str2.length-1; i++) {
          str3+= str2[i];
        }
        tocar = false;
        musica.pause();
        musica.rewind();
        musica = minim.loadFile(str1);
        tocar = true;
        r3 = random;
        rep3.get(random).setS(true);
        r1 = -1;
        r2 = -1;
        r4 = -1;
      } 
      for (int j = 0; j < rep3.size(); j++) {
        if (j != r3)
          rep3.get(j).setS(false);
      }
    }
    ////  REPRODUTOR 4 ////
    if (menu == 4) {
      if (rep4.size() > 0) {
        int random = int(random(0, rep4.size()));
        String str1 = rep4.get(random).getD();
        String [] str2 = split(str1, '.');
        String str3 = new String("");
        for (int i = 0; i < str2.length-1; i++) {
          str3+= str2[i];
        }
        tocar = false;
        musica.pause();
        musica.rewind();
        musica = minim.loadFile(str1);
        tocar = true;
        r4 = random;
        rep4.get(random).setS(true);
        r1 = -1;
        r2 = -1;
        r3 = -1;
      } 
      for (int j = 0; j < rep4.size(); j++) {
        if (j != r4)
          rep4.get(j).setS(false);
      }
    }
  }

  ////  ORGANIZAR ALFABETICAMENTE  ////
  if (visualizador == 0) {

    if (t[7].hit(mouseX, mouseY) || t[8].hit(mouseX, mouseY) || t[9].hit(mouseX, mouseY)) {
      if (r1!=-1)
        nome1 = rep1.get(r1).getN();
      if (r2!=-1)
        nome2 = rep2.get(r2).getN();
      if (r3!=-1)
        nome3 = rep3.get(r3).getN();
      if (r4!=-1)
        nome4 = rep4.get(r4).getN();
    }

    ////  MÚSICAS  ////
    if (t[7].hit(mouseX, mouseY)) {

      if (menu == 1)
        Collections.sort(rep1, new OrdenaNome());
      if (menu == 2)
        Collections.sort(rep2, new OrdenaNome());
      if (menu == 3)
        Collections.sort(rep3, new OrdenaNome());
      if (menu == 4)
        Collections.sort(rep4, new OrdenaNome());
      guardar();
    }

    ////  ARTISTA  ////
    if (t[8].hit(mouseX, mouseY)) {
      if (menu == 1)
        Collections.sort(rep1, new OrdenaArtista());
      if (menu == 2)
        Collections.sort(rep2, new OrdenaArtista());
      if (menu == 3)
        Collections.sort(rep3, new OrdenaArtista());
      if (menu == 4)
        Collections.sort(rep4, new OrdenaArtista());
      guardar();
    }

    ////  ÁLBUM  ////
    if (t[9].hit(mouseX, mouseY)) {
      if (menu == 1)
        Collections.sort(rep1, new OrdenaAlbum());
      if (menu == 2)
        Collections.sort(rep2, new OrdenaAlbum());
      if (menu == 3)
        Collections.sort(rep3, new OrdenaAlbum());
      if (menu == 4)
        Collections.sort(rep4, new OrdenaAlbum());
      guardar();
    }

///  INDICA AO PROGRAMA QUAL ERA A MÚSICA QUE ESTAVA A REPRODUZIR ANTES DA ORDENAÇÃO  ////
    if (t[7].hit(mouseX, mouseY) || t[8].hit(mouseX, mouseY) || t[9].hit(mouseX, mouseY)) {
      for (int i = 0; i < rep1.size(); i++) {
        if (rep1.get(i).getN().equals(nome1))
          r1 = i;
      }
      for (int i = 0; i < rep2.size(); i++) {
        if (rep2.get(i).getN().equals(nome2))
          r2 = i;
      }
      for (int i = 0; i < rep3.size(); i++) {
        if (rep3.get(i).getN().equals(nome3))
          r3 = i;
      }
      for (int i = 0; i < rep4.size(); i++) {
        if (rep4.get(i).getN().equals(nome4))
          r4 = i;
      }
    }
  }
}
