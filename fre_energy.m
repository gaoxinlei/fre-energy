function fe=fre_energy(wavfile)
[x,fs,bits]=wavread(wavfile); %读出信号，采样率和采样位数
x=x(:,1);%我这里假设你的声音是双声道，我只取单声道作分析，如果你想分析另外一个声道，请改成y=y(:,2)

% 预加重滤波器
xx=double(x);
xx=filter([1 -0.9375],1,xx);

% 语音信号分帧(30ms为一帧)
win=floor(fs*30/1000);
inc=floor(win/2);
xx=enframe(xx,win,inc);

% 计算每帧的频域能量
for i=1:size(xx,1)
  y = xx(i,:);
  s = y' .* hamming(win);   %hamming 窗
  t=fft(s,fs); %傅立叶变换
  t = abs(t).^2;%t = t.* conj(t); 与其效果一样
  fftLength=length(t);
  w=floor(fftLength/2);
  t=t(1:w);
  fe(i)=sum(t)/fftLength;
end