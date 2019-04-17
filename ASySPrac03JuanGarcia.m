%% P03: Se�ales en Tiempo Discreto
%
% <<UPII.PNG>>
%
% *UNIDAD PROFESIONAL INTERDISCIPLINARIA EN INGENIER�A Y TECNOLOG�AS AVANZADAS* 
% 
% *An�lisis de Se�ales y Sistemas*
%
% Autores: Garc�a Sandoval Juan Jes�s y P�rez Miranda Jacob Isa�as 2MV1
%
% Profesor: Dr Rafael Mart�nez Mart�nez
%
%% Objetivos 
%
% Como objetivos principales de la pr�ctica se pretende implementar la manipulaci�n b�sica de MATLAB, 
% as� como la graficaci�n de se�ales reales y complejas discretas, la transformaci�n de se�ales discretas 
% (escalamientos y traslaciones) y el c�lculo de energ�a y potencia de
% se�ales discretas
%
%% Introducci�n
%
% En la presente pr�ctica se desarrollar� una p�gina web, en lenguaje html utilizando MATLAB.
% 
% MATLAB es un software matem�tico desarrollado por MathWorks y su nombre proviene de
% la Abreviaci�n de MATrix LABoratory. 
%
% A lo largo de la pr�ctica se abordar� el procedimiento para tratar
% se�ales en tiempo discreto, para lo cual es importante describir el
% tratamiento para escalar horizontalmente este tipo de se�ales. 
%
% Para escalar horizontalmente una se�al en tiempo discreto es necesario multiplicar el argumento por un escalar.
% Supongamos la funci�n $f[n]$ (_figura 1 a_) nosotros al multiplicar por un escalar mayor
% a 1 conseguimos que la se�al se comprima horizontalmente, sin embargo, si
% multiplicamos por un escalar entre 0 y 1 consegumios que la funci�n se
% expanda horizontalmente.
%
% En la _figura 1 b_ se muestra un ejemplo de una compresi�n horizontal, al
% multiplicar el argumento _x2_
%
% En la _figura 1 c_ se muestra un ejemplo de una expansi�n horizontal, al
% multiplicar el argumento _x0.5_
%
%
% 
% <<COMP.PNG>>
% 
%
% _Figura 1. tomada de Linear Systems and Singnals de BP Lathi_
%
%
%% 1. 
%
% Se cre� una funci�n llamada _fun1_ la cual recibe dos parametros $\Omega$ y $a$ 
% para entonces regesar la evaluaci�n $f[n]=r^ncos(\Omega n)+r^nsen(\Omega n)j$
% como se muestra a continuaci�n:
%
%   function [f ] = fun1( r,w )
%   
%   syms n;
%   f=r^n*(cos(w*n)+sin(w*n)*1j)
%
%   end
%
% A manera demostrativa, daremos los valores $r=2$ y $\Omega = \pi$
Fun=fun1(2,pi)
%% 2.
%
% Se crear� una funci�n que nos permita graficar con un estilo predefinido.
% En este caso se graficar� el ejemplo 
% $x[n]=na^nu[n]$ vs $n$ y proponemos $a=0.9$. La funci�n se invoca de la siguiente manera:  _Figura(valores en x,
% valores en y, 't�tulo del gr�fico')_
%
close all
n=-2:10;
a=0.9;
x=@(n) n.*(a.^n).*heaviside(n);
Figura(n,x(n),'x[n]')
%%
% El c�digo de la funci�n Figura se escuentra en el ap�ndice 1
%% 3.
%
% Se crear� una funci�n que grafique funciones de $f : N \rightarrow R^2$.
% A maneraa de demostraci�n se graficar� la funci�n del ejercicio 1: $f[n]=r^ncos(\Omega n)+r^nsen(\Omega n)j$
%
close all
r=1.1;
w=0.5;
f=@(n) r.^n.*(cos(w.*n)+sin(w.*n).*1j);
FiguraCmplx(n,real(f(n)),imag(f(n)))
%%
% El c�digo de la funci�n FiguraCmplx se escuentra en el ap�ndice 2
 %%
 % tambi�n se reportar� la gr�fica de $|f[n]|$ como sigue a continuaci�n
 %
 mag=@(n) abs(f(n));
 Figura(n,mag(n),'|f[n]|')
 %%
 % y la gr�fica de $\angle f[n]$
 %
ang=@(n) angle(f(n));
 Figura(n,ang(n),'<f[n]')
 %% 4.
