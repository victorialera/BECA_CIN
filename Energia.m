function[energia]=Energia(vector_ondas_M_promediadas,eje_temporal_ventanas_promediadas)

energia=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
energia(end+1)=(sum(abs(vector_ondas_M_promediadas(i,:)).^2));
end
figure
plot(eje_temporal_ventanas_promediadas,energia)
title('Energia')
xlabel('Tiempo [s]')
