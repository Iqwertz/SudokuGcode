class continuesLine {
  int pointCount = 0;
  
  floatPoint[] points = new floatPoint[10000];
  
  continuesLine(float x1_, float y1_) {
    points[pointCount] = new floatPoint(x1_, y1_);
    pointCount++;
  }
  
  void add(float x1_, float y1_){
     points[pointCount] = new floatPoint(x1_, y1_);
     pointCount++;
  }
}
