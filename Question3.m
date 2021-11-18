%Question 3:
clear;
clc;

Cov = 0.01*[4.01, -1.19, 0.6, 0.74, -0.21;
    -1.19, 1.12, 0.21, -0.54, 0.55;
    0.6, 0.21, 3.31, 0.77, 0.29;
    0.74, -0.54, 0.77, 3.74, -1.04;
    -0.21, 0.55, 0.29, -1.04, 2.6];

r = 0.01*[13, 4.4, 12.1, 7.1, 11.7].';

%We will use quadprog:
%parameters
H = Cov;
ra = 0.2;

%constrains:
lb = zeros(1,5).';   %for non-short-selling:
%lb = []; %for short-selling

Aeq = [ones(1,5);r.'];
beq = [1; ra];

x = quadprog(H,[],[],[],Aeq,beq,lb);

disp(x);
disp(sum(x));