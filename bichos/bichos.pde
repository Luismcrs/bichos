int cuantas = 1000;
Bolas[] b = new Bolas[cuantas];

void setup() {
  size(900, 600, P2D);
  for (int i = 0; i<cuantas; i++) {
    b[i]= new Bolas();
  }
}

void draw() {
  background(0);
  for (int i = 0; i<cuantas; i++) {
    b[i].mueve();
    b[i].pinta();
    b[i].mantiene();
  }
}
