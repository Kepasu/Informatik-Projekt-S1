class Planet {
  
  float mass;
  float radius;
  PVector position = new PVector();
  PVector accel = new PVector();
  PVector velocityms = new PVector();
  //PVector gravityforce = new PVector();
  int situation;
  float gravconst = 6.67430 * pow(10, -11);
  boolean alive;
  Oscillator Osc;
  
  public float[] distance = new float[pcount];
  
  void generate() {
    
    setalive(true);
    
    Osc = new Oscillator();
    
    position.x = 0;
    position.y = 0;
    
    situation = int(random(1, 4));
    
    if (situation == 1.0) {
      
      position.x = -100;
      position.y = random(-100, height + 100);
      
    }
    
    if (situation == 2.0) {
      
      position.x = random(-100, width + 100);
      position.y = height + 100;
      
    }

    if (situation == 3.0) {
      
      position.x = width + 100;
      position.y = random(-100, height + 100);
      
    }

    if (situation == 4.0) {
      
      position.x = random(-100, width + 100);
      position.y = -100;
      
    }
    
    
    
    if (position.x >= width / 2) {
      
      velocityms.x = - random(0.1, 0.2);
      
    } else {
      
      velocityms.x = random(0.1, 0.2);
      
    }

    if (position.y >= height / 2) {
      
      velocityms.y = - random(0.1, 0.2);
      
    } else {
      
      velocityms.y = random(0.1, 0.2);
      
    }


    radius = random(5, 50);
    //mass = (3/4) * PI * pow(radius * 1000, 3) * 551000;
    mass = radius / 5;
    //gravityforce.x = 0;
    //gravityforce.y = 0;
    Osc.play(this);
    
  }
  
  /*
  public void update() {
    
    Osc.updateOsc(this);
    
  }
  */
  
  public boolean getalive() {
    
    return alive;
    
  }
  
  public void setalive(boolean a) {
    
    alive = a;
    
  }
  
  public PVector getpos() {
    
    return position;
    
  }
    
  
  
  
  public PVector calcGravity() {
    
    PVector ftotal = new PVector(0,0,0);
    for (int i=0; i < pcount; i++) {
      
      float dist = dist(getpos().x, getpos().x, planets[i].getpos().x, planets[i].getpos().y);
      
      if (dist > 0) {
        
        PVector f = planets[i].position.sub(getpos()).normalize().mult(0.001 * (planets[i].mass * mass) / pow(dist, 2));
        ftotal.add(f);
        
      }
      
    }
    
    return ftotal;
    
  }
  
  void applyForce(Planet other) {
    
    PVector force = PVector.sub(other.getpos(), getpos());
    float dist = force.mag();
    dist = constrain(dist, 5.0, 25.0);
    force.normalize();
    float strength = (0.0008 * mass * other.mass) / pow(dist, 2);
    force.mult(strength);
    accel.add(force);
    
  }
  
  public PVector calcAccel() {
    
    PVector accel = new PVector();
    
    accel.x = calcGravity().x / mass;
    accel.y = calcGravity().y / mass;
    
    return accel;
    
  }
  
  void move(float dt) {
    
    velocityms.x += accel.x * dt;
    velocityms.y += accel.y * dt;
    
    position.x += velocityms.x / 5 * dt;
    position.y += velocityms.y / 5 * dt; 
    
    //gravityforce.x = 0;
    //gravityforce.y = 0;
    
    accel.x = 0;
    accel.y = 0;
    
  }
  
  void draw() {
    
    if (position.x <= width || position.y <= height) {
      
      circle(position.x, position.y, radius);
      //filter(BLUR);
      
    }
    
    Osc.updateOsc(this);
    
  }
  
  void alert() {
    
    System.out.println(); 
    System.out.println("pos: " + position.x + "|" + position.y);
    System.out.println("vel: " + velocityms.x + "|" + velocityms.y);
    System.out.println("acc: " + accel.x + "|" + accel.y);
    System.out.println("radius: " + radius + " | " + "mass: " + mass);
    
  }
  
}
