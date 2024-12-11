clear 
clc
close all
%Estudio de la importancia de los autovalores de la matriz laplaciana
    n=30;  %Número de nodos
    N=16;   %Número de repreticiones
%Calculamos los grafos
    for j=1:N
        p(j)=0.05*(j-1); %Cálculo de diversas probabilidades
        A=rand(n)<p(j);
            for i=1:n
                A(i,i)=0.0;
            end
        A=triu(A);
        A=A+A';     %Matriz de adyacencia
        G=graph(A); %Creación del grafo
        b=sum(A);
        B=diag(b);
        L=B-A;      %Matriz laplaciana
        L=eig(L);   %Cálculo de los autovalores y búsqueda de los autovalores 0
        Auto=L'<=10*exp(-15)&L'>=-10*exp(-15);
        Auto=sum(Auto');
        Autos(:,j)=Auto;
        %Representación de  los grafos junto a los autovalores 0
            subplot(sqrt(N),sqrt(N),j);
            plot(G,'c','NodeLabel',{},'NodeColor','b','Marker','o');
            title(['Probabilidad = ',num2str(p(j))])
            xlabel(['Número de redes = ', num2str(Autos(j))])
    end
%Cálculo de la probabilidad crítica para esos nodos usando la función pc
    M=50; %Veces que repetimos el proceso
    [pc,mpc]=pc(n,N,M);
    display(['Probabilidad límite aproximada = ',num2str(mpc)]);