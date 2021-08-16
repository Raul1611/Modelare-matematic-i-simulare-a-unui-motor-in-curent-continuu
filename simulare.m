%Parametrii
L=0.9134; %H
R=0.6324; %ohm
J=0.9058; %kg*m^2;
B=0.8147; %N*m/(rad/sec)
Ke=0.1270; %V/(rad/sec)
Kt=0.1270; %N/A

%rad/sec --> RPM
rpm=60/(2*pi);

num=[1];
den=[L*J/Kt, (R*J+L*B)/Kt, R*B/Kt+Ke];

sys=tf(num,den);

[iesire_step, t_step]=step(sys);
plot(t_step,iesire_step*rpm);
ylabel('RPM'),xlabel('t'), title('Raspuns la semnal treapta')

figure
[iesire_impulse, t_impulse]=impulse(sys);
plot(t_impulse,iesire_impulse*rpm);
ylabel('RPM'),xlabel('t'), title('Raspuns la impuls, Kt mare')

figure
t=0:0.1:20; 
u=200*ones(length(t),1);
[iesire_lsim]=lsim(num, den,u,t);
plot(t,iesire_lsim*rpm);
ylabel('RPM'),xlabel('t'), title('Raspuns la treapta de amplitudine 200')

figure
t1=0:0.1:20; 
u1=[1200*ones(length(t)-100,1); 200*ones(length(t)-101,1)];
[iesire_lsim1]=lsim(num, den,u1,t1);
plot(t1,iesire_lsim1*rpm);
ylabel('RPM'),xlabel('t'), title('Raspuns la treapta de amplitudine variabila')


