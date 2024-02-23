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
