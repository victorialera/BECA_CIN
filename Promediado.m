function [vector_ondas_M]= Promediado(long_ventana_seg,senial_sin_estimulacion,artefacto_estimulacion,fs)
t_estimulacion=artefacto_estimulacion(2)-artefacto_estimulacion(1);
num_ondas=round(long_ventana_seg*fs/t_estimulacion);%numero de onda m por ventana

vector_ondas_M=[];% ondas m promediadas
for j=1:round(length(artefacto_estimulacion)/num_ondas)-1
for i=1:num_ondas
    e(:,i)=senial_sin_estimulacion(artefacto_estimulacion(i+((j-1)*num_ondas)):artefacto_estimulacion(i+((j-1)*num_ondas))+t_estimulacion);
end
vector_ondas_M(j,:)=mean(e,2);
end

