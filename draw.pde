
void draw() {

  background(210, 230, 255);

  place_pieces();

  if (millis()-lastRecordedTime>interval) {
    if (!pause) {
      stepTime();
      lastRecordedTime = millis();
    }
  }

  if (pause && mousePressed) {
    int xCellOver = int(map(mouseX, 0, width, 0, Nx));
    xCellOver = constrain(xCellOver, 0, Nx-1);
    int yCellOver = int(map(mouseY, 0, height, 0, Ny));
    yCellOver = constrain(yCellOver, 0, Ny-1-1);

    if (cellsCarbonCopy[xCellOver][yCellOver]==1) { // alive
      cells[xCellOver][yCellOver]=0; // Kill
    } else { // dead
      cells[xCellOver][yCellOver]=1; // Make alive
    }
  } else if (pause && !mousePressed) { 
    boundaryCondition();
    copyCells();
  }
}


void place_pieces() {
  for (int i=0; i<Nx; i++) {
    for (int j=0; j<Ny; j++) {
      if (cells[i][j]==1) {
        place_alive_piece(i, j);
      } else {
        place_dead_piece(i, j);
      }
    }
  }
}



void place_alive_piece(int i, int j) {
  fill(0); // black
  ellipse(i*cellSize+0.5*cellSize, j*cellSize+0.5*cellSize, 
          cellSize, cellSize);
}



void place_dead_piece(int i, int j) {
  fill(255); // white 
  ellipse(i*cellSize+0.5*cellSize, j*cellSize+0.5*cellSize, 
          cellSize, cellSize);
}
