private BasicMothership motherShip;
private Defender defender;
private ArrayList _drawables;

void setup(){
  size(600,600);
  
  defender = new Defender(300,540);
  motherShip = new BasicMothership(1000); 
  ArrayList<BasicShip> ships = motherShip.GetChilds();
  
  for (BasicShip ship : ships) {
     defender.Attach(ship);
  }
  
  _drawables = new ArrayList<IDrawable>();
  
  _drawables.add(defender);
}

void draw(){
  clear();
  
   for (Object drawable : _drawables) {
    if (drawable instanceof IDrawable)
    {
      IDrawable o = (IDrawable) drawable;
      o.Draw();
    }
  }
  
  motherShip.UpdateChilds(millis());
  CheckKeyPresses();
}

void CheckKeyPresses()
{
  if (keyPressed == true)
  {
    if (key == CODED) {
      if (keyCode == LEFT) {
        defender.Left();
      } else if (keyCode == RIGHT) {
        defender.Right();
      } else if (keyCode == UP) {
        defender.Shoot();
      }
    }
  }
}
