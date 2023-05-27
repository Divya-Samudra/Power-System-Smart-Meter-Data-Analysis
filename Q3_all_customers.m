clc; clear;
% EE768-Assignment1-4c by Divya M_18V972020
%Program to calculate diversity factor as a function of customers:

%dataset for half hourly demand of 789 customers for a year
Data = xlsread('Assignment1_Dataset.xlsx');%Assignment1_Dataset
sizeof_Data = size(Data);

% All loads
max_noncoincident_demand2 = 0;
for k = 1:789
    max_noncoincident_demand1(k) = max(Data(:,k));
    max_noncoincident_demand2 = max_noncoincident_demand2 + max_noncoincident_demand1(k);
    max_noncoincident_demand(k) = max_noncoincident_demand2;
    for j = 1:17520
        max_diversified_demand1 = 0;
        for i = 1:k
            max_diversified_demand1 = max_diversified_demand1+Data(j,i);
        end
        max_diversified_demand2(j) = max_diversified_demand1;
    end
    max_diversified_demand(k) = max(max_diversified_demand2);
    diversity_factor(k) = max_noncoincident_demand(k)/max_diversified_demand(k);
end

x_axis = [1:789];

figure(1)
set(gcf,'Name','Diversity factor versus number of customers including all customers','Color','w')
plot(x_axis,diversity_factor,'r','LineWidth',2)
hold on;
title('Diversity factor versus number of customers including all customers');
hold on;
axis([1 789 0 5]);
xlabel('No. of Customers')
ylabel('Diversity Factor')
