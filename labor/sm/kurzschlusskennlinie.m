clc;
clear;
close all;

ie = [0 0.1   0.2 0.3  0.4  0.5   0.6  0.8   0.7   0.9];
ik = [0 2.725 3.9 6.0  7.8  9.7  11.3 15.05 13.2  16.85];

figure(1);
plot(ie, ik);
xlabel("Erregerstrom [A]");
ylabel("Kurzschlussstrom [A]");
title("Kurzschlusskennlinie");
grid on;
