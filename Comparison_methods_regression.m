clc; clear;

% EE768-Assignment1-4b,4c
%Program to determine 
%1) Conforming consumers with the total system load
%2) Diversity factor as a function of conforming consumers

%dataset for half hourly demand of 789 customers for a year
Data = xlsread('Assignment1_Dataset.xlsx');
sizeof_Data = size(Data);

% Part-1 Conforming loads
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

% method of difference
conform_load=[];
a=diff(feeder_load);
for i = 1:789
    b(:,i)=diff(customer_load(:,i));
    dist(i)=norm(a-b(:,i));
   correlation(i)=corr(customer_load(:,i),feeder_load);% correlation
   [r(i),m(i),b(i)] = regression(customer_load(:,i),feeder_load,'one');% regression
   %stats(i) = Covariance(feeder_load-customer_load(:,i));
    tol=210.7;  % tolerance value 
    if dist(i)<tol;
        conform_load=[conform_load,i];
    end
end
conform_load
conform_load1 = find(correlation>0.9)
conform_load2 = find(r>0.9)

%Part-2 Diversity factor

% Conforming loads in case concept of difference
Data1 = Data(:,[164	251	502	538	566	290	490	616	632	765	721	126	571	94	410	291	446	262	278	543]);

max_noncoincident_demand2_1 = 0;
for k = 1:20
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

% Conforming loads in case of correlation
Data2 = Data(:,[279	571	111	344	502	574	212	96	208	223	38	174	368	570	199	308	469	664	543	772]);

max_noncoincident_demand2_2 = 0;
for k = 1:20
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

% Plots

x_axis = [1:365];
figure(1)
set(gcf,'Name','Examples of Conforming Loads-difference','Color','w')
plot(x_axis,customer_load(:,251),'r','LineWidth',2)
hold on;
plot(x_axis,customer_load(:,502),'b','LineWidth',2)
hold on;
plot(x_axis,norm_feeder_load,'k','LineWidth',3)
hold on;
%axis([1 365 -1 2])
title('Some conforming loads- concept of differnce');
hold on;
xlabel('DAYS')
ylabel('LOAD')
legend('Customer251','Customer502','Total load');

figure(2)
set(gcf,'Name','Examples of Conforming Loads-correlation','Color','w')
plot(x_axis,customer_load(:,279),'r','LineWidth',2)   
hold on;
plot(x_axis,customer_load(:,571),'b','LineWidth',2)
hold on;
plot(x_axis,norm_feeder_load,'k','LineWidth',3)
hold on;
%axis([1 365 -1 2])
title('Some conforming loads- Concept of correlation');
hold on;
xlabel('DAYS')
ylabel('LOAD')
legend('Customer279','Customer571','Total load');

x_axis1 = [1:20];

figure(3)
set(gcf,'Name','Diversity factor versus number of customers','Color','w')
plot(x_axis1,diversity_factor_1,'r','LineWidth',2)
hold on;
plot(x_axis1,diversity_factor_2,'b','LineWidth',2)
hold on;
title('Diversity factor versus number of customers');
hold on;
axis([1 20 0 10]);
xlabel('No. of Customers')
ylabel('Diversity Factor')
legend('Concept of dfference','Concept of correlation');





