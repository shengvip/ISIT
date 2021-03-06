slCharacterEncoding('UTF-8')
clc;
clear;
% 初始化参�?
%%**********平面�?*************************************
speaker_array_azimuth=[320,90,95,120]; % 车内四个扬声�?
speaker_array_elevation=[0,0,0,0];
distance=1; % 
F=1000;% 频率1000Hz
dB=0;%dB=1�?，dB=1，画声压级，dB=0，画声压
wp=zeros(10^4,5);
i=1;
% 计算声压
% w1=linspace(0,1,10)
for i1=1:10
    w1=rand();
    for i2=1:10 
        w2=rand();
        for i3=1:10 
            w3=rand();
            for i4=1:10 
                w4=rand();
                w=[w1,w2,w3,w4];
                if length(speaker_array_azimuth) ~= length(w) % 閺夊啴鍣搁弫浼村櫤娑撳孩澹冩竟鏉挎珤閺佷即鍣烘稉宥勭閼?
                    display('Dimension error. Please check the dimension of w.');
                    break;break;break;break;
                else
                    p=pressure_2D(speaker_array_azimuth,speaker_array_elevation,w,distance,F,dB);
                    wp(i,:)=[w p];
                    i=i+1;
                end
            end
        end
    end
end
% 保存权重和声压，在\t为分隔符，精度为6位，每一行后换行
plot(wp(:,5));
dlmwrite('presure.txt', wp, 'delimiter', '\t','precision', 6,'newline', 'pc');