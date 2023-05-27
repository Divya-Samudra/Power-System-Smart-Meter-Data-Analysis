clc; clear;
% EE768-Assignment1-4a by Divya M_18V972020
%Program to calculate maximum and average demand of 789 customers on:
%1-monthly basis
%2-annual basis

%dataset for half hourly demand of 789 customers for a year
Data = xlsread('Assignment1_Dataset.xlsx');%Assignment1_Dataset
sizeof_Data = size(Data);

% Monthly load curve

Data1 = Data(1:1488,:);          
Data2 = Data(1489:2832,:);
Data3 = Data(2833:4320,:);
Data4 = Data(4321:5760,:);
Data5 = Data(5761:7248,:);
Data6 = Data(7249:8688,:);
Data7 = Data(8689:10176,:);
Data8 = Data(10177:11664,:);
Data9 = Data(11665:13104,:);
Data10 = Data(13105:14592,:);
Data11 = Data(14593:16032,:);
Data12 = Data(16033:17520,:);

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:31
            sum = sum + Data1(j+(k-1)*48,i);
        end
        jan_load(i,j) = sum/31;
    end
end

average_jan = mean(jan_load,2);
max_jan = max(jan_load, [], 2);
for i = 1:789
load_factor_jan(i) = average_jan(i)/max_jan(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:28
            sum = sum + Data2(j+(k-1)*48,i);
        end
        feb_load(i,j) = sum/28;
    end
end

average_feb = mean(feb_load,2);
max_feb = max(feb_load, [], 2);
for i = 1:789
load_factor_feb(i) = average_feb(i)/max_feb(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:31
            sum = sum + Data3(j+(k-1)*48,i);
        end
        mar_load(i,j) = sum/31;
    end
end

average_mar = mean(mar_load,2);
max_mar = max(mar_load, [], 2);
for i = 1:789
load_factor_mar(i) = average_mar(i)/max_mar(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:30
            sum = sum + Data4(j+(k-1)*48,i);
        end
        apr_load(i,j) = sum/30;
    end
end

average_apr = mean(apr_load,2);
max_apr = max(apr_load, [], 2);
for i = 1:789
load_factor_apr(i) = average_apr(i)/max_apr(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:31
            sum = sum + Data5(j+(k-1)*48,i);
        end
        may_load(i,j) = sum/31;
    end
end

average_may = mean(may_load,2);
max_may = max(may_load, [], 2);
for i = 1:789
load_factor_may(i) = average_may(i)/max_may(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:30
            sum = sum + Data6(j+(k-1)*48,i);
        end
        jun_load(i,j) = sum/30;
    end
end

average_jun = mean(jun_load,2);
max_jun = max(jun_load, [], 2);
for i = 1:789
load_factor_jun(i) = average_jun(i)/max_jun(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:31
            sum = sum + Data7(j+(k-1)*48,i);
        end
        jul_load(i,j) = sum/31;
    end
end

average_jul = mean(jul_load,2);
max_jul = max(jul_load, [], 2);
for i = 1:789
load_factor_jul(i) = average_jul(i)/max_jul(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:31
            sum = sum + Data8(j+(k-1)*48,i);
        end
        aug_load(i,j) = sum/31;
    end
end

average_aug = mean(aug_load,2);
max_aug = max(aug_load, [], 2);
for i = 1:789
load_factor_aug(i) = average_aug(i)/max_aug(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:30
            sum = sum + Data9(j+(k-1)*48,i);
        end
        sep_load(i,j) = sum/30;
    end
end

average_sep = mean(sep_load,2);
max_sep = max(sep_load, [], 2);
for i = 1:789
load_factor_sep(i) = average_sep(i)/max_sep(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:31
            sum = sum + Data10(j+(k-1)*48,i);
        end
        oct_load(i,j) = sum/31;
    end
end

average_oct = mean(oct_load,2);
max_oct = max(oct_load, [], 2);
for i = 1:789
load_factor_oct(i) = average_oct(i)/max_oct(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:30
            sum = sum + Data11(j+(k-1)*48,i);
        end
        nov_load(i,j) = sum/30;
    end
end

average_nov = mean(nov_load,2);
max_nov = max(nov_load, [], 2);
for i = 1:789
load_factor_nov(i) = average_nov(i)/max_nov(i);
end

for i = 1:789 
    for j = 1:48
        sum = 0;
        for k = 1:31
            sum = sum + Data12(j+(k-1)*48,i);
        end
        dec_load(i,j) = sum/31;
    end
end

average_dec = mean(dec_load,2);
max_dec = max(dec_load, [], 2);
for i = 1:789
load_factor_dec(i) = average_dec(i)/max_dec(i);
end

average_monthly = [average_jan average_feb average_mar average_apr average_may average_jun average_jul average_aug average_sep average_oct average_nov average_dec]
max_monthly = [max_jan max_feb max_mar max_apr max_may max_jun max_jul max_aug max_sep max_oct max_nov max_dec]
monthly_load_factor = [load_factor_jan' load_factor_feb' load_factor_mar' load_factor_apr' load_factor_may' load_factor_jun' load_factor_jul' load_factor_aug' load_factor_sep' load_factor_oct' load_factor_nov' load_factor_dec']

% Yearly load curve

for i = 1:789 
    for j = 1:48
        year_load(i,j) = (jan_load(i,j)+feb_load(i,j)+mar_load(i,j)+apr_load(i,j)+may_load(i,j)+jun_load(i,j)+jul_load(i,j)+aug_load(i,j)+sep_load(i,j)+oct_load(i,j)+nov_load(i,j)+dec_load(i,j))/12;
    end
end

%filename = 'annual_load.xlsx';
%xlswrite(filename,year_load);
%status = xlswrite(filename,year_load)

average_year = mean(year_load,2)
max_year = max(year_load, [], 2)
for i = 1:789
load_factor_year(i) = average_year(i)/max_year(i);
end
annual_load_factor = load_factor_year'

x_axis1=[1:48];
figure(1)
set(gcf,'Name','Monthly and Annual demands','Color','w')
plot(x_axis1,jan_load(1,:),'r','LineWidth',2)
hold on;
plot(x_axis1,apr_load(1,:),'b','LineWidth',2)
hold on;
plot(x_axis1,jun_load(1,:),'g','LineWidth',2)
hold on;
plot(x_axis1,aug_load(1,:),'m','LineWidth',2)
hold on;
plot(x_axis1,oct_load(1,:),'y','LineWidth',2)
hold on;
plot(x_axis1,dec_load(1,:),'c','LineWidth',2)
hold on;
plot(x_axis1,year_load(1,:),'k','LineWidth',3)
hold on;
title('Monthly and Annual demands of Customer1');
hold on;
xlabel('Half hourly time')
ylabel('Demand')
grid on
legend('January','April','June','August','October','December','Annual')

figure(2)
set(gcf,'Name','Daily and Monthly demands','Color','w')
plot(x_axis1,Data1(1:48,1),'r','LineWidth',2)
hold on;
plot(x_axis1,Data1(145:192,1),'b','LineWidth',2)
hold on;
plot(x_axis1,Data1(193:240,1),'g','LineWidth',2)
hold on;
plot(x_axis1,Data1(529:576,1),'m','LineWidth',2)
hold on;
plot(x_axis1,Data1(865:912,1),'y','LineWidth',2)
hold on;
plot(x_axis1,Data1(1441:1488,1),'c','LineWidth',2)
hold on;
plot(x_axis1,jan_load(1,:),'k','LineWidth',3)
hold on;
title('Daily and Monthly demands of Customer1');
hold on;
xlabel('Half hourly time')
ylabel('Demand')
grid on
legend('Day1','Day4','Day5','Day12','Day19','Day31','Month of Jan')

