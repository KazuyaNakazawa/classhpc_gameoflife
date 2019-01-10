

void copyCells() {
  for (int i=0; i<Nx; i++) {
    for (int j=0; j<Ny; j++) {
      cellsCarbonCopy[i][j] = cells[i][j];
    }
  }
}
