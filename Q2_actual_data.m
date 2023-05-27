clc; clear;

% EE768-Assignment1-4b
%Program to determine which consumers conform with the total system load

%dataset for half hourly demand of 789 customers for a year
Data = xlsread('Assignment1_Dataset.xlsx');
sizeof_Data = size(Data);

%Daily average customer load and total daily load at feeder
for i = 1:365
    feeder_daily_demand1 = 0;
    for j = 1:789
        customer_daily_demand = 0;
        for k = 1:48
            customer_daily_demand = customer_daily_demand+Data(((i-1)*48)+k,j);
        end
        customer_daily_average(i,j) = customer_daily_demand*0.02083333; %*1/48
        feeder_daily_demand1 = feeder_daily_demand1+customer_daily_average(i,j);
    end
    feeder_daily_demand(i,1) = feeder_daily_demand1;
end

% Yearly average customer load and feeder load
feeder_average = mean(feeder_daily_demand);
for i = 1:789
    customer_average(i,1) = mean(customer_daily_average(:,i));
end

%ac components of customer loads and feeder load
for i = 1:365
    for j = 1:789
        customer_load(i,j) = customer_daily_average(i,j)-customer_average(j,1);
    end
    feeder_load(i,1) = feeder_daily_demand(i,1)-feeder_average;
end

%Normalized feeder ac component
norm_feeder_load = feeder_load / max( feeder_load );
for i = 1:789
    norm_customer_load(:,i)=customer_load(:,i)/max(customer_load(:,i));
end

% Conforming loads
conform_load=[];
a=diff(feeder_load);
for i = 1:789
b(:,i)=diff(customer_load(:,i));
dist(i)=norm(a-b(:,i));
tol=210.6;  % tolerance value 
if dist(i)<tol;
   conform_load=[conform_load,i];
end
end
Dissimilarity_index = dist
conform_load

x_axis = [1:365];

figure(1)
set(gcf,'Name','Examples of Conforming Loads','Color','w')
plot(x_axis,zeros(1,365),'k--','LineWidth',1)   
hold on;
plot(x_axis,customer_load(:,251),'r','LineWidth',2)
hold on;
plot(x_axis,customer_load(:,502),'b','LineWidth',2)
hold on;
plot(x_axis,norm_feeder_load,'k','LineWidth',2)
hold on;
axis([1 365 -1 2])
title('Some conforming loads');
hold on;
xlabel('DAYS')
ylabel('LOAD')
legend('reference','Customer251','Customer502','Total load');


