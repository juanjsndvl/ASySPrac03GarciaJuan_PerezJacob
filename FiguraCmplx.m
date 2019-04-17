function FiguraCmplx(X1, Y1, Z1)
%CREATEFIGURE(X1, Y1, Z1)
%  X1:  stem3 x
%  Y1:  stem3 y
%  Z1:  stem3 z

%  Auto-generated by MATLAB on 16-Apr-2019 14:35:55

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create stem3
stem3(X1,Y1,Z1,'LineWidth',2,'Color',[1 0 0]);

% Create xlabel
xlabel('n');

% Create ylabel
ylabel('Re');

% Create zlabel
zlabel('Im');

view(axes1,[14.9 44.4]);
box(axes1,'on');
grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Century Gothic');
