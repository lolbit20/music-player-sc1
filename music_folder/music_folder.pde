//global variables
int appwidth, appheight;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
//
void setup() {
  size(400, 500); //width, height
  //fullScreen (); //displaywidth, displayheight
  appwidth = width;
  appheight = height;
  //landscape is HARDCODED
  String displayInstructions = ( appWidth >= appheight )? "good to go" : "bru, turn your phun"
  println(displayInstructions);
  //
  //populate
  backgroundx = appwidth;
  backgroundy = appheight;
  backgroundwidth = appwidth;
  backgroundheight = appheight ;
  //layout DIVs
  //rect(X, Y, Width, height);
  rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight);
  int centerX = appwidth*1/2;
  int centerY = appheight*1/2;
  rect(centerX*1/2, centerY*1/2, appwidth*1/2, appheight*1/2)
  
} //end setup
//
void draw() {
} //End draw
//
void keyPressed() {
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
// End MAIN Program
