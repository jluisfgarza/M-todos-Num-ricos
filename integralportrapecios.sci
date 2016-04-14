clear
////////////////////////////////////////////////////////////////////
//   Autor:
//   Juan Luis Flores Garza  A01280767
//   Integración por metodo de trapecios y parabolas
//////////////////////////////////////////////////////////////////////
//   PARABOLA
function dArea = parabola(iA, iB)
    // pide numero de puntos 
    iN = input("Cuantos puntos(N): ")
    // define funcion de acuerdo a la introducida por el usuario
    sFun = input("Escribe la funcion ", 'string')
    deff('y = f(x)' , 'y = ' + sFun)
    dArea = f(iA)
    
    // calcula la altura
    dH = (iB - iA) / iN
    
    iADos = iA
    // sumatoria
    for i = 1: iN - 1
        // suma a iA el valor de dH
        iA = iA + dH;
        // suma al area la funcion en f(iA)
        if modulo(i, 2) <> 0 then  // true = impares, false = pares
            dArea = dArea + 4 * f(iA);
        else
            dArea = dArea + 2 * f(iA);
        end

    end

    // suma el el valor de la funcion evaluada en iB
    dArea = dArea + f(iB)
    // multiplica por dH/2
    dArea = dArea * (dH / 3)
endfunction

////////////////////////////////////////////////////////////////////
//   TRAPECIOS
function dArea = trapecios(iA, iB)

    // numero de trapecios
    iN = input("Cuantos trapecios: ")

    // define funcion de acuerdo a la introducida por el usuario
    sFun = input("Escribe la funcion ", 'string')
    deff('y = f(x)' , 'y = ' + sFun)
    dArea = f(iA)

    // calcula altura
    dH = (iB - iA) / iN

    // sumatoria de 1 hasta n - 1
    for i = 1: iN - 1
        // suma a iA el valor de dH 
        iA = iA + dH;
        // suma al area la funcion en f(iA)
        dArea = dArea + 2 * f(iA);
    end

    // suma el el valor de la funcion evaluada en iB
    dArea = dArea + f(iB)
    // multiplica por dH/2
    dArea = dArea * (dH / 2)
endfunction

/////////////////////////////// MAIN PROGRAM ///////////////////////////////////
// Pido Valores para metodo trapecios
disp("Metodo por trapecios")
iAt = input("Valor de A ")
iBt = input("Valor de B ")
dArea = trapecios(iAt, iBt)
disp("La integral  por trapecios es: " + string(dArea))

// Pido Valores para metodo parabola
disp("Metodo por parabola")
iAp = input("Valor de A ")
iBp = input("Valor de B ")
dArea = parabola(iAp, iBp)
disp("La integral  por parabolas es: " + string(dArea))
