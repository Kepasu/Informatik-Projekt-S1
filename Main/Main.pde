/*
to dos:

Sound
Grafik

*/

import processing.sound.*;

Sound s;

SawOsc Saw;

int pcount = 4;
int starttime = millis();
int time = 0;

Planet[] planets = new Planet[pcount];

void setup() {
  
  for (int i = 0; i < pcount; i++)  {
    
    planets[i] = new Planet(); //<>//
    planets[i].generate();
    Saw = new SawOsc(this);
    Saw.play();
    
  }

  size(1000, 1000);
  fullScreen();
  smooth();
  background(#180C39);
  
  //Sound.list();
  s = new Sound(this);
  
}

void draw() {
  
  float dt = millis() - time;
  time = millis(); //<>//
  
  background(#180C39); //<>//
  
  for (int i = 0; i < pcount; i++) {
        
    if (planets[i].getpos().x > width + 100 | planets[i].getpos().x < -100 | planets[i].getpos().y > height + 100 | planets[i].getpos().y < -100) {
      
      planets[i].generate();
      
    } else {
      
      for (int j = 0; j < pcount; j++) {
        
        planets[i].applyForce(planets[j]);
        
      }
      
      planets[i].move(dt);
      planets[i].draw();
      //planets[i].alert();
      
    }
      
  }
  
  //delay(100);
  
}
