PFont font;
color setColor = color(0);
int func = 1;
int number = 1;
int pencilThickness = 1;
int brushThickness = 10;
int eraseThickness = 10;
int b1 = 0;
int b2 = 100;
PImage pencilIcon;
PImage brushIcon;
PImage eraseIcon;
PImage saveIcon;
PImage eraseAllIcon;
String str = "";
String str2 = "";


void setup(){
  font = createFont("SSSB.ttf",70);
  size(800,900);
  background(0,0,0);
  fill(255);
  textSize(150);
  noStroke();
  rect(25,125,750,750);
  pencilIcon = loadImage("pencilIcon.png");
  brushIcon = loadImage("brushIcon.png");
  eraseIcon = loadImage("eraseIcon.png");
  eraseAllIcon = loadImage("eraseAllIcon.png");
  saveIcon = loadImage("saveIcon.png");

}

void draw(){
  /*연필*/
  button(25,25,color(220,220,220,80),1);
  /*브러쉬*/
  button(110,25,color(192,192,192,80),2);
  /*지우기*/
  button(195,25,color(169,169,169,80),3);
  /*전체 지우기*/
  button(280,25,color(128,128,128,80),4);
  /*저장*/
  button(365,25,color(105,105,105,80),5);
  /*각 function별 버튼, 커서, 역할 설정*/
  if(func==1){
    stroke(200, 0, 0);
    fill(220,220,220);
    rect(25,25,75,75);
    cursor(pencilIcon,2,25);
    pencil();
  }
  else if(func==2){
    stroke(200, 0, 0);
    fill(192,192,192);
    rect(110,25,75,75);
    cursor(brushIcon,2,25);
    brush();
  }
  else if(func==3){
    stroke(200, 0, 0);
    fill(169,169,169);
    rect(195,25,75,75);
    cursor(eraseIcon,2,25);
    erase();
  }
  else if(func==4){
    stroke(200, 0, 0);
    fill(128,128,128);
    rect(280,25,75,75);
    fill(255);
    noStroke();
    cursor(eraseAllIcon,25,25);
    str = "";
    rect(25,125,750,750);
  }
  /*각 function별 역할 - 연필, 브러쉬, 지우개*/
  fill(220,220,220);
  noStroke();
  rect(514,25,146,75);
  if(func==1){
    stroke(setColor);
    strokeWeight(pencilThickness);
  }
  else if(func==2){
    stroke(setColor);
    strokeWeight(brushThickness);
  }
  else if(func==3){
    stroke(255);
    strokeWeight(eraseThickness);
  }
  noFill();
  /*곡선 그림 - 두께 보여줄 때*/
  bezier(537, 42+20, 558, 20+20, 611, 65+20, 635, 42+20);
  /*펜, 지우개 두께 변경 기능*/
  thicknessButton(475,45);
  thicknessButton(663,45);
  stroke(0);
  line(483,62,502,62);
  line(672,62,689,62);
  line(681,54,681,70);
  /*icon*/
  image(pencilIcon,25+12.5,25+12.5);
  image(brushIcon,25+85+12.5,25+12.5);
  image(eraseIcon,25+12.5+85*2,25+12.5);
  image(eraseAllIcon,25+12.5+85*3,25+12.5);
  image(saveIcon,25+12.5+85*4,25+12.5);
}

/*두께 조절*/
void thicknessButton(int x, int y) {
  stroke(255);
  strokeWeight(2);
  fill(225);
  rect(x, y, 35, 35);
  if ((mouseX>x && mouseX<x+35)&&(mouseY>y&&mouseY<y+35)) {
    stroke(255, 150, 150);
    rect(x, y, 35, 35);
    if (mousePressed&&(mouseX>x&& mouseX<x+35) && (mouseY>y&&mouseY<y+35)) {
      stroke(255, 210, 210);
      rect(x, y, 35, 35);
      /*-버튼*/
      if (x==475) {
        if (func==1&&pencilThickness>=2) {
          pencilThickness --;
        }
        else if (func==2&&brushThickness>=2) {
          brushThickness --;
        }
        else if (func==3&&eraseThickness>=2) {
          eraseThickness --;
        }
      }
      /*+버튼*/
      else if (x==663) {
        if (func==1&&pencilThickness<=45) {
          pencilThickness ++;
        }
        else if (func==2&&brushThickness<=45) {
          brushThickness ++;
        }
        else if (func==3&&eraseThickness<=45) {
          eraseThickness ++;
        }
      }
    }
  }
}

