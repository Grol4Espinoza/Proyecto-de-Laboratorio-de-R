
ijk_p <- integer(4) 
ijk_c <- integer(4)

init <- function(){
  return(integer(4))
}

roll <- function(){
  n <- sample((1:6),1)
  return(n)
}

update_stat_cpr <- function(vect_stat,roll){
  if(roll == 1)
    vect_stat[3] <- 0
  else{
    vect_stat[3] <- vect_stat[3]+roll
  }
  return(vect_stat)
}

update_stat_cph <- function(vect_stat){
  vect_stat[1] <- vect_stat[1] + vect_stat[3]
  vect_stat[3] <- 0
  return(vect_stat)
}

update_stat_o <- function(vect_stat, vect_stat_cp){
    vect_stat[2] <- vect_stat_cp[1]
  return(vect_stat)
}

cpu_decit <- function(vect_stat){
  #Si el puntaje es mayor que 20, cpu pasa
  if(vect_stat[3] >=20)
    return(0)
  #De lo contrario, lanza nuevamente
  else
    return(1)
}

cp_win <- function(vect_stat){
  if(vect_stat[1] + vect_stat[3]>= 100)
    return(1)
  else
    return(0)
}

pig <- function(){
  cat("\tPrimer valor, score acumulado\n
      Segundo valor, score del oponente acumulado\n
      Tercer valor, score acumulado del turno\n")
  cat("Valores Iiciales\n")
  ijk_p <- init()
  ijk_c <- init()
  cat("Jugador\n")
  show(ijk_p)
  cat("PC\n")
  show(ijk_c)
  wdy <- 0
  #Si juega:
  if(dyp == 1){
    while (ijk_p[4]!=1 && ijk_c[4]!=1) {
      ijk_c[1]
      #Pregunta que desea hacer
      cat("Que desea hacer?\n")
      cat("1 lanzar dado, 2 pasar turno:\n")
      act <- readline()
      act <- as.integer(act)
      cat("Opcion:\n")
      show(act)
      #Si decide lanzar:
      while(act == 1){
        r <- roll()
        cat("Usted lanzo:\n")
        show(r)
        #Si el resultado es distinto de 1, acumula puntos
        if(r!=1){
          ijk_p <- update_stat_cpr(ijk_p,r)
          ijk_c <- update_stat_o(ijk_c,ijk_p)
          cat("Puntajes:\n")
          show(ijk_p)
          show(ijk_c)
        }
        #De lo contrario, pierde los puntos del turno y pasa su turno
        if(r==1){
          ijk_p <- update_stat_cpr(ijk_p,r)
          ijk_c <- update_stat_o(ijk_c,ijk_p)
          act <- 0
          cat("Puntajes:\n")
          show(ijk_p)
          show(ijk_c)
        }
        #Si ha acumlado mas de 100 puntos en total termina el juego
        if(cp_win(ijk_p)==1){
          ijk_p[4] <- 1
          ijk_p <- update_stat_cph (ijk_p)
          ijk_c <- update_stat_o(ijk_c, ijk_p)
          act <-0
          cat("Puntajes:\n")
          show(ijk_p)
          show(ijk_c)
        }
        #Si el juego aun no ha terminado
        else if(act!=0){
          cat("Que desea hacer?\n")
          cat("1 lanzar dado, 0 pasar turno:\n")
          act <- readline()
          act <- as.integer(act)
          cat("Opcion:")
          show(act)
        }
      }
      #Si el juego aun no termina
      if(cp_win(ijk_p)!=1){
        #Suma a sus puntos totales al final de su turno
        cat("Termino su turno\n")
        ijk_p <- update_stat_cph (ijk_p)
        ijk_c <- update_stat_o(ijk_c, ijk_p)
        cat("Puntajes:\n")
        show(ijk_p)
        show(ijk_c)
        #Si pasa su turno
        if(act == 0){
          #El cpu verifica si ya alcanzo los 20 puntos en su turno
          cat("CPU decidiendo....\n")
          d <- cpu_decit(ijk_c)
          #Mientras no alcanze los 20 puntos o resulte el dado en 1, lanzara el dado
          while(d==1){
            r <- roll()
            cat("CPU lanzo:\n")
            show(r)
            #Si resulta un numero distinto de uno, acomula y decide
            if(r!=1){
              ijk_c <- update_stat_cpr(ijk_c,r)
              d <- cpu_decit(ijk_c)
              cat("Puntajes:\n")
              show(ijk_p)
              show(ijk_c)
            }
            #De ser 1, el cpu pierde los puntos del turno y pasa su turno
            else if(r==1){
              ijk_c <- update_stat_cpr(ijk_c,r)
              ijk_p <- update_stat_o(ijk_p,ijk_c)
              d=0
              cat("Puntajes:\n")
              show(ijk_p)
              show(ijk_c)
            }
            #Si el cpu a acumlado los 100 puntos, el juego ha terminado
            if(cp_win(ijk_c)==1){
              d <- 0
              ijk_c[4] <- 1
              ijk_c <- update_stat_cph (ijk_c)
              ijk_p <- update_stat_o(ijk_p, ijk_c)
              cat("Puntajes:\n")
              show(ijk_p)
              show(ijk_c)
            }
            #Caso contrario, se seguira jugando
          }
          cat("Termino turno de CPU\n")
          ijk_c <- update_stat_cph (ijk_c)
          ijk_p <- update_stat_o(ijk_p, ijk_c)
          cat("Puntajes:\n")
          show(ijk_p)
          show(ijk_c)
        } 
      }
    }
    #Una vez terminado el juego, se muestran los puntajes
    cat("Puntajes Finales:\n")
    show(ijk_p)
    show(ijk_c)
    if(ijk_c[4]==1)
      cat("CPU GANO!\n")
    if(ijk_p[4]==1)
      cat("GANO EL JUEGO!\n")
  }
}

pig()


