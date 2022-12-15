class Planet {
  
  float mass;
  float radius;
  PVector position = new PVector();
  PVector velocityms = new PVector();
  PVector accel = new PVector();
  PVector gravityforce = new PVector();
  float situation;
  float gravconst = 6.67430 * pow(10, -11);
  
  public float[] distance = new float[pcount];
  
  
  void generate() {
    
    situation = round(random(1, 4));
    
    if (situation == 1.0) {
      
      position.x = -100;
      position.y = random(-100, 1100);
      
    }
    
    if (situation == 2.0) {
      
      position.x = -100;
      position.y = random(-100, 1100);
      
    }

    if (situation == 3.0) {
      
      position.x = 1100;
      position.y = random(-100, 1100);
      
    }

    if (situation == 4.0) {
      
      position.x = random(-100, 1100);
      position.y = -100;
      
    }
    
    
    
    if (position.x >= 500) {
      
      velocityms.x = - random(0.1, 0.2);
      
    } else {
      
      velocityms.x = random(0.1, 0.2);
      
    }

    if (position.y >= 500) {
      
      velocityms.y = - random(0.1, 0.2);
      
    } else {
      
      velocityms.y = random(0.1, 0.2);
      
    }


    radius = random(5, 20);
    mass = radius * 10000;
    gravityforce.x = 0;
    gravityforce.y = 0;
    
    
  }
  
  public float getposx() {
    
    return position.x;
    
  }
  
  public float getposy() {
    
    return position.y;
    
  }
  
  public void setgravforcex(float gravforce) {
    
    gravityforce.x = gravforce;
    
  }
  
  public void setgravforcey(float gravforce) {
    
    gravityforce.y = gravforce;
    
  }
  
  public void setgravforce(PVector gravforce) {
    
    //Planet.gravityforce = gravforce;
    
  }
  
  public void gravity(int i, int ii) {
    
    float dist = dist(planets[i].getposx(), planets[i].getposy(), planets[ii].getposx(), planets[ii].getposy());
    planets[i].gravityforce.set(planets[ii].position.sub(planets[i].position).normalize().mult(gravconst * (planets[i].mass * planets[ii].mass) / pow(dist, 2)));
    
  }
  
  void move(float dt, PVector gravityforce) {
    
    velocityms.x += gravityforce.x * dt;
    velocityms.y += gravityforce.y * dt;
    
    position.x += (velocityms.x / 10) * dt;
    position.y += (velocityms.y / 10) * dt; 
    
    gravityforce.x = 0;
    gravityforce.y = 0;
  }
  
  void draw() {
    
    if (position.x <= 1000 || position.y <= 1000) {
      
      circle(position.x, position.y, radius);
      
    }
    
  }
  
  void alert() {
    
    System.out.println(); 
    System.out.println("pos: " + position.x + "|" + position.y);
    System.out.println("vel: " + velocityms.x + "|" + velocityms.y);
    System.out.println("situation: " + situation);
    for (int i = 0; i < pcount; i++) {
      
      System.out.println("distance" + i + ": "  + distance[i]);
      System.out.println("gravforce" + i + ": " + gravityforce);
      
    }
    
  }
  
}
