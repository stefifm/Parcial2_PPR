
{-1) Realizar una función que reciba el nombre de un troyano y devuelva la probabilidad de que distribuya el ransomware Wannacry. 
En el caso de que el nombre del 
troyano no se encuentre especificado en la Tabla 1, la función deberá retornar un mensaje “no definido”. -}

{-2) Dada una lista de nombres de troyanos, genere una lista por comprensión o 
recursividad de todos aquellos troyanos que puedan distribuir el ransomware Wannacry con una probabilidad mayor al 20%.-}

{-3) Dada una lista con los valores de probabilidades que se distribuya el ransomware Wannacry, 
generar una nueva lista que contenga las probabilidades que esten comprendidas 
entre los dos valores límites pasados como argumentos. Para resolver este punto debe definir una función recursiva. -}

funcion1 troy
    | troy == "Emotet" = 20
    | troy == "Ezbot" = 30
    | troy == "Edridex" = 20
    | troy == "Egozi" = 20
    | troy == "Edanabot" = 20
    | otherwise = error ("no definido")


funcion2 xs = [x| x <-xs, funcion1 x > 20]


funcion3 [] _ _ = []
funcion3(x:xs) desde hasta 
    | x >= desde && x <= hasta = x : funcion3 xs desde hasta
    | otherwise = funcion3 xs desde hasta