// criações no inicializar
void criacao() {
  //  p2d = createGraphics(width, height, P2D);
  //  j2d = createGraphics(width, height, JAVA2D);

  surface.setTitle("Reprodutor de Jazz");
  minim  = new Minim(this);
  in     = minim.getLineIn();
  musica = minim.loadFile("arranque.mp3");
  video  = new Movie(this, "arranque.mp4");
  fft    = new FFT(musica.bufferSize(), musica.sampleRate());
  beats  = new BeatDetect(musica.bufferSize(), musica.sampleRate());
  drop   = new SDrop(this);

  textFont(createFont("fonte.otf", 100));

  imgvisualizador2   = loadImage  ("Imagens/visualizador2.png");
  imgvisualizador22  = loadImage  ("Imagens/visualizador22.png");
  imgvisualizador3   = loadImage  ("Imagens/visualizador3.png");
  imgvisualizador4   = loadImage  ("Imagens/visualizador4.png");
  imgvisualizador44  = loadImage  ("Imagens/visualizador44.png");
  imgvisualizador444 = loadImage  ("Imagens/visualizador444.png");
  megafone           = loadImage  ("Imagens/megafone.png");
  volumezero         = loadImage  ("Imagens/volumezero.png");
  imginiciar         = loadImage  ("Imagens/iniciar.png");
  imgmenu            = loadImage  ("Imagens/menu.png");
  imgrep1            = loadImage  ("Imagens/rep1.png");
  imgrep11           = createImage(imgrep1.width, imgrep1.height, ARGB);
  imgrep2            = loadImage  ("Imagens/rep2.png");
  imgrep22           = createImage(imgrep2.width, imgrep2.height, ARGB);
  imgrep3            = loadImage  ("Imagens/rep3.png");
  imgrep33           = createImage(imgrep3.width, imgrep3.height, ARGB);
  imgrep4            = loadImage  ("Imagens/rep4.png");
  imgrep44           = createImage(imgrep4.width, imgrep4.height, ARGB);

  beat   = loadStrings("beat.txt");
  baixo  = loadStrings("baixo.txt");
  medio1 = loadStrings("medio1.txt");
  medio2 = loadStrings("medio2.txt");
  alto   = loadStrings("alto.txt");
  esq1   = loadStrings("esq1.txt");
  esq2   = loadStrings("esq2.txt");
  dir1   = loadStrings("dir1.txt");
  dir2   = loadStrings("dir2.txt");

  // criação dos backgrounds para reprodutores
  back[0] = new Background(imgrep1, imgrep11);
  back[1] = new Background(imgrep2, imgrep22);
  back[2] = new Background(imgrep3, imgrep33);
  back[3] = new Background(imgrep4, imgrep44);

  // criação das imagens com as letras para o menu iniciar
  for (int i = 0; i < 8; i++) {
    inicio[i] = loadImage("Imagens/i"+i+".png");
    float x   = random(50, width-50);
    float y   = random(50, height-50);
    f[i]      = new Flutuante(inicio[i], x, y);
  }

  // criação dos painéis
  for (int i = 0; i < 3; i++) {
    pai[i] = new Painel(width/2, 170, 250, 0.05);
  }
  for (int i = 3; i < 7; i++) {
    pai[i] = new Painel(15, width-30, 30, 0.05);
  }

  // criação dos títulos
  t[0]  = new Titulo(width/2, pai[0].getY1(), 17, color(255), true, "Reprodutores");
  t[1]  = new Titulo(width/2 - 37, pai[0].getY1(), 13, color(255), false, "Bebop & Hardbop");
  t[2]  = new Titulo(width/2 - 37, pai[0].getY1(), 13, color(255), false, "Swing");
  t[3]  = new Titulo(width/2 - 37, pai[0].getY1(), 13, color(255), false, "Moderno");
  t[4]  = new Titulo(width/2 - 37, pai[0].getY1(), 13, color(255), false, "Solo");
  t[5]  = new Titulo(width/2, pai[1].getY1(), 17, color(255), true, "Equalizador");
  t[6]  = new Titulo(width/2, pai[2].getY1(), 17, color(255), true, "PlayList");
  t[7]  = new Titulo(28, 25, "Título");
  t[8]  = new Titulo(254, 25, "Artista");
  t[9]  = new Titulo(454, 25, "Álbum");
  t[10] = new Titulo(688, 25, "Duração");

  // criação dos tooltips
  tt[0] = new Tooltip("Tocar / Parar");
  tt[1] = new Tooltip("Reprodutores");
  tt[2] = new Tooltip("Equalizador");
  tt[3] = new Tooltip("Rebobinar");
  tt[4] = new Tooltip("Panorâmica");
  tt[5] = new Tooltip("Adicionar Música");
  tt[6] = new Tooltip("Aleatório");
  tt[7] = new Tooltip("Visualizador");

  // criação dos botões
  b[0]  = new Botao(width/2, 470, 17, 255, false); // tocar / parar
  b[1]  = new Botao(width/2+50, 470, 13, 255, false); // reprodutores
  b[2]  = new Botao(width/2-50, 470, 13, 255, false); // equalizador
  b[3]  = new Botao(width/2-86, 470, 13, 255, false); // rebobinar
  b[4]  = new Botao(width/2+86, 470, 13, 255, false); // playlist
  b[9]  = new Botao(width/2+122, 470, 13, 255, false); // adicionar música
  b[10] = new Botao(width/2-122, 470, 13, 255, false); // aleatório
  b[11] = new Botao(30, 470, 10, 255, true); // visualizador
  for (int i = 5; i < 9; i++) {
    b[i] = new Botao(width/2-55, pai[0].getY1(), 8, 80, true);
  }

  // criação do público no visualizador 3
  pbeat   = new Publico [beat.length];
  pbaixo  = new Publico [baixo.length];
  pmedio1 = new Publico [medio1.length];
  pmedio2 = new Publico [medio2.length];
  palto   = new Publico [alto.length];
  pesq1   = new Publico [esq1.length];
  pesq2   = new Publico [esq2.length];
  pdir1   = new Publico [dir1.length];
  pdir2   = new Publico [dir2.length];

  for (int i = 0; i < beat.length; i++) {
    String k [] = split(beat[i], ",");
    pbeat[i] = new Publico(Integer.parseInt(k[0]), Integer.parseInt(k[1]), 3);
  }

  for (int i = 0; i < baixo.length; i++) {
    String k [] = split(baixo[i], ",");
    pbaixo[i] = new Publico(Integer.parseInt(k[0]), Integer.parseInt(k[1]), 2);
  }

  for (int i = 0; i < medio1.length; i++) {
    String k [] = split(medio1[i], ",");
    pmedio1[i] = new Publico(Integer.parseInt(k[0]), Integer.parseInt(k[1]), 3);
  }

  for (int i = 0; i < pmedio2.length; i++) {
    String k [] = split(medio2[i], ",");
    pmedio2[i] = new Publico(Integer.parseInt(k[0]), Integer.parseInt(k[1]), 2);
  }

  for (int i = 0; i < alto.length; i++) {
    String k [] = split(alto[i], ",");
    palto[i] = new Publico(Integer.parseInt(k[0]), Integer.parseInt(k[1]), 1);
  }

  for (int i = 0; i < esq1.length; i++) {
    String k [] = split(esq1[i], ",");
    pesq1[i] = new Publico(Integer.parseInt(k[0]), Integer.parseInt(k[1]), 4);
  }

  for (int i = 0; i < esq2.length; i++) {
    String k [] = split(esq2[i], ",");
    pesq2[i] = new Publico(Integer.parseInt(k[0]), Integer.parseInt(k[1]), 3);
  }

  for (int i = 0; i < dir1.length; i++) {
    String k [] = split(dir1[i], ",");
    pdir1[i] = new Publico(Integer.parseInt(k[0]), Integer.parseInt(k[1]), 4);
  }

  for (int i = 0; i < dir2.length; i++) {
    String k [] = split(dir2[i], ",");
    pdir2[i] = new Publico(Integer.parseInt(k[0]), Integer.parseInt(k[1]), 3);
  }

  // criação dos círculos no visualizador 4
  for (int i=0; i<n.length; i++) {
    n[i]= new Noise(random(0, 3), random(0, 3));
  }
}

