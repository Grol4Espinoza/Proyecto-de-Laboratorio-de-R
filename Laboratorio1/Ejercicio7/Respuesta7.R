# Nombre : Carlos Alberto Espinoza Mansilla 20162187C

#(a) Se almacena el siguiente vector

f1=c(13563,-14156,-14319,16981,12921,11979,9568,8833,-12968,8133)

#ahora elevamos el array f1 a la potencia de 75

(f1^75)

#Notamos en el vector resultado que en varios de los elementos se ve
#"Inf" o -"Inf" esto significa que R considera a esas pontencias como infinitos
#para saber que elementos del vector (f1^75) no son infinitos al elevar se puede usar
#la funcion is.infinite(x), donde x es un vector esta funcion devuelve un vector de valores TRUE o FALSE
#donde TRUE indica un numero infinito y FALSE uno finito o un NaN que significa not a number, solo
#tenemos que invertir los valores booleanos con un !

is.infinite(f1^75)

!is.infinite(f1^75)

#finalmente para devolver solo los valores de f1 que no se vuelven inf o -inf al elevar a 75
#le ordenamos a R que escriba los valores de f1 que reciben TRUE de la funcion !is.infinite( (f1^75) )

f1[!is.infinite( (f1^75) )]

#Ahora para impimir los elementos de f1 quitando aquellos que elevados a 75 dan -inf
#usaremos la funcion which que nos devuelve un array con los indices de aquellos elementos que cumplen la condición:
#para nuestro ejercicio la condicion es f1^75==-inf

which(f1^75 == -Inf)

#Ahora simplemente le pedimos que escriba los elementos de f1 exceptuando los indices que ya hallamos

f1[-which(f1^75 == -Inf)]



#(b) Almacenamos la siguiente matriz 3x4, como el objeto varMatriz

varMatriz = matrix( c(77875.40, 27551.45, 23764.30, -36478.88, -35466.25, -73333.85, 36599.69, -70585.69, -39803.81, 55976.34, 76694.82, 47032.00), nrow = 3, ncol=4, byrow= TRUE)

#elevamos a 65 y dividimos por inf

(varMatriz^65)

(varMatriz^65)/Inf

# en (varMatriz^65) vemos que resultados se vuelven Inf o -Inf luego en (varMatriz^65)/Inf
# vemos que los resultados que quedaron Inf/Inf se convirtieron en NaN=Not a number y los demas que siguieron siendo numeros quedaron iguales a cero
# luego para indicar que indices de el resultado (varMatriz^65)/Inf son NaN necesitamos usar la funcion is.nan(x) donde x es vector, esta funcion devuelve un vector logico donde TRUE son valores NaN, y FALSE los demas, 
# luego usar esta matriz logica como condicion para la funcion which y asi finalmente obtenemos los indices

is.nan( (varMatriz^65)/Inf )

which( is.nan( (varMatriz^65)/Inf ) )

# vemos que no devuele los indices del array sino de vector, es porque en la funcion which falta activar la opcion arr.ind=TRUE que mostrara los indices del array

which( is.nan( (varMatriz^65)/Inf ) ,arr.ind = TRUE )

# para ver los valores en varMatriz que NO son NaN al elevar varMatriz por 67 y sumarle Inf simplemente usamos !is.nan y lo pones en varMatriz[condición] como condición
R1=varMatriz[!is.nan( (varMatriz^67)+Inf )]
#como queremos comparar lo guardamos en R1
# para (varMatriz^67) buscando valores diferentes -Inf usamos la condicion !(varMatriz^67) == -Inf
R2=varMatriz[!(varMatriz^67) == -Inf]
#Ahora comparamos R1 con R2
R1==R2
#vemos que devuelve una vector lógico de TRUE indicando que R1 Y R2 iguales

#para lo último usamos en varMatriz[condición] como condicion que (varMatriz^67) == -Inf o is.finite(varMatriz^67) donde is.finite(x) devuelve un vector logico con TRUE para valores finitos del vecto x y FALSE para lo demas
#finalmente quedaria(varMatriz^67) == -Inf | is.finite(varMatriz^67) usando el conector " | " como simbolo para " O " en R.
varMatriz[ (varMatriz^67) == -Inf | is.finite(varMatriz^67) ]

#(c)
#Creamos el siguiente vector:

f2=c(4.3, 2.2, NULL, 2.4, NaN, 3.3, 3.1, NULL, 3.4, NA)

#primera impresión: considero que son 10 elementos que conforman el array, tanto NULL como NaN y NA si bien no son numeros siguen siendo "elementos".

length(f2)

#luego de ejecutar length(f2) nos indica que tiene 8 elementos por las dudas y para saber que elementos R no esta contando como tales
# y sospechando que son los elementos NULL

length(c(4.3, 2.2, 2.4, NaN, 3.3, 3.1, 3.4, NA))

# es el vecto f2 sin los null, vemos que el resultado es el mismo por lo que ahora se sabe que R con considera NULL al momentos de contar los elementos

#primera impresión: ya que R no cuenta NULL como elemento y quitando los null tendriamos:
#(4.3, 2.2, 2.4, NaN, 3.3, 3.1, 3.4, NA) como vector, se ve que al aplicar which(x=is.na(x=f2))
# va devolver los indices 4 y 8 porque is.na(x) devuelve TRUE para valores NaN y NA.

which(x=is.na(x=f2))

# es correcto

#primera impresión: si is.null(x) funcionase igual que is.infinite,is.finite,is.na deberia devolver las posiciones de null en el vector
#sin embargo sabemos que null no es contado por R como elementos, por tanto no deberia tener información de sus indices, asi que solo queda ver que resulta:

is.null(x=f2)

#ahora, viendo la documentación de la funcion is.null(x) nos indica que esta funcion solo devuelve TRUE si el objeto X es un valor NULL
# de otro modo devuelve FALSE que es lo que ocurre en este caso ya que f2 no esta compuesto solo de valores NULL
