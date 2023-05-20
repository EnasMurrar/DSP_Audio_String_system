clc;clear;
%convert the audio in freq. domain
%---------------------------------------------------------------------------
%read letters
file=fopen('data.txt','r');
format='%c %d %d %d %d';
for j=1:52
a=fscanf (file,format);   
for k=1:5
i=1;
arr(j,k) = a(k);

end
end
%add space with its frequencies to the array
arr(53,1)=32; %32 is the ascii code for space
arr(53,2)=100;
arr(53,3)=1000;
arr(53,4)=2000;
arr(53,5)=4000;

arr;
%--------------------------------------------------------------------------- ctrl +t

in = input('enter .wav file : ','s')
%read the  signal and the sampling frequency of it 
[y,fs] = audioread(in);
t=[];
%read the signal and sampling frequency of it 
num = floor(length(y)/320)
for i=1:num
    freq =[];
    start =((i.*320)-319);
    endd = i.*320;
    y_sample = y(start:endd);
    

    % returns the transfer function coefficients of an 4th-order bandpass
    [b,a] = butter(4,[75 125]/4000,'bandpass') ;
    %using filters the input data y_sample using a rational transfer function defined by the numerator and denominator coefficients b and a.
    f=filter(b,a,y_sample);
    % find the power
    prms = rms(f)^2;
    % calculate the power to check if the frequency exist or not  
    if (prms >= 0.01)
          freq=[freq 100];
        
    end
    % if the frequency between 175 - 225, and the pRMS greater than or equal 0.01, the frequency equal 200
     [b,a] = butter(4,[175 225]/4000,'bandpass');
     f=filter(b,a,y_sample);
     prms = rms(f)^2;
    if (prms >= 0.01)
         freq=[freq 200];
    end
    % if the frequency between 375 - 425, and the pRMS greater than or equal 0.01, the frequency equal 400
    [b,a] = butter(4,[375 425]/4000,'bandpass');
    f=filter(b,a,y_sample);
    prms = rms(f)^2;
    if (prms >= 0.01)
         freq=[freq 400];
    end
    % if the frequency between 575 - 625, and the pRMS greater than or equal 0.01, the frequency equal 600
    [b,a] = butter(4,[575 625]/4000,'bandpass');
      f=filter(b,a,y_sample);
    prms = rms(f)^2;
    if (prms >= 0.01)%''''''''''''''''
         freq=[freq 600];
    end
    % if the frequency between 775 - 825, and the pRMS greater than or equal 0.01, the frequency equal 800
    [b,a] = butter(4,[775 825]/4000,'bandpass');
      f=filter(b,a,y_sample);
    prms = rms(f)^2;
    if (prms >= 0.01)
         freq=[freq 800];
    end
    % if the frequency between 975 - 1025, and the pRMS greater than or equal 0.01, the frequency equal 1000
    [b,a] = butter(4,[975 1025]/4000,'bandpass');
      f=filter(b,a,y_sample);
    prms = rms(f)^2;
    if (prms >= 0.01)%''''''''''''''''''''
         freq=[freq 1000];
    end
    % if the frequency between 1175 - 1225, and the pRMS greater than or equal 0.03, the frequency equal 1200
    [b,a] = butter(4,[1175 1225]/4000,'bandpass');
      f=filter(b,a,y_sample);
    prms = rms(f)^2;
    if (prms >= 0.03)
         freq=[freq 1200];
    end
    % if the frequency between 1575 - 1625, and the pRMS greater than or equal 0.01, the frequency equal 1600
    [b,a] = butter(4,[1575 1625]/4000,'bandpass');
      f=filter(b,a,y_sample);
    prms = rms(f)^2;
    if (prms >= 0.01)
         freq=[freq 1600];
    end
    % if the frequency between 1975 - 2025, and the pRMS greater than or equal 0.01, the frequency equal 2000
    [b,a] = butter(4,[1975 2025]/4000,'bandpass');
      f=filter(b,a,y_sample);
    prms = rms(f)^2;
    if (prms >= 0.01)
         freq=[freq 2000];
    end
    % if the frequency between 2350 - 2450, and the pRMS greater than or equal 0.01, the frequency equal 2400
    [b,a] = butter(4,[2350 2450]/4000,'bandpass');
      f=filter(b,a,y_sample);
    prms = rms(f)^2;
    if (prms >= 0.01)
         freq=[freq 2400];
    end
    % if the frequency between 3950 - 3990, and the pRMS greater than or equal 0.01, the frequency equal 4000 
    [b,a] = butter(4,[3950 3990]/4000,'bandpass');
      f=filter(b,a,y_sample);
    prms = rms(f)^2;
    if (prms >= 0.01)
         freq=[freq 4000];
    end
[r,c]=size(freq);
c;
 % the code bellow for the noice frequencies//////////// 

if (c == 5)    
    if freq ==[200 400 800 1000 1600] %A
        freq = [200 400 800 1600];  
    elseif freq==[200 400 800 1200 1600] %D
        freq = [200 400 1200 1600];
    elseif freq==[200 400 1000 1200 2400] %E
        freq = [200 400 1200 2400]; 
    elseif freq==[200 600 800 1000 2400] %K
        freq = [200 600 800 2400]; 
    elseif freq==[200 600 1600 2000 2400] %P
        freq = [200 600 1600 2000];
    elseif freq==[200 400 1200 2400 4000] %F
        freq = [200 400 1200 4000];
    elseif freq==[200 400 2000 2400 4000] %I
        freq = [200 400 2000 4000];
    elseif freq==[200 600 1000 2000 2400] %Z
        freq = [200 1000 2000 2400];
    
    
    else
        disp('askdjlask');
    end
        
elseif(c ==6)
    if freq==[200 600 1200 1600 2000 2400] %N
       freq = [200 600 1200 2400]; 
    elseif freq==[200 800 1000 1200 1600 2400] %
       freq = [200 1000 1200 1600];
    elseif freq==[ 200 600 800 1200 1600 2000] %M
       freq = [200 600 1200 1600];
   elseif freq==[ 200 600 1000 1600 2000 2400] %Y
       freq = [200 1000 1600 2000];
   
    end

    

end

freq;


r=[];
%code checks the frequencies for each character in  
%array B which is sorted  in ascending order with the frequencies stored in arr

    for p=1:53
        if freq(4) == arr(p,5) && freq(3) == arr(p,4) && freq(2) == arr(p,3) && freq(1) == arr(p,2) 
           % char(arr(p,1))
            r = arr(p,1);
            t =[t arr(p,1)];

end
    end
r;
t;
%----------------------------------------------------------------------------------
end
% print the string
res = char(t)