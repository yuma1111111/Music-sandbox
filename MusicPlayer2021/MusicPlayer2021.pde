//Libraries
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3

void setup() {
  size(500, 600); //fullScreen(), displayWidth, displayHeight
  population();
  textSetup();
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  song1 = minim.loadFile("Music/[No Copyright Music] Chill Lofi Hip Hop Beat FREE Instrumental (Copyright Free) Chillhop Music.mp3"); //able to pass absolute path, file name, and URL
  song1.play(); //Parameter is milli-seconds from start of audio file to start playing
}//End setup()

void draw() {
  powerButtonDraw();
}//End draw()

void keyPressed() {
   //PlayPause
  if (key == 'p') {
    if ( song1.isPlaying() ) {
      song1.pause();
    } else {
      song1.play();
    }
  }
}//End keyPressed()

void mousePressed() {
  powerButtonMousePressed();
}//End mousepressed()
