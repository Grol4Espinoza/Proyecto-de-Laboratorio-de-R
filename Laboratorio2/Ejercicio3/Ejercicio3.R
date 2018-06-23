#Ejercicio3:Funciones

#a)
vec1 <- c(2,1,1,3,2,1,0)
vec2 <- c(3,8,2,2,0,0,0)

#if((vec1[1]+vec2[2])==10){ cat("Imprime el resultado!") }
#El resultado de vec1[1]+vec2[2] es 10, entonces el argumento dentro del if es verdadero
#Por tanto imprime la cadena en consola

#if(vec1[1]>=2 && vec2[2]>=2){ cat("Imprime el resultado!") }
#Se observa que vec1[1]=2 es mayor o igual a 2 y vec2[2]=2 es mayor igual a 2, siendo asi el argumento verdadero
#Por tanto imprime la cadena en consola

#if(all((vec2-vec1)[c(2,6)]<7)){ cat("Imprime el resultado!") }
#(vec2-vec1)[c(2,6)] tiene uno de sus valores a 7, entonces (vec2-vec1)[c(2,6)]<7 tiene como uno de sus elementos FALSE
#Por lo que all((vec2-vec1)[c(2,6)]<7) da falso ya que uno de los elementos del vector es FALSE
#Por tanto no imprime la cadena

#if(!is.na(vec2[3])){ cat("Imprime el resultado!") }
#vec2[3] tiene el valor 2 por lo que is.na(vec2[3]) es falso, asi !is.na(vec2[3]) es verdadero
#Por tanto se imprime la cadena en consola

if((vec1[1]+vec2[2])==10){ cat("Imprime el resultado!") }
if(vec1[1]>=2 && vec2[2]>=2){ cat("Imprime el resultado!") }
if(all((vec2-vec1)[c(2,6)]<7)){ cat("Imprime el resultado!") }
if(!is.na(vec2[3])){ cat("Imprime el resultado!") }


#b)
#Creamos siguiente funcion que tendra como argumentos dos vectores de igual longitud, x e y
modf_vector <- function(x,y){
  #Creamos un vector de enteros del tamaño de uno de los vectores, en este caso de x
  z<- vector(mode = "integer", length = length(x))
  
  #Usaremos un for para recorrer los vectores
  for (i in seq(1, length(z))) {
    #Si la suma de elementos correspondientes es mayor que 3, entonces los elementos se multiplican
    if((x[i]+y[i])>3){
      z[i]=x[i]*y[i]
    }
    #En caso contrario los elementos se suman
    else{
      z[i]=x[i]+y[i]
    }
  }
  #Mostramos el resultado generado por el for
  return(z)
}
#Usamos la funcion para x=vec1 e y=vec2
modf_vector(vec1,vec2)



#c)
#Creamos la siguiente funcion
modf_matrix <- function(x){
  #flag se usara para saber si es que se encuentra alguna coincidencia en el caracter, se incia con flag FALSE
  flag=FALSE
  #Un for para que recorra por la diagonal de la matriz x
  for (i in seq(1,length(diag(x)))) {
    #Se ejecutara las sentencias del if si la primera letra de algunos elementos de diagonal
    #empieza con "g" o "G"
    if((substr(diag(x)[i],1,1) == "g") || (substr(diag(x)[i],1,1) == "G")){
      #De encontrar alguna coincidencia, la cadena entera se reemplaza por "AQUI"
      diag(x)[i] = "AQUI"
      #Finalmente el flag cambia TRUE
      flag = TRUE
    }
  }
  #Si no se encuentran coincidencias, es decir flag = FALSE, la matriz entera se reemplaza por la
  #matriz identidad de igual dimension.
  if(flag==FALSE)
    x=diag(length(diag(x)))
  #Finalmente se muestra la matriz resultada
  x
}

mymat <- matrix(as.character(1:16),4,4)
modf_matrix(mymat)

mymat <- matrix(c("DANDELION","Hyacinthius","Gerbera",
                  "MARIGOLD","geranium","lugularia",
                  "Pachysandra","SNAPDRAGON","GLADIOLUS"),3,3)
modf_matrix(mymat)

mymat <- matrix(c("GREAT","ejercicios","agua","hey"),2,2,
                byrow = T)
modf_matrix(mymat)
