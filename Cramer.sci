clear
/////////////////////////////////////////////////////////////////////////////////
//   Autor: Juan Luis Flores Garza
//   A01280767
//   Fecha: 2/5/2016
//   Version 1.0
//   
//   Un restaurante de comidas rápidas vende  hamburguesas sencillas,  hamburguesas 
//con queso y  malteadas.
//   -El precio de la hamburguesa sencilla es 45, el de la hamburguesa con queso es 60 y 
//el de la malteada es 50.
//   -El costo de vender una hamburguesa sencilla es 38, el de una hamburguesa con queso 
//es 42 y el de una malteada es 32.
//   -¿Cuantas hamburguesas sencillas, hamburguesas con queso y malteadas se deben vender 
//para obtener un ingreso de $14,100.00, con un costo de $10,600.00 y en total la suma 
//de las unidades de los productos vendidos sea igual a 280?
//
// -Escribe un sistema de ecuaciones lineales que modele el problema
// -Utilizando cofactores y menores, encuentra el determinante la matriz A
// -Utiliza la regla de Cramer para encontrar la solución, usa el metodo de cofactores y 
//menores para encontrar los determinantes de las matrices del numerador en la regla de Cramer.
//   
//   Parametros: 
//     MAtriz A y B
//     
//   Regresa:
//      Valores de X1,X2,X3
//     
//     
/////////////////////////////////////////////////////////////////////////////

///////////////////////////Funcion CRAMER ///////////////////////////////////
function Cramer = Cram(A,B)
    Cramer = 0
    disp ("Sustituye la primer columan de la matriz A por la de B" )    
    A1 = [14100,60,50;10600,42,32;280,1,1]
    disp ( A1 , "A1= " )
    disp ("Sustituye la segunda columan de la matriz A por la de B" )
    A2 = [45,14100,50;38,10600,32;1,280,1]
    disp ( A2 , "A2= " )
    disp ("Sustituye la tercer columan de la matriz A por la de B" )
    A3 = [45,60,14100;38,42,10600;1,1,280]
    disp ( A3 , "A3= " )
   
//No pude encontrar documentacion para hacer referencia a una instancia de la matriz en especifico
//opte por usar la funcion ya definida como "det" que obtiene el detemrinante de una matriz cuadrada

    disp ( "x1 = determinante de la MAtriz (A1 ) / det.(A) ")
    disp (( det( A1 ) /det( A ) ) , "=" )
    disp ( "x2 = determinante de la MAtriz (A1 ) / det.(A) ")
    disp (( det( A2 ) /det( A ) ) , "=" )
    disp ( "x3 = determinante de la MAtriz (A1 ) / det.(A) ")
    disp (( det( A3 ) /det( A ) ) , "=" )
    
    Cramer = ( det( A1 ) /det( A ) ) + ( det( A2 ) /det( A ) )+ ( det( A3 ) /det( A ) )
endfunction

////////////////////////////// Programa Principal ////////////////////////////
disp ("SE GENERA LA SIGUIENTE MATRIZ DE ACUERDO AL SISTEMA DE ECUACIONES.")
// ECUACIONES BASADAS EN EL PROBLEMA EN LA DESCRIPCION
disp ("45x + 60y + 50z = 14100")
disp ("38x + 42y + 32z = 10600")
disp ("  X +   Y +   Z = 280")

//  LAS MATRICES GENERADA DE ACUERDO A LAS ECUACIONES
A = [45,60,50;38,42,32;1,1,1]
B = [14100;10600;280]

Cram (A,B)

