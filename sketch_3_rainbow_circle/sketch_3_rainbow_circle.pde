void setup() {
  size(1000, 1000);
  noStroke();
  background(50);  // setting background with rgb and then changing it
  colorMode(HSB);
}

void draw() {
  translate(width/2, height/2);
  int reference = frameCount;
  while (reference > 255) reference -= 255;  // to keep it in range always

  rotate(radians(frameCount));  // we rotate with frameCount and not reference
  fill(reference, 255, 255);
  triangle(0, 0, sin(radians(1))*100, -cos(radians(1))*500, -sin(radians(1))*500, -cos(radians(1))*500); // basic triangle calculation
}
