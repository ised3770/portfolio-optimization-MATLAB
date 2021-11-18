%Question 2
clear;
clc;
%our condition is that sum(w) = 1;

%our Covariance matrix
Cov = 0.01*[4.01, -1.19, 0.6, 0.74, -0.21;
    -1.19, 1.12, 0.21, -0.54, 0.55;
    0.6, 0.21, 3.31, 0.77, 0.29;
    0.74, -0.54, 0.77, 3.74, -1.04;
    -0.21, 0.55, 0.29, -1.04, 2.6];

%We want to solve:
x = ones(1,5)/(2*Cov);
lamda = 1/sum(x);
x_real = lamda*x;

disp(x);
disp(lamda);
disp(x_real);
disp(sum(x_real));

%dubble check so nothing is wrong:
x = quadprog(Cov,[],[],[],ones(1,5),1);
disp(x)
