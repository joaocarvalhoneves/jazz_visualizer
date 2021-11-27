void scrollingtext() {
  if (frameCount%10==0) {

    ////  REPRODUTOR 1  ////

    if (menu==1 && rep1.size() > 0) {

      ////  NOME  ////     
      if (mouseX > 29 && mouseX < 239) {
        contadorcarateresnom
        ++;
        for (int k1 = 0; k1 < rep1.size(); k1++) {
          if (rep1.get(k1).hit(mouseX, mouseY)) {
            scrollingnom = k1;
            encontrounom++;
            break;
          }
        }
      } else {
        scrollingnom = -1;
        encontrounom = 0;
        if (!guardarStrNom.equals(""))
          rep1.get(guardarNumStrNom).setNom(guardarStrNom);
        guardarStrNom = "";
      }

      if (encontrounom == 1) {
        guardarStrNom = rep1.get(scrollingnom).getN();
        guardarNumStrNom = scrollingnom;
      }

      if (scrollingnom >= 0) {
        if (scrollingnom == guardarNumStrNom && mouseY < pai[3].getY2()) {
          rep1.get(scrollingnom).setNom(scrollingtext(guardarStrNom, 35, contadorcarateresnom));
        } else {
          rep1.get(guardarNumStrNom).setNom(guardarStrNom);
          encontrounom= 0;
        }
      }

      ////  ARTISTA  ////   
      if (mouseX > 255 && mouseX < 438) {
        contadorcarateresart++;
        for (int k1 = 0; k1 < rep1.size(); k1++) {
          if (rep1.get(k1).hit(mouseX, mouseY)) {
            scrollingart = k1;
            encontrouart++;
            break;
          }
        }
      } else {
        scrollingart = -1;
        encontrouart = 0;
        if (!guardarStrArt.equals(""))
          rep1.get(guardarNumStrArt).setArt(guardarStrArt);
        guardarStrArt = "";
      }

      if (encontrouart == 1) {
        guardarStrArt = rep1.get(scrollingart).getArt();
        guardarNumStrArt = scrollingart;
      }

      if (scrollingart >= 0) {
        if (scrollingart == guardarNumStrArt && mouseY < pai[3].getY2()) {
          rep1.get(scrollingart).setArt(scrollingtext(guardarStrArt, 28, contadorcarateresart));
        } else {
          rep1.get(guardarNumStrArt).setArt(guardarStrArt);
          encontrouart= 0;
        }
      }

      ////  ALBUM  ////   
      if (mouseX > 453 && mouseX < 680) {
        contadorcarateresalb++;
        for (int k1 = 0; k1 < rep1.size(); k1++) {
          if (rep1.get(k1).hit(mouseX, mouseY)) {
            scrollingalb = k1;
            encontroualb++;
            break;
          }
        }
      } else {
        scrollingalb = -1;
        encontroualb = 0;
        if (!guardarStrAlb.equals(""))
          rep1.get(guardarNumStrAlb).setAlb(guardarStrAlb);
        guardarStrAlb = "";
      }

      if (encontroualb == 1) {
        guardarStrAlb = rep1.get(scrollingalb).getAlb();
        guardarNumStrAlb = scrollingalb;
      }

      if (scrollingalb >= 0) {
        if (scrollingalb == guardarNumStrAlb && mouseY < pai[3].getY2()) {
          rep1.get(scrollingalb).setAlb(scrollingtext(guardarStrAlb, 35, contadorcarateresalb));
        } else {
          rep1.get(guardarNumStrAlb).setAlb(guardarStrAlb);
          encontroualb = 0;
        }
      }
    }


    ////  REPRODUTOR 2  ////

    if (menu==2 && rep2.size() > 0) {

      ////  NOME  ////     
      if (mouseX > 29 && mouseX < 239) {
        contadorcarateresnom++;
        for (int k2 = 0; k2 < rep2.size(); k2++) {
          if (rep2.get(k2).hit(mouseX, mouseY)) {
            scrollingnom = k2;
            encontrounom++;
            break;
          }
        }
      } else {
        scrollingnom = -1;
        encontrounom = 0;
        if (!guardarStrNom.equals(""))
          rep2.get(guardarNumStrNom).setNom(guardarStrNom);
        guardarStrNom = "";
      }

      if (encontrounom == 1) {
        guardarStrNom = rep2.get(scrollingnom).getN();
        guardarNumStrNom = scrollingnom;
      }

      if (scrollingnom >= 0) {
        if (scrollingnom == guardarNumStrNom && mouseY < pai[4].getY2()) {
          rep2.get(scrollingnom).setNom(scrollingtext(guardarStrNom, 35, contadorcarateresnom));
        } else {
          rep2.get(guardarNumStrNom).setNom(guardarStrNom);
          encontrounom= 0;
        }
      }

      ////  ARTISTA  ////   
      if (mouseX > 255 && mouseX < 438) {
        contadorcarateresart++;
        for (int k2 = 0; k2 < rep2.size(); k2++) {
          if (rep2.get(k2).hit(mouseX, mouseY)) {
            scrollingart = k2;
            encontrouart++;
            break;
          }
        }
      } else {
        scrollingart = -1;
        encontrouart = 0;
        if (!guardarStrArt.equals(""))
          rep2.get(guardarNumStrArt).setArt(guardarStrArt);
        guardarStrArt = "";
      }

      if (encontrouart == 1) {
        guardarStrArt = rep2.get(scrollingart).getArt();
        guardarNumStrArt = scrollingart;
      }

      if (scrollingart >= 0) {
        if (scrollingart == guardarNumStrArt && mouseY < pai[4].getY2()) {
          rep2.get(scrollingart).setArt(scrollingtext(guardarStrArt, 28, contadorcarateresart));
        } else {
          rep2.get(guardarNumStrArt).setArt(guardarStrArt);
          encontrouart= 0;
        }
      }

      ////  ALBUM  ////   
      if (mouseX > 453 && mouseX < 680) {
        contadorcarateresalb++;
        for (int k2 = 0; k2 < rep2.size(); k2++) {
          if (rep2.get(k2).hit(mouseX, mouseY)) {
            scrollingalb = k2;
            encontroualb++;
            break;
          }
        }
      } else {
        scrollingalb = -1;
        encontroualb = 0;
        if (!guardarStrAlb.equals(""))
          rep2.get(guardarNumStrAlb).setAlb(guardarStrAlb);
        guardarStrAlb = "";
      }

      if (encontroualb == 1) {
        guardarStrAlb = rep2.get(scrollingalb).getAlb();
        guardarNumStrAlb = scrollingalb;
      }

      if (scrollingalb >= 0) {
        if (scrollingalb == guardarNumStrAlb && mouseY < pai[4].getY2()) {
          rep2.get(scrollingalb).setAlb(scrollingtext(guardarStrAlb, 35, contadorcarateresalb));
        } else {
          rep2.get(guardarNumStrAlb).setAlb(guardarStrAlb);
          encontroualb = 0;
        }
      }
    }


    ////  REPRODUTOR 3  ////

    if (menu==3 && rep3.size() > 0) {

      ////  NOME  ////     
      if (mouseX > 29 && mouseX < 239) {
        contadorcarateresnom++;
        for (int k3 = 0; k3 < rep3.size(); k3++) {
          if (rep3.get(k3).hit(mouseX, mouseY)) {
            scrollingnom = k3;
            encontrounom++;
            break;
          }
        }
      } else {
        scrollingnom = -1;
        encontrounom = 0;
        if (!guardarStrNom.equals(""))
          rep3.get(guardarNumStrNom).setNom(guardarStrNom);
        guardarStrNom = "";
      }

      if (encontrounom == 1) {
        guardarStrNom = rep3.get(scrollingnom).getN();
        guardarNumStrNom = scrollingnom;
      }

      if (scrollingnom >= 0) {
        if (scrollingnom == guardarNumStrNom && mouseY < pai[5].getY2()) {
          rep3.get(scrollingnom).setNom(scrollingtext(guardarStrNom, 35, contadorcarateresnom));
        } else {
          rep3.get(guardarNumStrNom).setNom(guardarStrNom);
          encontrounom= 0;
        }
      }

      ////  ARTISTA  ////   
      if (mouseX > 255 && mouseX < 438) {
        contadorcarateresart++;
        for (int k3 = 0; k3 < rep3.size(); k3++) {
          if (rep3.get(k3).hit(mouseX, mouseY)) {
            scrollingart = k3;
            encontrouart++;
            break;
          }
        }
      } else {
        scrollingart = -1;
        encontrouart = 0;
        if (!guardarStrArt.equals(""))
          rep3.get(guardarNumStrArt).setArt(guardarStrArt);
        guardarStrArt = "";
      }

      if (encontrouart == 1) {
        guardarStrArt = rep3.get(scrollingart).getArt();
        guardarNumStrArt = scrollingart;
      }

      if (scrollingart >= 0) {
        if (scrollingart == guardarNumStrArt && mouseY < pai[5].getY2()) {
          rep3.get(scrollingart).setArt(scrollingtext(guardarStrArt, 28, contadorcarateresart));
        } else {
          rep3.get(guardarNumStrArt).setArt(guardarStrArt);
          encontrouart= 0;
        }
      }

      ////  ALBUM  ////   
      if (mouseX > 453 && mouseX < 680) {
        contadorcarateresalb++;
        for (int k3 = 0; k3 < rep3.size(); k3++) {
          if (rep3.get(k3).hit(mouseX, mouseY)) {
            scrollingalb = k3;
            encontroualb++;
            break;
          }
        }
      } else {
        scrollingalb = -1;
        encontroualb = 0;
        if (!guardarStrAlb.equals(""))
          rep3.get(guardarNumStrAlb).setAlb(guardarStrAlb);
        guardarStrAlb = "";
      }

      if (encontroualb == 1) {
        guardarStrAlb = rep3.get(scrollingalb).getAlb();
        guardarNumStrAlb = scrollingalb;
      }

      if (scrollingalb >= 0) {
        if (scrollingalb == guardarNumStrAlb && mouseY < pai[5].getY2()) {
          rep3.get(scrollingalb).setAlb(scrollingtext(guardarStrAlb, 35, contadorcarateresalb));
        } else {
          rep3.get(guardarNumStrAlb).setAlb(guardarStrAlb);
          encontroualb = 0;
        }
      }
    }
    ////  REPRODUTOR 4  ////

    if (menu==4 && rep4.size() > 0) {

      ////  NOME  ////     
      if (mouseX > 29 && mouseX < 239 && mouseY < pai[6].getY2()) {
        contadorcarateresnom++;
        for (int k4 = 0; k4 < rep4.size(); k4++) {
          if (rep4.get(k4).hit(mouseX, mouseY)) {
            scrollingnom = k4;
            encontrounom++;
            break;
          }
        }
      } else {
        scrollingnom = -1;
        encontrounom = 0;
        if (!guardarStrNom.equals(""))
          rep4.get(guardarNumStrNom).setNom(guardarStrNom);
        guardarStrNom = "";
      }

      if (encontrounom == 1) {
        guardarStrNom = rep4.get(scrollingnom).getN();
        guardarNumStrNom = scrollingnom;
      }

      if (scrollingnom >= 0) {
        if (scrollingnom == guardarNumStrNom && mouseY < pai[6].getY2()) {
          rep4.get(scrollingnom).setNom(scrollingtext(guardarStrNom, 35, contadorcarateresnom));
        } else {
          rep4.get(guardarNumStrNom).setNom(guardarStrNom);
          encontrounom= 0;
        }
      }

      ////  ARTISTA  ////   
      if (mouseX > 255 && mouseX < 438) {
        contadorcarateresart++;
        for (int k4 = 0; k4 < rep4.size(); k4++) {
          if (rep4.get(k4).hit(mouseX, mouseY)) {
            scrollingart = k4;
            encontrouart++;
            break;
          }
        }
      } else {
        scrollingart = -1;
        encontrouart = 0;
        if (!guardarStrArt.equals(""))
          rep4.get(guardarNumStrArt).setArt(guardarStrArt);
        guardarStrArt = "";
      }

      if (encontrouart == 1) {
        guardarStrArt = rep4.get(scrollingart).getArt();
        guardarNumStrArt = scrollingart;
      }

      if (scrollingart >= 0) {
        if (scrollingart == guardarNumStrArt && mouseY < pai[6].getY2()) {
          rep4.get(scrollingart).setArt(scrollingtext(guardarStrArt, 48, contadorcarateresart));
        } else {
          rep4.get(guardarNumStrArt).setArt(guardarStrArt);
          encontrouart= 0;
        }
      }

      ////  ALBUM  ////   
      if (mouseX > 453 && mouseX < 680) {
        contadorcarateresalb++;
        for (int k4 = 0; k4 < rep4.size(); k4++) {
          if (rep4.get(k4).hit(mouseX, mouseY)) {
            scrollingalb = k4;
            encontroualb++;
            break;
          }
        }
      } else {
        scrollingalb = -1;
        encontroualb = 0;
        if (!guardarStrAlb.equals(""))
          rep4.get(guardarNumStrAlb).setAlb(guardarStrAlb);
        guardarStrAlb = "";
      }

      if (encontroualb == 1) {
        guardarStrAlb = rep4.get(scrollingalb).getAlb();
        guardarNumStrAlb = scrollingalb;
      }

      if (scrollingalb >= 0) {
        if (scrollingalb == guardarNumStrAlb  && mouseY < pai[6].getY2()) {
          rep4.get(scrollingalb).setAlb(scrollingtext(guardarStrAlb, 35, contadorcarateresalb));
        } else {
          rep4.get(guardarNumStrAlb).setAlb(guardarStrAlb);
          encontroualb = 0;
        }
      }
    }

    if (contadorcarateresalb > guardarStrAlb.length())
      contadorcarateresalb = 0;

    if (contadorcarateresart > guardarStrArt.length())
      contadorcarateresart = 0;

    if (contadorcarateresnom > guardarStrNom.length())
      contadorcarateresnom = 0;
  }
}
