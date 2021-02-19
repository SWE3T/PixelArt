PImage city;

int x = 0;
int y = 0;
int scale = 2;
float factor = 155;


void setup() {
  size(1000, 500);
  city = loadImage("BudapestePequena.jpg");
  noStroke();
  background(13, 43, 69);
}

int getColor(int x, int y) {
  color pix = city.get(x, y);

  int loc = x + y * (width/2);
  if (loc == width/2 * height) {
    return 0;
  }

  //println("loc: ", loc, " x: ", x, " y :", y);

  float bright = brightness(city.pixels[loc]);

  if (bright > factor) {
    pix =  color(208, 129, 89);
    if (bright > 170) {
      pix = color(255, 170, 94);
      if (bright > 200) {
        pix = color(255, 212, 163);
        if (bright > 225) {
          pix = color(255, 236, 214);
        }
      }
    }
  }

  if (bright <= factor) {
    pix =  color(141, 105, 122);
    if (bright < map(factor, 0, 255, factor, factor * 1.5)) {
      pix =  color(84, 78, 104);
      if (bright < map(factor, 0, 255, factor*1.5, factor * 2)) {
        pix =  color(84, 78, 104);
        if (bright < 80) {
          pix =  color(141, 105, 122);
        }
      }
    }
  }
  return pix;
}


void draw() {
  image(city, width/2, 0);
  //factor = map(mouseX, 0, width, 0, 255);

  for (int i = 0; i < 100; i = i + 1) {
    fill(getColor(x, y));
    rect(x, y, scale, scale);
    x = x + scale;
    if (x >= width/2) {
      x = 0;
      y = y + scale;
    }
    if (y >= height) {
      noLoop();
      print("Stoping Loop, for the sake of memory");
      return;
    }
  }
}

 //pix =  color(13, 43, 69); 
  //pix =  color(32, 60, 86);
  //pix =  color(84, 78, 104);
  //pix =  color(141, 105, 122);


  //Light Tones 
  //#d08159 208 129 89  
  //#ffaa5e 255 170 94
  //#ffd4a3 255 212 163 
  //#ffecd6 255 236 214

  //Dark Tones 
  //#0d2b45 13 43 69
  //#203c56 32 60 86
  //#544e68 84 78 104
  //#8d697a 141 105 122
