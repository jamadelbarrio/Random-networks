function [t,c,T,C,G,d]=viajes(ciudades,medios,costes,tiempos,distancias,I,F)
%Ciudades = Lista con los nombres de ciudades
%Medios = Lista con los diversos transportes 
%Costes = Vector con los costes ciudad/medio
%Tiempos = Vector con los tiempos ciudad/medio
%Distancias = Vector con las distancias entre ciudades
%I = Punto de partida
%F = Punto de llegada
%Calculamos los vectores para establecer el grafo
    N=length(ciudades);
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
%Creamos el grafo
    G = graph([s],[v2],distancias,ciudades);
%Añadimos los medios, costes y tiempos
    j=1:n;
    b=length(s)/n;
    c=[];
    for i=1:b;
        v(1:n)=1:n;
        c=[c v];
    end
    G.Edges.Mode = categorical(c,j,medios)';
    G.Edges.Cost = costes';
    G.Edges.Time = tiempos';
%Extraemos los subgrafos con los mínimos tiempos, costes y distancias
    t = simplify(G,'min','PickVariable','Time');
    c = simplify(G,'min','PickVariable','Cost');
    d = simplify(G,'min');
%Representamos los diferentes subgrafos
    % figure()
    % subplot(1,2,1)
    % plot(t,'EdgeLabel',cellstr(t.Edges.Mode))
    % title("Más rápido")
    % subplot(1,2,2)
    % plot(c,'EdgeLabel',cellstr(c.Edges.Mode))
    % title("Más barato")
%Sacamos los viajes más rápidos y más baratos entre los pedidos
    [Min1,min1]=shortestpath(t,I,F);
    T=subgraph(t,Min1);
    [Min2,min2]=shortestpath(c,I,F);
    C=subgraph(c,Min2);
%Representamos los recorridos
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