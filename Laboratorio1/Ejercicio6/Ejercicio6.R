# Nombre: Luis Eduardo Ramos Grados 20162210E
# Respuesta6: Manejo de dataframes

#a)
#Seleccionamos los datos de quake, en los cuales sus manginutes (mag) mayor o igual a 5
q <- quakes[quakes$mag >= 5.0,]
#Guardamos los datos anteriores en q5.txt
write.table(q, "/home/luis/Escritorio/5/q5.txt", #Ruta de la carpeta
            sep = "!", #"!" para separar datos
            row.names = FALSE) #No se guardan los nombres de las filas

#Leemos el archivo anterior y lo renombramos como q5.dframe
q5.dframe <- read.csv("/home/luis/Escritorio/5/q5.txt", #Ruta del archivo a leer
                      header = TRUE, #
                      sep = "!") #reconoce a "!" 
q5.dframe


#b)
library('car')
#Establecemos el directorio donde se guardara el archivo
setwd("/home/luis/Escritorio/5/")
#Con png() empezaremos a creear la imagen en formato png
png(filename = "Duncan_e_i.png", #filename es el nombre de la imagen
    width = 500, height = 500)   #se crea la imagen de 500x500 pixeles
plot.new()
plot.window(c(0,100), c(0,100))  #Rangos de ejes del 0 al 100
box()
axis(side = 1)
axis(side = 2)
#Puntos solidos negros para datos en los cuales el prestigio es menor o igual a 80
points(Duncan$education[Duncan$prestige <= 80],
       Duncan$income[Duncan$prestige <= 80],
       pch = 19) # pch = 19asigna el tipo de punto solido
#Puntos sin relleno para datos con prestigio mayor a 80
points(Duncan$education[Duncan$prestige > 80],
       Duncan$income[Duncan$prestige > 80],
       pch = 1) #pch = 1 asigna un punto sin relleno
mtext("Educacion (education)", side = 1, line = 3)
mtext("Ingresos (income)", side = 2, line = 3) 
#Con legend() escrbimos una leyenda
legend(x = 52, y= 100, # x e y dan las posiciones para ubicar la leyenda 
       legend = c("Prestigio menor o igual a 80", "Prestigio mayor a 80"), 
       pch = c(19, 1))
#Con dev.off() damos por terminado la creacion de la imagen
dev.off()

#c)
#Creamos la lista exer que contiene quakes, q5.dframe y Duncan
exer <- list(quakes, q5.dframe, Duncan)
#Guardamos la lista como Ejercicio_df.txt en el espacio de trabajo
dput(exer, file = "Ejercicio_df.txt")
#Leemos el archvio guardado y lo almacenamos en lista.de.frames
lista.de.dataframes <- dget("Ejercicio_df.txt")
#Verificamos que es la lista guardada anteriormente
lista.de.dataframes
