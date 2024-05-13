import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer music & sound2;
AudioPlayer playList1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
//
int appWidth, appHeight;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float albumCoverX, albumCoverY, albumCoverWidth, albumCoverHeight;
float playButtonX, playButtonY, playButtonWidth, playButtonHeight;
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
int size;
PFont generalFont;
String quit="QUIT";
//
color backgroundColour, darkBackground=0, whiteBackground=255; //Gray Scale, note much smaller than COLOR
color foregroundColour;
color white=255, yellow=#FFFF00, black=0, purple=#FF00FF; //Hexidecimal, see Tools / Colour Selector
Boolean whiteMode=false;
//
void setup() {
  //size(400, 500); //width, height
  fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth;
  appHeight = displayHeight;
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "have a good day" : "see you soon!";
  println(displayInstructions);
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String extension = "mp3";
  String quitButtonSound = "Spring_Attic_Door";
  String pathwaySoundEffects = "../../../../Audio/SoundEffect/"; //Relative Path
  //println ( pathwaySoundEffects+quitButtonSound+extension );
  String path = sketchPath( pathwaySoundEffects + quitButtonSound + extension ); //Absolute Path
  //println ( path );
  soundEffects1 = minim.loadFile( path );
  //playList1 = minim.loadFile( path );
  //
  //Fonts from OS (Operating System)
  //String[] fontList = PFont.list(); //To list all fonts available on OS
  //printArray(fontList); //For listing all possible fonts to choose from, then createFont
  size = ( appWidth > appHeight ) ? appHeight : appWidth ; // Font size starts with smaller dimension
  generalFont = createFont("Harrington", size);
  //bottomFont = createFont("", size); //Note: more than one font allowed
  // Tools / Create Font / Find Font / Use size field / Do not press "OK", known bug
  //
  //Population
  backgroundX = appWidth*0;
  backgroundY = appHeight*0;
  backgroundWidth = appWidth;
  backgroundHeight = appHeight;
  albumCoverX = appWidth*18/100; //Percents Example
  albumCoverY = appHeight*15/100;
  albumCoverWidth = appWidth*64/100;
  albumCoverHeight = appHeight*6/16; //Fraction Example
  playButtonX = appWidth*3.5/8;
  playButtonY = appHeight*8/9;
  playButtonWidth = appWidth*1/8;
  playButtonHeight = appHeight*1/12;
  quitButtonX = appWidth*90/100;
  quitButtonY = appHeight*91/100;
  quitButtonWidth = appWidth*9/100;
  quitButtonHeight = appHeight*8/100;
  //Layout DIVs
  //rect(X, Y, Width, Height);
  //rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight);
  int centerX = appWidth*1/2;
  int centerY = appHeight*1/2;
  //rect(centerX*1/2, centerY*1/2, appWidth*1/2, appHeight*1/2);
  rect(albumCoverX, albumCoverY, albumCoverWidth, albumCoverHeight);
  //rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  //
  //Variable Population
  //if ( hour()>=9 && hour()<=17 ) backgroundColour = whiteBackground;
  //if ( hour()<9 && hour()>17 ) backgroundColour = darkBackground;
  if ( whiteMode==true && hour()>=9 && hour()<=17 ) {
    backgroundColour = whiteBackground;
    foregroundColour = black;
  } else {
    backgroundColour = darkBackground;
    foregroundColour = yellow; //Note: if(hour()<9&&hour()>17)
    if ( hour()>=9 && hour()<=17 ) foregroundColour = white;
  }
  //
  //soundEffects1.loop();
} //End setup
//
void draw() {
  background(backgroundColour);
  fill(foregroundColour);
  //
  //Quit Button
  //fill(purple);
  //if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) fill(yellow);
  fill(purple);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) {
    fill(yellow);
    rect( quitButtonX+quitButtonWidth*1/7, quitButtonY+quitButtonHeight*1/7, quitButtonWidth*5/7, quitButtonHeight*5/7);
  } else {
    fill(purple);
  }
  fill(foregroundColour); //Resetting the Defaults
  //Quit, Text
  fill(foregroundColour); //Ink
  textAlign( CENTER, CENTER ); //Align X&Y, see Processing.org / Reference
  //Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]
  size = appHeight*1/23; // Var based on ratio of display
  textFont(generalFont, size);
  text(quit, quitButtonX+quitButtonWidth*1/7, quitButtonY+quitButtonHeight*1/7, quitButtonWidth*5/7, quitButtonHeight*5/7); //Inside rect() above
  fill(foregroundColour); //Resetting the Defaults
  //

  //println(mouseX, mouseY);

  //
} //End draw
//
void keyPressed() { //Listener
  if (key=='Q' || key=='q')
  {
    soundEffects1.loop(0);
    delay(2650); //Parameter: milliseconds
    exit();
  }
  if (key==CODED && keyCode==ESC) //Hardcoded QUIT, no sound available
  {
    soundEffects1.loop(0);
    delay(2650); //Parameter: milliseconds
    exit();
  }
  if (key=='W' || key=='w') ;
  
  //soundEffects1.loop(0);
  
  
} //End keyPressed
//
void mousePressed() { //Listener
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight )
  {
    soundEffects1.loop(0);
    delay(2650); //Parameter: milliseconds
    exit();
  }
} //End mousePressed
//
// End MAIN Program
