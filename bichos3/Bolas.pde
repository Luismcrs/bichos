class Bolas {
  PVector pos;
  PVector vel;
  PVector mouse;
  PVector acel;
  PVector pmouse;
  PVector mueve;
  PVector pmueve;
  float rad;
 Bug b;

  PImage[] img = new PImage[16];

  Bolas() {
    pos = new PVector(random(0+rad, width-rad), random(0+rad, height-rad));
    vel = new PVector(0, 0);
    acel = new PVector (0, 0);
    rad =5;
    b = new Bug(pos.x,pos.y);
  }

  void mueve(float x, float y, float bx, float by, float ru, boolean a) {
    PVector ruido = new PVector(random(-ru, ru), random(-ru, ru));

    pmueve = new PVector (bx, by);
    mueve = new PVector (x, y);
    pmouse = new PVector (x, y);
    mouse= new PVector (x, y);
    mouse.sub(pos);
    mouse.setMag(0.01);
    pmueve.sub(mueve);

    if (pmueve.mag()<=0.2) {
      vel.setMag(1);
      pos.sub(vel);
    }

    if ((pmouse.sub(pos)).mag()< random(0, 200)) {
      pos.add(vel);
    }
    acel = mouse;
    vel.sub(acel);

    if (a) {
      pos.add(ruido);
    }
    vel.limit(2);
  }
  void pinta() {

    noStroke();
    fill(255, 200);
    ellipse(pos.x, pos.y, rad, rad);
  }

  void pinta1(PVector target) {

  b.seek(target);
  b.update();
  b.display();
  }
  void pinta2() {

    noStroke();
    fill(0, 0, 255, 200);
    ellipse(pos.x, pos.y, rad, rad);
  }
  void pinta3() {

    noStroke();
    fill(255, 0, 0, 200);
    ellipse(pos.x, pos.y, rad, rad);
  }
  void pinta4() {

    noStroke();
    fill(0, 255, 0, 200);
    ellipse(pos.x, pos.y, rad, rad);
  }

  void mantiene() {
    if (pos.x>= width-rad || pos.x <=0+rad) {
      vel.x = -vel.x;
    }
    if (pos.y>= height-rad || pos.y <=0+rad) {
      vel.y = -vel.y;
    }
    pos.x= constrain(pos.x, 0+rad, width-rad);
    pos.y = constrain(pos.y, 0+rad, height-rad);
  }
}
