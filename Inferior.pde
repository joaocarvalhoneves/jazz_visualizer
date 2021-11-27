// barra inferior do menu
void inferior() {

  reprodutor();
  equalizador();
  playlist();

  // background da barra
  rectMode(CENTER);
  fill(80);
  noStroke();
  rect(width/2, 470, width, 80); 
  b[0].desenha();

  // desenha ou não os botões - opcional 
  //botão de play/pause, reprodutores, equalização, rewind e playlist respetivamente
  //for (int i = 0; i < 5; i++) {
  //b[i].desenha();
  //}
  //b[10].desenha();
  //b[9].desenha();
  //}

  // ícone de play e pause
  noStroke();
  fill(255);
  if (!tocar)
    triangle(width/2-4, 463, width/2-4, 477, width/2+9, 470);
  else {
    rect(width/2-4, 470, 3, 14);
    rect(width/2+5, 470, 3, 14);
  }

  // ícone do rewind
  triangle(width/2-79, 465, width/2-79, 477, width/2-89, 471);
  triangle(width/2-86, 465, width/2-86, 477, width/2-94, 471);

  // ícone de equalização
  stroke(80);
  strokeWeight(1);
  rectMode(CORNER);
  rect(343, 469, 3, 8);
  rect(346, 463, 3, 14);
  rect(349, 465, 3, 12);
  rect(352, 467, 3, 10);
  rect(355, 472, 3, 5);

  // ícone da playlist
  /*
  rect(480, 464, 12, 3);
   rect(480, 468, 12, 3);
   rect(480, 472, 12, 3);
   */

  // ícone de setpan
  if (pan == 0) {
    c1 = 200;
    c2 = 255;
    c3 = 200;
  } 
  if (pan == 1) {
    c1 = 200;
    c2 = 200;
    c3 = 255;
  }
  if (pan == 2) {
    c1 = 255;
    c2 = 200;
    c3 = 200;
  }


  fill(c1);
  rect(480, 463, 4, 14);
  fill(c2);
  rect(484, 463, 4, 14);
  fill(c3);
  rect(488, 463, 4, 14);

  fill(255);

  //ícone do menu dos reprodutores
  textSize(18);
  textAlign(CENTER, CENTER);
  text("R", width/2+50, 467);

  //ícone do menu para adicionar músicas
  noStroke();
  textAlign(CORNER, CENTER);
  textSize(24);
  text("+", width/2+116, 465);

  //ícone do shuffle
  stroke(255);
  strokeWeight(2);
  noFill();
  bezier(width/2-122-6, 467, width/2-122-2, 467, width/2-122, 473, width/2-122+5, 473);
  bezier(width/2-122-6, 473, width/2-122-2, 473, width/2-122, 467, width/2-122+5, 467);
  noStroke();
  fill(255);
  triangle(width/2-122+5, 465, width/2-122+5, 470, width/2-122+10, 467);
  triangle(width/2-122+5, 471, width/2-122+5, 476, width/2-122+10, 473);

  // ícone do volume
  image(megafone, 675, 470, 9, 16); 

  // mudanças do ícone do volume consoante o mesmo
  noFill();
  stroke(255);
  strokeWeight(2);
  if (ba.getCur() > 0)
    arc(681, 470, 10, 8, -PI/4, PI/4);
  if (ba.getCur() > 30)
    arc(683, 470, 15, 12, -PI/4, PI/4);
  if (ba.getCur() > 60)
    arc(686, 470, 20, 16, -PI/4, PI/4);
  if (ba.getCur() == 0)
    image(volumezero, 690, 471, 9, 9);

  // barra de volume
  ba.desenha(); 
  if (mousePressed && arrastarvolume)
    ba.arrasta(mouseX);

  // barra de progresso
  p.desenha();
  if (mousePressed && arrastarmusica) {
    p.arrasta(mouseX);
    musica.pause();
  } else { 
    if (tocar)
      musica.play();
  }

  // duração da música na barra de progresso
  fill(255);
  textSize(13);
  textAlign(CORNER, CENTER);
  text(converterTempo(musica.length()), width/2+206, 438);
  text(converterTempo(musica.position()), width/2-230, 438);

  // botão de visualizador
  if (menu >= 1 && menu <= 4)
    b[11].desenha();

  // tooltips
  for (int i = 0; i < 5; i++) {
    if (b[i].hit(mouseX, mouseY))
      tt[i].desenha(mouseX, mouseY);
    tt[i].aparecer(b[i].hit(mouseX, mouseY));
  }

  if (b[9].hit(mouseX, mouseY))
    tt[5].desenha(mouseX, mouseY);
  tt[5].aparecer(b[9].hit(mouseX, mouseY));

  if (b[10].hit(mouseX, mouseY))
    tt[6].desenha(mouseX, mouseY);
  tt[6].aparecer(b[10].hit(mouseX, mouseY));

  if (menu >= 1 && menu <= 4) {
    if (b[11].hit(mouseX, mouseY))
      tt[7].desenha(mouseX, mouseY);
    tt[7].aparecer(b[11].hit(mouseX, mouseY));
  }
}
