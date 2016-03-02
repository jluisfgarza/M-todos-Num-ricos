clear
///////////////////////////////////////////////////////////////////////
//   Autor: Juan Luis Flores Garza
//   Fecha: 2/23/16
//   Ver:1 1.0
//
//   Algoritmos:
//
//      Algoritmo de Eliminación Gaussiana
//      1. Para i desde 1 hasta renglones - 1
//       1.1 Para k desde i + 1 hasta renglones
//        1.1.1  factor = - M(k, i) / matriz(i, i)
//        1.1.2  Para j desde i hasta columnas
//         1.1.2.1  M(k, j) = M(k, j) + factor * M(i, j)
//
//      Algoritmo de Sustitucion Hacia Atras
//      1. X(n) = M(renglones, columnas) / M(renglones, columnas-1)
//      2. Para i desde renglones-1 hasta 1
//        2.1 Suma = 0
//        2.2 Para j desde columnas-1 hasta i+1
//          2.2.1  Suma = Suma + M(i, j) * X(j)
//        2.3 X(i) = (M(i, columnas) - Suma) / M(i,i)
//
///////////////////////////////////////////////////////////////////////
// Get Matrix
function dMat = getMatrix()
    // dimensions
    iRow = input("Number of rows: ")
    iCol = input("Number of columns: ")
    // for every row
    for iI = 1 : iRow
        // for every column
        for iJ = 1 : iCol
            dMat(iI, iJ) = input("Enter element " + string(iI) +  ...
                    "," + string(iJ) + ": ");
        end
    end
endfunction
///////////////////////////////////////////////////////////////////////
// Despliega la matriz
function displayMatrix(dMatrix)
    // for every row
    for iI = 1 : size(dMatrix, 1)
        //for every column
        sLinea = ""
        for iJ = 1 : size(dMatrix, 2)
            sLinea = sLinea + string(dMatrix(iI, iJ)) + " , ";
        end
        disp(sLinea);
    end
endfunction
///////////////////////////////////////////////////////////////////////
// Eliminacion Gaussiana
function dMatNum = eliminacion(dMatNum)
    dNumero = 0
    for i = 1 : size(dMatNum, 1) - 1
        for k = i + 1 : size(dMatNum, 1) 
            dNumero = -dMatNum(k , i) / dMatNum(i, i);
            for j = i : size(dMatNum, 2)
                dMatNum(k, j) = dMatNum(k, j) + dNumero * dMatNum(i, j);
            end
        end
    end
endfunction
///////////////////////////////////////////////////////////////////////
//   Sustitucion
function dArr = Sustitucion(dMatNum)
    dRespuesta = dMatNum(size(dMatNum, 1) , size(dMatNum, 2)) / dMatNum(size(dMatNum, 1) , size(dMatNum, 2)-1);
    dArr(1, size(dMatNum, 1)) = dRespuesta
    for i = size(dMatNum, 1) - 1 : -1 : 1
        dSuma = 0
        for j = size(dMatNum, 2) - 1 : -1 : i + 1
            dSuma = dSuma + dMatNum(i, j) * dArr(1, j);
        end
        dArr(1, i) = (dMatNum(i, size(dMatNum, 2)) - dSuma) / dMatNum(i,i);
    end
endfunction
///////////////////////////////MAIN PROGRAM ///////////////////////////
dMatNum = getMatrix()             // FUNCION GET MATRIX
dMatNum = eliminacion(dMatNum)    // FUNCION ELIMINACION GAUSS.
displayMatrix(dMatNum)            // FUNCION DISPLAY MAT.
dArr = Sustitucion(dMatNum)       // ARREGLO CON LAS SOLUCIONES
disp("Soluciones de X(1) a X(n)") // DESPLIEGA EL ARREGLO
displayMatrix(dArr)
