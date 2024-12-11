clc
clear 
close all
%Estudio del problema de crear una red en una ciudad
%Establecimiento de los nombres y abreviaturas para el grafo
    namesl={'Ayuntamiento','Parque','Plaza','Estadio','Colegio','Estación buses','Cementerio','Instituto','Urbanizaciones','Centro comercial','Hotel'};
    names={'A','Pa','Pz','E','Cg','Eb','C','I','U','Cc','H'};
    disp('Abreviaturas:')
    disp([names;namesl]')
%Condiciones del grafo
    n=11;  %Número de nodos
    N=16;   %Número de repeticiones
    kl=4;   %Número de uniones mínimas de cada nodo pedido
    k=[];
    A=[];
%Repetición del cálculo de la probabilidad a partir de la cual se cumple lo pedido
    for a=1:N
%Creación del grafo
    for j=1:N
        p(j)=0.05*(j-1);
        B=rand(n)<p(j);
        for i=1:n
            B(i,i)=0.0;
        end
        B=triu(B);
        B=B+B';
        G=graph(B,names);
        D=degree(G); %Comando degree para ver el número de conexiones de cada nodo
        k(:,j)=mean(D); %Media de las conexiones por cada nodos
    end
%Obtención y almacenamiento de la probabilidad a partir de la cual se cumple lo pedido        
    km=find(k>=kl);
    P=p(km(1));
    A=[A P];
%Representación de la probabilidad frente al número medio de conexiones 
    subplot(sqrt(N),sqrt(N),a);
    plot(p,k,'o')
    axis([-0.15 1 0 11])
    xlabel(['Probabilidad'])
    ylabel(['Media conexiones'])
    grid on
    hold on
%Señalización de la media pedida
    x=linspace(-0.15,1,1000);
    y=kl*ones(size(x));
    line(x,y,'Color','red')
    hold off
end
%Muestra de las probabilidades
    display(['Probabilidad media a partir de la cual sucede = ',num2str(mean(A))]);
    display(['Probabilidad más segura para la que sucede = ',num2str(max(A))]);
%Cálculo del grafo con la probabilidad más segura
    B=rand(n)<max(A);
    for i=1:n
        B(i,i)=0.0;
    end
    B=triu(B);
    B=B+B';
    G=graph(B,names);
    D=degree(G);
    K=mean(D);
%Representación del grafo y del número medio de conexiones    
    figure()
    plot(G)
    title(['Grafo con probabilidad = ',num2str(max(A))])
    display(['Número medio de conexiones para p =', num2str(max(A)), ' ==> ',num2str(K)]);
    
  