void button(int x, int y, color c, int b) {
  fill(c);
  stroke(255);
  strokeWeight(3);
  rect(x, y, 75, 75);
  if ((mouseX>x&&mouseX<x+75)&&(mouseY>y&&mouseY<y+75)) {
    stroke(255, 150, 150);
    rect(x, y, 75, 75);
    /*눌렀을 때 어떤 func인지(연필, 브러쉬, 지우개, 모두 지우기) 설정해줌*/
    if (mousePressed&&(mouseX>x &&mouseX<x+75)&&(mouseY>y&&mouseY<y+75)&&(b<5)) {
      stroke(255, 210, 210);
      rect(x, y, 75, 75);
      func = b;
    }
    /*저장*/
    else if ((mouseX>x&&mouseX<x+75)&&(mouseY>y&&mouseY<y+75)&&(b==5)&&mousePressed) {
      stroke(255, 210, 210);
      fill(105,105,105);
      rect(x, y, 75, 75);
      PImage partialSave = get(25,125,750,750);
      partialSave.save("/show/data/flower" + nf(number,2) + ".png");
      number++;
    }
  }
}
/*연필*/
void pencil() {
  if (mousePressed&&(mouseX>25+pencilThickness/2)&&(mouseY>125+pencilThickness/2)&&(mouseX<25+750-pencilThickness/2)&&(mouseY<125+750-pencilThickness/2)&&(pmouseX>25+pencilThickness/2)&&(pmouseY>125+pencilThickness/2)&&(pmouseX<25+750-pencilThickness/2)&&(pmouseY<125+750-pencilThickness/2)) {
    stroke(setColor);
    strokeWeight(pencilThickness);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
/*브러쉬*/
void brush() {
  if (mousePressed&&(mouseX>25+brushThickness/2&&mouseX<25+750-brushThickness/2)&&(mouseY>125+brushThickness/2&&mouseY<125+750-brushThickness/2)&&(pmouseX>25+brushThickness/2&&pmouseX<25+750-brushThickness/2)&&(pmouseY>125+brushThickness/2&&pmouseY<125+750-brushThickness/2)) {
    if (b1<brushThickness) {
      b1++;
    }
    b2-=1;
    if (b2<0) {
      b2=0;
    }
    stroke(red(setColor)+b2, green(setColor)+b2, blue(setColor)+b2);
    strokeWeight(b1);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
/*브러쉬 명도 조절용*/
void mouseReleased() {
  b1=0;
  b2=100;
}
/*지우개*/
void erase() {
  if (mousePressed&&(mouseX>25+eraseThickness&&mouseX<25+750-eraseThickness/2)&&(mouseY>125+eraseThickness/2&&mouseY<125+750-eraseThickness/2)&&(pmouseX>25+eraseThickness/2&&pmouseX<25+750-eraseThickness/2)&&(pmouseY+eraseThickness/2>125&&pmouseY<125+750-eraseThickness/2)) {
    stroke(255);
    strokeWeight(eraseThickness);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
/*타이핑*/
void keyPressed(){
    noStroke();
    fill(30,30,30);
    rect(25,125,750,750);
    textFont(font);
    fill(200,200,200);
    textAlign(CENTER,CENTER);
    str += key;
    text(str,width/2,height/2);
    if(key == ENTER){
        text(str2,width/2,height/2+100);
    }    
}
