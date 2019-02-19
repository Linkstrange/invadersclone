import java.util.ArrayList;

class BasicMothership extends Subject {
  private int RefreshRatio;
  private int LastRefreshed;
  
  private int LeftMargin = 50;
  private int RightMargin = 50;
  private int DownMargin = 400;
  
  private ArrayList<BasicShip> Childs = new ArrayList<BasicShip>();
  
  public BasicMothership(int RefreshRatio){
    this.RefreshRatio = RefreshRatio;
    SpawnChilds();
  }
  
  public ArrayList<BasicShip> GetChilds(){
    return Childs;
  }
  
  private void SpawnChild(int x,int y){
    BasicShip child = new BasicShip(x,y);
    Childs.add(child);
    Attach(child);
  }
  
  public void SpawnChilds(){
    for(int y=50; y<200; y+=30){
       for(int x=50; x<550; x+=25){
         SpawnChild(x, y);
       }
    }
  }
  
  private void MoveLeft(){
    if(LeftMargin > 0) {
      SetState("left");
      LeftMargin-=10;
      RightMargin+=10;
    }
  }
  
  private void MoveRight(){
    if(RightMargin > 0) {
      SetState("right");
      LeftMargin+=10;
      RightMargin-=10;
    }
  }
  
  private void MoveDown(){
    if(DownMargin > 0) {
      SetState("down");
      DownMargin-=10;
    }
  }
  
  public void UpdateChilds(int time){
    SetState("none");
    
    if(time - LastRefreshed >= RefreshRatio){
       float r = random(4);
    
       switch((int)r) {
         case 0:
           MoveLeft();
         break;
         case 1:
           MoveRight();
         break;
         default:
           MoveDown();
         break;
       }
       
       LastRefreshed = time;
    }
 
    Notify();
  }
}
