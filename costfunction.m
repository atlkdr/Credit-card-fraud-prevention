function [cost,grad] = costfunction(X,theta,Y,lambda)
    % Compute Logarithmic cost and Gradient for Logistic Regression
    m=size(X,1);
    grad=zeros(size(theta));
    hypo=sigmod(X*theta);
    cost=(-(1/m)*sum((Y.*log(hypo))+((1-Y).*log(1-hypo))))+(lambda*(theta')*(theta));
    for i=1:size(theta,1),
        grad(i)=(1/m)*(sum((hypo-Y).*(X(:,i)))+lambda*(theta(i)));
    end
end

