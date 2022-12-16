/*
to dos:

Gravitationsverhalten
Sound?

*/

//import processing.sound.*;

int pcount = 5;
int starttime = millis();
int time = 0;
int a = 1;
float v;
float gravconst = 6.67430 * pow(10, -11);

Planet[] planets = new Planet[pcount];


void setup() {
  
  for (int i = 0; i < pcount; i++)  {
    
    planets[i] = new Planet(); //<>//
    planets[i].generate();
    
  }
  
  size(1000, 1000);
  background(#180C39);
  
}

void draw() {
  
  float dt = millis() - time;
  time = millis(); //<>//
  
  background(#180C39);
  
  
  
  
  
  for (int i = 0; i < pcount; i++) { //<>//
    
    for (int ii = 0; ii < pcount; ii++) { //<>//
      
      //planets[i].distance[ii] = dist(planets[i].getposx(), planets[i].getposy(), planets[ii].getposx(), planets[ii].getposy());  //<>//
      
    }
    
    planets[i].alert();
    
  }
  
   //<>// //<>// //<>// //<>//
  
  for (int i = 0; i < pcount; i++) {
        
      planets[i].draw();
      planets[i].move(dt, planets[i].gravityforce);
    
  }
  
  for (int i = 0; i < pcount; i++) {
    
    for (int ii = 0; ii < pcount && ii != i; ii++) {
        
    //planets[i].gravityforce.x += gravconst * ((planets[i].mass * planets[ii].mass) / pow(planets[i].distance[ii], 2));
    //planets[i].gravityforce.y += gravconst * ((planets[i].mass * planets[ii].mass) / pow(planets[i].distance[ii], 2));
    
       planets[i].gravity(i, ii);
    
    }
    
  }
  
  for (int i = 0; i < pcount; i++) {
    
    if (planets[i].getposx() > 1100 | planets[i].getposx() < -100 | planets[i].getposy() > 1100 | planets[i].getposy() < -100) {
      
      planets[i].generate();
      
    }
    
  }
  
  //delay(100);
  
}
