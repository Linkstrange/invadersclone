class BasicShip implements Observer,IDrawable {
  private int XPos;
  private int YPos;
  
  private boolean Alive = true;
  public BasicShip(int x, int y) {
    XPos = x;
    YPos = y;
  }
  
  public void Update(String state){
    switch(state){
       case "none":
       break;
       case "left":
          XPos-=10;
       break;
       case "right":
          XPos+=10;
       break;
       case "down":
          YPos+=10;
       break;
       case "up":
          YPos-=10;
       break;
       default:
          CheckForDestruction(state);
       break;
    }
    
    Draw();
  }
  
  public void CheckForDestruction(String state){
     int posX = Integer.parseInt(state.split(",")[0]);
     int posY = Integer.parseInt(state.split(",")[1]);
     
     if(abs(posX-XPos) <= 10 && abs(posY-YPos) <= 10){ 
        Alive = false;
      }
  }
  
  public void Draw(){
    if(Alive) {
     rect(XPos,YPos, 20, 20);
    }
  }
}
