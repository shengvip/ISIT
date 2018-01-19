function [w,p]=sound_signal_generation(speaker_azimuth,speaker_elevation,distance,F,dB)
%myFun - Description
% 输出speaker_azimuth,speaker_elevation处的扬声器（组）的声压
% Syntax:  myFun(input)
%
% Long description

%% **********平面波**************************************
% 重建声场的波场，本文的扬声器位置及权值,车内音响按四个扬声器试验
length(speaker_azimuth) 
