close all
clear
clc

n=30; 
p=0.05; 
names={'Poisson','Autovalores','Viajes','Ciudades','Vecinos','Grado separación','Diámetro','P. crítica'};     
B=rand(n)<p;
for i=1:n
     B(i,i)=0.0;
 end
B=triu(B);
B=B+B';
G=graph([1 2 3 4 5 6 7 8],[2 3 4 5 6 7 8 1]);
p=plot(G,'k');
p.Marker = 'p';
p.NodeColor = 'r';
p.LineStyle = '--';
p.NodeLabel = {};
Mi=neighbors(G,1);
C=findnode(G,1);
figure()
a=plot(G);
highlight(a,Mi,'NodeColor','y')
highlight(a,[1],'NodeColor','r','Marker','p')
a.NodeLabel = {};
c=graph(bucky);
s = [1 1 1 2 2 3 3 4 5 5 6 7];
t = [2 4 8 3 7 4 6 5 6 8 7 8];
d = graph(B);
figure()
p=0.05; 
d=plot(d)
d.NodeLabel={};
xlabel(['Probabilidad =',num2str(p)])

