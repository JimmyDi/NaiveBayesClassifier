clear;
clc;
close all;



load('feature_pdf.mat');
pdf1 = P_pdf(1,:);
pdf2 = N_pdf(1,:);



y = @(x) normpdf(x,pdf1(1),pdf1(2))-normpdf(x,pdf2(1),pdf2(2));

double(solve(y))