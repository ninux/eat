% cleanup
clear all;
close all;

r		= 0.79;		% 

f = 50;

u_s		= [33.0];	% Statorspannung
i_s_q	= [6.72];	% Statorstrom max (I_q)
i_s_d	= [4.12];	% Statorstrom min (I_d)

L_q = sqrt( (u_s/(i_s_q/sqrt(2)))^2 - r^2 ) / 2 / pi / f;
L_d = sqrt( (u_s/(i_s_d/sqrt(2)))^2 - r^2 ) / 2 / pi / f;
