% Written by Hesham Sharkas, on 22 October, 2024
% This code implements Theorem 2.5, introduced in the open access article
% DOI: http://dx.doi.org/10.47000/tjmcs.1424850

clc;
clear;

N = 512;
u = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;
v = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;

u_hat = DFT(u)./sqrt(N);
v_hat = DFT(v)./sqrt(N);

LHS = sum(u_hat.*v_hat.*conj(u_hat.*v_hat));
RHS = L2_fg(u,v)./N;

fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);

% Use higher sampling-rate to improve the accuracy of the Fourier transform
x = 10;
sampling_rate = x*N;
u_hat = fft(u,sampling_rate)./sqrt(sampling_rate);
v_hat = fft(v,sampling_rate)./sqrt(sampling_rate);

LHS = sum(u_hat.*v_hat.*conj(u_hat.*v_hat)).*sampling_rate./N;

fprintf('\nIncreased sampling-rate for ifft by %d\n',x);
fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);