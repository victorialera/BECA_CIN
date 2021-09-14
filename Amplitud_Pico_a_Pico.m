function [pico_a_pico]=Amplitud_Pico_a_Pico(vector_ondas_M_promediadas,eje_temporal_ventanas_promediadas)

% PTP, amplitud pico a pico
pico_a_pico=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
pico_a_pico(end+1)=max(vector_ondas_M_promediadas(i,:))-min(vector_ondas_M_promediadas(i,:));
end
figure
plot(eje_temporal_ventanas_promediadas,pico_a_pico)
title('PTP')
xlabel('Tiempo [s]')