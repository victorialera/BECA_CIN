function [artefacto_estimulacion]= Artefacto_Estimulacion(senial_estimulacion, altura_pico)

[pks,artefacto_estimulacion]=findpeaks(senial_estimulacion,'MinPeakHeight',altura_pico);
clear pks