function fe=fre_energy(wavfile)
[x,fs,bits]=wavread(wavfile); %�����źţ������ʺͲ���λ��
x=x(:,1);%������������������˫��������ֻȡ����������������������������һ����������ĳ�y=y(:,2)

% Ԥ�����˲���
xx=double(x);
xx=filter([1 -0.9375],1,xx);

% �����źŷ�֡(30msΪһ֡)
win=floor(fs*30/1000);
inc=floor(win/2);
xx=enframe(xx,win,inc);

% ����ÿ֡��Ƶ������
for i=1:size(xx,1)
  y = xx(i,:);
  s = y' .* hamming(win);   %hamming ��
  t=fft(s,fs); %����Ҷ�任
  t = abs(t).^2;%t = t.* conj(t); ����Ч��һ��
  fftLength=length(t);
  w=floor(fftLength/2);
  t=t(1:w);
  fe(i)=sum(t)/fftLength;
end