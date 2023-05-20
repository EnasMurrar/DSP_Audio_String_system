in = input('enter string : ','s') %enter string from the user
%letter=blanks(3); % returns a 1-by-n array of space characters.
%count=1;

file=fopen('data.txt','r');  %read data file which  Contains Alphabet characters with frequencies for each English character
format='%c %d %d %d %d'; %format of characters with frequencies in the file
for j=1:52 %for loop to read line by line in the file
a=fscanf (file,format);   
for k=1:5 %for loop read each line in  the file
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

arr %print array

for i = 1:length(in) % for loop to read entery string character letter with spaces
r(i) = in(i) ; 
end
double(in) % get ascii code for each character 

fs = 8000; %fs = 8000 sampels in the second
n = 1:320; %Each character has 320 samples
S=0;
t=[];
for r=1:length(in)
    
for p=1:53
%     t=[t S];
    if in(r)==arr(p)
        %pring the 4 Frequencies from arr wich is in position 2,3,4 and 5 
        fc1=arr(p,2);  
        fc2=arr(p,3);
        fc3=arr(p,4);
        fc4=arr(p,5);
    %  add the frequency of the letter to the wave by this expresion
    S= cos(2*pi*fc1*n/fs) + cos(2*pi*fc2*n/fs) + cos(2*pi*fc3*n/fs) + cos(2*pi*fc4*n/fs);
    t=[t S];  % fill s results in the array

end
end
end

 t                                    
audiowrite('output.wav',t,fs); % write in the audio file (.wav file)
info = audioinfo('output.wav') % get information about audio file

%b =  length(t)/fs 

figure(1)
 plot(t) 
 xlabel('Time')
ylabel('Audio Signal')

[y,fs] = audioread('output.wav'); %  read the audio file (.wav file)
sound(y,fs); % Hear the contents of the file directly
%-------------------------------------------------------------