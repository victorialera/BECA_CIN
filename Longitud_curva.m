function [longitud_curva]=Longitud_curva(vector_ondas_M_promediadas,eje_temporal_ventanas_promediadas)
longitud_curva=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
    a=abs(circshift(vector_ondas_M_promediadas(i,:),-1)-(vector_ondas_M_promediadas(i,:)));
    longitud_curva(end+1)=sum(a(1:end-1));
    clear  a
end
figure
plot(eje_temporal_ventanas_promediadas,longitud_curva)
title('Longitud de Curva')
xlabel('Tiempo [s]')
