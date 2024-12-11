function [Autos,p]=Auto(n1,N);
% Función para la creación de grafos y averiguar los autovalores 0
% n1 = Número de nodos del grafo
% N = Cantidad de grafos
% Autos = Multiplicidad del autovalor 0
% p = Vector con las probabilidades que forman cada grafo
% Creación de la matriz del grafo
    for j=1:N
        p(j)=0.05*(j-1);
        A=rand(n1)<p(j);
        for i=1:n1
            A(i,i)=0.0;
        end
        A=triu(A);
        A=A+A';
%Cálculo de los autovalores y almacenamiento de los autovalores 0
    b=sum(A);
    B=diag(b);
    L=B-A;
    L=eig(L);
    Auto=L'<=10*exp(-15)&L'>=-10*exp(-15);
    Auto=sum(Auto');
    Autos(:,j)=Auto;
    end
end