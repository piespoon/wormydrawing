/* @pjs preload="icons.004.png"; preload="icons.001.png";preload="icons.002.png";preload="icons.003.png"; */

PImage wipe=loadImage("icons.004.png");
PImage rubber=loadImage("icons.001.png");
PImage pencil=loadImage("icons.002.png");
PImage worm=loadImage("icons.003.png");

Audio audio=new Audio();

boolean d=false;
int r=0;
int g=0;
int b=0;
float s=25;

int mode=0;

void setup() {
  size(640,960);
  background(0);
  noStroke();
}

void draw() {
  if (d) {
    if (mode==0) {
      fill(random(255),random(255),random(255));
      ellipse(mouseX,mouseY,s,s);
    }
    if (mode==1) {
      fill(0);
      ellipse(mouseX,mouseY,46,46);
    }
    if (mode==2) {
      fill(255);
      ellipse(mouseX,mouseY,24,24);
    }    
  }
  
  if (mode==2) {
    noTint();
  }
  else {
    tint(128,128,128);
  }
  image(pencil,200,840);
  
  noTint();
  image(wipe,40,840);
  
  if (mode==1) {
    noTint();
  }
  else {
    tint(128,128,128);
  }
  image(rubber,120,840);
  
  if (mode==0) {
    noTint();
  }
  else {
    tint(128,128,128);
  }
  image(worm,280,840);
}



void mouseDragged() {
  s=s + 0.7;
}

void mouseReleased() {
 s=25;

  if ((mouseY>840) && (mouseY<920) && (mouseX>40) && (mouseX<120) && !d) {
    background(0);
    play("Error");
  }
  if ((mouseY>840) && (mouseY<920) && (mouseX>120) && (mouseX<200) && !d) {
    mode=1;
    play("Coin_2");
  }
  if ((mouseY>840) && (mouseY<920) && (mouseX>200) && (mouseX<280) && !d) {
    mode=2;
    play("Coin_3");
  }
  if ((mouseY>840) && (mouseY<920) && (mouseX>280) && (mouseX<360) && !d) {
    mode=0;
    play("Coin_1");
  }
  
  d=false;
} 

void mousePressed() {
  if (!((mouseY>840) && (mouseY<920) && (mouseX>40) && (mouseX<360))) {
    d=true;
  }
}

void play(String s) {
  if (audio.canPlayType && audio.canPlayType("audio/ogg")) {
    audio.setAttribute("src",s+".ogg");
  }
  else {
    audio.setAttribute("src",s+".mp3");
  }
  audio.play();
}


