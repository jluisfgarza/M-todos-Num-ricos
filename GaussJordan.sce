clear
///////////////////////////////////////////////////////////////////////
//   Autor: Juan Luis Flores Garza
//   Fecha: 2/26/16
//   Version: 1.0
//
//   Algoritmos:
//
//                          Algoritmo gauss jordan
//  1. RowPivote = 1
//  2. ColPivote = 1
//  3. Mientras no se llegue y procese ultimo renglon (RowPivote <= n renglones)
//   3.1 Pivote = Mat(RowPivote, ColPivote)
//      3.2 Para i = ColPivote hasta n columnas
//       3.2.1 Mat(RowPivote, i) = Mat(RowPivote, i) / Pivote -> (divido datos 
//            del renglon entre el pivote)
//   3.3 Para iRow = 1 hasta n renglones
//       3.3.1 Factor = -Mat(iRow, ColPivote)
//       3.3.2 Si iRow != RowPivote (renglon del pivote no se trabaja porque 
//                          ya se dividio entre el pivote; ya esta normalizado)
//               3.3.2.1 Desde iCol = 1 hasta n Columnas
//               3.3.2.1.1 Mat(iRow, iCol) = Mat(iRow, iCol) + Factor * Mat(RowPivote, col)
//   3.4 RowPivote++
//   3.5 ColPivote++
//
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//   GETMATRIX
function dMat = getMatrix()
    iRow = input("Number of rows: ")
    iCol = input("Number of columns: ")
    // for every row
    for iI = 1 : iRow
        // for every column
        for iJ = 1 : iCol
            dMat(iI, iJ) = input("Enter element " + string(iI) + "," + string(iJ) + ": ");
        end
    end
endfunction
///////////////////////////////////////////////////////////////////////
//   GAUSSJORDAN
function dMat = gaussJordan(dMat)
    iRowPivote = 1
    iColPivote = 1
    while iRowPivote <= size(dMat, 1)
        dPivote = dMat(iRowPivote, iColPivote);
        for i = iColPivote : size(dMat, 2)
            dMat(iRowPivote, i) = dMat(iRowPivote, i) / dPivote;
        end
        for iRow = 1 : size(dMat, 1)
            dFactor = -dMat(iRow, iColPivote);
            if iRow <> iRowPivote
                for iCol = 1 : size(dMat, 2)
                    dMat(iRow, iCol) = dMat(iRow, iCol) + ...
                                      dFactor * dMat(iRowPivote, iCol);
                end
            end
        end
        iRowPivote = iRowPivote + 1;
        iColPivote = iColPivote + 1;       
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
//   SOLUCIONES
function displaySoluciones(dMatrix)
    for iI = 1 : size(dMatrix, 1)
       disp(string(dMatrix(iI, size(dMatrix, 2))))
    end
endfunction

///////////////////////   PROGRAMA PRINCIPAL //////////////////////////
dMatNum = getMatrix()
displayMatrix(dMatNum)
dMatNum = gaussJordan(dMatNum)
displayMatrix(dMatNum)
disp("Soluciones de X(1) a X(n)")
displaySoluciones(dMatNum)

