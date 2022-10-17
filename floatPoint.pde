class floatPoint {
  float x, y;
  
  floatPoint(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void uniformScale(float factor){
    x=x*factor;
    y=y*factor;
  }
  
  void translate(float x_, float y_){
   x+=x_;
   y+=y_;
  }
}
