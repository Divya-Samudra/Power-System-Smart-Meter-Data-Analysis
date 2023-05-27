clc; clear;
% EE768-Assignment1-4c by Divya M_18V972020
%Program to calculate diversity factor as a function of customers:
%1-conforming customers considering normalized curves
%2-conforming customers considering actual curves

%dataset for half hourly demand of 789 customers for a year
Data = xlsread('Assignment1_Dataset.xlsx');%Assignment1_Dataset
sizeof_Data = size(Data);

% Conforming loads in case of actual data
Data1 = Data(:,[164	251	502	538	566	290	490	616	632	765	721	126	571	94 410]);

max_noncoincident_demand2_1 = 0;
for k = 1:15
    max_noncoincident_demand1_1(k) = max(Data1(:,k));
    max_noncoincident_demand2_1 = max_noncoincident_demand2_1 + max_noncoincident_demand1_1(k);
    max_noncoincident_demand_1(k) = max_noncoincident_demand2_1;
    for j = 1:17520
        max_diversified_demand1_1 = 0;
        for i = 1:k
            max_diversified_demand1_1 = max_diversified_demand1_1+Data1(j,i);
        end
        max_diversified_demand2_1(j) = max_diversified_demand1_1;
    end
    max_diversified_demand_1(k) = max(max_diversified_demand2_1);
    diversity_factor_1(k) = max_noncoincident_demand_1(k)/max_diversified_demand_1(k);
end

%-------------------------------
% Conforming loads in case of correlation
Data2 = Data(:,[279	571	111	344	502	574	212	96	208	223	38	174	368	570	199]);

max_noncoincident_demand2_2 = 0;
for k = 1:15
    max_noncoincident_demand1_2(k) = max(Data2(:,k));
    max_noncoincident_demand2_2 = max_noncoincident_demand2_2 + max_noncoincident_demand1_2(k);
    max_noncoincident_demand_2(k) = max_noncoincident_demand2_2;
    for j = 1:17520
        max_diversified_demand1_2 = 0;
        for i = 1:k
            max_diversified_demand1_2 = max_diversified_demand1_2+Data2(j,i);
        end
        max_diversified_demand2_2(j) = max_diversified_demand1_2;
    end
    max_diversified_demand_2(k) = max(max_diversified_demand2_2);
    diversity_factor_2(k) = max_noncoincident_demand_2(k)/max_diversified_demand_2(k);
end
%---------------------------------------

x_axis1 = [1:15];

figure(1)
set(gcf,'Name','Diversity factor versus number of customers','Color','w')
plot(x_axis1,diversity_factor_1,'r','LineWidth',2)
hold on;
plot(x_axis1,diversity_factor_2,'b','LineWidth',2)
hold on;
title('Diversity factor versus number of customers');
hold on;
axis([1 15 0 10]);
xlabel('No. of Customers')
ylabel('Diversity Factor')
legend('Concept of dfference','Concept of correlation');
