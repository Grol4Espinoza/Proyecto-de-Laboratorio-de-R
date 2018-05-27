# Nombre: Luis Eduardo Ramos Grados 20162210E
# Respuesta5: Plots y graficas con grid en R


#Inicializamos un plot con ejes x e y
plot.new()
#Configuramos el sistema de coordenadas para el plot inicializado
plot.window(range(pressure$temperature), #Asigna el rango de pressure$temperature para x
            range(pressure$pressure)) #Asigna el rango de pressure$pressure para y
#box() dibuja una rect?ngulo en el plot creado
box()
#axis(side) agrega un eje al plot crado anteriormente,
#dentro de su argumento va el entero "side" que especifica la posici?n del eje.
#axis(1) agrega el eje en la parte inferior
axis(1)
#axis(2) agrega el eje a la parte izquierda
axis(2)
#points() muestra los puntos en la region tomando al primer argumento
#como eje x y el segundo como eje y
points(pressure$temperature, pressure$pressure)
#Con la funcion mtext( text, side, line) agrega texto al los margenes del plot
#con el nombre "text" en la posicion "side" y a un margen del eje "line"
#Se agrega el texto en la parte inferior, side=1
mtext("temperatura", side=1, line=3)
#Se agrega el texto en la parte izquierda, side=2
mtext("presion", side=2, line=3)
#Se agrega el texto en la parte superior, side=3
mtext("Presion de vapor de Mercurio \ncomo una funcion de la Temperatura",
      side=3, line=3, font=2)


#Graficando con grid
#Inciamos el paquete "grid" con library()
library(package = "grid")
#Creamos el nuevo espacio para graficas en grid
grid.newpage()
#Creamos un plot para las graficas en grid con plotViewport(margins), donde
#"margins" es un vector numerico que contiene los margenes hacia adentro de
#la parte inferior, izquierdo, superior y derecho en ese orden
pVp <- plotViewport(margins = c(4,4,5,2))
#Enviamos el plot creado al esapacio grid antes creado con pushViewport
pushViewport(pVp)
#Creamos los rangos para los ejes x e y con dataViewport(xscale, yscale)
#xscale para el rango en x e yscale para el rango en y
dVp <- dataViewport(range(pressure$temperature), #Asigna el rango de pressure$temperature para x
                    range(pressure$pressure)) #Asigna el rango de pressure$pressure para y
#Ahora enviamos los rangos al plot creado con pushViewport()
pushViewport(dVp)
#Dibujamos el entorno rectangular con grid.draw(rectGrob())
grid.draw(rectGrob())
#Con grid.xaxis(at) y grid.yaxis(at) creamos y enviamos los ejes x e y respectivamente
#donde "at" es un vector numerico que guarda los valores que tomaran
grid.xaxis(at = seq(0, 350, 50)) #Eje para X desde 0 a 350
grid.yaxis(at = seq(0, 800, 200)) # Eje para Y desde 0 a 800 
#Dibujamos los puntos con grid.points(x,y) donde x e y son vectores numericos que contienen
#los valores para los ejes x e y respectivamente
grid.points(pressure$temperature,
            pressure$pressure)
#Usaremos grid.text(label, x, y, gp rot) ara escribir texto en los margenes del sistema de 
#coordenadas dibujado donde "label" es el texto, "x" e "y" son objetos unit que determinan
#la distancia horizontal y vertical respecto al centro del sistema de coordenadas
#respectivamente a la cual se encuentra el texto y rot el angulo en que gira el texto
grid.text("temperatura", y = unit(-3, "lines"))
grid.text("presion", x = unit(-3.2, "lines"), rot = 90)
grid.text("Presion de vapor de Mercurio \ncomo una funcion de la Temperatura",
          y = unit(25, "lines"))
