#Ejercicio7: Calculo de probabilidades

#a)
#Valores que pude contener A
A_values <- c("+","-","?")
#Valores que puede enviar B
B_values <- c("+","-")

#Se escoge un tamaño entre del 1 al 10
size <- sample((1:10),1)

#Una funcion que cuente la cantidad de elementos c dentro del vector x
c_char <- function(x,c){
  count = 0
  for (i in (1:length(x))) {
    if(x[i]==c){
      count = count+1
    }
  }
  return(count)
}

#Funcion que genera la cantidad determinada de datos aleatorios para que envie B, x los valores
#que B puede enviar y size cantidad
set_inf_B <- function(x,size){
  return(sample(x,size,replace = TRUE))
}
#Funcion que genera los datos posibles que A recibe de B
set_inf_A <- function(y){
  #Cantidad de "+" no mayor a la de B
  posit <- sample((0:c_char(y,"+")),1)
  #Cantidad de "-" no mayor a la de B
  negat <- sample((0:c_char(y,"-")),1)
  #Cantidad de datos que no se acuerda
  lost <- length(y)-(posit+negat)
  #Se genera un vector de "+","-" y "?" con sus cantidades respectivas
  vec <- c(rep("+",posit),rep("-",negat),rep("?",lost))
  #Se devuelve una permutacion del vector generado
  return(sample(vec))
}

#Generamos los valores que B envia
B_send <- set_inf_B(B_values,size)
#Obtenemos los datos que A recibe de B
A_rec <- set_inf_A(B_send)

#Mostramos los datos
B_send
A_rec

#Para calcular la probabilidad, procedemos a calcular la cantidad de "+" y "-" que faltan en A
#Cantidad de "+" que faltan
p <- c_char(B_send,"+")-c_char(A_rec,"+")
#Cantidad de "-" que faltan
n <- c_char(B_send,"-")-c_char(A_rec,"-")

#La cantidad total de casos que se puede obtener es 2^(p+n), pues son 2 valores en los que pueden
#ir p+n espacios
total <- (2)^(p+n)
#La cantidad de casos favorables es la permutacion repetida de p+n caracteres de los cuales
#p se repiten y n se repiten
fav <- factorial(p+n)/(factorial(p)*factorial(n))
#De lo anterior calculado procedemos a calcular la probabilidad
prob <- fav/total
sprintf("La probabilidad es:%.9f",prob)


#b)
#Creamos una funcion que genere un arreglo que contenga todas las posibles sumas de el resultado
#de tirar 3 dados
vect <- function(){
  v <- array(NA,c(6,6,6))
  for (i in (1:6)) {
    for (j in (1:6)) {
      for (k in (1:6)) {
        v[i,j,k] <- i+j+k
      }
    }
  }
  return(v)
}
#Creamos una funcion que calcula el maximo comun divisor
mcd <- function(x,y){
  m <- min(x,y)
  for (i in (1:m)) {
    if(x%%i == 0 && y%%i ==0)
      result = i
  }
  return(result)
}
#Generamos 2 resultados aleatorios de la suma del resultado de lanzar 3 dados
B <- sample((3:18),1)
C <- sample((3:18),1)

#Creamos una tabla, apartir del arreglo generado por vect(), que contiene como elementos
#la cantidad de veces que se repite una suma en orden creciente
tabla <- table(vect())

#Con la tabla creada podemos calcular los casos favorables
s <- sum(tabla[(max(B,C)-2):16])
cat("Casos favorables:",s)
cat("Casos totales:216")
#Calculamos el mcd entre los casos favorables y el total de casos, para obtener como resultado
#la probabilidad expresada en una fraccion irreductible
div <- mcd(s,216)
#Mostramos la probabilidad:
cat("Probabilidad:",s/div,"/",216/div)
