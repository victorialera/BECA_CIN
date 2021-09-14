function [iEMG]=IEMG(vector_ondas_M_promediadas,eje_temporal_ventanas_promediadas)

iEMG=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
    iEMG(end+1)=sum(abs(vector_ondas_M_promediadas(i,:)));
end
figure
plot(eje_temporal_ventanas_promediadas,iEMG)
title('IEMG')
xlabel('Tiempo [s]')
