//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// NENHUM DIREITO DE AUTOR FOI PRETENDIDO. OS AUDIOS EM ANEXO NÃO SÃO DA NOSSA AUTORIA E PORTANTO TODOS OS DIREITOS VÃO PARA O GRUPO OU COMPOSITOR.                 //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 1. No caso do primeiro reprodutor, caso se pretenda fazer load de um vídeo, ele deverá ter o mesmo diretório que a música que lhe está associada, em formato mp4.//
// 2. A menos que seja intenção do utilizador usufruir do primeiro reprodutor, aconselha-se a NÃO utilização do P2D, para benefícios gráficos.                      //
// 3. Para adicionar músicas aos diferentes reprodutores esta deverá começar por um número de 1 a 4 que a irá associar a um dos 4 reprodutores.                     //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import drop.*;
import java.util.*;
import processing.video.*;
import ddf.minim.*; 
import ddf.minim.effects.*;  
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;
Minim minim;                                          // biblioteca minim
AudioInput in;                                        // som que é recebido no menu inicial
AudioPlayer carregar, musica;                         // som que carrega e que toca
AudioMetaData meta;                                   // meta dos sons carregados
Movie video;                                          // vídeo que toca no visualizador 1
FFT fft;                                              // espectro do visualizador 1
BeatDetect beats;                                     // reconhece batimentos
SDrop drop;                                           // permite adicionar músicas através do arrasto
Liquido     l              = new Liquido();           // líquido para visualizador 4
Progresso   p              = new Progresso(200, 437); // barra do progresso da música
Barra       ba             = new Barra(703, 466);     // barra de controlo do volume
Background  [] back        = new Background[4];       // background para reprodutores
Painel      [] pai         = new Painel    [7];       // array para paineis dinâmicos
Botao       [] b           = new Botao     [12];      // array para botões
Titulo      [] t           = new Titulo    [11];      // array para texto
Flutuante   [] f           = new Flutuante [8];       // array para deslocação das letras iniciais     
Tooltip     [] tt          = new Tooltip   [8];       // array para tooltips
Noise       [] n           = new Noise     [10];      // array para círculos no visualizador 4
Publico     [] pbeat, pbaixo, pmedio1, pmedio2,       // array para público no visualizador 3
               palto, pesq1, pesq2, pdir1, pdir2 ;    // array para público no visualizador 3
