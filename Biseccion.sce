clear
/////////////////////////////////////////////////////////////////////////////////
//   Autor: Juan Luis Flores Garza
//   A01280767
//   Fecha: 1/26/2016
//   Version 1.0
//   
//   Se esta diseñando un tanque esferico de almacenamiento de agua 
//   para un poblado pequeno de un pais en desarrollo. El volumen del
//   liquido que puede contener se calcula con la formula:
//   
//   V =pi*h^2(3r-h)/3   done ... V = 30 y R = 3
//   
//   Parametros: 
//     inf =  limite inferior
//     sup =  limite superior
//     tol =  nivel de tolerancia de error
//   
//   Regresa:
//     el numero de iteraciones utilizadas con su respectiva raiz
//     y la raiz apriximada final.
//     
//////////////////////////////////////////////////////////////////////////////


function raiz=biseccion(inf, sup, tol) // limite inferior, superior y tolerancia de error

    deff('y=f(x)','y=((%pi*(x^2)*(9-x))/3)-30') //funcion con la cual se trabajará
    
Error = 100 //inicializamos el error con valor diferente a 0
raiz = 0 // inicializamos la variable raiz qur regresará la función
contador =1 //contador de iteraciones

while Error >= tol
    aux = raiz //se guarda el útimo valor de la raiz
        
    raiz = ((inf+sup)/2) //división del intervalo
    finf = f(inf) //se evalua la función para el límite inferior
    fxr = f(raiz) //se evalua la función para el límite superior 
    h=finf*fxr  //se multiplica la funcion ya evaluada en ambos limites
    
    if h<0 then
        sup = raiz //la raíz se encuentra en el intervalo inferior
            else if h>0
                  inf = raiz //la raíz se encuentra en el intervalo superior
                else
                    Error = tol //se encuentra la raíz
            end
    end
    
    Error = abs((raiz-aux)/raiz) // calculo del error procentual
    disp("Iteracion " +string(contador)+":  "+string(raiz)) //despliega la iteracion y su respectiva raíz
    disp("Error aprox. % = "+string(Error*100)) //se despliega el error porcentual. 
    contador = contador + 1 //contador de iteraciones 
    
end

//scilab automaticamente imprime la raíz final al terminar la función
endfunction



////////////////////////////// Programa Principal ////////////////////////////
disp ("Tolerancia de error definida en  0.00001 ")
//Se piden los limites inferior y superior y se desplieg a el grado de tolerancia de error en %
i = input ("Ingrese el límite inferior del intervalo para esta función: ")
s = input ("Ingrese el límite superior del intervalo para esta función: ")

biseccion(i,s,0.00001)
