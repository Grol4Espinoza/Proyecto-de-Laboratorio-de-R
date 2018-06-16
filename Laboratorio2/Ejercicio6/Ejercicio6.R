#Nombre: Ramos Grados Luis Eduardo
#Respuesta6: Manejo de la familia apply

#a)
#Se crea la lista matlist
matlist <- list(matrix(c(T,F,T,T),2,2),
                matrix(c("a","c","b","z","p","q"),3,2),
                matrix(1:8,2,4))
matlist
#Ciclo for:
for (i in 1:length(matlist)) {
  matlist[[i]] <- t(matlist[[i]])
}
matlist

#Con lapply se ejecuta la misma accion que con el ciclo for.
#El primer argumento(matlist) es la lista de matrices.
#El segundo argumento(t) es la funcion que se aplicara a cada elemento de la lista.
lapply(matlist, t)



#b)
#Se crea una matriz tetradimensional compuesta de tres bloques, cada bloque compuesto por dos capas de matrices de 4x4
qux <- array(96:1,dim = c(4,4,2,3))
#Extraemos las matrices de la segunda capa y las almacenamos en qux_c2
#Esta matriz es tridimensional de 4x4x3, visto como una matriz sobre otra de dimensiones 4x4
qux_c2 <- qux[,,2,]
#Ahora usaremos apply para extraer los elementos de la diagonal de cada una de las matrices
apply(qux_c2, 3, diag)
#Tambien podemos escribir de la siguiente manera:
apply(qux[,,2,], 3, diag)


#Mostramos tres matrices de 4x2, accediendo a las columnas de qux de la siguiente manera:
qux[,4,,]
#Con un apply podemos extraer las dimensiones de cada una de ellas, almacenando en qux_col_dim
qux_col_dim <- apply(qux[,4,,],3,dim)
#Con un apply hallamos la suma de filas de la qux_col_dim
apply(qux_col_dim, 1, sum)
#Se puede obtener el mismo resultado final enlazando los dos apply
apply(apply(qux[,4,,],3,dim), 1, sum)
