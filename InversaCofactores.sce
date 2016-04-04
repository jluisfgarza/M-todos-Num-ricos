clear
////////////////////////////////////////////////////////////////////
//   Inversa por factores
//  
//   Se introduce una matriz cuadrada de la cual se imprime:
//   su matriz de cofactores transpuesta, su determinante y por 
//   ultimo su inversa
//
//   Autor:
//   Juan Luis Flores A01280767
//////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
//   getMatrix
function dMat = getMatrix()
    iRow = input("Number of rows: ")
    iCol = input("Number of columns: ")
    // for every row
    for iI = 1 : iRow
        // for every column
        for iJ = 1 : iCol
            dMat(iI, iJ) = input("Enter element " + string(iI) + "," + ...
                    string(iJ) + ": ");
        end
    end
endfunction

////////////////////////////////////////////////////////////////////
//   displayMatrix
function displayMatrix(dMatrix)
    // for every row
    for iI = 1 : size(dMatrix, 1)
        //for every column
        sLinea = ""
        for iJ = 1 : size(dMatrix, 2)
            if(iJ == size(dMatrix, 2)) then
                sLinea = sLinea + string(dMatrix(iI, iJ));
            else
                sLinea = sLinea + string(dMatrix(iI, iJ)) + " , ";
            end
        end
        disp(sLinea);
    end
endfunction

////////////////////////////////////////////////////////////////////
//   cofactores: despliega la matriz por cofactores y la matriz transpuesta
function dCof = cofactores(dMatrix)
    // variable para submatrices
    dSub = 0;
    //tamaño de la submatriz
    iRow = 1;
    iCol = 1;
    
    // for every row
    for iI = 1 : size(dMatrix, 1)
        //for every column
        for iJ = 1 : size(dMatrix, 2)
            // genero submatriz (menores)
            iRow = 1;
            
            for iR = 1 : size(dMatrix, 1)
                // Reset iterador de columna al cambiar renglon
                iCol = 1;
                for iC = 1 : size(dMatrix, 2)
                    //si no estamos en renglon/columna de matriz de menores(i,j)
                    if iC <> iJ & iR <> iI then
                        dSub(iRow, iCol) = dMatrix(iR, iC);
                        iCol = iCol + 1;
                    end
                end
                // se le agrega un al tamaño de renglones de la submatriz 
                // cuando no estemos en en renglon j de matriz de menores
                if iR <> iI then
                    iRow = iRow + 1;
                end
            end
            // asigno nuevo valor
            dCof(iI, iJ) = (-1)**(iI + iJ) * det(dSub);
        end
    end
endfunction

/////////////////////////// MAIN /////////////////////////////////////
// pido matriz
dMat = getMatrix()
disp("Matriz original")
displayMatrix(dMat)

// llamo funcion cofactores para obtener la matriz de cofactores
dCof = cofactores(dMat)

disp("Matriz cofactores")
displayMatrix(dCof)

disp("Matriz transpuesta")
dTranspuesta = dCof'
displayMatrix(dTranspuesta)

disp("Determinante de matriz")
dDet = det(dMat)
disp(string(dDet))

// multiplico transpuesta por 1/determinante
dInversa = (1/dDet) * dTranspuesta

disp("Matriz inversa")
displayMatrix(dInversa)
