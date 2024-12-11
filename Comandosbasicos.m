clc
clear
close all
%%%% Creamos una matriz simetrica y un grafo a partir de esta
n=30;
p=0.15;
B=rand(n)<p;
for i=1:n
    B(i,i)=0;
end
B=triu(B);
B=B+B'
G=graph(B);
%%%% Centrality nos da información sobre los nodos
C1=centrality(G,'degree');
C2=centrality(G,'betweenness');
C3=centrality(G,'closeness');
C4=centrality(G,'eigenvector');
C5=centrality(G,'pagerank');
%%%% El comando conncomp nos indica en que cluster está cada nodo
Bins=conncomp(G);
%%%% Comprobamos el flujo maximo de un punto a otro
Flujomax=maxflow(G,1,7);
%%%% Creamos el arbol del grafo y tomamos los datos que nos ofrece
tree=bctree(G);
A=tree.Nodes;
B=tree.Edges;
%%%% Marcamos con una x roja lo puntos del grafo de mayor conectividad
figure()
h=plot(G);
J=sum(C1)/n;
M=[];
for i=1:n
    if C1(i)>J
        M=[M i];
    end
highlight(h,M,'NodeColor','r','Marker','X')
end



