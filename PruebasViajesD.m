clear
close all
clc
%Programa para probar la función viajes_d
%Establecimiento de las variables iniciales
    ciudades={'Madrid', 'Barcelona','Segovia','Oporto','Palencia','Albacete','Lyon','Navacerrada','Paris','EEUU','Bilbao','Cádiz','Almería','Lugo'};
    medios={'Coche' 'Tren' 'Bus' 'Bicicleta' 'Andando'};
    c=length(ciudades)-2;
    m=length(medios);
    a=sum(1:c);
    b=sum(1:c-1);
    costes=rand(1,a*m+c*m);
    tiempos=rand(1,a*m+c*m);
    distancias=rand(1,b*m);
%Uso de la función
    [t,c,T,C,G]=viajes_d(ciudades,medios,costes,tiempos,distancias);
    