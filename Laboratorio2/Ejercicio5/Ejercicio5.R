# Nombre: Luis Eduardo Ramos Grados 20162210E
# Respuesta5: Manejo de dataframes

#5_a)
#Crearemos la funcion factorial llamada xfactorial tienendo como argumento a x
xfactorial <- function(x){
  #Si x es negativo, mostrara un mensaje indicando que el numero es negativo
  if(x < 0)
    cat(x, "es un numero no negativo")
  #Para otro caso realizamos un bucle con while
  else{
    #Considerando valores mayores o iguales a cero
    while(x >= 0){
      #Si el valor de x es 0 la funcion retornara 1
      if(x == 0)
        return(1)
      #En otro caso se calculara el factorial como el producto de x con el factorial de x-1
      else{
        fact <- x*xfactorial(x-1)
        #Se retorna el valor calculado
        return(fact)
      }
    }
  }
}
#Asignando a minum 5 se verifica que resultado de la funcion es 120
minum <- 5
xfactorial(minum)
#Asignando a minum 12 se verifica que resultado de la funcion es 479001600
minum <- 12
xfactorial(minum)
#Asignando a minum 0 se verifica que resultado de la funcion es 1
minum <- 0
xfactorial(minum)


#5_b)
#Examinaremos el objeto unacadena
unacadena <- "R fever"
#index sera la posicion del caracter en unacadena y ecount las veces que se han encontrado
#una e o E
index <- 1
ecount <- 0
resultado <- unacadena

#Examinaremos caracter por caracter hasta encontrar ecount sea 2 o hasta haber terminado de
#examinar el objeto
while(ecount<2 && index<=nchar(unacadena)){
  #Extraemos el caracter en la posicion index
  chrt <- substr(unacadena, index, index)
  #De econtrarse una e o E se incrementara el ecount en 1
  if(chrt == 'E' || chrt == 'e')
    ecount <- ecount + 1
  #Si ecount es 2, a resultado se le asignara los caracteres de la poscion 1 hasta index-1
  if(ecount == 2)
    resultado <- substr(unacadena, 1, index-1)
  #incrementamos index en 1 para seguir recorriendo el objeto
  index <- index + 1
}
#Mostramos el resultado luego de ejecutar el bucle
resultado
