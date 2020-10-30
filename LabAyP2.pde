
int x=1280, x1=1280, x2=1280, cambio=3, cambio1=2, cambio2=1, y=-720, cambioy=1, n=0, a, pos1 = 0, pos2 = 0, pos3 = 0;
PImage title, play, exit, credit, wallpaper, nube1, nube2, nube3, salida, wallpaper2, ex, recipiente, piston, credtxt, isobarica, isovolumetrica, isotermica, adiabatica, isobaricasup, isovolumetricasup, isotermicasup, adiabaticasup, fuegobase;
int maxFuego = 8, imageIndex=0;
PImage [] fuego = new PImage[maxFuego];
float tfinal, pfinal, vfinal, xx = 500, yy = 500, vx=7.0, vy=2.0, r=20.0, dx=1, dy=-1, valorT, valorP, valorV, valorR;
boolean cal = false, tf = false, vf = false, pf = false, temp2, vol2, pres2, look = false, creditos=false, jugar=false, temp=false, pres=false, volu=false, radi=false, mole=false, isobarica1=false, isotermica1=false, isovolumetrica1=false, adiabatica1=false, editv, editp, editt, editr, wait = false;
String tempfinal = "", volfinal = "", presfinal = "", valtemp = "", valpres = "", valvol = "", valrad = "";
int tapa = 0, limite = 415;
void setup () {
  size (1280, 720);
  title = loadImage("TITULO.png"); // carga de imagenes
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
  isobarica = loadImage("t.isobarica.png");
  isovolumetrica = loadImage("t.isovolumetrica.png");
  isotermica = loadImage("t.isotermica.png");
  adiabatica= loadImage("t.adiabatica.png");
  isobaricasup = loadImage("t.isobaricasup.png");
  isovolumetricasup = loadImage("t.isovolumetricasup.png");
  isotermicasup = loadImage("t.isotermicasup.png");
  adiabaticasup= loadImage("t.adiabaticasup.png");
  fuegobase = loadImage("fuegobase.png");
  for (int i = 0; i < fuego.length; i++) {
    fuego[i] = loadImage("fuego_" + i + ".png");
  }
  if (mole==true) {
    ellipseMode(RADIUS);
  }
}
//MENU DE OPCIONES
void draw () {
  background(0);
  image(wallpaper, 0, 0); // Wallpaper
  frameRate(120);

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

  if (creditos == true) { // animacion para los creditos
    image(salida, 10, 0);
    y=y+cambioy;
    if (y>0) {
      cambioy=0;
    }
    image(credtxt, 0, y);
  }

  if (jugar==true) {

    image(wallpaper2, 0, 0); // importar el fondo para simular una nueva pantalla
    image(fuegobase, 0, 0);
    image(fuego[imageIndex], -8, 0);
    imageIndex = (imageIndex+1) % fuego.length;
    if (isobarica1==false && isotermica1==false && isovolumetrica1==false && adiabatica1==false) {
      image(adiabatica, 0, 0); // mostrar botones sin seleccionar
      image(isotermica, 0, 0);
      image(isovolumetrica, 0, 0);
      image(isobarica, 0, 0);
    }
    image(ex, 0, 0);
    image(piston, 0, tapa);
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

    //Convertir los valores recibidos
    if (!valtemp.equals("") && editt == true) { // condicional para evitar la mala edicion de datos
      valorT = Float.parseFloat(valtemp);
    }
    if (!valpres.equals("") && editp == true) {
      valorP = Float.parseFloat(valpres);
    }
    if (!valvol.equals("") && editv == true) {
      valorV = Float.parseFloat(valvol);
    }
    if (!valrad.equals("") && editr == true) {
      valorR = Float.parseFloat(valrad);
    }

    // Calcular el cuarto valor
    if (!valtemp.equals("") && !valpres.equals("") && !valvol.equals("") && editv == true && editp == true && editt == true) { // condicional para reconocer el dato a calcular
      valorR = (valorP * valorV) / (n * valorT); // Proceso matematico 
      valrad = String.valueOf(valorR); // conversion a string para mostrar
      editr = false; // quitar la edicion de este dato
      textSize(10);
      fill(255, 0, 0);
      text("Se ha autocompletado el valor del radio", 1060, 158); // mostrar la advertencia al usuario de la accion automatica hecha por el programa
    } else {
      editr = true; // habilitar la edicion de este dato
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (!valtemp.equals("") && !valpres.equals("") && !valrad.equals("") && editr == true && editp == true && editt == true) {
      valorV = (n * valorR * valorT) / valorP;
      valvol = String.valueOf(valorV);
      editv = false;
      textSize(10);
      fill(255, 0, 0);
      text("Se ha autocompletado el valor del volumen", 834, 158);
    } else {
      editv = true;
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (!valtemp.equals("") && !valvol.equals("") && !valrad.equals("") && editr == true && editv == true && editt == true) {
      valorP = (n * valorR * valorT) / valorV;
      valpres = String.valueOf(valorP);
      editp = false;
      textSize(10);
      fill(255, 0, 0);
      text("Se ha autocompletado el valor de Presion", 1060, 86);
    } else {
      editp = true;
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (!valpres.equals("") && !valvol.equals("") && !valrad.equals("") && editv == true && editp == true && editr == true) {
      valorT = (valorP * valorV) / (n * valorR);
      valtemp = String.valueOf(valorT);
      editt = false;
      textSize(10);
      fill(255, 0, 0);
      text("Se ha autocompletado el valor de temperatura", 828, 86);
    } else {
      editt = true;
    }

    // animacion de botones de seleccion
    if (isobarica1==true) { // Identificar el boton seleccionado
      fill(0);
      triangle(886, 231, 864, 246, 886, 261); //triangulo para indicar retroceso (Es apenas un boceto)
      image(isobaricasup, 0, 0); // mostra el boton en diferente color para indicar seleccion
      if (look == true) { // Variable para que el boton no vuelva a la normalidad hasta que el usuario lo indique
        if (!tempfinal.equals("")) { 
          tfinal = Float.parseFloat(tempfinal); // leer los datos de los valores finales 
        }
        if (!volfinal.equals("")) {
          vfinal = Float.parseFloat(volfinal);
        }
        if (tf == true) { // indicar cual valor se va a editar por medio de cambio de color
          fill(141, 165, 233);
        } else {
          fill(168, 189, 247);
        }
        quad(910, 393, 910, 429, 1184, 429, 1184, 393);
        if (vf == true) {
          fill(141, 165, 233);
        } else {
          fill(168, 189, 247);
        }
        quad(910, 482, 910, 520, 1184, 520, 1184, 482);
        fill(141, 165, 233);
        quad(976, 566, 976, 622, 1110, 622, 1110, 566);
        fill(0);
        textSize(12);
        text("Temperatura final", 910, 383); // Horientar al usuario donde debe ingresar los valores
        text("volumen final", 910, 475);
        textSize(32);
        text("Calcular", 982, 605); // boton para calcular, tal como se especifica en la documentacion
        if (!tempfinal.equals("")) { // Se identifica que valor se va a calcular y se inhabilita su edicion a base de cancelacion en el mayor momento posible
          vf = false;
          textSize(8);
          fill(255, 0, 0);
          text(("Este valor sera calculado por procesos fisicos"), 910, 535); // indicar al usuario que este valor no debe editarlo ya que lo hara el programa
        }
        // copy and paste de lo anterior con arreglo en el funcionamiento
        if (!volfinal.equals("")) {
          tf = false;
          textSize(8);
          fill(255, 0, 0);
          text(("Este valor sera calculado por procesos fisicos"), 910, 443);
        }
        textSize(16);
        fill(0);
        text(tempfinal, 915, 416); // Mostrar al usuario los valores digitados o finales
        text(volfinal, 915, 505);
        if (cal == true) {
          fill(191, 207, 245);
          quad(876, 600, 876, 631, 960, 631, 960, 600); // crear un boton el cual permita el borrado de datos y volver a iniciar la transformacion
          fill(0);
          text("Borrar", 890, 623);
        }
      }
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (isovolumetrica1==true) {
      fill(0);
      triangle(886, 231, 864, 246, 886, 261);
      image(isovolumetricasup, 0, pos1);
      if (pos1 > -86 && look == true) { // animacion para cuando el boton sea seleccionado este suba
        pos1 = pos1 - 3;
      } else if (look == false) {
        if (wait == true) {
          if (pos1 < 0) { // animacion de bajada
            pos1 = pos1 + 3;
          } else {
            wait = false;
          }
        } else {
          isovolumetrica1 = false; // desactivacion del boton para cuando el boton llegue a su posicion original
        }
        // copy and paste de lo anterior con arreglo en el funcionamiento
      } else {
        if (!tempfinal.equals("")) {
          tfinal = Float.parseFloat(tempfinal);
        }
        if (!presfinal.equals("")) {
          pfinal = Float.parseFloat(presfinal);
        }
        fill(168, 189, 247);
        if (tf == true) {
          fill(141, 165, 233);
        } else {
          fill(168, 189, 247);
        }
        quad(910, 393, 910, 429, 1184, 429, 1184, 393);
        if (pf == true) {
          fill(141, 165, 233);
        } else {
          fill(168, 189, 247);
        }
        quad(910, 482, 910, 520, 1184, 520, 1184, 482);
        fill(141, 165, 233);
        quad(976, 566, 976, 622, 1110, 622, 1110, 566);
        fill(0);
        textSize(12);
        text("Temperatura final", 910, 383);
        text("Presion final", 910, 475);
        textSize(32);
        text("Calcular", 982, 605);
        if (!tempfinal.equals("")) {
          pf = false;
          textSize(8);
          fill(255, 0, 0);
          text(("Este valor sera calculado por procesos fisicos"), 910, 535);
        }
        if (!presfinal.equals("")) {
          tf = false;
          textSize(8);
          fill(255, 0, 0);
          text(("Este valor sera calculado por procesos fisicos"), 910, 443);
        }
        textSize(16);
        fill(0);
        text(tempfinal, 915, 416);
        text(presfinal, 915, 505);
        if (cal == true) {
          fill(191, 207, 245);
          quad(876, 600, 876, 631, 960, 631, 960, 600);
          fill(0);
          text("Borrar", 890, 623);
        }
      }
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (isotermica1==true) {
      fill(0);
      triangle(886, 231, 864, 246, 886, 261);
      image(isotermicasup, 0, pos2);
      if (pos2 > -176 && look == true) {
        pos2 = pos2 - 6;
      } else if (look == false) {
        if (wait == true) {
          if (pos2 < 0) {
            pos2 = pos2 + 6;
          } else {
            wait = false;
          }
        } else {
          isotermica1 = false;
        }
      } else {
        if (!presfinal.equals("")) {
          pfinal = Float.parseFloat(presfinal);
        }
        if (!volfinal.equals("")) {
          vfinal = Float.parseFloat(volfinal);
        }
        fill(168, 189, 247);
        if (pf == true) {
          fill(141, 165, 233);
        } else {
          fill(168, 189, 247);
        }
        quad(910, 393, 910, 429, 1184, 429, 1184, 393);
        if (vf == true) {
          fill(141, 165, 233);
        } else {
          fill(168, 189, 247);
        }
        quad(910, 482, 910, 520, 1184, 520, 1184, 482);
        fill(141, 165, 233);
        quad(976, 566, 976, 622, 1110, 622, 1110, 566);
        fill(0);
        textSize(12);
        text("Presion final", 910, 383);
        text("volumen final", 910, 475);
        textSize(32);
        text("Calcular", 982, 605);
        if (!presfinal.equals("")) {
          vf = false;
          textSize(8);
          fill(255, 0, 0);
          text(("Este valor sera calculado por procesos fisicos"), 910, 535);
        }
        if (!volfinal.equals("")) {
          pf = false;
          textSize(8);
          fill(255, 0, 0);
          text(("Este valor sera calculado por procesos fisicos"), 910, 443);
        }
        textSize(16);
        fill(0);
        text(presfinal, 915, 416);
        text(volfinal, 915, 505);
        if (cal == true) {
          fill(191, 207, 245);
          quad(876, 600, 876, 631, 960, 631, 960, 600);
          fill(0);
          text("Borrar", 890, 623);
        }
      }
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (adiabatica1==true) {
      fill(0);
      triangle(886, 231, 864, 246, 886, 261);
      image(adiabaticasup, 0, pos3);
      if (pos3 > -270 && look == true) {
        pos3 = pos3 - 9;
      } else if (look == false) {
        if (wait == true) {
          if (pos3 < 0) {
            pos3 = pos3 + 9;
          } else {
            wait = false;
          }
        } else {
          adiabatica1 = false;
        }
      } else {
        fill(255, 0, 0);
        text("Esta conversion", 910, 393);
        text("Sera finalizada", 910, 433);
        text("En futuras", 910, 473);
        text("Actualizaciones", 910, 513);
      }
    }
    
    
    if (cal == true) {
      //animacion para el piston movil
      if (valorV > vfinal) {
        if (limite < 515) {
          limite++;
          tapa++;
        }
      } else if (valorV < vfinal) {
        if (limite > 315) {
          limite--;
          tapa--;
        }
      }
      
      fill(255, 255, 0);
      //flecha amarilla que indica el calor cedido
      if (valorT < vfinal) {
        quad(495, 623, 495, 671, 525, 671, 525, 623);
        triangle(481, 621, 510, 590, 539, 621);
      } else if (valorT > vfinal) {
        quad(512, 592, 512, 632, 534, 632, 534, 592);
        triangle(500, 632, 521, 672, 546, 632);
      }
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

// funcion para las particulas
void molecula() {
  for (int i = 0; i < n; i++) {
    xx=random(490, 750);
    yy=random(limite, 560);
    ellipse(xx, yy, r, r);

    xx=xx+vx*dx;
    if ((xx>750)||(xx<490)) {
      dx=-dx;
    }
    yy=yy+vy*dy;
    if ((yy>560)||(yy<limite)) {
      dy=-dy;
    }
  }
}

// funcion para calcular los valores finales
void calcular() {
  if (isobarica1 == true) {
    if (volfinal.equals("")) {
      vfinal = valorV * tfinal / valorT;
      volfinal = String.valueOf(vfinal);
    } else {
      tfinal = vfinal * valorT / valorV;
      tempfinal = String.valueOf(tfinal);
    }
  }

  if (isovolumetrica1 == true) {
    if (presfinal.equals("")) {
      pfinal = valorP * tfinal / valorT;
      presfinal = String.valueOf(pfinal);
    } else {
      tfinal = pfinal * valorT / valorP;
      tempfinal = String.valueOf(tfinal);
    }
  }

  if (isotermica1 == true) {
    if (presfinal.equals("")) {
      pfinal = valorP * valorV / vfinal;
      presfinal = String.valueOf(pfinal);
    } else {
      vfinal = valorP * valorV / pfinal;
      volfinal = String.valueOf(vfinal);
    }
  }
  cal = true;
}


//mapeo de letras para que puedan ser leidos los valores 
void keyPressed() {
  if (temp == true && editt == true) {
    if (key>='0' && key<='9') { // solo podran ser ingresados numeros
      valtemp+= key;
    }
    if (key == '.') { // validar para que solo sea un punto por cada valor
      if (!valtemp.contains(".")) {
        valtemp+= key;
      }
    }
    if (valtemp.length() > 0) { // borrar por medio de las funciones del substring
      if (key == 8) {
        valtemp = valtemp.substring(0, valtemp.length() - 1);
      }
    }
  }
  // copy and paste de lo anterior con arreglo en el funcionamiento
  if (pres == true && editp == true) {
    if (key>='0' && key<='9') {
      valpres+= key;
    }
    if (key == '.') {
      if (!valpres.contains(".")) {
        valpres+= key;
      }
    }
    if (valpres.length() > 0) {
      if (key == 8) {
        valpres = valpres.substring(0, valpres.length() - 1);
      }
    }
  }
  if (volu == true && editv == true) {
    if (key>='0' && key<='9') {
      valvol+= key;
    }
    if (key == '.') {
      if (!valvol.contains(".")) {
        valvol+= key;
      }
    }
    if (valvol.length() > 0) {
      if (key == 8) {
        valvol = valvol.substring(0, valvol.length() - 1);
      }
    }
  }
  if (radi == true && editr == true) {
    if (key>='0' && key<='9') {
      valrad+= key;
    }
    if (key == '.') {
      if (!valrad.contains(".")) {
        valrad+= key;
      }
    }
    if (valrad.length() > 0) {
      if (key == 8) {
        valrad = valrad.substring(0, valrad.length() - 1);
      }
    }
  }
  if (tf == true && vf == false && pf == false) {
    if (key>='0' && key<='9') {
      tempfinal+= key;
    }
    if (key == '.') {
      if (!tempfinal.contains(".")) {
        tempfinal+= key;
      }
    }
    if (tempfinal.length() > 0) {
      if (key == 8) {
        tempfinal = tempfinal.substring(0, tempfinal.length() - 1);
      }
    }
  }
  if (tf == false && vf == true && pf == false) {
    if (key>='0' && key<='9') {
      volfinal+= key;
    }
    if (key == '.') {
      if (!volfinal.contains(".")) {
        volfinal+= key;
      }
    }
    if (volfinal.length() > 0) {
      if (key == 8) {
        volfinal = volfinal.substring(0, volfinal.length() - 1);
      }
    }
  }
  if (tf == false && vf == false && pf == true) {
    if (key>='0' && key<='9') {
      presfinal+= key;
    }
    if (key == '.') {
      if (!presfinal.contains(".")) {
        presfinal+= key;
      }
    }
    if (presfinal.length() > 0) {
      if (key == 8) {
        presfinal = presfinal.substring(0, presfinal.length() - 1);
      }
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
      jugar=false; // Boton retroceso en la emulacion
      isobarica1=false;
      isotermica1=false;
      isovolumetrica1=false;
      adiabatica1=false;
      mole=false;
      n=0;
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
      pres = true; // indicarle al usuario cual valor va a editar
    } else {
      pres = false;
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
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

    if (mouseX>890 && mouseX<1200 && mouseY>297 && mouseY<345 && isotermica1 == false && isobarica1 == false && isovolumetrica1 == false && adiabatica1 == false) {
      // Activacion de las teclas de conversion
      isobarica1=true;
      isotermica1=false;
      isovolumetrica1=false;
      adiabatica1=false;
      look = true;
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (mouseX>890 && mouseX<1200 && mouseY>383 && mouseY<438 && isotermica1 == false && isobarica1 == false && isovolumetrica1 == false && adiabatica1 == false) {
      isobarica1=false;
      isotermica1=false;
      isovolumetrica1=true;
      adiabatica1=false;
      look = true;
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (mouseX>890 && mouseX<1200 && mouseY>473 && mouseY<528 && isotermica1 == false && isobarica1 == false && isovolumetrica1 == false && adiabatica1 == false) {
      isobarica1=false;
      isotermica1=true;
      isovolumetrica1=false;
      adiabatica1=false;
      look = true;
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (mouseX>890 && mouseX<1200 && mouseY>566 && mouseY<620 && isotermica1 == false && isobarica1 == false && isovolumetrica1 == false && adiabatica1 == false) {
      isobarica1=false;
      isotermica1=false;
      isovolumetrica1=false;
      adiabatica1=true;
      look = true;
    }
    if (mouseX>863 && mouseX<886 && mouseY>230 && mouseY<260) { // boton de retroceso en las conversiones (activan la animacion de regreso)
      wait = true;
      isobarica1 = false;
      look = false;
    }

    if (isobarica1 == true) {
      // indica al usuario los campos que esta editando al hacer click
      if (mouseX>910 && mouseX<1184 && mouseY>393 && mouseY<429) {
        tf = true;
      } else {
        tf = false;
      }
      if (mouseX>910 && mouseX<1184 && mouseY>482 && mouseY<520) {
        vf = true;
      } else {
        vf = false;
      }
      // llama la funcion calcular para dar un resultado final
      if (mouseX>976 && mouseX<1110 && mouseY>566 && mouseY<622) {
        calcular();
      }
      // boton de borrar que reinicia los valores al entrar en las conversiones
      if (mouseX>876 && mouseX<960 && mouseY>600 && mouseY<631) {
        presfinal = "";
        volfinal = "";
        tempfinal = "";
        tapa = 0;
        limite = 415;
        cal = false;
      }
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (isotermica1 == true) {
      if (mouseX>910 && mouseX<1184 && mouseY>393 && mouseY<429) {
        pf = true;
      } else {
        pf = false;
      }
      if (mouseX>910 && mouseX<1184 && mouseY>482 && mouseY<520) {
        vf = true;
      } else {
        vf = false;
      }
      if (mouseX>976 && mouseX<1110 && mouseY>566 && mouseY<622) {
        calcular();
      }
      if (mouseX>876 && mouseX<960 && mouseY>600 && mouseY<631) {
        presfinal = "";
        volfinal = "";
        tempfinal = "";
        tapa = 0;
        limite = 415;
        cal = false;
      }
    }
    // copy and paste de lo anterior con arreglo en el funcionamiento
    if (isovolumetrica1 == true) {
      if (mouseX>910 && mouseX<1184 && mouseY>393 && mouseY<429) {
        tf = true;
      } else {
        tf = false;
      }
      if (mouseX>910 && mouseX<1184 && mouseY>482 && mouseY<520) {
        pf = true;
      } else {
        pf = false;
      }
      if (mouseX>976 && mouseX<1110 && mouseY>566 && mouseY<622) {
        calcular();
      }
      if (mouseX>876 && mouseX<960 && mouseY>600 && mouseY<631) {
        presfinal = "";
        volfinal = "";
        tempfinal = "";
        tapa = 0;
        limite = 415;
        cal = false;
      }
    }
  }
}
