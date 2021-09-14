function [umbral]= Umbral(vector_ondas_M_promediadas,eje_temporal_ventanas_promediadas)

umbral=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
    a=vector_ondas_M_promediadas(i,:)-mean(vector_ondas_M_promediadas(i,:));
    umbral(end+1)=3*sqrt(sum(a.^2))/(length(vector_ondas_M_promediadas(i,:))-1);
    clear a
end
figure
plot(eje_temporal_ventanas_promediadas,umbral)
title('Umbral')
xlabel('Tiempo [s]')