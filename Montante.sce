clear
///////////////////////////////////////////////////////////////////////
//   Autor: Juan Luis Flores Garza
//   Fecha: 2/25/16
//   Ver:1 1
//
//   Algoritmos:
//                         METODO MONTANTE
// 1. iPivotAnt = 1;
// 2. Para i desde 1 hasta renglones

Pivoteo si iMat (i,i) = 0 (buscar le primero que no sea cero dentro de l amisma columns e intercambiar renglones)

//   2.1 Para k desde 1 hasta renglones
//       2.1.1 Si k es diferente de i
//       2.1.1.1 Para j desde i hasta columnas
//         2.1.1.1.1 iMat(k,j) = (iMat(i,i)*iMat(k,j)-
//                      iMat(i,j)*iMat(k,i))/iPivotant
//   2.2 iPivotAnt = iMat (i,i)
//   2.3 Para k desde i-1 hasta 1
//       2.3.1 iMat(k,k) = iMat(j,j)
//   2.4 Desplegar iMat
// 3. Para i desde 1 hasta renglones
//   3.1 iMat (i,columnas) / iPivotAnt
//
///////////////////////////////////////////////////////////////////////
