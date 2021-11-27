// carregar a música a partir de um txt
void carregar() {

  String[] rep1 = loadStrings("rep1.txt");
  for (int i = 0; i < rep1.length; i++) {
    escolhermusica(new File(rep1[i]));
  }

  String[] rep2 = loadStrings("rep2.txt");
  for (int i = 0; i < rep2.length; i++) {
    escolhermusica(new File(rep2[i]));
  }

  String[] rep3 = loadStrings("rep3.txt");
  for (int i = 0; i < rep3.length; i++) {
    escolhermusica(new File(rep3[i]));
  }

  String[] rep4 = loadStrings("rep4.txt");
  for (int i = 0; i < rep4.length; i++) {
    escolhermusica(new File(rep4[i]));
  }
}
