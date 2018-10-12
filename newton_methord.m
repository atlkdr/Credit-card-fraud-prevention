function [theta,cost,nt_iter] = newton_methord(X,theta,Y,lambda)
    
    % FOR LOGIC PART PLEASE REFER THE REPORT 
    
    iterations=15;  %  Convergence Happens Extremely Fast ( In 2 iterations )
    m=size(Y,1);
    cost=zeros(iterations,1);
    nt_iter=0;
    for i=1:iterations,
        heissen=zeros(size(X,2),size(X,2));
        gradient_mat=zeros(size(X,2),1);
        for row_no=1:size(X,1),
            row=X(row_no,:);
            heissen=heissen+sigmod(row*theta)*(1-sigmod(row*theta))*(row')*row;
            gradient_mat=gradient_mat+((sigmod(row*theta)-Y(row_no,:))*row');
        end
        heissen=heissen/m;
        gradient_mat=gradient_mat/m;
        theta=theta-inv(heissen)*gradient_mat;
        % Grad is junk for Newton Rapsion
        [cost_temp,junk]=costfunction(X,theta,Y,lambda);
        cost(i,1)=cost_temp;
        if i>=2,
          if cost(i,1)>=cost(i-1,1),
            break;
          end
        end
        nt_iter+=1;
    end
end
