class Link {
  float restingDistance = 2;  //  how far apart each link wants to be
  float[] diffX, diffY, distance, difference, translateX, translateY;
  Point[] p;
  PVector velVector = new PVector(0, 0);
  PVector centripAccel = new PVector(0, 0);
  float deltaTheta, omega, prettyOmega;
  float mouseTimer = 0;

  Link(Point[] point) {
    p = point;
    diffX = new float[p.length];
    diffY = new float[p.length];
    distance = new float[p.length];
    difference = new float[p.length];
    translateX = new float[p.length];
    translateY = new float[p.length];
  }
  void solve() {
    for (int i = 0; i < p.length-1; i++) {
      // calculate the distance
      diffX[i] = p[i].x - p[i+1].x;
      diffY[i] = p[i].y - p[i+1].y;
      distance[i] = sqrt(diffX[i] * diffX[i] + diffY[i] * diffY[i]) ;

      // difference scalar
      difference[i] = (restingDistance - distance[i]) / distance[i];

      // translation for each Point. They'll be pushed 1/2 the required distance to match their resting distances.
      translateX[i] = diffX[i] * 0.5 * difference[i];
      translateY[i] = diffY[i] * 0.5 * difference[i];

      p[i].x += translateX[i];
      p[i].y += translateY[i];

      p[i+1].x -= translateX[i];
      p[i+1].y -= translateY[i];
    }
  }

  void display() {
    PVector last = new PVector(p[p.length-1].lastX - width/2, p[p.length-1].lastY - height/2);  //  angle between last and next locations (from the screen's center)
    PVector next = new PVector(p[p.length-1].nextX - width/2, p[p.length-1].nextY - height/2);
    deltaTheta = PVector.angleBetween(last, next);
    omega = deltaTheta*frameRate;  //  angular velocity = rad/sec, frameRate is 60 loops per sec, so the angle changes by 60*theta radians per sec
    prettyOmega = int(omega/PI * 100);
    fill(255,255,255);
    if (p[0].followMouse == false) {
      textSize(14);
      text("Angular velocity = \n" + prettyOmega/100 + " radians/sec", 380, 60);
    }
    p[0].move(true);  //  pin = true for the first point only
    for (int i = 1; i < p.length; i++) {
      p[i].move(false);
    }
    solve();
    for (int i = 0; i < p.length-1; i++) {
      stroke(0);
      line(p[i].x, p[i].y, p[i+1].x, p[i+1].y);
      noStroke();
      fill(0);
      ellipse(p[i].x, p[i].y, 2, 2);
      ellipse(p[i+1].x, p[i+1].y, 2, 2);
    }
    noStroke();
    ellipse(p[p.length-1].x, p[p.length-1].y, 10, 10);

    pushMatrix();  //  draw the velocity vector
    translate(p[p.length-1].x, p[p.length-1].y);
    strokeWeight(2);
    stroke(0, 255, 0);
    velVector.x = p[p.length-1].nextX - p[p.length-1].lastX;  //  velocity angle is the secant between the last and next locations of the last Point
    velVector.y = p[p.length-1].nextY - p[p.length-1].lastY;
    velVector.normalize();
    velVector.mult(8*sqrt(p[p.length-1].velX*p[p.length-1].velX + p[p.length-1].velY*p[p.length-1].velY));
    line (0, 0, velVector.x, velVector.y);

    if (p[0].followMouse == false) {
      stroke(255, 0, 0);  //  centripetal acceleration magnitude = V^2 / r
      centripAccel.x = velVector.x;
      centripAccel.y = velVector.y;
      centripAccel.normalize();
      centripAccel.mult(velVector.mag()*velVector.mag() / dist(width/2, height/2, p[p.length-1].x, p[p.length-1].y));
      pushMatrix();
      rotate(PI/2);
      line (0, 0, centripAccel.x, centripAccel.y);
      popMatrix();

      pushMatrix();
      stroke(255, 0, 0);  //  the arrowhead for the centripetal acceleration vector
      rotate(PI/2);
      translate(centripAccel.x, centripAccel.y);
      centripAccel.div(8);
      rotate(3*PI/4);
      line (0, 0, centripAccel.x, centripAccel.y);
      rotate(PI/2);
      line (0, 0, centripAccel.x, centripAccel.y);
      popMatrix();
    }
    pushMatrix();
    stroke(0, 255, 0);  //  the arrowhead for the velocity vector
    translate(velVector.x, velVector.y);
    velVector.div(8);
    rotate(3*PI/4);
    line (0, 0, velVector.x, velVector.y);
    rotate(PI/2);
    line (0, 0, velVector.x, velVector.y);
    popMatrix();
    popMatrix();
    strokeWeight(1);
  }
}