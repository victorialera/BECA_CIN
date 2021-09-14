function [MDF,MDF_norm,MDF_padding]= MDF(vector_ondas_M_promediadas,fs,eje_temporal_ventanas_promediadas)

%se calcula para cada onda M y para cada ondaM + zero padding hasta
%1segundo

% zero padding hasta 1 seg
vector_ondas_M_promediadas_padding=vector_ondas_M_promediadas;
% muestras 1 seg
N=round(fs*1);
for i=1:length(vector_ondas_M_promediadas(:,1))
vector_ondas_M_promediadas_padding(i,length(vector_ondas_M_promediadas_padding):N)=0;% contiene ondas M+ zero padding
end


MDF=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
MDF(end+1)=medfreq(vector_ondas_M_promediadas(i,:),fs);
end
MDF_norm=MDF/MDF(1); %normalizacion respecto al valor inicial
MDF_padding=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
MDF_padding(end+1)=medfreq(vector_ondas_M_promediadas_padding(i,:),fs);
end
figure
plot(eje_temporal_ventanas_promediadas,MDF)
legend('MDF')
hold on
plot(eje_temporal_ventanas_promediadas,MDF_padding,'DisplayName','MDF_padding')
title('MDF')
xlabel('Tiempo [s]')