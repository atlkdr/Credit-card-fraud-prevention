function hypo_fitting(X_plot,Y_plot,X,Y,theta);
  hold on;
  class_1=find(Y_plot==1);
  class_2=find(Y_plot==0);
  % Plot Examples
  plot(X_plot(class_1,1), X_plot(class_1,2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
  title("Credit Card [Acceptance Or Rejected]")
  xlabel("Attribute 1");
  ylabel("Attribute 2");
  plot(X_plot(class_2,1), X_plot(class_2,2), 'ko', 'MarkerFaceColor', 'y','MarkerSize', 7);
  X_vals=[ones(6,1),repmat([1:6]',1,(size(theta,1)-1))]
  Y_vals_1=X_vals*theta;
  plot(X_vals,Y_vals_1);
  legend("Accepted","Rejected");
  hold off;
end
