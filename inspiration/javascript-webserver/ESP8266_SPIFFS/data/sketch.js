// Animater Circular Ticker
// Rob Lloyd
// March 2019

let diameter = 150;
let shade = [0, 127, 255];
let lastshade = [];

function setup() {
  createCanvas(400, 400);
  background(51);
  // darkBlue = color(0, 159, 227);
}

function draw() {
  background(51);
  colorMode(RGB);
  translate(width / 2, height / 2);
  rotate(PI);
  for (let i = 0; i < frameCount % 102; i++) {
    noStroke();
    stroke(shade);
    fill(shade);
    strokeWeight(3);
    rotate(radians(3.6));
    line(0, diameter - 25, 0, diameter);
  }
  for (let i = 0; i < shade.length; i++) {
    if (shade[i] == 254 || lastshade[i] > shade[i]) {
      shade[i]--;
    } else {
      shade[i]++;
    }
  }
  lastshade = shade
}