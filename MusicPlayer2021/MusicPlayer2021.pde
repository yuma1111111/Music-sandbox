//Libraries
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates object to access all functions
int numberOfSongs = 3;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
int currentSong = numberOfSongs - numberOfSongs; //Current Song is 0

void setup() {
  size(500, 600); //fullScreen(), displayWidth, displayHeight
  population();
  textSetup();
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  song[currentSong] = minim.loadFile("music/yt5s.com - Open It Up edit audio TikTok (Slowed Reverb 8D Audio) (128 kbps).mp3"); //able to pass absolute path, file name, and URL
  song[currentSong+1] = minim.loadFile("Music/[No Copyright Music] Chill Lofi Hip Hop Beat FREE Instrumental (Copyright Free) Chillhop Music.mp3");
  //song1.play(); //Parameter is milli-seconds from start of audio file to start playing
}//End setup()

void draw() {
  powerButtonDraw();
  //
}//End draw()

void keyPressed() {
  //currentSong ++; // = currentSong + 1, += 1
  if ( key == 'l' || key == 'L') song[currentSong].loop(0); //Parameter is Parameter is number of repeats
  //
  if (key == 'p' || key == 'P') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() == song[currentSong].length() ) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong+1].play();
    }
  }
  //
  if (key == 'n' || key == 'N') {
    if ( song[currentSong+1].isPlaying() ) {
      song[currentSong+1].pause();
      song[currentSong+1].rewind();
      //
      arrayFixError();
      //
      song[currentSong+1].play();
    } else {
      song[currentSong+1].rewind();
      arrayFixError();
    }
  } //End Next Button
}//End keyPressed()

/*//PlayPause
 if (key == 'p') {
 if ( song1.isPlaying() ) {
 song1.pause();
 } else if ( song1.position() >= song1.length()-3000 ) {
 song1.pause();
 song1.rewind();
 } else {
 song1.play();
 }
 }
 //Play-Stop
 if (key == 's') {
 if ( song1.isPlaying() ) {
 song1.pause();
 song1.rewind();
 } else {
 song1.rewind();
 }
 }
 //Fast Forward
 if (key == 'f') song1.skip(1000);
 //Fast Rewind
 if (key == 'r') song1.skip(-1000);
 //Mute
 if (key == 'm') { 
 if ( song1.isMuted() ) {
 song1.unmute();
 } else {
 song1.mute();
 }
 }
 //Loop Function
 int loopIntNum = 2; //Loop Hardcode
 if ( key == 'l' || key == 'L' ) song1.loop(loopIntNum); //Play Button
 */
void mousePressed() {
  powerButtonMousePressed();
}//End mousepressed()
