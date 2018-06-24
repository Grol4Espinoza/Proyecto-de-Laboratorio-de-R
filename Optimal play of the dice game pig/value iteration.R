#establecemos valores posibles para nuestros indices i,j,k
#a pesar de que en el problema se trabaja con valores 0 y 1 R no permite esto asi que se trabajara con valores 1,2:
I=c(1,2) #Para i
J=c(1,2) #Para j
K=c(1,2) #Para k

S <-array(NA, c(2,2,2)) #seteamos el array de probabilidad.

#El estado "S" es tu posicion en i,j,k en la matriz de 3 dimensiones.
#Donde i representa el puntaje acumalado en el juego, j el puntaje acumulado del oponente durante el juego
#y k es el puntaje acumulado durante su turno, y el contenido S(i,j,k)
#es la probabilidad de ganar a partir de ese estado
#Existen 2 acciones:  "Lanzar" y "terminar turno"


#Rellenamos el array S con valores arbitrarios:

for (i in I) {
  for (j in J) {
    for (k in K) {
      #Si se tiene el estado en el que ya se ha ganado,es decir S(i,j,k)=1, se le da 1
      if(i+k>=4)
        S[i,j,k] <- 1
      #Caso contrario, se le asigna una numero aleatorio entre [0,1]
      else
        S[i,j,k] <- sample((1:999),1)/1000
    }
  }
}
#Mostramos el arreglo generado
S

#La indexacion en R empieza desde 1, por lo cual interpretaremos el índice S[1,2,1] como S[0,1,0]

e=0.001  #seteamos el mínimo de aproximación

P=as.vector(S) # inicializamos el vector que contendra los resultados de todas las iteraciónes
P
iteracion=0

m=0

x=1  #seteamos la condicion inicial 

while (x >= e) { #iniciamos el bucle
  x = 0
  
  Pr=NULL #seteamos el vector que guardara los cambios por cada iteracion
  
  for (i in I) {
    for (j in J) {
      for (k in K) {
        
        v = S[i,j,k]
        
        if(i+k == 4 ) # Si entra un S(i,j,k) correspondiente a un estado ganador
          S[i,j,k] = 1
        else 
          if(k+1 == 3) # si entra un S(i,j,k) que pueda salirse de los limites de nuestra matriz(2,2,2)
            S[i,j,k] = max( 0.5*(1-S[j,i,1]+1),1-S[j,i,1])
          else         # todos los demas imputs
            S[i,j,k] = max( 0.5*(1-S[j,i,1]+S[i,j,k+1]),1-S[j,i,1]) 
          
          x = max(x,abs(v-S[i,j,k]))
          Pr=c(Pr,S[i,j,k])
          
      }
    }
  }
  
  m=m+1
  iteracion=c(iteracion,m)
  P=rbind(P,Pr)
}

plot(iteracion,P[,1],type="o",col="blue",xlab="nro de iteraciones",ylab = "Probabilidad de ganar",main = "value iteration para piglet")
lines(iteracion,P[,2],type="o",col="green")
lines(iteracion,P[,3],type="o",col="red")
lines(iteracion,P[,4],type="o",col="yellow")
lines(iteracion,P[,5],type="o",col="black")
lines(iteracion,P[,7],type="o",col="orange")
legend("bottomright",col=c("blue","green","red","yellow","black","orange"),legend=c("P(0,0,0)","P(0,0,1)","P(0,1,0)","P(0,1,1)","P(1,0,0)","P(1,1,0)"),lwd=3,bty="n")


for(i in I)
  for(j in J)
    for(k in K)
      cat(sprintf("P(%d,%d,%d)=%f\n", i-1,j-1,k-1,S[i,j,k]))
