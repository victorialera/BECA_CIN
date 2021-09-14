function [Eje_temporal, Eje_muestras]= Ejes(senial,fs)

n_samples=length(senial);
tiempo_total=n_samples/fs;
Eje_muestras=1:1:n_samples;
Eje_temporal=0:1/fs:(tiempo_total-1/fs);