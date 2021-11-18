%Question 1
clear;
clc;

Assets = [1 2 3 4 5].';

Cov = [4.01, -1.19, 0.6, 0.74, -0.21;
      -1.19, 1.12, 0.21, -0.54, 0.55;
         0.6, 0.21, 3.31, 0.77, 0.29;
      0.74, -0.54, 0.77, 3.74, -1.04;
      -0.21, 0.55, 0.29, -1.04, 2.6];

disp(Cov)

r = 0.01*[13, 4.4, 12.1, 7.1, 11.7].';

%checks so it's symetric:
disp(issymmetric(Cov));

%displayes the upper triangle to compare
disp(triu(Cov));

%multiply by 0.01
Cov = 0.01*Cov;


%Since the expected return is largest for the first stock
%it makes sense to put everything in to that stock if we want
%to maximize the return. Since we have no short selling, we can
%maximum put w1 = 1 into that stock.

%our variance will be 4.01



