Follower[] f = new Follower[50];
PVector[] p = new PVector[50];
boolean mouseExit = false;
void setup() {
  //size(600, 400);
  fullScreen();
  colorMode(HSB);
  noStroke();
  for (int i=0; i<f.length; i++) {
    PVector a = new PVector(random(width), random(height));
    p[i] = a;
    f[i] = new Follower(a);
  }
}
void draw() {
  background(40);
  if (mouseExit) {
    for (int i=0; i<f.length; i++) {
      f[i].seek(p[i].x, p[i].y);
      f[i].update();
      f[i].show(p[i]);
    }
  } else {
    for (int i=0; i<f.length; i++) {
      f[i].seek(mouseX, mouseY);
      f[i].update();
      f[i].show(new PVector(mouseX, mouseY));
    }
  }
}

void mousePressed() {
  mouseExit = !mouseExit;
}
