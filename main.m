clc;
clear;

% 初始化参数
%% **********平面波**************************************
speaker_array_azimuth=[320,90,95,120]; % 车内音响按四个扬声器试验
speaker_array_elevation=[0,0,0,0];
distance=1; %计算-distance至distance之间的声场。
F=1000;%计算声压时信号频率
dB=0;%dB=1，画声压级，dB=0，画声压

% 计算声压

for w1=0:0.1:1
    for w2=0:0.1:1
        for w3=0:0.1:1
            for w4=0:0.1:1
                w=[w1,w2,w3,w4];
                if length(speaker_array_azimuth) ~= length(w) % 权重数量与扬声器数量不一致
                    display('Dimension error. Please check the dimension of w.');
                    break;break;break;break;
                else
                    p=pressure_2D(speaker_array_azimuth,speaker_array_elevation,w,distance,F,dB);
                    
                end
            end
        end
    end
end
