function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0.01;
sigma = 0.01;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
trysigma=zeros(10,1);
tryC=zeros(10,1);
for i=1:10,
  trysigma(i)=sigma;
  sigma=sigma*3;
  tryC(i)=C;
  C=C*3;
endfor
cost=1000000000;
for i=1:10,
  for j=1:10,
    model= svmTrain(X, y, tryC(i), @(x1, x2) gaussianKernel(x1, x2, trysigma(j))); 
    predictions = svmPredict(model, Xval);
    if cost>mean(double(predictions ~= yval))
      cost=mean(double(predictions ~= yval));
      C=tryC(i);
      sigma=trysigma(j);
    endif
  endfor
endfor






% =========================================================================

end
