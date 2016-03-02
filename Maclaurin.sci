clear
/////////////////////////////////////////////////////////////////////////////////
//   Autor: Juan Luis Flores Garza
//   A01280767
//   Fecha: 1/18/2016
//   Version 1.0
//   
//   cos x = 1 - x 2 / 2 ! + x 4 / 4 ! - x 6 / 6 ! + x 8 / 8 ! ......
//   Aplicacion para obtener la aproximacion de la funcion coseno utilizando
//   Maclaurin.
//   
//   Parametros: 
//     iX:  
//     iN:  el valor del exponente hasta el cual se quiere sumar
//   Regresa:
//     La sumatoria con Maclaurin que despliega desplegar el error real  
//     relativo % en cada aproximación y desplega el error aproximado 
//     relativo % a partir de la segunda aproximación
/////////////////////////////////////////////////////////////////////////////////

function dMaclaurin = Mac(dX, iN)
    disp ("Para x = "+string(dX)+"n = "+ string(iN))    
    //Se declaran todas las variables a utilizar
    dMaclaurin = 0
    dErrRealRelatPor = 0
    dErrApproxRealPor = 0
    dApproxAnterior = 0
    iContador = 0
    // Se valida que el valor de iN sea par y positivo, en caso de no ser el programa 
    // despliega el error
    if (modulo(iN,2) ~= 0) | (iN < 0)
        disp("Error de calculo... la N debe ser par y positiva")
    else
        // Se inicia un ciclo que sube el valor de iN con un "+2"
        for iI = 0 : 2: iN  
            dApproxAnterior = dMaclaurin
            if  (modulo(iContador,2) == 0)
                dMaclaurin = dMaclaurin + dX^iI/(factorial(iI))
            else
                dMaclaurin = dMaclaurin - dX^iI/(factorial(iI))
            end
            //Se calculan los errores
            dErrRealRelatPor = abs((cos(dX)-dMaclaurin)/cos(dX))*100
            dErrApproxRealPor = abs ((dMaclaurin - dApproxAnterior)/dMaclaurin)*100
            //en caso de no ser la primera iteracion de despliegan los errores a partir de la misma
            if (iContador > 0)
                disp("n = " + string(iI) + "  Suma = " + string(dMaclaurin)+" Error Real Relativo % = " + string(dErrRealRelatPor) + "  Error aproximado relativo % "+ string(dErrApproxRealPor))
            else
            //En caso de ser la primer iteracion solo se puede desplegar el error real relatico porcentual
                disp("n = " + string(iI) + "  Suma = " + string(dMaclaurin)+ " Error Real Relativo % = " + string(dErrRealRelatPor))
            end
                iContador =iContador + 1
            end 
     end
endfunction

////////////////////////////// Programa Principal ////////////////////////////////////////

dX = input("da dX   ")
iI = input("da iN   ")

Mac(dX, iI)

