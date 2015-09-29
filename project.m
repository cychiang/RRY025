%% Read image src
mat=load('forest.mat');
src=mat.forestgray;
dist=src;
figure, imshow(src)
%% Global mean M and variance V=D^2
[rows, cols]=size(src);
M=sum(src(:))./(rows*cols); % global mean m = sum[f(x,y)]/MN, x=0~M-1, y=0~N-1
D=sqrt(sum((src(:)-M).^2)/(rows*cols)); % D=sqrt(V), global variance V = sum[[f(x,y)-m]^2]/MN, x=0~M-1, y=0~N-1 
%% Local mean Ms and Variance Ds
E=4;
k0=0.4; k1=0.02; k2=0.4;
img=padarray(src,[1,1], 'both');   % zero padding
for x=2:rows+1
   for y=2:cols+1
       s=img(x-1:x+1,y-1:y+1); % s=subimage, region=3x3
       Ms=sum(s(:))./numel(s);  % local mean Ms= sum[f(x,y)]/M2N2, x=0~M2-1, y=0~N2-1
       r=unique(s); % different elements in s
       %以下註解: 不考慮0的時候
       %if r(1)==0
       %    temp=histcounts(s, numel(r));
       %    p=temp(2:end)./(numel(s)-numel(s(s==0)));
       %    Ds=sqrt(sum((r(2:end)'-Ms).^2.*p)); % local variance
       %else
           p=histcounts(s, numel(r))./(numel(s)); % probability of different elements in s
           Ds=sqrt(sum((r'-Ms).^2.*p)); % Ds=sqrt(Vs), local variance Vs = sum[(r(i)-Ms)^2*p(r(i))], i=0~L-1
       %end
       if Ms<=k0*M && Ds>=k1*D && Ds<=k2*D
           dist(x-1,y-1)=E*img(x,y);    % update
       end
   end
end
figure, imshow(dist)