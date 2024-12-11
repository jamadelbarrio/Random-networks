clc
close all
clear
%Estudio del grado de separación 
    n=10;      %Número de nodos
    p=0.5;     %Probabilidad
%Cálculo de la matriz de adyacencia y del grafo
    B=rand(n)<p;
        for i=1:n
            B(i,i)=0.0;
        end
    B=triu(B);
    G=graph(B,'upper');
%Calculamos la distancia más corta entre todos los puntos y la almacenamos
M=[];
N=[];
D=[];
W=[];
    for j=1:n-1
        for i=j+1:n   
            [A,c]=shortestpath(G,j,i);
            if c~=inf
                D=c;
            else 
                W=c;
        end
        M=[M D];
        N=[N W];
        D=[];
        W=[];
        end
    end  
%Calculamos la media de conexiones y el número de distancias "infinitas"  y la representamos en pantalla
    gs=mean(M);
    nc=numel(N);
    display(['Grado de separación = ',num2str(gs)]);
    display(['Número de distancias infinitas = ',num2str(nc)]);
%Representamos el grafo que estamos estudiando y lo adornamos un poco
    figure()
    plot(G,'k','NodeLabel',{},'NodeColor','r','Marker','p')
    title('Grafo a estudiar')