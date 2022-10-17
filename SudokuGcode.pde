import de.sfuhrm.sudoku.*;
import de.sfuhrm.sudoku.output.*;

import controlP5.*;




/////////////Settings////////////
int gridSize = 9;
int gridDimension = 500;

////////////Programm Vars////////////
int pathCount = 0;
continuesLine[] paths = new continuesLine[5000];

Riddle sudoku;
PrintWriter OUTPUT;

void setup() {
    size(500, 500);
    background(255);

  float cellSize = gridDimension/gridSize;

  //generate Row lines
  for (int i = 0; i<=gridSize; i++) {
    continuesLine row;
    if (i%2==0) {
      row = new continuesLine(i*cellSize, 0);
      row.add(i*cellSize, gridSize*cellSize);
    } else {
      row = new continuesLine(i*cellSize, gridSize*cellSize);
      row.add(i*cellSize, 0);
    }

    paths[pathCount] = row;
    pathCount++;
  }

  //generate Column lines
  for (int i = 0; i<=gridSize; i++) {
    continuesLine row;
    if (i%2==0) {
      row = new continuesLine(0, i*cellSize);
      row.add(gridSize*cellSize, i*cellSize);
    } else {
      row = new continuesLine(gridSize*cellSize, i*cellSize);
      row.add(0, i*cellSize);
    }

    paths[pathCount] = row;
    pathCount++;
  }

  generateSudoku();
  addSudokuNumbers();
  generateGcode(paths, pathCount);
  generateSVG(paths, pathCount);
  generateImage(paths, pathCount);
}

void generateSudoku() {
  GameMatrix matrix = Creator.createFull();
  sudoku = Creator.createRiddle(matrix); 
  println(sudoku.get(2, 2));
}

void addSudokuNumbers() {
  float cellSize = gridDimension/gridSize;

  for (int i=0; i<gridSize; i++) {
    for (int j=0; j<gridSize; j++) {
      if (sudoku.get(i, j)!=0) {
        continuesLine numberLine = getScaledNumber(sudoku.get(i, j), cellSize);
        numberLine.translate(i*cellSize, j*cellSize);

        paths[pathCount] = numberLine;
        pathCount++;
      }
    }
  }
}

void draw() {
  exit();
}
