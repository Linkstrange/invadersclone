class Projectile extends Subject implements IDrawable {
  private int XPos;
  private int YPos;
  
  public Projectile(int x, int y) {
    XPos = x;
    YPos = y;
  }
  
  public void Update(){
    YPos-= 30;
    
    if(YPos <= 0) {
      try{
       finalize();
     }
     catch(Throwable ex){}
    }
    
    SetState(XPos+","+YPos);
    Notify();
  }
    
  public void Draw(){
    rect(XPos,YPos, 30, 20);
    Update();
  }
}
