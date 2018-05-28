# Nombre : Carlos Alberto Espinoza Mansilla 20162187C

#(a) PPara poder ver los elementos de un "ambiente" o "entorno" en este caso para ver 
#lo que hay en el paquete "methods" usamos ls() que muestra un vector de cadenas de caracteres 
#con nombres de los objetos dentro de lo que se encuentre dentro de los paréntesis luego 
#mostramos los primeros 20 elementos con un vector a .


a=ls("package:methods")
a[1:20]

#Vemos que muestra en orden alfabetico los objetos del paquete sin embargo, no esta mostrando 
#todo ya que ls() esta omitiendo los objetos que empiezan con un ".", para que los muestre hay 
#que agregar el argumento "all.names=TRUE"

a=ls("package:methods",all.names=TRUE)
a[1:20]

#Ahora los 20 primeros elementos son funciones que empiezan con un ".".
#Finalmente para saber cuantos elementos hay usamos length(a) que devuelve el numero de elementos de un vector.

length(a)


#(b) La funcion "environment()" nos permitira saber a que paquete pertence las funciones que nos piden.

environment(read.table)
environment(data)
environment(matrix)
environment(jpeg)

#(c) Para confirmar que "smoothScatter" pertenece al paquete "graphics" usaremos la funcion "grep()" 
#la cual devuelve la posicion de un string en un vector de strings si este se encuentrase en dicho vector, 
#entonces comparamos el string "smoothScatter" con el vector de strings ls("package:graphics"). Ademas para este 
#caso no es necesario incluir "all.names" en la función ls ya que el string que buscamos no empieza con un ".".

grep("smoothScatter", ls("package:graphics") )

#Nos devuelve 71 por que esa es la posición en la que se encuentra la funcion en el vector de strings de 
#funciones del paquete graphics, por lo tanto se concluye que dicha funcion si pertenece al paquete graphics.