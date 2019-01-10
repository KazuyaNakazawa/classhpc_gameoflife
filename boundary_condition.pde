
void boundaryCondition() {
  //
  // When Nx = 10
  //
  //       0    1    2    3    4    5    6    7    8    9
  //       o----o----o----o----o----o----o----o----o----o
  //       |    |                                  |    |
  //   ----o----o                                  o----o----
  //       8    9                                  0    1
  for (int j=1; j<Ny; j++) {
    cells[   0][j] = cells[Nx-2][j];
    cells[Nx-1][j] = cells[   1][j];
  }
  for (int i=0; i<Nx; i++) {
    cells[i][   0] = cells[i][Ny-2];
    cells[i][Ny-1] = cells[i][   1];
  }
}
