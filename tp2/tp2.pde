// WANDA ROJAS 122872/1
// DNI 41922516
// COMISIÓN 1

// DECLARAR VARIABLES PARA LAS IMÁGENES
PImage imagen1; 
PImage imagen2; 
PImage imagen3; 
PImage imagen4; 

// DECLARAR LOS TEXTOS QUE SE MOSTRARÁN EN CADA PANTALA
String texto1 = "MI PELI FAVORITA: PERSONAJES"; 
String texto2 = "RAPUNZEL Y PASCAL"; 
String texto3 = "RAPUNZEL Y MAXIMUS:"; 
String texto4 = "RAPUNZEL Y FLYNN RIDER"; 

int pantallaActual = 0; // INDICA QUÉ PANTALLA SE ESTÁ MOSTRANDO
PFont fuente; // VARIABLE PARA GUARDAR LA FUENTE DE TEXTO
boolean mostrarBoton = false; // BOTÓN FINAL

int tiempoInicio; // TIEMPO EN EL QUE EMPEZÓ CADA PANTALLA
int duracionPantalla = 4000; // DURACIÓN DE PANTALLA 4 SEGUNDOS

float alphaTexto = 0; // OPACIDAD DEL TEXTO PARA LA ANIMACIÓN DE FADEIN
float sizeTexto = 20; // TAMAÑO DEL TEXTO PARA LA ANIMACIÓN DE ZOOM

void setup() {
size(640, 480); // TAMAÑO DE LA VENTANA

fuente = createFont("Arial", 40); // FUENTE ARIAL DE TAMAÑO 40
textFont(fuente); // SE APLICA ESA FUENTE
textAlign(CENTER, CENTER); // EL TEXTO cENTRADO

//CARGAR IMAGENES
imagen1 = loadImage("hola0.jpeg"); 
imagen2 = loadImage("hola1.jpg"); 
imagen3 = loadImage("hola2.jpg"); 
imagen4 = loadImage("hola3.jpg"); 

tiempoInicio = millis(); // SE GUARDA EL TIEMPO DE INICIO DE PRIMER PANTALLA
}

void draw() {
background(255); // FONDO BLANCO 

if (pantallaActual < 4) { // MIENTRAS ESTEMOS EN ALGUNA DE LAS 4 PANTALLAS PRINCIPALES
mostrarPantalla(pantallaActual); // SE MUESTRA LA IMAGEN CORRESPONDIENTE

int tiempoTranscurrido = millis() - tiempoInicio; // SE CALCULA EL TIEMPO PASADO DESDE QUE CAMBIÓ DE PANTALLA

// ANIMACIÓN DE FADE Y ZOOM DEL TEXTO
alphaTexto = map(tiempoTranscurrido, 0, 1000, 0, 255); // OPACIDAD VA DE 0 A 255 EN 1 SEGUNDO
alphaTexto = constrain(alphaTexto, 0, 255); 

sizeTexto = map(tiempoTranscurrido, 0, 1000, 20, 36); // TAMAÑO CRECE DE 20 A 36 EN 1 SEGUNDO
sizeTexto = constrain(sizeTexto, 20, 36); 

fill(0); // COLOR DE TEXTO NEGRO
textSize(sizeTexto); // APLICARTAMAÑO AL TEXTO

// MOVIMIENTO VERTICAL SUAVE DEL TEXTO HACIA ARRIBA
float yTexto = map(alphaTexto, 0, 255, height, height - 60); 

// DETERMINA QUE TEXTO VA SEGÚN LA PANTALLA ACTUAL

String textoActual = "";
if (pantallaActual == 0) textoActual = texto1;
else if (pantallaActual == 1) textoActual = texto2; 
else if (pantallaActual == 2) textoActual = texto3;
else if (pantallaActual == 3) textoActual = texto4;

text(textoActual, width / 2, yTexto); // SE MUESTRA EL TEXTO EN PANTALLA

// SI YA PASARON LOS 4 SEGUNDOS, SE CAMBIA A LA SIGUIENTE PANTALLA
if (tiempoTranscurrido > duracionPantalla) {
  pantallaActual++; // SE AVANZA A LA SIGUIENTE PANTALLA
  tiempoInicio = millis(); // SE RESETEA EL CONTADOR DE TIEMPO
  alphaTexto = 0; // SE REINICIA LA ANIMACIÓN DEL TEXTO
  sizeTexto = 20;
}

} else if (pantallaActual == 4) { // SI YA TERMINARON TODAS LAS PANTALLAS}

// FINAL PREPARAR BOTON PARA REINICIAR

background(245, 119, 222); // FONDO COLOR ROSA
fill(255); 
textSize(32);
text("FIN. ¿queres volver a verlo?", width / 2, height / 2 - 40); // MENSAJE FINAL

mostrarBoton = true; // SE ACTIVA PARA MOSTRAR EL BOTÓN

if (mostrarBoton) {
  fill(227, 62, 103); // COLOR DE FONDO DEL BOTÓN
  rectMode(CENTER);
  rect(width / 2, height / 2 + 40, 150, 40); // SE DIBUJA EL BOTÓN COMO RECTÁNGULO

  fill(255); // TEXTO BLANCO PARA EL BOTON
  text("Siiiiiiii", width / 2, height / 2 + 40); // TEXTO DEL BOTÓN
}
}
}

// FUNCIÓN PARA MOSTRAR UNA IMAGEN SEGUN LA PANTALLA ACTUAL

void mostrarPantalla(int pantalla) {
if (pantalla == 0) image(imagen1, 0, 0, width, height);
else if (pantalla == 1) image(imagen2, 0, 0, width, height);
else if (pantalla == 2) image(imagen3, 0, 0, width, height);
else if (pantalla == 3) image(imagen4, 0, 0, width, height);
}

// FUNCION PARA HACER CLICK EN EL BOTON FINAL

void mousePressed() {
if (pantallaActual == 4 && mostrarBoton) {
  
// ESTA FUNCION VE SI EL CLICK FUE DENTRO DEL BOTÓN

if (mouseX > width / 2 - 75 && mouseX < width / 2 + 75 &&
    mouseY > height / 2 + 20 && mouseY < height / 2 + 60) {
  pantallaActual = 0; // VUELVE A LA PRIMERA PANTALLA
  tiempoInicio = millis(); // REINICIA EL CONTADOR DE TIEMPO
  alphaTexto = 0; // REINICIA LAS ANIMACIONES
  sizeTexto = 20;
  mostrarBoton = false; // OCULTA EL BOTÓN PARA QUE SE REINICIE
}
}
}
