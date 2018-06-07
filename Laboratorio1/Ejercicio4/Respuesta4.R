# Nombre : Juan Daniel Valdivia Fuentes
# Pregunta 4
# (a)

# Analizaremos primero que hace cada código y pondremos su tipo de clase.

f1 <- array(data=1:36,dim=c(3,3,4))

# En R, lo que hace es llenar por columnas los números naturales del 1 al 36
# por 4 grupos (matrices de orden 3x3) donde cada uno contiene 9 elementos.
# Su clase es "array" y está definida implícitamente.

bar <- as.vector(f1)

# En R, nuevamente nos muestra los números del 1 al 36 pero esta vez
# como un solo vector, esto es 1 2 3 ... 36.
# Su clase es "integer" y está definida explícitamente.

baz <- as.character(bar)

# En R, nos muestra 36 caracteres dsitribuidos sobre un vector, esto es
# "1" "2" ... "36"
# Su clase es "character" y está definida explícitamente.

qux <- as.factor(baz)

# En R, nos muestra en primer lugar todos los números del 1 al 36 en forma
# de vector. Sin embargo esta vez, se anexan "niveles" los cúales nos indican
# cuantas veces se repiten nuestros datos. En este caso como cada número se
# repite una vez, aparecen 36 niveles que resultan ser cada número.
# Su clase es "factor" y está definida explícitamente.

quux <- bar+c(-0.1,0.1)

# En R, nos muestra un vector pero ua no con los números del 1 al 36 sino
# con un ligero cambio. Al primer número, en nuestro caso 1, le resta 0.1 y al
# siguiente le suma 0.1. Y así sucesivamente, alternando entre restar 0.1 y
# sumar 0.1. Esto es una operación alternada.
# Su clase es "numeric" y está definida implícitamente.

# (b)

v1 <- is.numeric(f1) + is.integer(f1); v1
# en R da 2.
v2 <- is.numeric(bar) + is.integer(bar); v2
# en R da 2.
v3 <- is.numeric(baz) + is.integer(baz); v3
# en R da 0.
v4 <- is.numeric(qux) + is.integer(qux); v4
# en R da 0.
v5 <- is.numeric(quux) + is.integer(quux); v5
# en R da 1.

# Cada sumando de la suma anterior solo puede tomar el valor de 0 o 1.
# En v1 y v2 son números enteros(1+1), en v3 son caracteres (0+0) y en
# v4 y v5 son flotantes.
# Ahora encontraremos en un factor de niveles 0, 1 y 2 que nos identifiquen
# los mismos resultados.

ff <- factor(c(v1,v2,v3,v4,v5))

# En R :
# [1] 2 2 0 0 1
# Levels: 0 1 2

# (c)

# Almacenamos una matriz, con un espacio en blanco.

a <- c(34, 0, 1, 23, 1, 2, 33, 1, NA, 42, 0, 1, 41, 0, 2)
A <- matrix(a, byrow = TRUE, nrow = 5)
A[is.na(A)] <- ""
A

#      [1] [2] [3]
# [1,] 34   0  1
# [2,] 23   1  2
# [3,] 33   1
# [4,] 42   0  1
# [5,] 41   0  2

#Haciendo la coerción respectiva :

MD <- as.data.frame(A)
MD$V2 <- as.logical(type.convert(MD$V2))
MD$V3 <- as.factor(MD$V3) # Checkealo con is.factor(MD$V3)
MD

# En R:

# V1    V2 V3
# 1 34 FALSE  1
# 2 23  TRUE  2
# 3 33  TRUE
# 4 42 FALSE  1
# 5 41 FALSE  2
