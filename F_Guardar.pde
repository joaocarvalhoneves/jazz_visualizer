// guardar a música num txt
void guardar() {

  String[] musicas1 = new String [rep1.size()];
  String[] musicas2 = new String [rep2.size()];
  String[] musicas3 = new String [rep3.size()];
  String[] musicas4 = new String [rep4.size()];

  for (int i = 0; i < rep1.size(); i++) {
    musicas1[i] = rep1.get(i).getD();
  }
  for (int i = 0; i < rep2.size(); i++) {
    musicas2[i] = rep2.get(i).getD();
  }
  for (int i = 0; i < rep3.size(); i++) {
    musicas3[i] = rep3.get(i).getD();
  }
  for (int i = 0; i < rep4.size(); i++) {
    musicas4[i] = rep4.get(i).getD();
  }

  saveStrings("rep1.txt", musicas1);
  saveStrings("rep2.txt", musicas2);
  saveStrings("rep3.txt", musicas3);
  saveStrings("rep4.txt", musicas4);
}
