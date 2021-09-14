function [senial_normalizada]=Normaliza_amplitud_PaP(senial_sin_estimulacion,artefacto_estimulacion)

ptps=[];% amplitud pico a pico de cada onda m
for i=1:length(artefacto_estimulacion)-1
    ptps(end+1)=max(senial_sin_estimulacion(artefacto_estimulacion(i):artefacto_estimulacion(i+1)))-min(senial_sin_estimulacion(artefacto_estimulacion(i):artefacto_estimulacion(i+1)));
end
ptp=max(ptps); %maxima de las amplitudes pico a pico
senial_normalizada=senial_sin_estimulacion/ptp;
