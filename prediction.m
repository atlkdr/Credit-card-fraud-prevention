function [accuracy] = prediction(X,theta,Y)
    m=size(X,1);
    % Rounding Prediction to closest Integer
    predicted=round(sigmod(X*theta));
    accuracy=mean(double(predicted==Y))*100;
end
