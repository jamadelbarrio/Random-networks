clear
close all
clc
%Estudio de las funciones  propias de Matlab para grafos poniendo estaciones de metro como ejemplo
%Condiciones iniciales 
    n=11;   %Número de estaciones o nodos
    p=0.5;  %Probabilidad de unión de las estaciones
    names={'Atocha','UAM','Avenida de América','Pacífico','Sainz de Baranda','Nuevos Ministerios','Cuatro caminos','Moncloa','Ciudad universitaria','Vicente Aleixandre','Puerta Arganda'}; %names = nombre de las estaciones    
%Cálculo de la matriz de adyacencia y distancias
    B=rand(n)<p;
    d=rand(n);
    for i=1:n
        B(i,i)=0.0;
        d(i,i)=0.0;
    end
    B=triu(B);
    d=triu(d);
    B=B.*d;
    B=B+B';
%Creación del grafo
    G=graph(B,names);
%Comando para ver los "vecinos" de un nodo
    D=neighbors(G,11);
%Extracción del subgrafo de los "vecinos"
    P=subgraph(G,[11;D]);
%Comando para averiguar el camino más corto entre dos puntos
    [Min1,d]=shortestpath(G,1,11);
%Extracción del subgrafo con el camino más corto
    C=subgraph(G,Min1);
%Comando que calcula una matriz o un número con las distancias entre puntos 
    D=distances(G,2,11); %Número
    F=distances(G);      %Matriz
%Comando que dibuja un árbol con las posibles trayectorias desde un punto
    [Mi,p]=minspantree(G);
%Comando que dibuja un árbol con los caminos más cortos desde un punto 
    TR=shortestpathtree(G,1);
%Comando que proporciona un vector con el número de conexiones de cada nodo
    Dg=degree(G);
%Comando que devuelve un vector con los nodos menor a una distancia "d" y extracción del subgrafo
    Nr=nearest(G,1,0.5);
    Near=subgraph(G,Nr);
%Comando que cuenta el número de conexiones entre dos puntos dados
    E=edgecount(G,1,4);
%Representación de los subgrafos
    figure()
    plot(G,'c','EdgeLabel',G.Edges.Weight,'NodeLabel',{})
    title("Grafo con las distancias")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure()
    a=plot(G);
    highlight(a,Mi,'EdgeColor','r')
    title("Árbol de Atocha en el grafo")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure()
    plot(P,'sm')
    title("Vecinos Puerta Arganda")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure()
    plot(C,'pk')
    title("Camino más corto entre Atocha y Puerta Arganda")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    display(['Distancia entre UAM y Puerta Arganda = ',num2str(D)]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure()
    plot(TR,'g')
    title("Árbol con los caminos más cortos desde Atocha")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure()
    plot(Near,'ro')
    title("Puntos a una distancia inferior de 0.5 a Atocha")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    display(['Número de conexiones entre Atocha y Pacífico = ',num2str(E)]);
