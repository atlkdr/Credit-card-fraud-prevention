% Function to Add FeatureS to data
function [X,theta] = featuretransform(X,theta)
 if size(X,2)>=2,
  new_feature=X(:,size(X,2)).*X(:,size(X,2));
  new_feature2=X(:,size(X,2)-1).*X(:,size(X,2)-1);
  X=[X,new_feature,new_feature2];
  theta=[theta;0.05;0.05];
 end
end

