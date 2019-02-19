class Defender extends Subject implements IDrawable,Observer {
  private int XPos;
  private int YPos;
  
  private ArrayList<Projectile> projectiles;
 
  public Defender(int x, int y) {
    XPos = x;
    YPos = y;
    projectiles = new ArrayList<Projectile>();
  }
  
  public void Left(){
    if(XPos > 0){
      XPos -= 10; 
    }
  }
  
  public void Right(){
    if(XPos < 570){
      XPos += 10; 
    }
  }
  
  public void Shoot(){
    Projectile projectile = new Projectile(XPos, YPos);
    projectiles.add(projectile);
    projectile.Attach(this);
  }
  
  public void Update(String state){
     SetState(state);
     Notify();
  }
  
  public void Draw(){
    rect(XPos,YPos, 30, 20);
    for (Projectile projectile : projectiles) {
      if ( projectile != null){
         projectile.Draw();
      }
    }
  }
}
