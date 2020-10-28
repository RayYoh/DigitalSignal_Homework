function [ S , W , T ] = mf_spectrogram...
    ( signal , nsc , nov , fs )
%MF_SPECTROGRAM Short-time Fourier transform realization
% Input        
%       signal      - Signal vector
%       nsc         - Abb. of Number SeCtion
%       nov         - Abb. of Number OverLap
%       fs          - Abb. of Frequency of Sample
% Output
%       S           - A matrix that each colum is a FFT for time of nsc
%       W           - A vector labeling frequency
%       T           - A vector labeling time
 
  % Signal Preprocessing
    h = hamming(nsc, 'periodic');   % Hamming weight function
    L = length(signal);             % Length of Signal
    nst = nsc-nov;                  % Number of STep per colum
    ncl = fix( (L-nsc)/nst ) + 1;   % Number of CoLum
    nff = 2^nextpow2(nsc);          % Number of Fast Fourier Transformation
    Ps = zeros(nsc,ncl);
    for n = 1:ncl                   % Ps means Processed Signal
        Ps(:,n) = signal( (n-1)*nst+1 : (n-1)*nst+nsc ).*h';
    end                             % Ps is a matrix
 
  % Short-time Fourier transform
    STFT0 = fft(Ps,nff);
 
  % Turn into DFT in dB
    STFT1 = abs(STFT0/nff);
    STFT2 = STFT1(1:nff/2+1,:);             % Symmetric results of FFT
    STFT2(2:end-1,:) = 2*STFT2(2:end-1,:);  % Add the value of the other half
    STFT3 = 20*log10(STFT2);                % Turn sound pressure into dB level
 
  % Axis Generating
    fax = fs*(0:(nff/2))/nff;                           % Frequency axis setting
    tax = ( .5*nsc : nst : nst*(ncl-1)+.5*nsc ) / fs;   % Time axis generating
    [ffax,ttax] = meshgrid(tax,fax);                    % Generating grid of figure
     
  % Output
    W = ffax;
    T = ttax;
    S = STFT3;
end