// função para detetar string demasiado comprida
String comprimir(String str, float tamanho) {
  String output = "";
  float acumular = tamanho;
  if (textWidth(str)>tamanho) {
    for (int i = 0; i < acumular; i++) {
      output+= str.charAt(i);
      acumular-=textWidth(str.charAt(i));
    }
  } else output = str;
  return output;
}

// função que transforma uma string comprida em scrolling text
String scrollingtext(String str, int lim, int cont) {
  String rotativa = "";
  if (str.length() < lim) {
    rotativa = str;
  } else {
    if (lim + cont <= str.length()) {
      for (int i = cont; i < lim+cont; i++) {
        rotativa+= str.charAt(i);
      }
    } else { 
      for (int i = cont; i < str.length(); i++) {
        rotativa+= str.charAt(i);
      } 
      rotativa+= " - ";
      for (int i = 0; rotativa.length()<=lim; i++) {
        rotativa+= str.charAt(i);
      }
    }
  }
  return rotativa;
}

// função que converte o tempo de milisegundos para minutos e segundos
String converterTempo(int a) {
  String mmss;
  int minutos = (int) (a/1000)/60;
  int segundos = (int) (a/1000)%60;
  if (segundos < 10)
    mmss = minutos + ":0" + segundos;
  else mmss = minutos + ":" + segundos;
  return mmss;
}
