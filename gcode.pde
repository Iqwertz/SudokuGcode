PrintWriter OUTPUT;

void generateGcode(continuesLine[] gcodePaths, int pathsLineCount){
  String gname = "output/gcode.nc";
        OUTPUT = createWriter(sketchPath("") + gname);
  
   for(int i=0; i<pathsLineCount; i++){
      continuesLine conLine = gcodePaths[i];
      
      for(int j=0; j<conLine.pointCount; j++){
         println(conLine.points[j].x, conLine.points[j].y);
         OUTPUT.println("G01 X" + conLine.points[j].x + " Y" + conLine.points[j].y);
       }
   }
   
           OUTPUT.flush();
        OUTPUT.close();
}
