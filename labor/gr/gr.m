% EAT LABOR - Gleichrichter
clear all;
close all;

f = 50; % Frequenz [Hz]

% Messung der Induktivität AC
il = [ 5  10];  % [A]
ul = [87 172];  % [V]

% Messung der Induktivität DC
idc = [5    10];        % [A]
udc = [0.86  1.72];     % [V]

rl = mean(udc./idc);    % [Ohm]
zl = mean(ul./il);      % [Ohm]
xl = sqrt(zl^2 - rl^2); % [Ohm]
L = xl/(2*pi*f);        % [H]  

%------------------------------------------------------------------------------
% Einphasige Brückenschaltung - Ungesteuerter Betrieb

% Messung 1, GR mit Glättung, Lastposition 16 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0001

% Messung 2, GR mit Glättung, Lastposition 11 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0002

% Messung 3, GR mit Glättung, Lastposition 6 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0003

% Messung , GR ohne Glättung, Lastposition 16 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL

% Messung , GR ohne Glättung, Lastposition 16 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL

% Messung , GR ohne Glättung, Lastposition 16 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL

%------------------------------------------------------------------------------
% Einphasige Brückenschaltung - Gesteuerter Betrieb


%------------------------------------------------------------------------------
% Kommutierung
