clc
clear 
close all
%Estudio de la distribución Poisson
    N=50;  %Número de nodos
    a=16;  %Número de repeticiones
    for iN=1:a
        p(iN)=0.05*(iN); %Cálculo de las probabilidades
        A=rand(N)<p(iN);
        for i=1:N
            A(i,i)=0.0;
        end
        A=triu(A);
        A=A+A';     %Matriz de adyacencia
        b=sum(A);
        k=p(iN)*(N-1);
        K=0:N-1;
        P=((exp(1).^-k)*k.^K)./factorial(K); %Cálculo de la Poisson 
        P=P.*100;                            %Normalización de la Poisson
        %Representación de la Poisson junto al histograma
            subplot(sqrt(a),sqrt(a),iN)
            plot(K,P)
            title(['Probabilidad = ',num2str(p(iN))])
            hold on
            histogram(b) 
    end

