slCharacterEncoding('UTF-8')
clc;
clear;
% ��ʼ������
%%**********ƽ�沨**************************************
speaker_array_azimuth=[320,90,95,120]; % �����ĸ�������
speaker_array_elevation=[0,0,0,0];
distance=1; % 
F=1000;% Ƶ��1000Hz
dB=0;%dB=1��0��dB=1������ѹ����dB=0������ѹ
wp=zeros(10^4,5);
i=1;
% ������ѹ

for w1=linspace(0,1,10)
    for w2=linspace(0,1,10)
        for w3=linspace(0,1,10)
            for w4=linspace(0,1,10)
                w=[w1,w2,w3,w4];
                if length(speaker_array_azimuth) ~= length(w) % 鏉冮噸鏁伴噺涓庢壃澹板櫒鏁伴噺涓嶄竴�?
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
