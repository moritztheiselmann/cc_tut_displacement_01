float x1;
float x2;
float y1;
float y2;
int nSegments = 1000;
float xoff = 0;
int nLines = 50;

void setup() {
  size(1000, 1000);
  
  x1 = 0;
  y1 = height/2;
  x2 = width;
  y2 = height/2;
  
  noiseSeed(66666);
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  strokeWeight(3);
  
  float segmentLength = width / nSegments;
  pushMatrix();
  translate(x1, y1);
  for(int l = 0; l < nLines; l++) {
    //beginShape();
    xoff = 0;
    if(l == 0) {
      strokeWeight(2);
      stroke(255, 200);
    }
    else {
      strokeWeight(random(0.5, 1.5));
      stroke(255, random(50, 100));
    }
    for(int n = 0; n <= nSegments; n++) {
      float dx = random(-10, 10) + segmentLength*n;
      float amp = random(100, 250);
      float dy = map(noise(xoff), 0, 1, -amp, amp);
      point(dx, dy);
      xoff += 0.001;
    }
    noFill();
    
    //endShape();
  }
  popMatrix();
  
  noLoop();
  //println(frameRate);
}
