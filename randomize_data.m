function data=randomize_data(data1)
  data=data1;
  data=data1(randperm(size(data1,1)),:);  
end
