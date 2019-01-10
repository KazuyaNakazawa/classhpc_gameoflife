

void stepTime() {
  for (int i=1; i<Nx-1; i++) {
    for (int j=1; j<Ny-1; j++) {
      int neighbours = 0; // Number of alive neighbours.
      for (int ii=i-1; ii<=i+1; ii++) {
        for (int jj=j-1; jj<=j+1; jj++) {
          if ((ii==i)&&(jj==j)) continue;
          if (cellsCarbonCopy[ii][jj]==1) {
            neighbours ++;
          }
        }
      }
      if (cellsCarbonCopy[i][j]==1) { // The cell is alive.
        if ( neighbours<=1 || neighbours>=4) cells[i][j]=0;
      } else { // The cell is dead.
        if ( neighbours==3 ) cells[i][j]=1;
      }
    }
  }

  boundaryCondition();
  copyCells();
}
