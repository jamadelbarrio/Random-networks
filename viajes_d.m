function [t,c,T,C,G]=viajes_d(ciudades,medios,costes,tiempos,distancias)
%Primero creamos un grafo con los puntos medios
    N=length(ciudades)-2;
    n=length(medios);
    s=[];
    for i=1:N-1
        o=i*ones(1,n*(N-i));
        s=[s o]; 
    end
    N_=1;
    a=1;
        for h=1:N
            N_=N_+1;
            for i=N_:N
                for j=1:n
                    v2(a)=i;
                    a=a+1;
                end
            end
        end
    G = graph(s,v2,distancias,ciudades(2:end-1));
%Añadimos los nodos iniciales y finales
    G = addnode(G,ciudades(1));
    G = addnode(G,ciudades(end));
%Unimos los nodos nuevos con los que quedan
    for d=1:n
        for i=2:N+1
            G= addedge(G,ciudades(1),ciudades(i),rand());
            G= addedge(G,ciudades(i),ciudades(end),rand());
        end
    end
%Recolocamos los nodos 
    G=reordernodes(G,ciudades)
    distances(G,1,N);
%Añadimos tiempos, precios y medios
    j=1:n;
    b=length(s)/n;
    c=[];
    for i=1:b;
        v(1:n)=1:n;
        c=[c v];
    end
    x=[];
    for m=1:N
        x=[x 1:n];  
    end
    a=[x c x];
    G.Edges.Mode = categorical([a],[j],medios)';
    G.Edges.Cost = costes';
    G.Edges.Time = tiempos';
%Extraemos los subgrafos con los menores tiempos y costes
    t = simplify(G,'min','PickVariable','Time');
    c = simplify(G,'min','PickVariable','Cost');
%Extraemos el camino más rápido y el más corto
    [Min1,min1]=shortestpath(t,1,N+2);
    T=subgraph(t,Min1);
    [Min2,min2]=shortestpath(c,1,N+2);
    C=subgraph(c,Min2);
%Los representamos
    figure()
    subplot(1,2,1)
    plot(T,'EdgeLabel',cellstr(T.Edges.Mode))
    title("Más corto y más rápido")
    xlabel(["Distancia =" num2str(min1)])
    subplot(1,2,2)
    plot(C,'EdgeLabel',cellstr(C.Edges.Mode))
    title("Más corto y más barato")
    xlabel(["Distancia =" num2str(min2)])
end

