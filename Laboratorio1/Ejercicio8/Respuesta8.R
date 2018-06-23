# Nombre : Carlos Alberto Espinoza Mansilla 20162187C

#(a) Se crea el data frame dframe:
dframe = data.frame(
Persona = c("Stan","Francine","Steve","Roger","Hayley","Klaus"),
Sexo = factor(c("M","F","M","M","F","M"), levels = c("F","M")),
Puntuacion = factor(c("Alto","Medio","Bajo","Alto","Medio","Medio"), levels=c("Alto","Medio","Bajo"))
)

dframe

#(b) agregamos la nueva columna edad

Edad=c(41,41,15,1600,21,60)

#luego para agregar una columna a un dataframe usamos $ para crear una nueva columna y la llenamos con nuestros datos

dframe$Edad = Edad

#(c) Creamos el data frame misdatos

misdatos = data.frame(
Persona = c("Peter","Lois","Meg","Chris","Stewie"),
Edad = c(42,40,17,14,1),
Sexo = factor(c("M","F","F","M","M"),levels = c("F","M") )
)
misdatos

#vemos como estan ordenanadas las columnas en misdatos y ordenamos de forma similar dframe
#sabiendo que los indices de las columnas son 1:persona, 2: sexo, 3:puntuacion y 4:edad
#se debe reordenar de la forma (1,2,3,4)->(1,4,2,3)

dframe = dframe[,c(1,4,2,3)]
dframe

#(d) 

misdatos$edad.mon = misdatos$Edad*12

misdatos

#Creamos un nuevo "misdatos" sin la columna edad.mon
#para eso simplemente seleccionas todas las demas columnas de misdatos

misdatos2 = misdatos[,c(1,2,3)]
misdatos2

#(e) creamos misdatosframe combinando misdatos2 y dframe con cbind

misdatosframe = rbind(misdatos2, dframe)

#Si intentamos unir mediante filas(row) o columnas(column) nos da error ya que falta la 
#columna puntuacion entonces la agregamos a misdatos2

Puntuacion = factor(c("Bajo","Medio","Bajo","Medio","Alto"), levels=c("Alto","Medio","Bajo"))

misdatos2$Puntuacion = Puntuacion

#intentamos nuevamente 

misdatosframe = rbind(misdatos2, dframe)
misdatosframe

#efectivamente ahora funciona
