Pilha p1 = new Pilha();
Pilha p2 = new Pilha();
Pilha p3 = new Pilha();
int elemento;
boolean um = false, dois = false, tres = false;

void setup() {
  size(1002, 600);
  frameRate(60);
  inicio();
}

void draw() {
  background(#F077D6);
  desenhaColunas();
  p1.mostraTela(width/12);
  p2.mostraTela(width/12 * 5);
  p3.mostraTela(width/12 * 9);
  fimDeJogo();
}

void desenhaColunas() {
  noStroke();
  fill(#F8FC14);
  //coluna
  rect(width/6, 200, 30, 270);
  rect(width/6 * 3, 200, 30, 270);
  rect(width/6 * 5, 200, 30, 270);
  //linha
  rect(0, 470, 1002, 130);
}

void inicio(){
  for(int i = 5; i > 0; i--){   
    p1.armazenaDisco(i);
  }
}

void mousePressed(){
  float ai = width/3;
  if(mouseX > 0 && mouseX < ai){
    elemento = p1.pressao(mouseX, mouseY);
    um = true;
  }
  if(mouseX > ai && mouseX < ai*2){
    elemento = p2.pressao(mouseX, mouseY);
    dois = true;
  }
  if(mouseX > ai*2){
    elemento = p3.pressao(mouseX, mouseY);
    tres = true;
  }
}

void mouseReleased(){
  float ai = width/3;
  boolean ok = false;
  if(mouseX > 0 && mouseX < ai){
    ok = p1.armazenaDisco(elemento);
  }
  if(mouseX > ai && mouseX < ai*2){
    ok = p2.armazenaDisco(elemento);
    
  }
  if(mouseX > ai*2){
    ok = p3.armazenaDisco(elemento);
  }
  if(ok == true && um == true){
    p1.tiraDisco();
  }
  if(ok == true && dois == true){
    p2.tiraDisco();
  }
  if(ok == true && tres == true){
    p3.tiraDisco();
  }
}

void fimDeJogo(){
  int i = 0;
  for (Integer elemento: p3.pilha) {
    i++;
    if(i == 5){
      fill(0);
      rect(0, 0, 1002, 600);
      fill(255);
      textSize(50);
      text("FIM DE JOGO!!", 400, 300);
    }
  }
  
}
