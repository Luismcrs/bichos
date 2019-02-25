import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;


int cuantas = 100;
Bolas[] b = new Bolas[cuantas];

void setup() {
  size(640, 520);
  for (int i = 0; i<cuantas; i++) {
    b[i]= new Bolas();
  }
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() {
  background(0);
  tracker.track();
  translate(0,0);
  tracker.display();
  PVector v1 = tracker.getPos();
  PVector v2 = tracker.getLerpedPos();

  for (int i = 0; i<cuantas; i++) {

    b[i].mueve(v2.x, v2.y, v1.x, v1.y, 1,false);
    //b[i].pinta();
    b[i].mantiene();
  }
  if (keyPressed) {
    if (key == 'a') {
      for (int i = 0; i<cuantas; i++) {
        b[i].mueve(v2.x, v2.y, v1.x, v1.y, 1, true);
        b[i].pinta1(v2);
      }
    } else if (key == 's') {
     for (int i = 0; i<cuantas; i++) {
        b[i].pinta2();
      }
    } else if (key == 'd') {
      for (int i = 0; i<cuantas; i++) {
        b[i].pinta3();
      }
    } else if (key == 'f') {
      for (int i = 0; i<cuantas; i++) {
        b[i].pinta4();
      }
    }
  }
  ellipse(v1.x, v1.y, 40, 40);
}

// Adjust the threshold with key presses
void keyPressed() {
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
