Population test;
PVector goal  = new PVector(400, 10);


void setup() {
  size(800, 800); //size of the window
  frameRate(200);//increase this to make the dots go faster
  test = new Population(10000);//create a new population with 1000 members
}


void draw() { 
  background(255);
  
  //display stats
  text("Steps: " + test.dots[test.bestDot].brain.step, 10, 30);
  text("Gen: " + test.gen, 10, 60);

  //draw goal
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);

  //draw obstacle(s)
  fill(0, 0, 255);
  rect(0, 100, 600, 10);
  rect(0, 300, 600, 10);
  rect(0, 500, 600, 10);
  rect(200, 600, 600, 10);
  rect(200, 400, 600, 10);
  rect(200, 200, 600, 10);

  if (test.allDotsDead()) {
    //genetic algorithm
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDemBabies();
  } else {
    //if any of the dots are still alive then update and then show them

    test.update();
    test.show();
  }
}
