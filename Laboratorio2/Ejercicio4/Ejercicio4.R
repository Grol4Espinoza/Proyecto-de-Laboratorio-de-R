#Ejercicio4



#a)
loopvec1 <- 5:7
loopvec2 <- 9:6
mat1 <- matrix(NA,length(loopvec1),length(loopvec2))
mat1

for (i in 1:length(loopvec1)) {
  for (j in 1:length(loopvec2)) {
    mat1[i,j] <- loopvec1[i]*loopvec2[j]
  }
}
mat1

#Reduciendo a un solo bucle for:
#i sera para recorrer las filas de mat1
for (i in 1:length(loopvec1)) {
  #La operacion loopvec[i]*loopvec2 multiplica a todos los elementos de loopvec2 por el numero loopvec1[i]
  #Este vector generado se alamacena en mat[i,] que es la i-esima fila de mat1
  mat1[i,] <- loopvec1[i]*loopvec2
}
mat1



#b)
cadena1 <- "Lisa"
#Lo siguiente devuelve el numero correspondiente a cadena1, NA si es cadena1 no esta en la lista
switch(EXPR=cadena1,Homer=12,Marge=34,Bart=56,Lisa=78,Maggie=90,NA)

#Creamos la siguiente funcion cuyo argumento, x es un array de characteres
ret_vec <- function(x){
  #creamos un vector de enteros del tamaño de x
  vec <- vector(mode = "integer", length = length(x))
  #Recorremos el vector x
  for (i in (1:length(x))) {
    #A cada elemento del vector x, se aplicara el switch anterior mencionado, almacenando los valores en
    #el vector de enteros vec
    vec[i] <- switch(EXPR=x[i],Homer=12,Marge=34,Bart=56,Lisa=78,Maggie=90,NA)
  }
  #Luego retornamos el vector generado
  return(vec)
}
#Mostramos el resultado con el siguiente vector de caracteres:
vec_char <- c("Peter","Homer","Lois","Stewie","Maggie","Bart")
ret_vec(vec_char)



#c)
#Creamos una funcion cuyo argumento es una lista la cual puede contener listas, pero estas listas contenidas
#no puede contener otras listas.
#Es funcion cuenta la cantidad de matrices que estan contenidas en el tipo de lista mencionada
nro_matrix <- function(x){
  #count inicia en cero, es el contador de matrices
  count=0
  #Recorremos la lista x
  for (i in (1:length(x))) {
    #Si el elemento i de la lista x es una lista recorremos sus elementos
    if(is.list(x[[i]])){
      for (j in (1:length(x[[i]]))) {
        #Si el elemento j de la lista x[[i]] es una matriz, el contador aumenta en uno
        if(is.matrix(x[[i]][[j]])){
          count=count+1
        }
      }
    }
    #De no ser una lista el elemento i de la lista x, se procede a verificar si es una matriz
    #Si es una matriz, el contador aumenta en 1
    else if(is.matrix(x[[i]])){
      count=count+1
    }
  }
  #Finalmente retorna el valor de count
  return(count)
}
unalista <- list(aa=c(3.4,1),bb=matrix(1:4,2,2),
                 cc=matrix(c(T,T,F,T,F,F),3,2),dd="cadena aqui",
                 ee=list(c("hola","tu"),matrix(c("hola","there"))),
                 ff=matrix(c("red","green","blue","yellow")))
nro_matrix(unalista)

unalista <- list("salio algo raro",as.vector(matrix(1:6,3,2)))
nro_matrix(unalista)

unalista <- list(list(1,2,3),list(c(3,2),2),list(c(1,2),matrix(c(1,2))),
                 rbind(1:10,100:91))
nro_matrix(unalista)
