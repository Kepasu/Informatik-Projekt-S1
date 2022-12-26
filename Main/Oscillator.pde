
class Oscillator {
  
  SawOsc saw;
  LowPass lowPass;
  
  float amp;
  float freq;
  float pan;
  
  
  
  
  void updateOsc(Planet p) {
    
    amp = p.radius;
    lowPass.process(saw);
    lowPass.freq(p.getpos().x*10);
    
  }
  
  
  void play() {
    
    saw = new SawOsc(this);
    saw.play();
    
  }
  
  void stop() {
    
    //saw.stop();
    
  }
  
  
}
