clear;
% REGULARIZED LOGISTIC REGRESSION PREDICTS VALUE USING GRADIENT DESCENT AND NEWTON'S METHORD
data2=load('credit.txt');

% Randomizing data
data3=randomize_data(data2);

% Creating Test_data
test_data=data3(1:int16(0.2*size(data3,1)),:);  % 20% Test data [ For This Case ] 


% Creating Training_data
data=data3(1:int16(size(data3,1)),:);  % 100% Training data [ For This Case ] 


X=data(:,1:2);
Y=data(:,3);

% For plotting Purpose as Its going to be changed
X_plot=X;
Y_plot=Y;
plot_data(X_plot,Y_plot);


% Preparing Matrices
[m n]=size(X);
X=[ones(m,1),X];

% Initial Value of theta is within range(-0.1,0.1)
theta=[1;-0.05;0.05];


lambda=0;
learning_rate=0.01; % ALPHA

% PREDICTION USING LOGISTIC REGRESSION ( SIGMOD , Gradient Descent , lambda )


[theta2,cost2,gd_iter]=logdes(X,theta,Y,learning_rate,lambda);
accuracy1=prediction(X,theta2,Y);

% takes 10,000 iterations to converge to accuracy given by newton's methord

[theta3,cost3,nt_iter]=newton_methord(X,theta,Y,lambda);
accuracy2=prediction(X,theta3,Y);

printf("Accuracy using Gradient Descent = %f \n Iterations taken :%d\n\n",accuracy1,gd_iter);
printf("Accuracy using Newton Raphson = %f \n Iterations taken :%d \n\n",accuracy2,nt_iter);




% Applying Feature Transform Calculations _t denotes transformed

[X_t,theta_t]=featuretransform(X,theta);
lambda_t=5;
[theta_t,cost_t,gd_iter_t]=logdes(X_t,theta_t,Y,learning_rate,lambda_t);
transformed_accuracy=prediction(X_t,theta_t,Y);

printf("Feature_Added_Matrix_Accuracy %f\n\n",transformed_accuracy);

printf("EFFECT--OF--LAMBDA--CHANGE--TO--OUTPUT--ACCURACY\n");
for counter=1:5,
  lambda_counter=counter*5;
  [theta_temp,cost_temp,gd_iter_temp]=logdes(X_t,theta_t,Y,learning_rate,lambda_counter);
  lambda_transformed_accuracy=prediction(X_t,theta_temp,Y);
  printf("Feature_Added_Matrix_Accuracy = %f for lambda = %d\n",lambda_transformed_accuracy,lambda_counter);
end

