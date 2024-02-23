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
