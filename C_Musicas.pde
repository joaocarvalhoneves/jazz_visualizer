class Musicas {
  float xt;                     // coordenada x do centro da imagem
  float yt;                     // coordenada y do centro da imagem
  int s;                        // coordenada x do centro da imagem
  String nome;                  // nome da música
  String artista;               // artista da música
  String album;                 // album da música
  String albumshort = "";       // album da música (apresentação curta)
  int duracao;                  // duração da música
  String diretorio;             // diretório da música
  color c = 255;                // album da música
  boolean seleccionada = false; // true a música está seleccionada

  Musicas(String diretorio, String nome, String artista, String album, int duracao) {
    this.diretorio = diretorio;
    this.nome      = nome;
    this.artista   = artista;
    this.album     = album;
    this.duracao   = duracao;
  }

  void desenha(float _xt, float _yt) {
    xt = _xt;
    yt = _yt;
    textAlign(CORNER, CENTER);
    textSize(14);
    if (seleccionada)
      c = #E8D823; 
    else c = 255;
    fill(c);
    noStroke();
    text(comprimir(nome, 200), xt, yt+50);     // nome
    text(comprimir(artista, 185), xt+225, yt+50); // artista
    text(comprimir(album, 227), xt+425, yt+50);// album 
    text(converterTempo(duracao), xt+661, yt+50); // duração
  }

  // toca a música
  void tocar() {
    musica = minim.loadFile(diretorio);
    musica.play();
  }

  // apagar a música
  void apagar(float f, float g) {
    if (hit(f, g))
      stroke(255, 255);
    strokeWeight(1);
    line(768, yt+49, 762, yt+56);
    line(768, yt+56, 762, yt+49);
  }

  // permite mudar a cor do texto da música
  void setS(boolean a) {
    seleccionada = a;
  }

  // altera o album
  void setAlb(String a) {
    album = a;
  }

  // altera o artista
  void setArt(String a) {
    artista = a;
  }

  // altera o nome
  void setNom(String a) {
    nome = a;
  }



  // verifica se há colisão com o botão
  boolean hit(float f, float g) {
    if (f > getXT() && f < width - getXT() && g > 50 + getYT()-5 && g < 50 + getYT()+10)
      return true;
    else return false;
  }

  // devolve o valor da seleção
  boolean getS() {
    return seleccionada;
  }

  // devolve o x do texto da música
  float getXT() {
    return xt;
  }

  // devolve o y do texto da música
  float getYT() {
    return yt;
  }

  // devolve o diretório da música
  String getD() {
    return diretorio;
  }

  // devolve o nome da música
  String getN() {
    return nome;
  }

  // devolve o artista da música
  String getArt() {
    return artista;
  }

  // devolve o álbum da música
  String getAlb() {
    return album;
  }

  color getC() {
    return c;
  }
}
