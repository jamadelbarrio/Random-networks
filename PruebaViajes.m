clear
close all
clc
%Programa para probar la función viajes
%Establecimiento de las variables iniciales
    ciudades={'Madrid', 'Barcelona','Segovia','Oporto','Palencia','Albacete','Lyon','Navacerrada','Paris','EEUU','Bilbao','Cádiz','Almería','Lugo'};
    medios={'Coche' 'Tren' 'Bus' 'Bicicleta' 'Andando'};
    c=length(ciudades);
    m=length(medios);
    a=sum(1:c-1);
    costes=rand(1,a*m);
    tiempos=rand(1,a*m);
    distancias=rand(1,a*m);
    i=1;
    f=3;
%Uso de la función
    [t,c,T,C,G,d]=viajes(ciudades,medios,costes,tiempos,distancias,i,f);


