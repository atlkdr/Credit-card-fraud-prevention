function plot_data(X,Y)
    hold on;
    class_1=find(Y==1);
    class_2=find(Y==0);
    % Plot Examples
    plot(X(class_1,1), X(class_1,2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
    title("Credit Card [Acceptance Or Rejected]")
    xlabel("Attribute 1");
    ylabel("Attribute 2");
    plot(X(class_2,1), X(class_2,2), 'ko', 'MarkerFaceColor', 'y','MarkerSize', 7);
    legend("Accepted","Rejected");
    hold off;
end
