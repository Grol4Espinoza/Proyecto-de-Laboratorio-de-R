# Nombre : Carlos Alberto Espinoza Mansilla 20162187C

array(8:1,dim=c(2,2,2))

#mixto de posicional y exacto
# 8:1 es posicional por que se encuentra en el lugar donde se pone el argumento data
# dim=c(2,2,2) es exacto por que especifica el nombre completo del argumento

rep(1:2,3)

#posicional
#1:2 hace referencia al argumento x que es el dato con el que se va llenar el vector
#3 hace referencia al argumento times que dice cuantas veces se va repetir x

seq(from=10,to=8,length=5)
sort(decreasing=T,x=c(2,1,1,2,0,3,3,1.3))

#son exactos por que llaman a cada argumento por su nombre completo

which(matrix(c(T,F,T,T),2,2))

#posicional
#matrix(c(T,F,T,T),2,2) hace referencia al argumento x

which(matrix(c(T,F,T,T),2,2),a=T)

#mixto
# el primer argumento es posicional
# el segundo es parcial hace referencia a arr.ind 