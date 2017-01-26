%Inverse Kinematics
function [t1,t2,t3,t4,t5,t6] = ForwardKinematics(x,y,z,roll,pitch,yaw)
%the symbols are a relic from earlier symbolic computation
syms T1 T2 T3 T4 T5 T6;

T_0 = [1,0,0,0;0,1,0,0;0,0,1,110;0,0,0,1];
T_1 = [-cos(T1),sin(T1),0,0;0,0,-1,0;-sin(T1),-cos(T1),0,0;0,0,0,1];
T_2 = [-cos(T2),sin(T2),0,0;0,0,-1,-360;-sin(T2),-cos(T2),0,0;0,0,0,1];
T_3 = [-cos(T3),sin(T3),0,0;0,0,-1,0;-sin(T3),-cos(T3),0,0;0,0,0,1];
T_4 = [-cos(T4),sin(T4),0,0;0,0,-1,-360;-sin(T4),-cos(T4),0,0;0,0,0,1];
T_5 = [-cos(T5),sin(T5),0,0;0,0,-1,0;-sin(T5),-cos(T5),0,0;0,0,0,1];
T_6 = [-cos(T6),sin(T6),0,0;0,0,-1,-155;-sin(T6),-cos(T6),0,0;0,0,0,1];
T_7 = [0,1,0,0;0,0,1,0;1,0,0,0;0,0,0,1];
T_7_0 = [1,0,0,155;0,1,0,0;0,0,1,0;0,0,0,1];
T =  T_0 * T_1 * T_2 * T_3 * T_4 * T_5 * T_6 * T_7 * T_7_0;

x_0 = T(1,4);
y_0 = T(2,4);
z_0 = T(3,4);
roll_0 = atan2(T(2,1),T(1,1));
pitch_0 = atan2(-T(3,1),sqrt(T(3,2)^2+T(3,3)^2));
yaw_0 = atan2(T(3,2),T(3,3));

J = jacobian([x_0,y_0,z_0,roll_0,pitch_0,yaw_0],[T1,T2,T3,T4,T5,T6])

step = [10;10;10;.1;.1;.1];
initial = [1,1,1,0,0,0];
q = [1;1;1;1;1;1];

while (norm([x,y,z,roll,pitch,yaw]) - norm(initial) > 1)
T1 = initial(1);
T2 = initial(2);
T3 = initial(3);
T4 = initial(4);
T5 = initial(5);
T6 = initial(6);

dq = transpose(subs(J))*step;
q = q + dq;
initial = ForwardKinematics(q(1,1),q(2,1),q(3,1),q(4,1),q(5,1),q(6,1),0);

end