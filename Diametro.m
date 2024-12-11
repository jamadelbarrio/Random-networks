clear
close all
clc
%Estudio del diámetro del grafo
    n=15:10:95; %Creamos grafos con varios nodos
    p=0.05;     %Definimos una probabilidad
    N=9;        %Número de grafos
%Creamos los diferentes grafos
    for j=1:length(n) 
        B=rand(n(j))<p;
        for i=1:n
            B(i,i)=0.0;
        end
        B=triu(B);
        B=B+B';
        G=graph(B); %Creación del grafo
        k=p.*n(j);  %Calculamos k y la almacenamos
        K(j)=k;
        d=log(n(j))/log(k);    %Calculamos el diámetro
        D(j)=d;     %Almacenamiento de diámetros
    %Representamos k y d con los nodos y el grafo
        subplot(sqrt(N),sqrt(N),j) 
        a=plot(G);
        title(['Nodos = ',num2str(n(j))]);
        xlabel(['K = ', num2str(k)])
        ylabel(['D = ', num2str(d)])
        a.NodeLabel={}; %Elminación de los números de los nodos 
end
