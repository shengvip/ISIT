function P=pressure_2D(speaker_azimuth,speaker_elevation,funky,distance,F,dB) 
  %来自：draw_wavfield_pw_2D
  % 参数中删去了：distance_view,gray
 distance=1; %计算-distance至distance之间的声场。
 xref=0;
 yref=0;
 x=linspace(0,distance,1); %计算-distance至distance之间的声场。
 y=linspace(0,distance,1);
 z=0;
 [xx,yy]=meshgrid(x,y);
 [i,j]=size(xx);  % 对每一个点求声压，改动此处，求给定一个点的声压
 for I=1:i
     for J=1:j
         %pressure_one= pressure_WAVori_in_frequency_XYZ(speaker_azimuth,speaker_elevation,funky,xx(I,J),yy(I,J),z,F);
         pressure_one=pressure_in_frequency_XYZ(speaker_azimuth,speaker_elevation,funky,xx(I,J),yy(I,J),z,F);
         pressure(I,J)=pressure_one(1,4);
     end
 end
 P=wav_field_norm_pressure(pressure,x,y,xref,yref);%参考点为（0,0,0）
 %% ===== Calculation =====================================================
% Check the size of x,y and P
if size(P,1)~=length(y) || size(P,2)~=length(x)
    error('%s: the size of P has to be y x x.',upper(mfilename));
end
if dB==1
    % Check if we have any activity in the wave field
    if max(abs(P(:)))~=0
        % For the dB case scale the signal maximum to 0 dB
        %P = P./max(abs(P(:)));
    else
        % If we have only zeros in the wave field set the field to eps to avoid
        % problems with log(0).
        P(:) = eps;
    end
end
 %% ===== Plotting ========================================================
     if dB==1
        % Plot the amplitude of the wave field in dB
        P=20*log10(abs(P));
    else
        % Plot the wave field
        P=real(P);
     end
end