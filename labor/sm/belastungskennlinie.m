% clean
clear all;
close all;

% Parameter
ie	= 1;	% Erregerstrom [A]
rpm	= 1500;	% Drehzahl [1/min]

% resistiv
ir	= [2.5 3.35 6.9];	% Laststrom [A]
ur	= [205 202  190];	% Ausgangsspannung [V]

% kapazitiv
ik	= [1.32  3.59 5.25];	% Laststrom [A]
uk	= [257   280  298];		% Ausgangsspannung [V]

% induktiv
ii	= [0.44 2.27 5.38];	% Laststrom [A]
ui	= [225  200  176];	% Ausgangsspannung [V]
