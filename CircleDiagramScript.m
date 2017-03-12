%% Power Circle Diagram
% 
% This program plots a power circle diagram
% using given Values of _Vs, Vr, A and B_ and plots
% the sending end and receiving end graphs on a single 
% figure.

%%% Way of giving input
%
% All the Values are Comples, so the Sending End and 
% Receiving End Volages should be pre adjusted before
% giving any input to eliminate the error in the circle 
% diagram location in the *a + bi* format.
% The Values of the A and B parameter is to be given
% in the *a + bi* format

%------------------------Input Section-------------------------------------
Vs = input('Enter Vs in (a + bi) form : ');                     
%Taking Inputs for the Sending end voltage vector
Vr = input('Enter Vr in (a + bi) form : ');                      
%taking input for the Receiving end voltage Vector
A = input('Enter the A Parameter in (a + bi) form : ');    
%Takng input for the A parameter of the line
B = input('Enter the B Parameter in (a + bi) form : ');     
%Taking input for the B parameter of the line

%--------------Processing section--------------------

R = (abs(Vs)*abs(Vr))/abs(B); 
%Calculation of radius of the Power Circle
CntrR = (abs(A)*abs(Vr)*abs(Vr))/abs(B); 
%Calculation of the Centre of the power circle

%-----------------Plotting Section-------------------

th = linspace( 0, 2*pi , 3600);  
%Threshold of the receiving end power Circle
x = R*cos(th) + CntrR*cos(angle(B));
y = R*sin(th) + CntrR*sin(angle(B));
plot(x,y,'DisplayName','Sending End Power Circle')

hold on 
x1 = R*cos(th) - CntrR*cos(angle(B));  
 
y1 = R*sin(th) - CntrR*sin(angle(B));    
%Equation of the circle in cartesian form
plot(x1,y1,'DisplayName','Receiving End Power Circle')

%-----------Plot Formatting Section------------------

legend('show')
axis equal   %plotting the x,y plot with equal axis ratios
ax = gca;   %creating the axes
ax.XAxisLocation = 'origin';  
ax.YAxisLocation = 'origin';
title('Power Circle Diagrams');
xlabel('Watt');
ylabel('VAR');
