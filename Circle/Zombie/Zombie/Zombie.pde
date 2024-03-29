import processing.sound.*;
import de.looksgood.ani.*;

Bob s;
int nSnake = 13;
Snake[] z = new Snake[nSnake];
boolean test = false;
Synth boing;
PFont myfont;

static final int SPLASH = 0;
static final int PLAY = 1; 
static final int LOOSE = 2;
int gameState = SPLASH;

void setup()
{
  size(1200,800);
  //fullScreen();
  Ani.init(this);
 gameStateChange(SPLASH);
}

void draw()
{
if (gameState == PLAY)  game_run();
  if (gameState == SPLASH) splash_run();
  if (gameState == LOOSE) loose_run();
}

void keyPressed()
{
  if (gameState == PLAY)  game_keyPressed();
  if (gameState == SPLASH) splash_keyPressed();
 if (gameState == LOOSE) loose_keyPressed();
}

void mouseClicked()
{
  if (gameState == PLAY)  game_mouseClicked();
  if (gameState == SPLASH) splash_mouseClicked();
  if (gameState == LOOSE) loose_mouseClicked();
}

void gameStateChange(int state)
{
  gameState = state; 
  if (gameState == PLAY)  game_init();
  if (gameState == SPLASH) splash_init();
  if (gameState == LOOSE) loose_init();
}
/*Splash start -----------*/
void splash_init()
{
   s = new Bob("test");
}

void splash_run()
{
  background(255,100,200);
  textAlign(CENTER);
  //textFont(myfont);
  textSize(100);
  fill(255);
  text("Press ANY key",width/2,height/2);
  s.display();
  s.update();
  s.check();
}

void splash_mouseClicked()
{
  
}

void splash_keyPressed()
{
  gameStateChange(PLAY);
}


/*Splash end -----------------------*/

/*Game stuff Start --------------------------------*/

void game_init()
{
   boing = new Synth(this,1);
   s = new Bob("test");
  for(int i =0; i < nSnake; i =  i + 1)
  {
    z[i] = new Snake("snake"+i);
  } 
   
}

void game_run()
{
    background(255);
  fill(230);
  rect(100,100,width-200,height-200);
  s.display();
  s.update();
  s.check();
 //Calls to Snake 
  for(int i =0; i < nSnake; i =  i + 1)
  {
    z[i].display();
    z[i].update();
    z[i].check();
  }  
  boing.display();
  boing.update();
}

void game_keyPressed()
{
    s.acceleration.x = s.acceleration.x * (-1.0);
  s.velocity.x = s.acceleration.x * (-1.0);
}

void game_mouseClicked()
{
  //boing.frequency = random(60,6000);
   boing.hit();
}
/* game stuff end -----------------------------------*/


/* Loose Start---------------*/ 
void loose_init()
{
  s = new Bob("test");
} 
void loose_run()
{
  background(300,100,200);
  s.display();
  s.update();
  s.check();
}

void loose_mouseClicked()
{
  
}

void loose_keyPressed()
{
  gameStateChange(PLAY);
}
