#el estado "S" es tu posicion en i,j,k en la matriz de 3 dimensiones.
#  "no ganar" y "ganar"
#S[i,j,k]=probabilidad de ganar desde estado s


S= array(c(0.1,0.34,0.623,0.2,0.45,1,0.4,1),c(2,2,2)) #array en tres dimensiones

#el array en R empieza desde 1 asique veremos interpretaremos el indice S[1,2,1] por ejemplo como S[0,1,0]

I=c(1,2) #establecemos valores posibles para nuestros indices i,j,k
J=c(1,2)
K=c(1,2)

e=0.001  #seteamos el minimo de aproximación

P=c(0.1,0.34,0.623,0.2,0.45,1,0.4,1) # inicilizado vector que contendra los resultados en cada iteracion

iteracion=0

m=0

x=1  #seteamos la condicion inicial 

while (x >= e) {
  x = 0
  
  Pr=NULL
  
  for (i in I) {
   for (j in J) {
     for (k in K) {
       v = S[i,j,k]
       if(k+1==3 | i+k>2)
         S[i,j,k] = max( 0.5*(1-S[j,i,1]+1),1-S[j,i,1])
       
       else 
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

