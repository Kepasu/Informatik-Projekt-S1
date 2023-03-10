class Oscillator extends Main {
  
  SawOsc saw;
  LowPass lowPass;
  
  float amp;
  float freq;
  float pan;
    
  void updateOsc(Planet p) {
    
    lowPass = new LowPass(this);
    
    saw.amp(map(p.radius, 5, 50, 0, 0.5));
    saw.pan(map(p.getpos().x, -200, width + 200, -0.99, 0.99));
    //lowPass.process(saw);
    saw.freq(map(p.getpos().y, 0, height, 0, 2000));
    //lowPass.process(saw);
    lowPass.freq(5000);
    
    
  }
  
  void play(Planet p) {
    
    saw = new SawOsc(this);
    if (p.getalive() == true) {
      
      saw.play();
      
    } else {
      
      saw.stop();
      
    }
    
  }
  
  void stop() {
    
    saw.stop();
    
  }
  
}
