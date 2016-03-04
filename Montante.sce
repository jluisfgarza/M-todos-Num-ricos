clear
/////////////////////////////////////////////////////////////////////
//autor: JUAN LUIS FLORES
// fecha: 02/ 03/ 2016
//  
//      ALGORITMO MONTANTE
//1.  PivoteAnterior = 1
//2.  Para cada renglon i desde 1 hasta numero de renglones
//   2.1  Para cada renglon k desde 1 hasta el numero de renglones
//       2.1.1   Si k es diferente a la i
//            2.1.1.1  Para cada columna j desde i + 1 hasta numero de columnas
//                2.1.1.1.1  M(k,j) = ( M(i,i) * M(k,j) - M(k,i) * M(i,j)) / PivoteAnterio
//            2.1.1.2   M(k,i) = 0
//   2.2    PivoteAnterior = M(i,i)
//   2.3    Despliega M
//3. Para cada renglon i desde 1 hasta Renglones -1
//     M(i, i) = PivoteAnterior
//4. Despliega M
//5. Para cada renglon i desde 1 hasta Renlones
// Cree un metodo para desplegar ls soluciones aparte
//     X(i) = m(i,COLUMNAS) / pivoteAnterior
//6.  Despliega X
//
////////////////////////////////////////////////////////////////////
//   getMatrix
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

////////////////////////////////////////////////////////////////////
//   displayMatrix
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

////////////////////////////////////////////////////////////////////
//   displaySoluciones
function displaySoluciones(dMatrix)
    // for every row
    for iI = 1 : size(dMatrix, 1)
        //el ultimo elemento de la matriz es una de las soluciones
        dRespuesta = dMatrix(iI, size(dMatrix, 2)) / dMatrix(iI, iI); 
        disp(string(dRespuesta));
    end
endfunction

////////////////////////////////////////////////////////////////////
//   Montante
function Montante(dMatrix)
    iPivoteAnte = 1
    
    for iI = 1: size(dMatrix, 1)
        for iK = 1: size(dMatrix, 1)
            if (iK <>iI) then
                for iJ = iI + 1: size(dMatrix, 2)
                    dMatrix(iK, iJ) = (dMatrix(iI, iI) * dMatrix(iK, iJ) - ...
                        dMatrix(iK, iI) * dMatrix(iI, iJ))/iPivoteAnte;
                end
                dMatrix(iK, iI) = 0;
            end
        end        
        iPivoteAnte = dMatrix(iI, iI)
        displayMatrix(dMatrix)        
        for iJ = 1: iI - 1 
            dMatrix(iJ, iJ) = iPivoteAnte
        end
        disp("Matriz Resultante despues de iteracion: " + string(iI))
        displayMatrix(dMatrix)
          
    end
    
    disp("Soluciones")
    displaySoluciones(dMatrix) //Desplegar solo la columna de soluciones
endfunction

////////////////////////PROGRAMA PRINCIPAL///////////////////////////////
dMatValues = getMatrix()  //Introduce datos para matriz
disp("Matriz") 
displayMatrix(dMatValues) //Despliega matriz introducida por el usuario
Montante(dMatValues)      //Metodo montente
