class Follower {
  PVector pos, vel, acc;
  float maxSpeed = 15;
  float maxForce = 0.2;
  float size = random(9, 15);
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
    ellipse(pos.x, pos.y, 2*size, 2*size);
  }


  Food search(Food[] food) {
    float min = width*height;
    Food nearest = new Food();
    for (int i=0; i<food.length; i++) {
      float d = pos.dist(food[i].pos);
      if (d<min) {
        nearest = food[i];
        min = d;
      }
      if (d-size-food[i].size <= 0) {
        food[i].pos = new PVector(random(size, width-size), random(size, height-size));
      }
    }
    return nearest;
  }
}
