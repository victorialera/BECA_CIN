function [senial_sin_estimulacion]= Elimina_fase_precedente(senial,senial_sin_estimulacion,artefacto_estimulacion,altura_pico,separacion_pico)
    
%% Borrado de pico negativo anterior al pico de la  onda M porque trae problemas al calcular la amplitud pico a pico posteriormente
% El problema se presenta principalmente en el sujeto 1. 
% En los demas sujetos puede aplicarse aunque no presenta muchos cambios
% La minima altura de pico,para detectar los picos negativos, se obtiene observando la señal
periodo_estimulacion=artefacto_estimulacion(2)-artefacto_estimulacion(1);
[pks,parche]=findpeaks(-senial_sin_estimulacion,'MinPeakHeight',altura_pico,'MinPeakDistance',separacion_pico); 
puntos3=[];%posicion de cruce por cero luego de la estimulacion. 
for n=1:length(parche)
    v=(senial(parche(n):parche(n)+round(periodo_estimulacion*0.85)));    
    a=find(v(1:end-1) <= 0 & v(2:end) > 0);
    puntos3(end+1)=a(1)+parche(n);
end 
for i=1:length(parche)
    senial_sin_estimulacion(parche(i)-round(0.028*periodo_estimulacion):puntos3(i))=0;
end
