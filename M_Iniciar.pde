// menu iniciar
void iniciar() {
  if (menu == 5) {
    background(imginiciar);
    for (int i = 0; i < 8; i++) {
      f[i].desenha(in.left.get(200), in.right.get(200));
    }
    textSize(16);
    fill(#F7DF7D, f[1].distancia());
    text("faça som", width-85, height-20);
  }
}
