void generateGcode(continuesLine[] gcodePaths, int pathsLineCount) {  //generates the gcode file from a given path array.
  String gname = "output/gcode.nc";
  OUTPUT = createWriter(sketchPath("") + gname);
  
  OUTPUT.println(startGcode);

  for (int i=0; i<pathsLineCount; i++) {
    continuesLine conLine = gcodePaths[i];

    OUTPUT.println("G01 X" + conLine.points[0].x + " Y" + conLine.points[0].y);
    OUTPUT.println(penDownCommand);
    for (int j=1; j<conLine.pointCount; j++) {
      OUTPUT.println("G01 X" + conLine.points[j].x + " Y" + conLine.points[j].y);
    }
    OUTPUT.println(penUpCommand);
  }

OUTPUT.println(endGcode);
  OUTPUT.flush();
  OUTPUT.close();
  
  println("Saved Gcode");
}
