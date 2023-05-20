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
arr(53,1)=32;
arr(53,2)=100;
arr(53,3)=1000;
arr(53,4)=2000;
arr(53,5)=4000;

arr
%--------------------------------------------------------------------------- ctrl +t

in = input('enter .wav file : ','s')
%read the  signal and the sampling frequency of it 
[y,fs] = audioread(in);
t=[];
num = size(y,1)/320
for i=1:num
    start =((i.*320)-319);
    e = i.*320;
    y_sample = y(start:e);
       
%plot(y);
%to take the magnitude of the audio after transform it to frequency domaun
f1 = fft(y_sample);
f = abs((f1));
f2=f(1:160);

[pks,locs] = findpeaks(f2,'SortStr','descend');

high = (locs(1).*25)-25;
med = (locs(2).*25)-25;
low = (locs(3).*25)-25;
ca = (locs(4).*25)-25;


A = [high med low ca]
B= sort(A)

if B(4) >2000 && B(4) ~= 2400
    B(4)=4000;
elseif B(4) == 2000 && B(3) == 1400
    B(4) =4000;
    B(3) = 2000;
end
B
    

r=[];

    for p=1:53
        if B(4) == arr(p,5) && B(3) == arr(p,4) && B(2) == arr(p,3) && B(1) == arr(p,2) 
            r = arr(p,1);
            t =[t arr(p,1)];

end
    end
r
t
%----------------------------------------------------------------------------------


end

res = char(t)