function [RMS]=RMS(vector_ondas_M_promediadas,eje_temporal_ventanas_promediadas)

RMS=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
RMS(end+1)=sqrt((sum(vector_ondas_M_promediadas(i,:).^2))/length(vector_ondas_M_promediadas(i,:)));
end
figure
plot(eje_temporal_ventanas_promediadas,RMS)
title('RMS')
xlabel('Tiempo [s]')