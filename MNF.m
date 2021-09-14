function [MNF,MNF_norm,MNF_padding]= MNF(vector_ondas_M_promediadas,fs,eje_temporal_ventanas_promediadas)

%se calcula para cada onda M y para cada ondaM + zero padding hasta
%1segundo

% zero padding hasta 1 seg
vector_ondas_M_promediadas_padding=vector_ondas_M_promediadas;
% muestras 1 seg
N=round(fs*1);
for i=1:length(vector_ondas_M_promediadas(:,1))
vector_ondas_M_promediadas_padding(i,length(vector_ondas_M_promediadas_padding):N)=0;% contiene ondas M+ zero padding
end


MNF=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
MNF(end+1)=meanfreq(vector_ondas_M_promediadas(i,:),fs);
end
MNF_norm=MNF/MNF(1); %normalizacion respecto al valor inicial
MNF_padding=[];
for i=1:length(vector_ondas_M_promediadas(:,1))
MNF_padding(end+1)=meanfreq(vector_ondas_M_promediadas_padding(i,:),fs);
end
figure
plot(eje_temporal_ventanas_promediadas,MNF)
legend('MNF')
hold on
plot(eje_temporal_ventanas_promediadas,MNF_padding,'DisplayName','MNF_padding')
title('MNF')
xlabel('Tiempo [s]')