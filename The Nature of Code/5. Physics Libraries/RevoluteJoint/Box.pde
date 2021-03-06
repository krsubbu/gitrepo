class Box{
 
  Body body;
  float x;
  float y;
  float w;
  float h;
  boolean s;
  
  Box(float x_,float y_,float w_,float h_,boolean s_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    s = s_;
    
    BodyDef bd = new BodyDef();
    if(s){
      bd.type = BodyType.STATIC;
    }else{
      bd.type = BodyType.DYNAMIC;
    }
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.3;
    
    body.createFixture(fd);    
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    rectMode(CENTER);
    fill(200);
    stroke(0);
    rect(0,0,w,h);
    popMatrix();
  }
}