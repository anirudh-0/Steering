int flownum = 1;
Follower[] f = new Follower[flownum];
Food[] food = new Food[6];
PVector[] p = new PVector[flownum];
int mode = 1;


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
  for (int i=0; i<food.length; i++) {
    food[i] = new Food();
  }
}


void draw() {
  background(40);
  for (int i=0; i<food.length; i++) {
    food[i].show();
  }
  //Seek nearest food
  if (mode==1) {
    for (int i=0; i<f.length; i++) {
      Food nearest = f[i].search(food);
      f[i].seek(nearest.pos.x, nearest.pos.y);
      f[i].update();
      f[i].show(p[i]);
      //f[i].size-=0.001;
      //f[i].maxSpeed+=0.002;
    }
  }
  //Seek Origin
  else if (mode==2) {
    for (int i=0; i<f.length; i++) {
      f[i].seek(p[i].x, p[i].y);
      f[i].update();
      f[i].show(p[i]);
    }
  }
  //Seek mouse
  else {
    for (int i=0; i<f.length; i++) {
      f[i].seek(mouseX, mouseY);
      f[i].update();
      f[i].show(new PVector(mouseX, mouseY));
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    mode=1;
  } else if (mouseButton == RIGHT) {
    mode=2;
    for (int i=0; i<f.length; i++) {
      PVector a = new PVector(random(width), random(height));
      p[i] = a;
      f[i] = new Follower(a);
    }
    for (int i=0; i<food.length; i++) {
    food[i] = new Food();
  }
  } else {
    mode = 2;
  }
}
