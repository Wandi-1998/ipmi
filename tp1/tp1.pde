PImage imagen;

void setup() {
  size(800, 400);
  imagen = loadImage ("images.png"); //cargar imagen
  imagen.resize(400, 400);//Ajustar imagen
}

void draw() {
background(240,2,34);// fondo rojo
  
image (imagen,0,0); //imagen
  
strokeWeight(5); //grosor de linea
line(400, 0, 400, 400);  //linea que divide
  
//circulo peinado izquierdo
fill(0);         // color negro
noStroke();      // sin borde
ellipse(480, 160, 110, 110);  // (x, y, ancho, alto)
  
//Circulo peinado derecho
fill(0);         // color negro
noStroke();      // sin borde
ellipse(715, 160, 110, 110);  // (x, y, ancho, alto)
  
//colita de pelo del lado derecho
fill(240,2,34);         // color rojo
noStroke();      // sin borde
ellipse(690, 175, 60, 60);  // (x, y, ancho, alto)
  
//colita de pelo del lado izquierdo
fill(240,2,34);         // color rojo
noStroke();      // sin borde
ellipse(510, 175, 60, 60);  // (x, y, ancho, alto)
  
//circulo de la cara negro
fill(0);         // color negro
noStroke();      // sin borde
ellipse(600, 215, 230, 220);  // (x, y, ancho, alto)
  
//circulo de la cara (nude)
fill(252,222,226);         // color nude
noStroke();      // sin borde
ellipse(600, 230, 200, 170);  // (x, y, ancho, alto)
  
//ojo derecho
stroke(0); //color 
strokeWeight(6); //grosor de linea
line(625, 240, 679, 228);  
  
//ojo izquierdo
stroke(0); //color 
strokeWeight(6); //grosor de linea
line(520, 226, 580, 240); 

//ceja izquierda
stroke(0); //color 
strokeWeight(6); //grosor de linea
line(515, 180, 545, 180);

//ceja derecha
stroke(0); //color 
strokeWeight(6); //grosor delinea
line(655, 180, 691, 180);
 
//circulo de la cara izquierdo (Rosa)
fill(252,130,146);         // color rosa
noStroke();      // sin borde
ellipse(550, 280, 30, 30);  // (x, y, ancho, alto)
  
//circulo de la cara derecha (Rosa)
fill(252,130,146);         // color rosa
noStroke();      // sin borde
ellipse(650, 280, 30, 30);  // (x, y, ancho, alto)
   
// Sonrisa
stroke(0);         // color negro
strokeWeight(5);   // grosor de la línea
noFill();          // solo contorno (sin el relleno)
arc(600, 270, 18, 20, 0, PI);

}
