function te=time_energy(wavfile)
[x,fs,bits]=wavread(wavfile); %�����źţ������ʺͲ���λ��
x=x(:,1);%������������������˫��������ֻȡ����������������������������һ����������ĳ�y=y(:,2)

% Ԥ�����˲���
xx=double(x);
xx=filter([1 -0.9375],1,xx);

% �����źŷ�֡
win=fs*30/1000;
inc=win/2;
xx=enframe(xx,win,inc);

% ����ÿ֡��ʱ������
for i=1:size(xx,1)
  y = xx(i,:);
  s = y' .* hamming(win);   %hamming ��
  te(i)=sum(s.^2);
end