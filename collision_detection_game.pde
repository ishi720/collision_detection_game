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

class Player {
  float px0, py0;//プレイヤーの初期位置
  float pa, pb, pc, pd, pe, pf;//三角形の頂点
  int x=30;//図形のxの補正
  int y=30;//図形のyの補正
  float r=30;//円の半径
  float s=3;//スピード
  float sx, sy;//xとyのスピードの分別
  PVector vp;//プレイヤーの位置
  PVector vb1, vb2, vb3, vb4;//壁の隅
  PVector vt1, vt2, vt3;

  Player(float px1, float py1) {
    vp=new PVector(700, 700);
    px0=px1;
    py0=py1;
    initialize();
  }

  void initialize() {
    vp.x=px0;
    vp.y=py0;
  }

  void update() {
    if (vp.y<33) {
      vp.y=33;
    }//上の限界
    if (vp.y>743) {
      vp.y=743;
    }//下の限界
    if (vp.x<33) {
      vp.x=33;
    }//左の限界
    if (vp.x>787) {
      vp.x=787;
    }//右の限界 


    if (mouseX-5<=vp.x && mouseX+5>=vp.x && mouseY-5<=vp.y && mouseY+5>=vp.y) {//この範囲内だとPlayerのブロックは動かない
      sx=0;
      sy=0;
    }
    else if (mouseX-5<=vp.x && mouseX+5>=vp.x) {//この範囲内だとPlayerのブロックはx方向には動かない
      sx=0;
      sy=s;
    }
    else if (mouseY-5<=vp.y && mouseY+5>=vp.y) {//この範囲内だとPlayerのブロックはy方向には動かない
      sx=s;
      sy=0;
    }
    else {//上の条件を満たさない場合Playerのブロックは動く
      sx=s;
      sy=s;
    }

    //Playerのブロックはマウスのポインタに向かって来る
    if (vp.x>=mouseX && vp.y>=mouseY) {
      vp.x-=sx;
      vp.y-=sy;
    }
    else if (vp.x<=mouseX && vp.y>=mouseY) {
      vp.x+=sx;
      vp.y-=sy;
    }
    else if (vp.x>=mouseX && vp.y<=mouseY) {
      vp.x-=sx;
      vp.y+=sy;
    }
    else if (vp.x<=mouseX && vp.y<=mouseY) {
      vp.x+=sx;
      vp.y+=sy;
    }
  }
  void show() {
    fill(255, 0, 0);
  }

  boolean col() {//当たり判定
    return true;
  }
}

class PlayerCircle extends Player {
  PImage circle;
  PVector vb1, vb2, vb3, vb4;//壁の隅

  PlayerCircle(float px1, float py1) {
    super(px1, py1);
    circle = loadImage("ball2.png");
  }  
  boolean col(Block b) {
    vb1=new PVector(b.a, b.b);
    vb2=new PVector(b.a+b.c, b.b);
    vb3=new PVector(b.a, b.b+b.d);
    vb4=new PVector(b.a+b.c, b.b+b.d);

    if (figure==3) {
      if ((vp.dist(vb1)<=r)
        ||(vp.dist(vb2)<=r)
        ||(vp.dist(vb3)<=r)
        ||(vp.dist(vb4)<=r)
        ||(vp.x+r>=vb1.x && vp.x+r<=vb4.x && vp.y>=vb1.y && vp.y<=vb4.y)
        ||(vp.x-r>=vb1.x && vp.x-r<=vb4.x && vp.y>=vb1.y && vp.y<=vb4.y)
        ||(vp.x>=vb1.x && vp.x<=vb4.x && vp.y+r>=vb1.y && vp.y+r<=vb4.y)
        ||(vp.x>=vb1.x && vp.x<=vb4.x && vp.y-r>=vb1.y && vp.y-r<=vb4.y))

        return false;
    }
    return true;
  }

  void show() {
    if (figure==3) {
      image(circle, vp.x-x, vp.y-y, 2*x, 2*y);
    }
  }
}

class PlayerSquare extends Player {
  PImage sikaku;
  PVector vb1, vb2, vb3, vb4;//壁の隅

