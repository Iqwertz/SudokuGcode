void generateSVG(continuesLine[] gcodePaths, int pathsLineCount) {
  String gname = "output/image.svg";
  OUTPUT = createWriter(sketchPath("") + gname);
  OUTPUT.println("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
  OUTPUT.println("<svg width=\"" + gridDimension + "mm\" height=\"" + gridDimension + "mm\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">");
 OUTPUT.println("<g id=\"0\">");
  for (int i=0; i<pathsLineCount; i++) {
   
    OUTPUT.println("<polyline fill=\"none\" stroke=\"#000000\" stroke-width=\"1.0\" stroke-opacity=\"1\" points=\"");
    continuesLine conLine = gcodePaths[i];
    for (int j=0; j<conLine.pointCount; j++) {
      String buf = svg_format(conLine.points[j].x) + "," + svg_format(conLine.points[j].y);
      OUTPUT.println(buf);
    }
   OUTPUT.println("\" />");
  }

 OUTPUT.println("</g>");
  OUTPUT.println("</svg>");
  OUTPUT.flush();
  OUTPUT.close();
  println("SVG created");
}


///////////copied from DrawbotV2///////////
String svg_format (Float n) {
  final char regional_decimal_separator = ',';
  final char svg_decimal_seperator = '.';

  String s = nf(n, 0, 4);
  s = s.replace(regional_decimal_separator, svg_decimal_seperator);
  return s;
}
