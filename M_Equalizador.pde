// equalizador
void equalizador() {
  if (equalizador) {

    // desenho do painel e título a deslocar-se com o painel
    pai[1].desenha(80, 300);
    t[5].desenha();
    t[5].setC(255);
    t[5].setY(pai[1].getY1()-103);
  } else {

    // títulos e painel a desaparecer
    t[5].desaparecer();
    pai[1].esconder(150);
  }
}
