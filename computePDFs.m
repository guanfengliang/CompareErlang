function [erlangPDF, myPDF] = computePDFs(L,n,points)

% L -- max number of parallel threads
% n -- chunks per file
% points -- values to be evaluated for both PDFs

% mu is assume to be 1

Lambdas = (L-n+1):L;

erlangLambda = 1/mean(1./Lambdas);



erlangPDF = zeros(size(points));
myPDF = zeros(size(points));

for i = 1:length(points)
    x = points(i);
    erlangPDF(i) = erlangLambda^n * x^(n-1) * exp(-erlangLambda * x)/gamma(n);
    
    for j = 1:n
        LambdaMinusJ = Lambdas;
        LambdaMinusJ(j) = [];
        prod(LambdaMinusJ./(LambdaMinusJ - Lambdas(j)));
        myPDF(i) = myPDF(i) + prod(LambdaMinusJ./(LambdaMinusJ - Lambdas(j))) * Lambdas(j) * exp(-Lambdas(j) * x);
    end
end
