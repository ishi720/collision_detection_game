/* @pjs preload="nigero.png,nigero2.png,tomare.png,tomare2.png,ball.png,ball2.png,pp.png,hi.png,k1.jpg,k2.jpg,k3.jpg"; */
Block [] b;//壁・敵・ゴール
PlayerCircle pc;
PlayerSquare ps;
PlayerTriangle pt;

PImage sikaku;
PImage sankaku;
PImage ball;

int scene;//画面｛スタート画面、プレイ画面、ゲームオーバー、ゲームクリア｝
int figure;//図形｛四角形、三角形、円｝
PImage bg1, bg2, bg3;//背景の画像
int kaz;
int i;

void setup() {
  size(821, 777);//画面のサイズ
  frameRate(50);


  sikaku = loadImage("nigero.png");
  sankaku = loadImage("tomare.png");
  ball = loadImage("ball2.png");

  scene = 0;
  figure = 1;
  kaz = 44;

  bg1 = loadImage("k1.jpg");
  bg2 = loadImage("k2.jpg");
  bg3 = loadImage("k3.jpg");

  pc=new PlayerCircle(700, 700);
  ps=new PlayerSquare(700, 700);
  pt=new PlayerTriangle(700, 700);

  b = new Block[kaz];

  //ゴールブロック
  b[0] = new Block(320, 0, 210, 150, 3);
  //動くブロック縦方向
  b[1]=new Block(50, 100, 50, 50, 0);
  b[2]=new Block(50, 200, 50, 50, 0);
  b[3]=new Block(50, 300, 50, 50, 0);
  b[4]=new Block(50, 400, 50, 50, 0);
  b[5]=new Block(50, 500, 50, 50, 0);
  b[6]=new Block(50, 600, 50, 50, 0);
  b[7]=new Block(50, 700, 50, 50, 0);
  b[8]=new Block(50, 800, 50, 50, 0);
  //動くブロック横方向
  b[9]=new Block(100, 50, 50, 50, 1);
  b[10]=new Block(200, 50, 50, 50, 1);
  b[11]=new Block(300, 50, 50, 50, 1);
  b[12]=new Block(400, 50, 50, 50, 1);
  b[13]=new Block(500, 50, 50, 50, 1);
  b[14]=new Block(600, 50, 50, 50, 1);
  b[15]=new Block(700, 50, 50, 50, 1);
  b[16]=new Block(800, 50, 50, 50, 1);
  //止まっているブロック
  b[17]=new Block(270, 0, 50, 50, 2);
  b[18]=new Block(270, 50, 50, 50, 2);
  b[19]=new Block(270, 100, 50, 50, 2);
  b[20]=new Block(270, 150, 50, 50, 2); 
  b[21]=new Block(320, 175, 50, 50, 2);
  b[22]=new Block(370, 200, 50, 50, 2);
  b[23]=new Block(420, 225, 50, 50, 2);
  b[24]=new Block(470, 225, 50, 50, 2);
  b[25]=new Block(520, 225, 50, 50, 2);
  b[26]=new Block(570, 225, 50, 50, 2);
  b[27]=new Block(620, 225, 50, 50, 2);
  b[28]=new Block(200, 500, 50, 50, 2);
  b[29]=new Block(250, 500, 50, 50, 2);
  b[30]=new Block(300, 450, 50, 50, 2);
  b[31]=new Block(350, 450, 50, 50, 2);
  b[32]=new Block(400, 450, 50, 50, 2);
  b[33]=new Block(450, 450, 50, 50, 2);
  b[34]=new Block(500, 450, 50, 50, 2);
  b[35]=new Block(550, 450, 50, 50, 2);
  b[36]=new Block(300, 400, 50, 50, 2);
  b[37]=new Block(665, 450, 50, 50, 2);
  b[38]=new Block(715, 450, 50, 50, 2);
  b[39]=new Block(765, 450, 50, 50, 2);
  b[40]=new Block(815, 450, 50, 50, 2);
  b[41]=new Block(530, 0, 50, 50, 2);
  b[42]=new Block(530, 50, 50, 50, 2);
  b[43]=new Block(530, 100, 50, 50, 2);
}

