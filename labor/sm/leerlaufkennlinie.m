clc;
clear;
close all;

i = [0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0 2.2];
u = [0 45  88  128 172 209 240 270 293 308 320 332];

figure(1);
plot(i, u);
xlabel("Erregerstrom [A]");
ylabel("Induzierte Spannung [V]");
title("Leerlaufkennlinie");
