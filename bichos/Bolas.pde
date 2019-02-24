class Bolas {
  PVector pos;
  PVector vel;
  PVector mouse;
  PVector acel;
  PVector pmouse;
  float rad;

  Bolas() {
    pos = new PVector(random(0+rad, width-rad), random(0+rad, height-rad));
    vel = new PVector(0, 0);
    acel = new PVector (0, 0);
    rad =2;
  }

  void mueve() {
    PVector ruido = new PVector(random(-1, 1), random(-1, 1));
    pmouse = new PVector (mouseX, mouseY);
    mouse= new PVector (mouseX, mouseY);
    mouse.sub(pos);
    mouse.setMag(0.1);

    acel = mouse;
    vel.sub(acel);
    if ((pmouse.sub(pos)).mag()< random(100,200)) {
      pos.add(vel);
    }
    pos.add(ruido);
    vel.limit(2);
  }
  void pinta() {
    noStroke();
    fill(255, 200);
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
