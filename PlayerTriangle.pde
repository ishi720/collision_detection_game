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
