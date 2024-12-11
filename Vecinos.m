clear
close all
clc
format long
%Estudio del coeficiente de clustering
    n=500; %Número de nodos
    p=0.1; %Probabilidad
    V=0;
    C=[];
%Cálculo de la matriz de adyacencia y el grafo
    B=rand(n)<p;
    for i=1:n
        B(i,i)=0.0;
    end
    B=triu(B);
    G=graph(B,'upper');
%Sacamos el coeficiente de clustering
    for i=1:n
        N=neighbors(G,i); %Sacamos los vecinos de cada nodo
        for j=1:length(N)
            for k=1:length(N)
                if j~=k  
                    A=(B(N(j),N(k))==1); %Vemos si están conectados    
                    V=V+A;
                end
            end   
        end
        C(i)=(2.*V)./(length(N).*(length(N)-1)); %Sacamos el coeficiente de clustering individual
        clear V
        V=0;
    end
%Calculamos el coeficiente de clustering general y lo comprobamos con la fórmula
    ccg=sum(C)/n;
    display(['Coeficiente de clustering general numérico = ',num2str(ccg)]);
    format long
    k=p*(n-1);
    Cf=k/n;
    display(['Coeficiente de clustering general fórmula = ',num2str(Cf)]);