import processing.sound.*;

Sound s;
int pcount = 7;
int starttime = millis();
int time = 0;

Planet[] planets = new Planet[pcount];

void setup() {
  
  for (int i = 0; i < pcount; i++)  {
    
    planets[i] = new Planet(); //<>//
    planets[i].generate();
    
  }

  size(1000, 1000);
  //fullScreen();
  smooth();
  background(#180C39);
  
  s = new Sound(this);
  
}

void draw() {
  
  float dt = millis() - time;
  time = millis(); //<>//
  
  background(#180C39); //<>//
  
  for (int i = 0; i < pcount; i++) {
        
    if (planets[i].getpos().x > width + 100 | planets[i].getpos().x < -100 | planets[i].getpos().y > height + 100 | planets[i].getpos().y < -100) {
      
      planets[i].setalive(false);
      planets[i].generate();
      
    } else {
      
      for (int j = 0; j < pcount; j++) {
        
        planets[i].applyForce(planets[j]);
        
      }
      
      planets[i].move(dt); //<>//
      planets[i].draw(); //<>// //<>//
      //planets[i].alert();
      
    }
      
  }
  
  //delay(100);
  s.volume(0.5);
  
}
