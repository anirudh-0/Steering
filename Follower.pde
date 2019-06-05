class Follower {
  PVector pos, vel, acc;
  float maxSpeed = 5;
  float maxForce = 0.2;
  float size = random(25,35);
  float hue = random(255);
  Follower(PVector a) {
    pos = a.copy();
    vel = new PVector();
    acc = new PVector();
  }
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void seek(float x, float y) {
    PVector target = new PVector(x, y);
    PVector desired = PVector.sub(target, pos);
    //desired.normalize();
    //desired.mult(maxSpeed);
    desired.limit(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void show(PVector a) {
    if ( pos.dist(a)<0.2 && vel.mag() < 0.2) {
      noFill();
      vel.mult(0);
    } else {
      //fill(255);
      fill(hue, 255, 255);
    }
    ellipse(pos.x, pos.y, size, size);
  }
}
