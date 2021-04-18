//Bibek Pokharel
//Project 2  Human Computer Interaction
//Car Dashboard design


boolean cruise = false;
float ll = -0.5;
float yy= -0.1;
int LX = 800;
int LY = 290;
float speed = 0;
int  R = 90;
float AC = 0.01;
int rpm =0;
float RM = 0.02;
int L = 350;
int  Y= 300;
int timer =0;
int count = 0;
int miles = 0;
int temp =0;
float distance = 0;
boolean rightLight = false;
boolean leftLight = false;
PImage img;
PImage img2;
PImage a, b, c, d, e;

void setup(){

  background(0);
  frameRate(60);
  size(1200,1200);
  img = loadImage("st.png");
 img2 = loadImage("Fuel.png");
 
 
 //Images for warning lights
 a = loadImage("A.png");
 b = loadImage("Ab.png");
 c= loadImage("abc.png");
  d= loadImage("abcd.png");
   e= loadImage("abcde.png");
}

void draw(){
  
  //Buttons
  noStroke();
  fill(#494a4d);
  rect(5,5,1180,600);
  rect(150,650,130,70,30);
  rect(290,650,130,70,30);
  rect(430,650,130,70,30);
  rect(580, 650, 150, 70, 30);
  rect(750,650,130,70,30);
  fill(0);
  text("Right",170,690);
  text("Left",320,690);
  text("Emer", 470,690);
  text("Accelerate",600,690);
  text("Cruise",770,690);
  
  //Fuel and engine bars
  fill(#BADEDB);
  rect(462,480,236,103,10);
  fill(#8E6666);
  rect(50,260,40,10);
  rect(50,280,40,10);
  rect(50,300,40,10);
  rect(50,320,40,10);
  //fill(#F2980F);
  rect(50,340,40,10);
  rect(50,360,40,10);
  rect(50,380,40,10);
  rect(50,400,40,10);
  
  fill(#F2980F);
  rect(1100,260,40,10);
  rect(1100,280,40,10);
  rect(1100,300,40,10);
  rect(1100,320,40,10);
  //fill(#F2980F);
  rect(1100,340,40,10);
  rect(1100,360,40,10);
  rect(1100,380,40,10);
  rect(1100,400,40,10);
  
  //inserting image
  img.resize(865,385);
  img2.resize(50,50);
  a.resize(80,80);
  b.resize(80,80);
  c.resize(80,80);
  d.resize(80,80);
  e.resize(80,80);
  image(img,150,95);
  image(img2, 1100,200);
  image (a, 70,5);
  image (b, 224,5);
  image (c, 966,5);
  image (d, 384,5);
  image (e, 697,5);
 
 //Output for RPM and Speed
  textSize(36);
  fill(#22448B);
  rect(290,380,141,60,550);
  rect(730,375,169,60,550);
  fill(#7E8E0E);
  text(int(yy*3), 300,420);
  
  text(int(speed/3.39), 745,420);
  textSize(24);
  text("RPM",350,420);
  text("MPH",820,420);
  text("*1000 RPM", 290,250);
  text("Outside Temperature: 50°",100,550);
  
  text("H",15,270);
  text("C",15,420);
  text("F",1150,270);
  text("E",1150,420);
  

//Side light
 noStroke();
 fill(#0D3633);
 triangle(470, 120, 540, 90, 540, 150);
 triangle(670, 120, 600, 90, 600, 150);
  
  //Milage printing
  textSize(24);
  text("Milage:",480,525);
  text( "Average: 25 MPH", 480,560);
  text(int(distance),630,525);
  
  //Function call
  liner();
  rpm();
  side_light();
  mailage();
  engine_temperature();
  
  
  
  
  if(speed >0){
     distance += 0.009;
   }
   
   if (timer > 100){
     timer = 0;
   }
 
 }

//Function for speedometer
 void liner(){
   if( (mousePressed)&& (mouseX >580 && mouseX <730 && mouseY >650 && mouseY < 720)&& cruise == false){
     
    if (ll < 3.58){
      ll = ll + AC;
      
      speed = (speed+1);
      
      
    }
    }
    else if( cruise == false){
       if( ll > -0.5){
       ll = ll - AC;
      
        if(speed> 0){
          speed = speed - 1;
       }
       
    }
     
    }
    
  stroke(500,134,134);
  strokeWeight(4);
  
  line(LX,LY,LX-cos(ll)*R, LY-sin(ll)*R);
 }
 
 //Function for Techometer
 void rpm(){

   
  if (mousePressed&& (mouseX >580 && mouseX <730 && mouseY >650 && mouseY < 720)&& cruise == false){
    if (yy < 1.3){
      yy = yy + RM;
     
    }
    }
    else if (cruise == false){
       if( yy > -0.1){
       yy = yy - RM;
    
    
    }
    }
   
    
  stroke(500,134,134);
  strokeWeight(4);
  
  line(L,Y,L-cos(yy)*R, Y-sin(yy)*R);
 }
 
  // Function for side lights
 void side_light(){
   if(leftLight && timer <50){
    
     
    fill(#52FA12);
    triangle(470, 120, 540, 90, 540, 150);
     
   }else{
     fill(#494a4d);
     triangle(470, 120, 540, 90, 540, 150);
     
   }
    if(rightLight && timer <50){
    
     
    fill(#52FA12);
   triangle(670, 120, 600, 90, 600, 150);
     
   }else{
     fill(#494a4d);
    triangle(670, 120, 600, 90, 600, 150);
     
   }
    timer++;
 }
 
 
 //Function for Milage count
 void mailage (){
   
   if (mousePressed &&  (mouseX >580 && mouseX <730 && mouseY >650 && mouseY < 720) ){
    if(speed >0){
     distance += 0.009;
   }
 }
 }
 void  engine_temperature(){
   mailage();
   
     if(distance >25){
      fill(#F50A0A);
        rect(1100,260,40,10);
        rect(50,400,40,10);
     }
     if(distance >50){
    fill(#F50A0A);
      rect(1100,280,40,10);
      rect(50,380,40,10);
   }
   if(distance >75){
    fill(#F50A0A);
      rect(50,360,40,10);
       rect(1100,300,40,10);
     }
 }
 
 //Function for different buttons
 void mousePressed(){
   if(mouseX >150 && mouseX <280 && mouseY >650 && mouseY < 720){
     leftLight ^= true;
   }
   
   if(mouseX >290 && mouseX <420 && mouseY >650 && mouseY < 720){
     rightLight ^= true;
   }
   if((mouseX >430 && mouseX <560 && mouseY >650 && mouseY < 720)){
     leftLight ^= true;
     rightLight ^= true;
   }
   if (mousePressed && (mouseX >750 && mouseX<880 && mouseY> 650 && mouseY< 720) ){
     cruise ^= true;
     
   }
   
 }
