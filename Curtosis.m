function[curtosis]=Curtosis(vector_ondas_M_promediadas,eje_temporal_ventanas_promediadas)

curtosis=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
curtosis(end+1)=kurtosis(vector_ondas_M_promediadas(i,:));
end
figure
plot(eje_temporal_ventanas_promediadas,curtosis)
title('Curtosis')
xlabel('Tiempo [s]')