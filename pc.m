function [pc,mpc]=pc(n,N,M)
%Función que calcula la probabilidad crítica del grafo
%n = Número de nodos del grafo
%N = Cantidad de grafos
%M = Cantidad de veces que repite el proceso
%pc = Vector con los valores de las probabilidades criticas calculadas
%mpc = Valor de la media de las probabilidades críticas
%Cálculo de los autovalores 0 del grafo mediante la función auto
    pc=[];
    for j=1:M
        [Autos,p]=Auto(n,N); 
        h=length(Autos);
%Encontar el valor de la probabilidad crítica para el grafo creado
    for i=1:h-1
        if Autos(i)==1
            if Autos(i+1)==1
                break
            end
        end
    end
    pc(j)=p(:,i);
    end
%Media de los valores de probabilidad crítica encontrados
    mpc=mean(pc);
end