// 
// A Game of Life by Processing
//   - Torus geometry, i.e., under the periodic boundary condition.
//   - by Akira Kageyama
//


// Size of each cell
int cellSize = 20;

// Number of cell in x and y
int Nx, Ny;


// How likely for a cell to be alive at start (in percentage)
float probabilityOfAliveAtStart = 15;

// Variables for timer
int interval = 200;
int lastRecordedTime = 0;


// Array of cells
int[][] cells; 
// Buffer to record the state of the cells and use this while changing the others in the interations
int[][] cellsCarbonCopy; 

// Pause
boolean pause = true;



void setup() {
  size (640, 480); 
  Nx = width / cellSize;
  Ny = height / cellSize;
  println("Nx, Ny = ", Nx, Ny);
  println("Space=>stop/start. 'c'=>clear, 'r'=>random, Return=>one step, Mouse click=>cell reversal.");

  cells = new int[Nx][Ny];
  cellsCarbonCopy = new int[Nx][Ny];

  // Gray curve around each cell circle
  stroke(100);

  // Anti-aliasing  
  smooth(8);

  // Initialization
  for (int i=1; i<Nx-1; i++) {
    for (int j=1; j<Ny-1; j++) {
      float state = random (100);
      if (state > probabilityOfAliveAtStart) { 
        state = 0;
      } else {
        state = 1;
      }
      cells[i][j] = int(state); // Save state of each cell
    }
  }

  boundaryCondition();
  copyCells();

  //background(210, 220, 250);
}




void keyPressed() {
  if (key=='r' || key == 'R') {
    // Restart: reinitialization of cells
    for (int i=1; i<Nx-1; i++) {
      for (int j=0; j<Ny-1; j++) {
        float state = random (100);
        if (state > probabilityOfAliveAtStart) {
          state = 0;
        } else {
          state = 1;
        }
        cells[i][j] = int(state); // Save state of each cell
      }
    }
    boundaryCondition();
    copyCells();
  }
  if (key==' ') { // On/off of pause
    pause = !pause;
  }
  if (key=='c' || key == 'C') { // Clear all
    for (int x=0; x<width/cellSize; x++) {
      for (int y=0; y<height/cellSize; y++) {
        cells[x][y] = 0; // Save all to zero
      }
    }
  }
  if (key=='\n') {
    stepTime();
  }
}
