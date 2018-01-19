import math
import math.pi as pi
def pressure_in_frequency_XYZ(speaker_array_azimuth,speaker_array_elevation,funky,x,y,z,F):
    
    S=fft(funky)
    for I=1:1:length(speaker_array_azimuth)   
        #s2(:,I) = fft(s1)#傅里叶变换    
        # S(1,I)=s2(1,I)
        # G 和 k ,k为波数 k=2*pi*f/c , c=340m/s
        #G =1.0
        c = 340
        k = 2*pi*F/c
     
        a = 2*math.cos((pi/180)*speaker_array_azimuth(I))*math.cos((pi/180)*(speaker_array_elevation(I)))#球半径为2m    
        b = 2*math.sin((pi/180)*speaker_array_azimuth(I))*math.cos((pi/180)*(speaker_array_elevation(I)))
        c = 2*math.sin((pi/180)*speaker_array_elevation(I))
        d=math.sqrt((a-x)^2+(b-y)^2+(c-z)^2)
        # pressure_one(1,I) = Q*S(1,I)
        #Q= 1/(4*pi) * exp(-i*k.* d)/d
        Q=float(1)/(4*math.pi)*pow(math.e,-k*d*j)/d
        pressure_one(1,I)=Q*S

    pressure(1,4)=sum(pressure_one,2)
    pressure(1,1)=x
    pressure(1,2)=y
    pressure(1,3)=z
    return pressure