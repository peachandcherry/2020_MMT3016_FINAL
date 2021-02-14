PFont font, font2, font3;
PImage img1_f, img1_b, img2_f, img2_b, img3_f, img3_b,img4_f, img4_b, img5_f, img5_b, img6_f, img6_b, img7_f, img7_b, img8_f, img8_b, img9_f, img9_b;

void setup(){
  
  size(1000,1000);
  font = createFont("darklaunch.ttf",50);
  font2 = createFont("HUDAM.otf",50);
  font3 = createFont("BBI.ttf",50);
 
  noStroke();
  img1_f = loadImage("flower01.png");
  img1_b = loadImage("flower02.png");
  img2_f = loadImage("flower03.png");
  img2_b = loadImage("flower04.png");
  img3_f = loadImage("flower05.png");
  img3_b = loadImage("flower06.png");
  img4_f = loadImage("flower07.png");
  img4_b = loadImage("flower08.png");
  img5_f = loadImage("flower09.png");
  img5_b = loadImage("flower10.png");
  img6_f = loadImage("flower11.png");
  img6_b = loadImage("flower12.png");


}
boolean bMove1 = true;
boolean bMove2 = true;
boolean bMove3 = true;
boolean bMove4 = true;
boolean bMove5 = true;
boolean bMove6 = true;


void draw(){
  smooth();
  background(30,30,30);
  textFont(font);
  textAlign(LEFT,CENTER);
  textSize(100);
  for(int i=0; i<5; i++){
    fill(200, 200+(4*i), 200, 255-(i*70));
    text("Bloom Bloom!", width/2-130,150+(i*25));
  }
  
  //square1
  if(bMove1){
    image(img1_b,160,350,200,200);
  }
  else{
    image(img1_f,160,350,200,200);
    
  }
  //square2
  if(bMove2){
    image(img2_b,400,350,200,200);
  }
  else{
    image(img2_f,400,350,200,200);
  }

  //square3
  if(bMove3){
    image(img3_b, 640,350,200,200);
  }
  else{
    image(img3_f,640,350,200,200);
  }
  //square4
  if(bMove4){
    image(img4_b,160,590,200,200);
  }
  else{
    image(img4_f,160,590,200,200);
  }

  //square5
  if(bMove5){
    image(img5_b,400,590,200, 200);
  }
  else{
    image(img5_f,400,590,200, 200);
  }

  //square6
  if(bMove6){
    image(img6_b,640,590,200,200);
  }
  else{
    image(img6_f,640,590,200,200);
  }

  //square7
  
  textFont(font3);
  fill(200,200,200);
  textSize(25);
  textAlign(CENTER,CENTER);
  text("bloom where you are planted", width/2, 850);
  
  textFont(font2);
  fill(250,250,250);
  textSize(20);
  textAlign(CENTER,CENTER);
  text("*각 네모를 클릭하시면 개개인이 생각하는 '아름다운 꽃'을 보실 수 있습니다*", width/2, 900);
}

void mouseClicked(){
  if((mouseX >= 160 && mouseX <= 360) && (mouseY >= 350 && mouseY <= 550)){
    bMove1 = !bMove1;
  }
  else if((mouseX >= 400 && mouseX <= 600) && (mouseY >= 350 && mouseY <= 550)){
    bMove2 = !bMove2;
  }
  else if((mouseX >= 640 && mouseX <= 840) && (mouseY >= 350 && mouseY <= 550)){
    bMove3 = !bMove3;
  }
  else if((mouseX >= 160 && mouseX <= 360) && (mouseY >= 590 && mouseY <= 790)){
    bMove4 = !bMove4;
  }
  else if((mouseX >= 400 && mouseX <= 600) && (mouseY >= 590 && mouseY <= 790)){
    bMove5 = !bMove5;
  }
  else if((mouseX >= 640 && mouseX <= 840) && (mouseY >= 590 && mouseY <= 790)){
    bMove6 = !bMove6;
  }
}
