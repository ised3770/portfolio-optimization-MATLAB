%Question 4:
clear;
clc;

Cov = 0.01*[4.01, -1.19, 0.6, 0.74, -0.21;
    -1.19, 1.12, 0.21, -0.54, 0.55;
    0.6, 0.21, 3.31, 0.77, 0.29;
    0.74, -0.54, 0.77, 3.74, -1.04;
    -0.21, 0.55, 0.29, -1.04, 2.6];

r = 0.01*[13, 4.4, 12.1, 7.1, 11.7].';

ra = zeros(1,length(0.05:0.05:1));
sigma = zeros(1,length(0.05:0.05:1));
i = 1;

for alpha = 0.05:0.05:1
  
    %parameters
    H = Cov;

    %constrains:
    %lb = zeros(1,5).';   %for non-short-selling:
    lb = []';            %for short-selling   % Hur ändra till short-sell?

    Aeq = ones(1,5);
    beq = 1;

    x = quadprog(alpha*H,-(1-alpha)*r,[],[],Aeq,beq, lb);
    ra(i) = r.'*x;
    sigma(i) = x.'*Cov*x;
    
    i = i+1;
end

plot(ra,sigma);
ylabel('Variance \sigma');
xlabel('Expected rate of return');
title('Expected return of investment vs risk');
%axis([0,1,0,0.13]);