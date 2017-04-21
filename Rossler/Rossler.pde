float x = 0.1;
float y = 0.1; 
float z = 0.1;

float a = 0.1;
float b = 0.1;
float c = 14;

float dt = 0.04;
boolean swap = false;
ArrayList<PVector> points = new ArrayList<PVector>();
void  setup() {
  size(800, 600, P3D);
  rotate(PI / 3.0);
  colorMode(HSB);
  
}

void draw() {
  background(0);
  
  float dx = (-y - z) * dt;
  float dy = (x + a * y) * dt;
  float dz = b + z * (x - c) * dt;
  
  x += dx;
  y += dy;
  z += dz;
  
  points.add(new PVector(x, y, z));
  translate(width / 2, height / 2);
  scale(14);
  strokeWeight(0.4);
  noFill();
  float hue = 0;
  beginShape();
  for (PVector v : points) {
    stroke(hue, 255, 255);
    vertex(v.x, v.y, v.z);
    if (!swap){
      if (hue < 255)
        hue += 0.1;
       else
         swap = true;
    } else {
      if (hue > 0)
        hue -= 0.1;
       else
       swap = false;
    }
  }
  endShape();
}