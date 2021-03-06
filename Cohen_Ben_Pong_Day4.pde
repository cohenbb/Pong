
float gap;    // the distance between the paddle and the bottom of the window 
float circleX;
float circleY=random(150);
float xspeed;
float yspeed=1;
int xrect=200;    // value for width of rect
float yrect=20;   
int xrecttoo=xrect/2;    // created this variable to limit paddle on left side if the size of the paddle changes.
int zconstrain= 640-xrecttoo;            // z value for contrain to limit paddle on right side if the size of the paddle changes
int score=0;




void setup() {
  size(640, 360);
  circleX=random(width);
  gap=height-30;  //makes paddle sit 30 pixels above the bottom of the window
textSize(24);  //makes text size 24


if(random(-1,1) <0 ){   // makes ball start in random position and go in random direction
     xspeed=-1;
}
else {
    xspeed = 1;
}

}
  
  
void draw() {
 fill(255);
 
  
 if (!mousePressed)  {     // when I press mouse, we get crazy rainbow ball
background(50);
}

 text("Score:", width-150, height-340);   // display "score" on window
 text(score, width-75, height-340);


  
  rectMode(CENTER);
  fill(random(255),random(255),random(255));  // randomize color of ball
  circle(circleX, circleY, 20); 
  fill(255);
  mouseX = constrain( mouseX, xrecttoo, zconstrain);  //keeps paddle completely in window 
  rect(mouseX, gap, xrect, yrect);  //the paddle
  circleY=circleY+yspeed;
  circleX=circleX+xspeed;

if(circleX>=width || circleX<0) {  //bounces off right and left side
 xspeed=xspeed*-1;

}

//I see your point why variables are so nice. xrecttoo came in handy here as well 
if (circleX>mouseX-xrecttoo && circleX<mouseX+xrecttoo && circleY>gap-20 ) {  //bounces off paddle
  yspeed=yspeed*-1.5;  //multiplying by 1.5 increases the speed 50% each time the ball hits the paddle
   score=score+1;
}

if(circleY<0 ){   //bounces off top 
 yspeed=yspeed*-1;
}

 if(circleY>=height  ){     //when ball goes past paddle displays game over then Press any key to start over
text("Game Over:( ", 200, 180);
text("Press any key to start over", 150, 200);
    score=0;

if (keyPressed) {
 circleX=random(width);
 circleY=random(150);
 }
}


}       //end

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
