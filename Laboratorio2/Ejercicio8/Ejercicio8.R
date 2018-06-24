#Ejercicio8: Manejo de solve y try

#Creamos la funcion invert con 4 argumentos
invert <- function(x,noninv,nonmat,silent){
  #Si x no es una lista muestra un mensaje de error
  if(is.list(x)==FALSE)
    cat("Error, no es una lista.\n")
  #De lo contrario sigue el procedimiento
  else{
    #Si x es una lista vacia, muestra un mensaje de error
    if(length(x)==0)
      cat("Error, la lista no tiene elementos\n")
    #De lo contrario sigue el procedimiento
    else{
      #Si nonmat no es una cadena de caracteres, muestra un mensaje y lo coerce a una cadena de caracteres
      if(is.character(nonmat)==FALSE){
        cat("nonmat no es una cadena de caracteres, se coercera nonmat\n")
        nonmat <- as.character(nonmat)
      }
      #Recorremos cada elemento de la lista x
      for (i in (1:length(x))) {
        #Si el elemento i de la lista x es una matriz, se sigue lo siguiente
        if(is.matrix(x[[i]])==TRUE){
          #Con try procedemos a resolver el elemento
          x[[i]] <- try(solve(x[[i]]),silent)
          #Si no se puede resolver, el elemento se reemplaza por noninv
          if(is.matrix(x[[i]])==FALSE)
            x[[i]] <- noninv
        }
        #De no ser una matriz, el elemento se reemplaza por nonmat
        else
          x[[i]] <- nonmat
      }
    }
  }
  #Finalmente se devuelve la lista modificada
  return(x)
}
noninv <- NA
nonmat <- "no es una matriz!"
silent <- TRUE
x <- list(1:4,matrix(1:4,1,4),matrix(1:4,4,1), matrix(1:4,2,2))
invert(x,noninv,nonmat,silent)

noninv <- Inf
nonmat <- 666
silent <- silent
invert(x,noninv,nonmat,silent)

noninv <- Inf
nonmat <- 666
silent <- FALSE
invert(x,noninv,nonmat,silent)

noninv <- "matriz inadecuada"
nonmat <- "no es una matriz!"
silent <- TRUE
x <- list(diag(9),matrix(c(0.2,0.4,0.2,0.1,0.1,0.2),3,3),
        rbind(c(5,5,1,2),c(2,2,1,8),c(6,1,5,5),c(1,0,2,0)),
        matrix(1:6,2,3),cbind(c(3,5),c(6,5)),as.vector(diag(2)))
invert(x,noninv,nonmat,silent)

x <- "hola"
invert(x,noninv,nonmat,silent)

x <- list()
invert(x,noninv,nonmat,silent)
