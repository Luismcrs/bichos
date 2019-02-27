import processing.sound.*;

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;

SoundFile soundfile1;
SoundFile soundfile2;
SoundFile soundfile3;

int cual;
int cual_sonido;
int cuantas = 100;

Bug[] b = new Bug[cuantas];

void setup() {
  //size(640, 360);

  size(1920, 1080, P2D);
  for (int i = 0; i<cuantas; i++) {
    b[i] = new Bug(random(width), random(height));
  }

  kinect = new Kinect(this);
  tracker = new KinectTracker();
  soundfile3 = new SoundFile(this, "data/InsectosNivel3.wav");
  soundfile2 = new SoundFile(this, "data/InsectosNivel2.wav");
  soundfile1 = new SoundFile(this, "data/InsectosNivel1.wav");
  switch (cual_sonido) {
  case 0:
    soundfile1.loop();

  case 1:
    soundfile2.loop();

  case 2:
    soundfile3.loop();
  }
}

void draw() {
  background(0);

  tracker.track();
  tracker.display();
  PVector v1 = tracker.getPos();
  PVector v2 = tracker.getLerpedPos();

  PVector mouse = new PVector(v2.x, v2.y);
  PVector pmouse = new PVector(v1.x, v1.y);

  PVector nervios;

  nervios= pmouse.sub(mouse);


  // Draw an ellipse at the mouse position
  fill(200);
  stroke(0);
  strokeWeight(2);
  ellipse(mouse.x, mouse.y, 48, 48);

  // Call the appropriate steering behaviors for our agents
  for (int i = 0; i<cuantas; i++) {
    b[i].seek(mouse);
    b[i].update(nervios, mouse);

    switch (cual) {
    case 0:
      b[i].displayBola();
      break;
    case 1:
      b[i].display_N1();
      break;
    case 2:
      b[i].display_N2();
      break;
    case 3:
      b[i].display_N3();
      break;
    }
  }

  float amplitude = map(constrain(nervios.mag(), 0, 5), 0, 5, 1.0, 0.1);
  soundfile1.amp(amplitude);
  soundfile2.amp(amplitude);
  soundfile3.amp(amplitude);
}

void keyPressed() {
  if (key == 'a') {
    cual++;
    if (cual ==4) {
      cual=0;
    }
  }
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}



void mousePressed() {
  cual_sonido++;
  if (cual_sonido ==3) {
    cual_sonido=0;
  }
}
