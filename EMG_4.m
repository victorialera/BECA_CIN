%% 
clear all
close all
%% Si leen los datos de un archivo .daq
[Archivo,ubc]=uigetfile()

cd(ubc)
 
[data,time]=daqread(Archivo);
info =daqread(Archivo,'info');
fs=info.ObjInfo.SampleRate;
senial=data(:,3);
estimulacion=data(:,2);

%% Si leen de un archivo .mat 

load('...');
% Es necesario obtener del archivo señal de sEMG cruda, la señal de estimulacion y
% la frecuencia de muestreo al menos
%Ejemplo 
load('suj1.mat')
senial=Sujeto1.senial;
estimulacion=Sujeto1.estimulacion;
fs=Sujeto1.sample_frequency;

%%

[eje_temporal, eje_muestras]=Ejes(senial,fs);

artefacto_estimulacion= Artefacto_Estimulacion(estimulacion,2);

figure
plot(eje_temporal,senial);
hold on
plot(eje_temporal(artefacto_estimulacion(:)),senial(artefacto_estimulacion(:)),'.')

%% Eliminacion artefacto de estimulacion 
TIEMPO_POST_ESTIMULACION= 0.005;
senial_sin_estimulacion=Elimina_Artefacto_Estimulacion(TIEMPO_POST_ESTIMULACION,senial,artefacto_estimulacion,fs);

% Graficacion de la señal sin estimulacion
figure
plot(eje_temporal,senial_sin_estimulacion)
%% Eliminacion de fase precedente de la onda M
ALTURA_PICO=0.12;
SEPARACION_PICO=200;
senial_sin_estimulacion=Elimina_fase_precedente(senial,senial_sin_estimulacion,artefacto_estimulacion,ALTURA_PICO,SEPARACION_PICO);

% Graficacion de la señal con la fase precedente eliminada
figure
plot(eje_temporal,senial_sin_estimulacion)
%% Normalizacion de acuerdo a la maxima amplitud pico a pico del registro 

senial_normalizada=Normaliza_amplitud_PaP(senial_sin_estimulacion,artefacto_estimulacion);

%% Promediado de las ondas M en ventanas de longitud predeterminada 
LONGITUD_VENTANA_SEGUNDOS=1;
ondas_M_promediadas=Promediado(LONGITUD_VENTANA_SEGUNDOS,senial_normalizada,artefacto_estimulacion,fs);

%% Grafica ondas M superpuestas
figure
for i=1:length(ondas_M_promediadas(:,1))
plot(ondas_M_promediadas(i,:))
hold on
end

%% Eje temporal para la graficacion de los indicadores de fatiga

eje_temporal_ondasM_promediadas=Eje_temporal_ventanas_promediadas(LONGITUD_VENTANA_SEGUNDOS,length(ondas_M_promediadas(:,1)));

%% Indicadores de fatiga.Calculo y graficacion

PTP=Amplitud_Pico_a_Pico(ondas_M_promediadas,eje_temporal_ondasM_promediadas);

[MNF,MNF_norm,MNF_padding]=MNF(ondas_M_promediadas,fs,eje_temporal_ondasM_promediadas);

[MDF,MDF_norm,MDF_padding]=MDF(ondas_M_promediadas,fs,eje_temporal_ondasM_promediadas);

RMS=RMS(ondas_M_promediadas,eje_temporal_ondasM_promediadas);

ENERGIA=Energia(ondas_M_promediadas,eje_temporal_ondasM_promediadas);

CURTOSIS=Curtosis(ondas_M_promediadas,eje_temporal_ondasM_promediadas);

LONGITUD_CURVA=Longitud_curva(ondas_M_promediadas,eje_temporal_ondasM_promediadas);

UMBRAL=Umbral(ondas_M_promediadas,eje_temporal_ondasM_promediadas);

IEMG=IEMG(ondas_M_promediadas,eje_temporal_ondasM_promediadas);
