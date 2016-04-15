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

% Messung 1, GR mit Glättung induktiv, Lastposition 16 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0001

% Messung 2, GR mit Glättung induktiv, Lastposition 11 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0002

% Messung 3, GR mit Glättung induktiv, Lastposition 6 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0003

% Messung 4, GR ohne Glättung, Lastposition 16 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0004

% Messung 5, GR ohne Glättung, Lastposition 11 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0005

% Messung 6, GR ohne Glättung, Lastposition 6 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0007 (evtl. ALL0006)

%------------------------------------------------------------------------------
% Einphasige Brückenschaltung - Gesteuerter Betrieb

% Messung 7, GR mit Glättung induktiv, Last = 6A, alpha ca. 0°
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0008

% Messung 8, GR mit Glättung induktiv, Last = 6A, alpha ca. ???° (gerade kein Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0010

% Messung 9, GR mit Glättung induktiv, Last = 6A, alpha ca. ???° (Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0012

% Messung 10, GR mit Glättung induktiv, Last = 6A, alpha ca. ???° (Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0014

% Messung 11, GR mit Glättung induktiv, Last = 6A, alpha ca. 90° (Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0015

% Messung 12, GR mit Glättung induktiv, Last = 6A, alpha ca. ???° (Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0017

%------------------------------------------------------------------------------
% Kommutierung

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%------------------------------------------------------------------------------
% Dreiphasige Brückenschaltung - Ungesteuerter Betrieb

% Messung 13, GR mit Glättung induktiv, Lastposition 16 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0019

% Messung 13, GR mit Glättung induktiv, Lastposition 11 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0020

% Messung 13, GR mit Glättung induktiv, Lastposition 6 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0021

% Messung 13, GR mit Glättung induktiv, Lastposition 4 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0022

%------------------------------------------------------------------------------
% Dreiphasige Brückenschaltung - Gesteuerter Betrieb
%------------------------------------------------------------------------------
% Kommutierung
%------------------------------------------------------------------------------
% Strombegrenzung
%------------------------------------------------------------------------------
% Spannungsbelastung der Halbleiter
%------------------------------------------------------------------------------
% Wechselrichterbetrieb
%------------------------------------------------------------------------------
% Netzrückwirkungen
%------------------------------------------------------------------------------
% Stromoberschwingungen
%------------------------------------------------------------------------------
% Leistungsfaktor
%------------------------------------------------------------------------------
% Kommutierungseinbrüche
%------------------------------------------------------------------------------
% 12-pulsiger Betrieb
%------------------------------------------------------------------------------
% Aktives Oberwellenfilter