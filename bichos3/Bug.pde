// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Seek_Arrive

// The "Vehicle" class

class Bug {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  PImage bug;
  boolean parate = false;
  float par;


  Bug(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, -2);
    position = new PVector(x, y);
    r = 6;
    maxspeed = 1;
    maxforce = 0.5;
    bug = loadImage("bug2.gif");
    par = random(360);
  }

  // Method to update position
  void update() {
    // Update velocity
    if(parate){
    velocity.add(acceleration);
    } else {
    velocity.sub(acceleration);
    }
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
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
    } else {
    parate=false;
    }
    // Scale to maximum speed
    desired.setMag(maxspeed);

    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force

    applyForce(steer);
  }

  void display() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(position.x, position.y);
    
    if (parate) {
      parate= false;
      theta =0;
      rotate(par);
    } else {
      rotate(theta);
    }
    imageMode(CENTER);
    image(bug, 0, 0, 50, 50);
    popMatrix();
  }
}
