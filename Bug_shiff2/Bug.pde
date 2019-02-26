// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Seek_Arrive

// The "Vehicle" class

class Bug {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  PImage bug;
  boolean parate = false;
  float r;
  PVector ruido = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));

  Bug(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, -2);
    position = new PVector(x, y);
    maxspeed = 1;
    maxforce = 0.5;
    bug = loadImage("bug2.gif");
    r = random(360);
  }

  // Method to update position
  void update(PVector n, PVector m) {
    // Update velocity
    if (n.mag()<2) {

      velocity.add(acceleration);
      velocity.limit(random(0.00, 0.50));
    } else {

      velocity.sub(acceleration);
    }
    // Limit speed
    velocity.limit(maxspeed);
    position.add(ruido);

    position.add(velocity);



    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);





    position.x= constrain(position.x, random(-1000), width+random(1000));
    position.y= constrain(position.y, random(-1000), height+random(1000));
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target

    if (desired.mag()<2) {
      parate=true;
    }
    // Scale to maximum speed
    desired.setMag(maxspeed);

    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force

    applyForce(steer);
  }

 void display_N1() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    
    pushMatrix();
    translate(position.x, position.y);

    if (parate) {
      parate= false;
      rotate(radians(r));
    } else {
      rotate(theta);
    }
    imageMode(CENTER);
    image(bug, 0, 0, 25, 25);
    popMatrix();
  }

 void display_N2() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    
    pushMatrix();
    translate(position.x, position.y);

    if (parate) {
      parate= false;
      rotate(radians(r));
    } else {
      rotate(theta);
    }
    imageMode(CENTER);
    image(bug, 0, 0, 25, 25);
    popMatrix();
  }

  void display_N3() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    
    pushMatrix();
    translate(position.x, position.y);

    if (parate) {
      parate= false;
      rotate(radians(r));
    } else {
      rotate(theta);
    }
    imageMode(CENTER);
    image(bug, 0, 0, 25, 25);
    popMatrix();
  }
  
  void displayBola() {
    // Draw a triangle rotated in the direction of velocity
    fill(255,100);
    noStroke();
    ellipse(position.x, position.y,random(2,5),random(2,5));
    
  }
}
