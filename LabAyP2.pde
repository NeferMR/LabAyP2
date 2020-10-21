int x=1280, x1=1280, x2=1280, cambio=3, cambio1=2, cambio2=1, y=-720, cambioy=1, n=0, a;
PImage title, play, exit, credit, wallpaper, nube1, nube2, nube3, salida, wallpaper2, ex, recipiente, piston, credtxt;
float xx = 500, yy = 500, vx=7.0, vy=2.0, r=20.0, dx=1, dy=-1;
boolean creditos=false, jugar=false, temp=false, pres=false, volu=false, radi=false, mole=false;
String valtemp = "", valpres = "", valvol = "", valrad = "";
void setup () {
  size (1280, 720);
  title = loadImage("TITULO.png");
  play = loadImage ("BOTON PLAY.png");
  exit = loadImage("exit bottom.png");
  credit = loadImage("credits.png");
  wallpaper = loadImage("wallpaper.jpg");
  nube1 = loadImage("nube1.png");
  nube2 = loadImage("nube2.png");
  nube3 = loadImage("nube3.png");
  salida = loadImage("boton salida.png");
  wallpaper2 = loadImage("wallpaperplay.jpg");
  ex = loadImage("exit play.png");
  piston = loadImage("piston.png");
  recipiente = loadImage("recipiente.png");
  credtxt = loadImage("creditos.png");
  if (mole==true) {
    ellipseMode(RADIUS);
  }
}
//MENU DE OPCIONES
void draw () {
  background(0);
  image(wallpaper, 0, 0); // Wallpaper

  //ANIMACION DE LAS NUBES
  x=x-cambio; //ecuacion de cambio para nube 1
  x1=x1-cambio1;//ecuacion de cambio para nube 2
  x2=x2-cambio2;//ecuacion de cambio para nube 3

  if (x<-1280) {
    cambio=-3;//variable de cambio para nube 1
  }
  if (x1<-1280) {
    cambio1=-2;//variable de cambio para nube 2
  }
  if (x2<-1280) {
    cambio2=-1;//variable de cambio para nube 3
  }

  //
  if (x>1280) {
    cambio=3;//variable de cambio para nube 1
  }
  if (x1>1280) {
    cambio1=2;//variable de cambio para nube 2
  }
  if (x2>1280) {
    cambio2=1;//variable de cambio para nube 3
  }
  image(nube1, x, 0); 
  image(nube2, x1, -40); 
  image(nube3, x2, 0); 
  //

  if (creditos==false && jugar==false) {
    image(title, 255, -140);// Title
    image(play, 255, -10); // Play Buttom
    image(exit, 255, 90, 720, 720); // Exit Buttom
    image(credit, 255, 190); // Credits Buttom
    fill(225);
    text("Version 3.0", 1200, 700);
  }

  if (creditos == true) {
    image(salida, 10, 0);
    y=y+cambioy;
    if (y>0) {
      cambioy=0;
    }
    image(credtxt, 0, y);
  }

  if (jugar==true) {
    image(wallpaper2, 0, 0);
    image(ex, 0, 0);
    image(piston, 0, 0);
    image(recipiente, 0, 0);
    // Triangulos para controlar numero de particulas
    fill(0);
    textSize(14);
    triangle(1147, 182, 1147, 218, 1165, 200);
    triangle(940, 182, 940, 218, 922, 200);
    // Texto para titular los valores de entrada
    text("Numero de particulas", 990, 236);
    text("Temperatura", 900, 32);
    text("Volumen", 915, 105);
    text("Presion", 1133, 32);
    text("Radio", 1133, 105);

    // Numero de partidas a mostrar
    textSize(32);
    text(n, 1040, 211);

    // Cuadrado para indicar al usuario que va a digitar valor en los valores correspondientes
    fill(133, 164, 243);
    if (temp==true) {
      quad(836, 37, 836, 74, 1037, 74, 1037, 37);
    }
    if (pres==true) {
      quad(1060, 37, 1060, 74, 1248, 74, 1248, 37);
    }
    if (volu==true) {
      quad(836, 109, 836, 147, 1037, 147, 1037, 109);
    }
    if (radi==true) {
      quad(1060, 110, 1060, 147, 1248, 147, 1248, 110);
    }

    //Valores a recibir
    textSize(16);
    fill(0);
    text(valtemp, 845, 64);
    text(valpres, 1063, 64);
    text(valvol, 845, 133);
    text(valrad, 1063, 133);
  }
  if (mole==true) {
    fill(0);
    molecula();
  }
}

void molecula() {
  for (int i = 0; i < n; i++) {
    xx=random(490, 750);
    yy=random(415, 560);
    ellipse(xx, yy, r, r);

    xx=xx+vx*dx;
    if ((xx>750)||(xx<490)) {
      dx=-dx;
    }
    yy=yy+vy*dy;
    if ((yy>560)||(yy<415)) {
      dy=-dy;
    }
  }
}


void keyPressed() {
  if (temp == true) {
    if (key>='0' && key<='9') {
      valtemp+= key;
    }
  }
    if (pres == true) {
    if (key>='0' && key<='9') {
      valpres+= key;
    }
  }
    if (volu == true) {
    if (key>='0' && key<='9') {
      valvol+= key;
    }
  }
    if (radi == true) {
    if (key>='0' && key<='9') {
      valrad+= key;
    }
  }
}

void mouseClicked() {
  if (mouseX>480 && mouseX<745 && mouseY>410 && mouseY<490) {
    exit(); // Boton salir en menu principal
  }
  if (mouseX>480 && mouseX<745 && mouseY>510 && mouseY<590) {
    creditos=true; // Abrir paso a los creditos
  }
  if (mouseX>480 && mouseX<745 && mouseY>310 && mouseY<390) {
    jugar=true;  // Iniciar la emulacion
  }


  if (creditos == true) {
    if (mouseX>10 && mouseX<81 && mouseY>0 && mouseY<81) {
      creditos=false; // Boton retroceso en creditos
    }
  }


  if (jugar == true) {
    if (mouseX>10 && mouseX<81 && mouseY>0 && mouseY<81) {
      jugar=false;  // Boton retroceso en la emulacion
    }


    if (mouseX>921 && mouseX<941 && mouseY>181 && mouseY<219) {
      if (n > 0) {
        n--; // Disminucion de numero de particulas
      } else {
        mole = false; // Validacion para cuando las moleculas sean 0 sea desahibilitado el proceso de ellipses
      }
    }

    if (mouseX>1146 && mouseX<1166 && mouseY>181 && mouseY<219) {
      n++;// Aumenta el numero de particulas
      mole=true; // Abre paso a la creacion de ellipses
    }



    if (mouseX>835 && mouseX<1038 && mouseY>36 && mouseY<75) {
      temp=true; // Cuando se de click en temperatura iniciar la edicion
    } else {
      temp=false; // Click en cualquier otro lugar desahibilitara la edicion
    }
    if (mouseX>1060 && mouseX<1248 && mouseY>36 && mouseY<75) {
      pres = true;
    } else {
      pres = false;
    }
    if (mouseX>836 && mouseX<1039 && mouseY>109 && mouseY<147) {
      volu = true;
    } else {
      volu = false;
    }
    if (mouseX>1060 && mouseX<1248 && mouseY>109 && mouseY<147) {
      radi = true;
    } else {
      radi = false;
    }
  }
}
