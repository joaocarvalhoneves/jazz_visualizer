// menu reprodutor
void reprodutor() {

  if (reprodutor) {

    // desenho do painel e título a deslocar-se com o painel
    pai[0].desenha(80, 300);
    t[0].desenha();
    t[0].setC(255);

    // títulos a deslocarem-se com o painel
    t[0].setY(pai[0].getY1()-104);
    t[1].setY(pai[0].getY1()-58);
    t[2].setY(pai[0].getY1()-8);
    t[3].setY(pai[0].getY1()+42);
    t[4].setY(pai[0].getY1()+92);

    // botões a deslocarem-se com o painel
    b[5].setY(pai[0].getY1()-56);
    b[6].setY(pai[0].getY1()-6);
    b[7].setY(pai[0].getY1()+44);
    b[8].setY(pai[0].getY1()+94);

    // desenho dos botões com fade in
    for (int i = 5; i < 9; i++) {
      b[i].desenha();
      if (pai[0].getY1() < 301)
        b[i].aparecer();
      if (b[i].hit(mouseX, mouseY))
        b[i].mouseover();
    }
    // desenho e fade in de títulos dos reprodutores
    for (int i = 1; i < 5; i++) {
      t[i].desenha();
      if (pai[0].getY1() < 301)
        t[i].aparecer();
    }
  } else {

    // botões a desaparecer
    for (int i = 5; i < 9; i++) {
      b[i].desaparecer();
    }

    // títulos a desaparecer
    for (int i = 0; i < 5; i++) {
      t[i].desaparecer();
    }

    // menu a esconder
    pai[0].esconder(150);
  }
}