String     beat   [];                                 // array para coordenadas do público no visualizador 3
String     baixo  [];                                 // array para coordenadas do público no visualizador 3
String     medio1 [];                                 // array para coordenadas do público no visualizador 3
String     medio2 [];                                 // array para coordenadas do público no visualizador 3
String     alto   [];                                 // array para coordenadas do público no visualizador 3
String     esq1   [];                                 // array para coordenadas do público no visualizador 3
String     esq2   [];                                 // array para coordenadas do público no visualizador 3
String     dir1   [];                                 // array para coordenadas do público no visualizador 3
String     dir2   [];                                 // array para coordenadas do público no visualizador 3
ArrayList  <Musicas> rep1 = new ArrayList();          // array para músicas do reprodutor 1
ArrayList  <Musicas> rep2 = new ArrayList();          // array para músicas do reprodutor 2
ArrayList  <Musicas> rep3 = new ArrayList();          // array para músicas do reprodutor 3
ArrayList  <Musicas> rep4 = new ArrayList();          // array para músicas do reprodutor 4
PImage     inicio []      = new PImage [8];           // letras iniciar
PImage     imgrep1, imgrep11;                         // imagens do fundo do reprodutor 1
PImage     imgrep2, imgrep22;                         // imagens do fundo do reprodutor 2
PImage     imgrep3, imgrep33;                         // imagens do fundo do reprodutor 3
PImage     imgrep4, imgrep44;                         // imagens do fundo do reprodutor 4
PImage     imgvisualizador2, imgvisualizador22;       // imagens do fundo do visualizador 2
PImage     imgvisualizador3;                          // imagem do fundo do visualizador 3
PImage     imgvisualizador4, imgvisualizador44;       // imagens do fundo do visualizador 4
PImage     imgvisualizador444;                        // imagens do fundo do visualizador 4
PImage     megafone;                                  // imagens várias
PImage     volumezero;                                // imagens várias
PImage     imginiciar;                                // imagens várias
PImage     imgmenu;                                   // imagens várias
boolean    reprodutor     = false;                    // true é painel de escolha de reprodutores
boolean    equalizador    = false;                    // true é painel de escolha da equalização 
boolean    playlist       = false;                    // true é painel da playlist
boolean    arrastarvolume = false;                    // true permite arrastar o volume
boolean    arrastarmusica = false;                    // true permite arrastar a música
boolean    tocar          = false;                    // true a aplicação dá som
boolean    luz            = false;                    // true desenha luz no candeeiro no visualizador 4
String     nome1 = "", nome2 = "";                    // variáveis para guardar a posição da música selecionada antes de organizar
String     nome3 = "", nome4 = "";                    // variáveis para guardar a posição da música selecionada antes de organizar
String     guardarStrAlb = "";                        // variáveis para guardar o nome do album antes da edição
String     guardarStrArt = "";                        // variáveis para guardar o nome do artista antes da edição      
String     guardarStrNom = "";                        // variáveis para guardar o nome da música antes da edição  
int        guardarNumStrAlb = 0;                      // variáveis para guardar o numero do album na array em mouseover
int        guardarNumStrArt = 0;                      // variáveis para guardar o numero do artista na array em mouseover
int        guardarNumStrNom = 0;                      // variáveis para guardar o numero da música na array em mouseover
int        scrollingalb = -1;                         // variáveis para guardar a posição da música em  mouseover
int        scrollingart = -1;                         // variáveis para guardar a posição da música em  mouseover
int        scrollingnom = -1;                         // variáveis para guardar a posição da música em  mouseover
int        encontroualb = 0;                          // contador para permitir definir a altura em que se guarda o album em mouseover
int        encontrouart = 0;                          // contador para permitir definir a altura em que se guarda o artista em mouseover
int        encontrounom = 0;                          // contador para permitir definir a altura em que se guarda a musica em mouseover
int        contadorcarateresalb = 0;                  // variáveis para refazer string quando demasiado comprida para apresentação
int        contadorcarateresart = 0;                  // variáveis para refazer string quando demasiado comprida para apresentação
int        contadorcarateresnom = 0;                  // variáveis para refazer string quando demasiado comprida para apresentação
int        r1 = -1, r2 = -1, r3 = -1, r4 = -1;        // variáveis para guardar a mudança de cor nas listas
int        k1, k2, k3, k4;                            // variáveis para guardar a mudança de cor nas listas
int        freq = 0;                                  // frequência para visualizador 1 
int        pan = 0;                                   // variável para definir panorâmica                                 
color      c1, c2, c3;                                // cores para definir panorâmica
float      RegistoBaixo = 0.03;                       // 3% do registo da banda
float      RegistoMedio = 0.125;                      // 12.5% do registo da banda
float      RegistoAlto  = 0.2;                        // 20% do registo da banda
float      TotalBaixo   = 0;                          // total do registo dos baixos
float      TotalMedio   = 0;                          // total do registo dos medios
float      TotalAlto    = 0;                          // total do registo dos altos
float      TotalEsq     = 0;                          // total do canal esquerdo
float      TotalDir     = 0;                          // total do canal direito
float      MediaEsq     = 0;                          // media do canal esquerdo
float      MediaDir     = 0;                          // media do canal direito 

int        menu = 5;                                  // menu ativo
// 0 = geral
// 1 = bebop
// 2 = swing 
// 3 = moderno
// 4 = solo
// 5 = iniciar

int        visualizador = 0;                          // visualizador ativo
// 0 = nenhum
// 1 = bebop
// 2 = swing 
// 3 = moderno
// 4 = solo


void setup() {
  size(800, 500);
  criacao();
  carregar();
}

void draw() {
  imageMode(CENTER);
  rectMode(CENTER);
  iniciar();
  menu();
  reprodutor1();
  reprodutor2();
  reprodutor3();
  reprodutor4();
  geral();
}

void mousePressed() {
  cliques();
  guardar();
}

void mouseReleased() {
  arrastarvolume = false;
  arrastarmusica = false;
}

void keyPressed() {
  comandosteclado();
}

void movieEvent(Movie m) {
  m.read();
}
