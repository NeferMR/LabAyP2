int x=1280,x1=1280,x2=1280,cambio=3,cambio1=2,cambio2=1,y=-720,cambioy=1;
PImage title,play,exit,credit,wallpaper,nube1,nube2,nube3,salida,wallpaper2,ex,recipiente,piston,credtxt;
boolean creditos=false,jugar=false;
void setup (){
  size (1280,720);
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
}
//MENU DE OPCIONES
void draw (){
  background(0);
  image(wallpaper,0,0); // Wallpaper
  
  //ANIMACION DE LAS NUBES
  x=x-cambio; //ecuacion de cambio para nube 1
  x1=x1-cambio1;//ecuacion de cambio para nube 2
  x2=x2-cambio2;//ecuacion de cambio para nube 3
  
    if(x<-1280){
    cambio=-3;//variable de cambio para nube 1
    }
    if(x1<-1280){
    cambio1=-2;//variable de cambio para nube 2
    }
    if(x2<-1280){
    cambio2=-1;//variable de cambio para nube 3
    }
  
    //
    if(x>1280){
    cambio=3;//variable de cambio para nube 1
    }
    if(x1>1280){
    cambio1=2;//variable de cambio para nube 2
    }
    if(x2>1280){
    cambio2=1;//variable de cambio para nube 3
    }
  image(nube1,x,0); 
  image(nube2,x1,-40); 
  image(nube3,x2,0); 
  //
  
  if(creditos==false && jugar==false){
    image(title,255,-140);// Title
    image(play,255,-10); // Play Buttom
    image(exit,255,90,720,720); // Exit Buttom
    image(credit,255,190); // Credits Buttom
    fill(225);
    text("Version 3.0", 1200, 700);
  }
  
  if (creditos == true) {
      image(salida,10,0);
      y=y+cambioy;
      if(y>0){
        cambioy=0;
      }
      image(credtxt,0,y);
  }
  
  if(jugar==true){
    image(wallpaper2,0,0);
    image(ex,0,0);
    image(piston,0,0);
    image(recipiente,0,0);
    // Triangulos para controlar numero de particulas
    fill(0);
    triangle(1147, 182, 1147, 218, 1165, 200);
    triangle(940, 182, 940, 218, 922, 200);
    text("Numero de particulas", 990, 236);
    text("Temperatura", 908, 32);
    text("Volumen", 915, 105);
    text("Presion", 1133, 32);
    text("Radio", 1133, 105);
    
    
    
  }
}


void mouseClicked(){
  if(mouseX>480 && mouseX<745 && mouseY>410 && mouseY<490){
    exit();
  }
  if(mouseX>480 && mouseX<745 && mouseY>510 && mouseY<590){
    creditos=true;
  }
  if (mouseX>10 && mouseX<81 && mouseY>0 && mouseY<81 && creditos == true) {
    creditos=false; 
  }
  if (mouseX>480 && mouseX<745 && mouseY>310 && mouseY<390) {
    jugar=true; 
  }
  if (mouseX>10 && mouseX<81 && mouseY>0 && mouseY<81 && jugar == true) {
    jugar=false; 
  }
}
