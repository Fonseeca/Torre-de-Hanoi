import java.util.Stack;

class Pilha {
  int largura, altura, posicaoDisco;
  int xPilha, yPilha;
  Stack<Integer> pilha = new Stack<Integer>();
  
  Pilha(){
    this.altura = 25;
  }
  
  boolean armazenaDisco(Integer elemento){
    int topo = 10;
    if(!pilha.empty()){
      topo = pilha.peek();
    }
    if(topo > elemento){
      pilha.push(elemento);
      return true;
    }
    return false;
  }
  
  void tiraDisco(){
    if(!pilha.empty()){
      pilha.pop();
    }
  }
  
  void mostraTela(int xPilha){
   int i = 6;
    for (Integer elemento: pilha) {
      i--;
      fill(#0C32EA);
      stroke(255);
      rect(xPilha - elemento*20 + 95, altura*i + 320, elemento*45, altura);
    }
    
  }
  
  int pressao(float mouseX, float mouseY){
    if(!pilha.empty()){
      int topo;
      topo = pilha.peek();
      rect(mouseX, mouseY, topo*45, altura);
      tiraDisco();
      return topo;
    }
    return 0;
  }
}
