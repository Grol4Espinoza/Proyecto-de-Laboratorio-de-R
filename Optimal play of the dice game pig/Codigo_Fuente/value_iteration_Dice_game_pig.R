
#Valore que puede tomar i,j,k respectivamente
I <- (1:101)
J <- (1:101)
K <- (1:106)

#S arreglo de probabilidades
S <- array(NA,c(101,101,106))
#D arreglo booleano cuyo valor D[i,j,k] de ser verdadero la probabilidad S[i,j,k] ya ha sido calculado por 'Value Iteration'
#Inicializamos el array con todos los valores falsos
D <- array(F,c(101,101,106))

#Generamos valores para S
for (i in I) {
  for (j in J) {
    for (k in K) {
      if(i+k>=102)
        S[i,j,k] <- 1
      else
        S[i,j,k] <- sample((1:999),1)/1000
    }
  }
}


#iteration value
#Empezamos con los valores com mayor puntaje acumulado, es deci S[100,100,]
for(i in (100:1)){
  for (j in (i:1)) {
    e <- 0.001
    x <- 1
    #Iniciamos bucle para ijk
    while (x>=e) {
      x<-0
      for(k in (1:(101-i))){
        #Si no ha sido calculado S[i,j,k]
        #cat(i,' ',j,' ',k,"ijk\n")
        if(D[i,j,k] == FALSE){
          #Empieza a calcular
          v <- S[i,j,k]
          if((i+k)>=102){
            S[i,j,k] <- 1
          }
          else if(i+k < 101){
            #prob est i,j,k es Pi,j,k S[i+1,j+1,k+1]
            #show(k)
            p_r <- (1/6)*(1-S[j,i,1]+S[i,j,(k+2)]+S[i,j,(k+3)]+S[i,j,(k+4)]+S[i,j,(k+5)]+S[i,j,(k+6)])
            p_h <- (1-S[j,(i+k),k])
            S[i,j,k] <- max(p_r,p_h)
            x <- max(x,abs(v-S[i,j,k]))
          }
        }
        #Si ya ha sido calculado sale del bucle
        if(D[i,j,k] == TRUE)
          x <- 1
      }
    }
    #Luego avisamos que ya ha sido calculado
    for (k in (1:(101-i))) {
      D[i,j,k] <- TRUE 
    }
    
    e <- 0.001
    x <- 1
    #Iniciamos bucle para j,i,k
    while (x>=e) {
      x<-0
      for(k in (1:(101-j))){
        #Si no ha sido calculado S[i,j,k]
        cat(i,' ',j,' ',k,"ijk\n")
        if(D[j,i,k] == FALSE){
          #Empieza a calcular
          v <- S[j,i,k]
          if((j+k)>=102){
            S[j,i,k] <- 1
          }
          else if(j+k < 101){
            #prob est i,j,k es Pi,j,k S[i+1,j+1,k+1]
            #show(k)
            p_r <- (1/6)*(1-S[i,j,1]+S[j,i,(k+2)]+S[j,i,(k+3)]+S[j,i,(k+4)]+S[j,i,(k+5)]+S[j,i,(k+6)])
            p_h <- (1-S[i,(j+k),k])
            S[j,i,k] <- max(p_r,p_h)
            x <- max(x,abs(v-S[j,i,k]))
          }
        }
        #Si ya ha sido calculado sale del bucle
        if(D[j,i,k] == TRUE){
          #show(x)
          x <- 1
          show(x)
        }
      }
    }
    #Luego avisamos que ya ha sido calculado
    for (k in (1:(101-j))) {
      D[j,i,k] <- TRUE 
    }
  }
}


