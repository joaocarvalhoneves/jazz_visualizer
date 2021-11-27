// Organiza os objetos da classe "Musicas" por ordem alfabética de título
class OrdenaNome implements Comparator <Musicas> {

  public int compare(Musicas m0, Musicas m1) {
    return (int) m0.getN().compareTo(m1.getN());
  }
}

// Organiza os objetos da classe "Musicas" por ordem alfabética de artista
class OrdenaArtista implements Comparator <Musicas> {

  public int compare(Musicas m0, Musicas m1) {
    return (int) m0.getArt().compareTo(m1.getArt());
  }
}

// Organiza os objetos da classe "Musicas" por ordem alfabética de álbum
class OrdenaAlbum implements Comparator <Musicas> {

  public int compare(Musicas m0, Musicas m1) {
    return (int) m0.getAlb().compareTo(m1.getAlb());
  }
}
