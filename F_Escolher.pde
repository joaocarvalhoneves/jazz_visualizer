// escolher música de um diretorio
void escolhermusica(File a) {
  boolean iguais = false;

  if (a != null && a.exists()) {
    carregar = minim.loadFile(a.getAbsolutePath());

    for (int i = 0; i < rep1.size(); i++) {
      if (a.getAbsolutePath().equals(rep1.get(i).getD()))
        iguais = true;
    }

    for (int i = 0; i < rep2.size(); i++) {
      if (a.getAbsolutePath().equals(rep2.get(i).getD()))
        iguais = true;
    }

    for (int i = 0; i < rep3.size(); i++) {
      if (a.getAbsolutePath().equals(rep3.get(i).getD()))
        iguais = true;
    }

    for (int i = 0; i < rep4.size(); i++) {
      if (a.getAbsolutePath().equals(rep4.get(i).getD()))
        iguais = true;
    }

    if (!iguais) {
      String [] separacao;
      String [] sistema = split(System.getProperty("os.name"), ' ');
      if (sistema[0].equals("Windows"))
        separacao = split(a.getAbsolutePath(), "\\");
      else separacao = split(a.getAbsolutePath(), '/');
      meta = carregar.getMetaData();
      String [] verifica = split(separacao[separacao.length-1], '.');
      if (verifica[verifica.length-1].equals("mp3") || verifica[verifica.length-1].equals("wav") || verifica[verifica.length-1].equals("aiff")) {
        char repn = separacao[separacao.length-1].charAt(0);
        if (repn == '1' && rep1.size() < 20) {
          rep1.add(new Musicas(a.getAbsolutePath(), meta.title(), meta.author(), meta.album(), carregar.length()));
        } else {
          if (repn == '2' && rep2.size() < 20) {
            rep2.add(new Musicas(a.getAbsolutePath(), meta.title(), meta.author(), meta.album(), carregar.length()));
          } else {
            if (repn == '3' && rep3.size() < 20) {
              rep3.add(new Musicas(a.getAbsolutePath(), meta.title(), meta.author(), meta.album(), carregar.length()));
            } else {
              if (repn == '4' && rep4.size() < 20) {
                rep4.add(new Musicas(a.getAbsolutePath(), meta.title(), meta.author(), meta.album(), carregar.length()));
              }
            }
          }
        }
      }
    }
  }
}

// permite adicionar músicas através do arrasto
void dropEvent(DropEvent theDropEvent) {
  escolhermusica  (theDropEvent.file());
}

/* VERIFICAÇÃO DE GÉNERO PARA ADIÇÃO EM RESPETIVO REPRODUTOR QUE O MINIM NÃO SUPORTA
 if (meta.genre().equals("Bebop")) {
 rep1.add(new Musicas(a.getAbsolutePath(), meta.title(), meta.author()));
 } else {
 if (meta.genre().equals("Swing") || meta.genre().equals("83")) {
 rep2.add(new Musicas(a.getAbsolutePath(), meta.title(), meta.author()));
 } else {
 if (meta.genre().equals("Moderno")) {
 rep3.add(new Musicas(a.getAbsolutePath(), meta.title(), meta.author()));
 } else {
 if (meta.genre().equals("Solo")) {
 rep4.add(new Musicas(a.getAbsolutePath(), meta.title(), meta.author()));
 }
 }
 }
 }*/
