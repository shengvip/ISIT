function pressure= pressure_in_frequency_XYZ(speaker_array_azimuth,speaker_array_elevation,funky,x,y,z,F)
for I=1:1:length(speaker_array_azimuth)   
    %for J = 1:100
    %    s1(J) = funky(J,I);
    %end
   s=funky(I);
   S=fft(s);
   %s2(:,I) = fft(s1);%傅里叶变换    
   % S(1,I)=s2(1,I);
% G 和 k ,k为波数 k=2*pi*f/c , c=340m/s
%G =1.0;
c = 340;
k = 2*pi*F/c;
     
    a = 2*cos((pi/180)*speaker_array_azimuth(I))*cos((pi/180)*(speaker_array_elevation(I)));%球半径为2m    
    b = 2*sin((pi/180)*speaker_array_azimuth(I))*cos((pi/180)*(speaker_array_elevation(I)));
    c = 2*sin((pi/180)*speaker_array_elevation(I));
    d=sqrt((a-x)^2+(b-y)^2+(c-z)^2);
   % pressure_one(1,I) = Q*S(1,I);
      Q= 1/(4*pi) * exp(-1i*k.* d)/d;
      pressure_one(1,I)=Q*S;
end
    pressure(1,4)=sum(pressure_one,2);
    pressure(1,1)=x;
    pressure(1,2)=y;
    pressure(1,3)=z;
end