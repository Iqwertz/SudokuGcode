
/////////////Settings////////////
int gridSize = 9;
int gridDimension = 100;

////////////Programm Vars////////////
int pathCount = 0;
continuesLine[] paths = new continuesLine[5000];

void setup(){
  float cellSize = gridDimension/gridSize;
  
  //generate Row lines
  for(int i = 0; i<=gridSize; i++){
    continuesLine row = new continuesLine(i*cellSize,0);
    row.add(i*cellSize, gridSize*cellSize);
    
    paths[pathCount] = row;
    pathCount++;
  }
  
    //generate Column lines
  for(int i = 0; i<=gridSize; i++){
    continuesLine row = new continuesLine(0,i*cellSize);
    row.add(gridSize*cellSize,i*cellSize);
    
    paths[pathCount] = row;
    pathCount++;
  }
  
  generateGcode(paths, pathCount);
}

void draw(){
  
}
