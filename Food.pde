class Food {
  PVector pos;
  float size = 4;
  Food() {
    pos = new PVector(random(size,width-size), random(size,height-size));
  }
  void show() {
    push();
    colorMode(RGB);
    stroke(255, 127, 80);
    fill(255);
    ellipse(pos.x, pos.y, 2*size,2*size);
    pop();
  }
}
