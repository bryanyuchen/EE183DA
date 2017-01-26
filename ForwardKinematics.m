%Forward Kinematics function for position:

function [x,y,z] = ForwardKinematics(t1,t2,t3,t4,t5,t6,t7)
%the symbols are a relic from earlier symbolic computation
syms T1 T2 T3 T4 T5 T6 T7;

T1 = t1;
T2 = t2;
T3 = t3;
T4 = t4;
T5 = t5;
T6 = t6;
T7 = t7;

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
res = T*[0;0;1;1];
x = res(1);
y = res(2);
z = res(3);
end