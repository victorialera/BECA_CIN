function [senial_sin_estimulacion]= Elimina_Artefacto_Estimulacion(tiempo_post_estimulacion,senial,artefacto_estimulacion,fs)

%Blanking hasta cruce de la señal por cero luego de la estimulacion
 
puntos2=[];%posicion de cruce por cero luego de la estimulacion. Si hay un cruce dentro de un tiempo post estimulacion no se le considera
for n=1:length(artefacto_estimulacion)-1
    v=(senial(artefacto_estimulacion(n):artefacto_estimulacion(n+1)));
    a=find(v(1:end-1) <= 0 & v(2:end) > 0);
    a=a(a>tiempo_post_estimulacion*fs);
    puntos2(end+1)=a(1)+artefacto_estimulacion(n);
end

v=(senial(artefacto_estimulacion(end):length(senial)));
a=find(v(1:end-1) <= 0 & v(2:end) > 0);
if ~isempty(a)
puntos2(end+1)=a(1)+artefacto_estimulacion(end);
else
    artefacto_estimulacion(end)=[];
end 
    
senial_sin_estimulacion=senial;
for i=1:length(puntos2)
    senial_sin_estimulacion(artefacto_estimulacion(i)-3:puntos2(i))=0;
end


