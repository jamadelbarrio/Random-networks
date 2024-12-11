clc
close all
clear
%Programa para observar la probabilidad crítica calculada con la función "pc"
    n=10;   %Número de nodos del grafo
    N=10;   %Número de grafos   
    M=50;   %Cantidad de veces que se repite el proceso de cálculo de probabilidad crítica
    Nt=100;  %Cantidad de veces que se repite todo el cálculo
    MPC=[]; %Vector nulo para añadir las probabilidades críticas
    for x=1:Nt
        [pc,mpc]=pc(n,N,M);
        clear pc
        MPC(x)=mpc;
    end
   z=max(MPC); %Máximo de las probabilidades críticas calculadas
   display(['Probabilidad límite calculada = ',num2str(z)])
%Creación de un grafo con una probabilidad un poco mayor a la supuesta probabilidad crítica y cálculo de la multiplicidad del autovalor 0 
    A=rand(n)<z+0.05;
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
%Representamos el grafo, adornándolo un poco
    figure()
    plot(G,'m','NodeLabel',{},'NodeColor','r','Marker','h')
    xlabel(['Número de redes = ', num2str(Auto)])