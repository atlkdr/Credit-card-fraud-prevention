function [theta,cost,con_it] = logdes(X,theta,Y,alpha,lambda)
    iterations=1000;
    con_it=0; % Convergence Iteration
    % In default Go to 1000 iterations but in case of early convergence exit
    for i=1:iterations,
      [cost,grad]=costfunction(X,theta,Y,lambda);
      theta=theta-(alpha*grad);
      [cost_new,Junk]=costfunction(X,theta,Y,lambda);
      if cost_new>=cost,
        break;
      end
      con_it+=1;
    end
end