  PlayerSquare(float px1, float py1) {
    super(px1, py1);
    sikaku = loadImage("nigero.png");
  }  
  boolean col(Block b) {
    vb1=new PVector(b.a, b.b);
    vb2=new PVector(b.a+b.c, b.b);
    vb3=new PVector(b.a, b.b+b.d);
    vb4=new PVector(b.a+b.c, b.b+b.d);

    if (figure==1) {
      if ((vp.x-x>=vb1.x && vp.x-x<=vb4.x && vp.y-y>=vb1.y && vp.y-y<=vb4.y)
        ||(vp.x-y+2*x>=vb1.x && vp.x-x+2*x<=vb4.x && vp.y-y>=vb1.y && vp.y-y<=vb4.y)
        ||(vp.x-x>=vb1.x && vp.x-x<=vb4.x && vp.y-y+2*y>=vb1.y && vp.y-y+2*y<=vb4.y)
        ||(vp.x-x+2*x>=vb1.x && vp.x-x+2*x<=vb4.x && vp.y-y+2*y>=vb1.y && vp.y-y+2*y<=vb4.y)

      ||(vb1.x>=vp.x-x && vb1.x<=vp.x-x+2*x && vb3.y>=vp.y-y && vb3.y<=vp.y-y+2*y)
        ||(vb2.x>=vp.x-x && vb2.x<=vp.x-x+2*x && vb3.y>=vp.y-y && vb3.y<=vp.y-y+2*y)
        ||(vb1.x>=vp.x-x && vb1.x<=vp.x-x+2*x && vb4.y>=vp.y-y && vb4.y<=vp.y-y+2*y)
        ||(vb2.x>=vp.x-x && vb2.x<=vp.x-x+2*x && vb4.y>=vp.y-y && vb4.y<=vp.y-y+2*y))

        return false;
    }
    return true;
  }

  void show() {
    if (figure==1) {
      image(sikaku, vp.x-x, vp.y-y, 2*x, 2*y);
    }
  }
}

class PlayerTriangle extends Player {
  PImage sankaku;
  PVector vb1, vb2, vb3, vb4;//壁の隅

  PlayerTriangle(float px1, float py1) {
    super(px1, py1);
    sankaku = loadImage("tomare.png");
  }  
  boolean col(Block b) {
    vb1=new PVector(b.a, b.b);
    vb2=new PVector(b.a+b.c, b.b);
    vb3=new PVector(b.a, b.b+b.d);
    vb4=new PVector(b.a+b.c, b.b+b.d);

    if (figure==2) {
      vt1=new PVector(vp.x, vp.y-y);
      vt2=new PVector(vp.x-x, vp.y+y);
      vt3=new PVector(vp.x+x, vp.y+y);

      PVector ma0 = PVector.sub(vt1, vb1);
      PVector mb0 = PVector.sub(vt2, vb1);
      PVector mc0 = PVector.sub(vt3, vb1);

      PVector ma1 = PVector.sub(vt1, vb2);
      PVector mb1 = PVector.sub(vt2, vb2);
      PVector mc1 = PVector.sub(vt3, vb2);

      PVector ma2 = PVector.sub(vt1, vb3);
      PVector mb2 = PVector.sub(vt2, vb3);
      PVector mc2 = PVector.sub(vt3, vb3);

      PVector ma3 = PVector.sub(vt1, vb4);
      PVector mb3 = PVector.sub(vt2, vb4);
      PVector mc3 = PVector.sub(vt3, vb4);

      // 各頂点へのベクトル間の角度を調べて合計  
      float angleSum0 = PVector.angleBetween(ma0, mb0) + PVector.angleBetween(mb0, mc0) + PVector.angleBetween(mc0, ma0);
      float angleSum1 = PVector.angleBetween(ma1, mb1) + PVector.angleBetween(mb1, mc1) + PVector.angleBetween(mc1, ma1);
      float angleSum2 = PVector.angleBetween(ma2, mb2) + PVector.angleBetween(mb2, mc2) + PVector.angleBetween(mc2, ma2);
      float angleSum3 = PVector.angleBetween(ma3, mb3) + PVector.angleBetween(mb3, mc3) + PVector.angleBetween(mc3, ma3);

      // およそ(誤差を考慮して)360度ならば内側、それ以外は外側
      if ((abs(angleSum0 - PI * 2) < 0.1)
        || (abs(angleSum1 - PI * 2) < 0.1)
        || (abs(angleSum2 - PI * 2) < 0.1)
        || (abs(angleSum3 - PI * 2) < 0.1))

        return false;
    }
    return true;
  }

  void show() {
    if (figure==2) {
      image(sankaku, vp.x-x, vp.y-y, 2*x, 2*y);
    }
  }
}

