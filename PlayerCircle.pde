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
