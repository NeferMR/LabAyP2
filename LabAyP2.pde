int x=1280,x1=1280,x2=1280,cambio=3,cambio1=2,cambio2=1;
PImage title,play,exit,credit,wallpaper,nube1,nube2,nube3,salida;
boolean op=false;
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
  
  image(title,255,-140);// Title
  image(play,255,-10); // Play Buttom
  fill(100);
  stroke(0);
  rect(490,510,240,80);
  image(exit,255,90,720,720); // Exit Buttom
  image(credit,255,190); // Credits Buttom 
  if(mouseX>490 && mouseX<730 && mouseY>410 && mouseY<490 && mousePressed==true){
    exit();
  }
  if(mouseX>490 && mouseX<730 && mouseY>510 && mouseY<590 && mousePressed==true){
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
  image(salida,0,0);
  }
  
}