%
% Para este punto se ha elaborado la funci�n _energiadis_, la cual recibe
% un vector tiempo y las alturas asignadas.
%
% El c�digo se ha implementado de la siguiente manera:
%
%   function [ E ] = energiadis( h)
%   ff=h.^2;
%   E=sum(ff);
%   end
%
% A manera de demostraci�n se obtendr� la energ�a de la funci�n planteada
% en el ejercicio 2: $x[n]=na^nu[n]$
E1=energiadis(x(n))
%%
% Y tambi�n lleva a cabo el c�lculo de la energ�a de se�ales complejas como
% la del ejercicio 1: $f[n]=r^ncos(\Omega n)+r^nsen(\Omega n)j$
E2=energiadis(f(n))
%% 5. 
%
% Resolver el ejercicio 3.1.1.c) del Lathi
%
% _Find the energy of the signals depicted_
close all
clear all
u=@(n) (n>=0 & n>=0);
n=-5:5;
x=@(n) n.*(u(n+3)-u(n-4)); 
Figura(n,x(n),'c)')
%%
% Para resolver este problema, unicamente debemos ejecutar la funci�n
% desarrollada en el ejercicio 4:
energiadis(x(n))
%% 6.
%
% Resolver el ejercicio 3.2.3. del Lathi
%
% _For the signal shown, sketch the following signals:_
close all
clear all
u=@(n) (n>=0 & n>=0);
n=-12:21;
x=@(n) (n.*(u(n)-u(n-4)))+((-n+6).*(u(n-4)-u(n-6))); 
Figura(n,x(n),'x[n]')
axis equal
xlim([-1 7])
ylim([-1 4])
%%
% $a) x[-n]$
Figura(n,x(-n),'a)x[-n]')
axis equal
xlim([-7 1])
ylim([-1 4])
%%
% $b) x[n+6]$
Figura(n,x(n+6),'b)x[n+6]')
axis equal
xlim([-7 1])
ylim([-1 4])
%%
% $c) x[n-6]$
Figura(n,x(n-6),'c)x[n-6]')
axis equal
xlim([5 13])
ylim([-1 4])
%%
% $d) x[3n]$
Figura(n,x(3.*n),'d)x[3n]')
axis equal
xlim([-1 7])
ylim([-1 4])
%%
% $e) x[\frac{n}{3}]$
uu=@(nn) (nn>=0 & nn>=0);
nn= 0:3:21;
xx=@(nn) ((nn./3).*(uu(nn)-uu(nn-10)))+(((-nn./3)+6).*(uu(nn-10)-uu(nn-18))); 
Figura(nn,xx(nn),'e)x[n/3]')
xlim([-0 19])
ylim([-1 4])
%%
% $f) x[3-n]$
Figura(n,x(3-n),'f)x[3-n]')
axis equal
xlim([-4 4])
ylim([-1 4])
%% Ap�ndices
%
% *Ap�ndice 1*
%
%   function Figura(X1, Y1,titl)
%   %CREATEFIGURE(X1, Y1)
%   %  X1:  stem x
%   %  Y1:  stem y
% 
%   %  Auto-generated by MATLAB on 15-Apr-2019 21:17:37
% 
%   % Create figure
%   figure1 = figure;
% 
%   % Create axes
%   axes1 = axes('Parent',figure1);
%   hold(axes1,'on');
% 
%   % Create stem
%   stem(X1,Y1,'LineWidth',2,'Color',[1 0 0]);
% 
%   % Create title
%   title(titl);
% 
%   % Set the remaining axes properties
%   set(axes1,'Color',[1 0.968627452850342 0.921568632125854],'FontName',...
%       'Century Gothic','XAxisLocation','origin','XGrid','on','YAxisLocation',...
%       'origin','YGrid','on');
%%
%
% *Ap�ndice 2*
%
%   function FiguraCmplx(X1, Y1, Z1)
%   %CREATEFIGURE(X1, Y1, Z1)
%   %  X1:  stem3 x
%   %  Y1:  stem3 y
%   %  Z1:  stem3 z
% 
%   %  Auto-generated by MATLAB on 16-Apr-2019 14:35:55
% 
%   % Create figure
%   figure1 = figure;
% 
%   % Create axes
%   axes1 = axes('Parent',figure1);
%   hold(axes1,'on');
% 
%   % Create stem3
%   stem3(X1,Y1,Z1,'LineWidth',2,'Color',[1 0 0]);
% 
%   % Create xlabel
%   xlabel('n');
% 
%   % Create ylabel
%   ylabel('Re');
% 
%   % Create zlabel
%   zlabel('Im');
% 
%   view(axes1,[14.9 44.4]);
%   box(axes1,'on');
%   grid(axes1,'on');
%   % Set the remaining axes properties
%   set(axes1,'FontName','Century Gothic');
%
%% Referencias
% 
% # B.P. Lathi. (2005). Linear Systems and Signals. New York: Oxford University Press, Inc.
% # Integral. 10 abril 2019, de MathWorks Sitio web:
% https://es.mathworks.com/discovery/integral.html
% # Limit. 10 abril 2019, de MathWorks Sitio web: https://www.mathworks.com/help/symbolic/limit.html
% # (2012). Juntas, pero no revueltas: sub-gr�ficas en una misma figura de Matlab . 10 abril 2019, de 5 minutos de Matlab Sitio web: http://5minutosdematlab.blogspot.com/2012/09/juntas-pero-no-revueltas-sub-graficas.html
%