void draw() {
  background(0);
  noStroke();
  //スタート画面--------------------------------------------------------
  if (scene == 0) {
    //三角形の頂点
    PVector v1;
    PVector v2;
    PVector v3;

    v1=new PVector(370, 460);
    v2=new PVector(400, 400);
    v3=new PVector(430, 460);

    float pa=370;
    float pb=460;
    float pc=400;
    float pd=400;  
    float pe=430;
    float pf=460;
    float r=60;

    image(sikaku, 200, 400, 60, 60);
    //rect(200, 400, 60, 60);//四角

    image(sankaku, pa, 400, 60, 60);
    //triangle(v1.x, v1.y, v2.x, v2.y, v3.x, v3.y);//三角

    image(ball, 530, 400, 60, 60);
    //ellipse(550, 430, r, r);//円

    //四角形の当たり判定
    if ((mouseX >= 200 && mouseX <= 260 && mouseY >= 400 && mouseY <= 450)
      && mousePressed) {

      PImage sikaku2;
      sikaku2 = loadImage("nigero2.png");
      image(sikaku2, 200, 400, 60, 60);
      //rect(200, 400, 60, 60);
      figure=1;
    }
    //三角形の当たり判定
    else if (((pe*(pb-pd)+pf*(pc-pa)+pa*pd-pc*pb)
      *(mouseX*(pb-pd)+mouseY*(pc-pa)+pa*pd-pc*pb)>0)
      &&  ((pa*(pd-pf)+pb*(pe-pc)+pc*pf-pe*pd)
      *(mouseX*(pd-pf)+mouseY*(pe-pc)+pc*pf-pe*pd)>0)
      &&  ((pc*(pf-pb)+pd*(pa-pe)+pe*pb-pa*pf)
      *(mouseX*(pf-pb)+mouseY*(pa-pe)+pe*pb-pa*pf)>0)
      && mousePressed) {

      PImage sankaku2;
      sankaku2 = loadImage("tomare2.png");
      image(sankaku2, pa, 400, 60, 60);
      //triangle(pa, pb, pc, pd, pe, pf);
      figure=2;
    }
    //円の当たり判定
    else if (((550-mouseX)*(550-mouseX)+(430-mouseY)*(430-mouseY) <= (r/2)*(r/2))
      && mousePressed) {

      PImage maru;
      maru = loadImage("ball.png");
      image(maru, 530, 400, 60, 60);
      //ellipse(550, 430, 60, 60);
      figure=3;
    }
    fill(255, 255, 0);
    PFont font = createFont("MS-Gothic", 26, true);
    textFont(font);
    text("操作するものをクリックして\nスタートボタンを押してください。", 200, 300);
    text("何もクリックしないで\nスタートボタンを押すと\n自動で四角形になります。", 200, 520);

    fill(0, 0, 255);
    rect(650, 700, 100, 50);
    fill(255, 0, 0);

    textFont(font);
    text("スタート", 650, 730);
    if ((mouseX >= 650 && mouseX <= 750 && mouseY >= 700 && mouseY <= 750)
      && mousePressed) {
      scene=1;
    }
  }
  //プレイ画面-------------------------------------------------------------
  else if (scene == 1) { 
    background(bg1);

    for (i=0; i<kaz; i++) {
      b[i].update();
      b[i].show();
    }

    pc.update();
    ps.update();
    pt.update();

    pc.show();
    ps.show();
    pt.show();

    for (i=0; i<kaz; i++) {
      if ((pc.col(b[i])==false)
        ||(ps.col(b[i])==false)
        ||(pt.col(b[i])==false)) {
        if (b[i].type()==false)
          scene=2;
        else if (b[i].type()==true)
          scene=3;
      }
    }
  }
  //GAME OVER画面-------------------------------------------------------------------
  else if (scene==2) {
    background(bg2);
    {
      PFont font = createFont("MS-Gothic", 30, true);
      fill(255, 0, 0);
      textFont(font); 
      text("GAME OVER", 300, 400);
    }
    if (mousePressed) {
      scene=0;
      figure=1;
      for (i=0;i<kaz;i++) {
        b[i].initialize();
      }
      ps.initialize();
      pc.initialize();
      pt.initialize();
    }
  }
  //GAME CLEAR画面-----------------------------------------------------------
  else if (scene==3) {
    background(bg3);
    PFont font = createFont("MS-Gothic", 30, true);
    fill(0, 0, 0);
    textFont(font);
    text("GAME CLEAR", 480, 250);

    if (mousePressed) {
      scene=0;
      figure=1;

      for (i=0;i<kaz;i++) {
        b[i].initialize();
      }
      ps.initialize();
      pc.initialize();
      pt.initialize();
    }
  }
}

class Block {
  float a, b, c, d;
  float a0, b0, c0, d0;
  PImage sikaku;
  PImage wall;
  int dir;

  Block(float a1, float b1, float c1, float d1, int dir1) {
    a0=a1;
    b0=b1;
    c0=c1;
    d0=d1;
    dir=dir1;
    sikaku = loadImage("pp.png");
    wall = loadImage("hi.png");
    initialize();
  }
  void initialize() {
    a=a0;
    b=b0;
    c=c0;
    d=d0;
  } 
  void update() {
    if (dir==0) {
      b += random(-3, 6);//ブロックの流れる速さ
      if (b>=width) {//もしブロックが画面外に出たら
        a=random(0, 750);//x座標をランダムに
        b=-100;//画面上に移動
      }
      if (b<25) {
        fill(255, 0, 255, 100);
        ellipse(a+25, 0, 80, 40);
      }
    }  
    else if (dir==1) {
      a += random(-3, 6);//ブロックの流れる速さ
      if (a>=height) {//もしブロックが画面外に出たら
        b=random(0, 750);//y座標をランダムに
        a=-100;//画面左に移動
      }
      if (a<25) {
        fill(255, 0, 255, 100);
        ellipse(0, b+25, 40, 80);
      }
    }
    /*else {
     //a -= random(-3, 6);//ブロックの流れる速さ
     if (a<=-50) {//もしブロックが画面外に出たら
     b=random(0, 750);//x座標をランダムに
     a=871;//画面右に移動
     }
     if (a>796) {
     fill(255, 0, 255, 100);
     ellipse(821, b+25, 40, 80);
     }
     }*/
  }
  void show() {
    if (dir==0 || dir==1) {
      image(sikaku, a, b, c, d);
    }
    else if (dir==2) {
      tint(200, 200, 255, 150);
      image(wall, a, b, c, d);
      noTint();
    }
    else if (dir==3) {
      fill(255, 255, 0, 100);
      rect(a, b, c, d);
    }
  }
  boolean type() {
    if (dir==0 || dir==1 || dir==2) {
      return false;
    }
    else {
      return true;
    }
  }
}
