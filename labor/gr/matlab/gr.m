% EAT LABOR - Gleichrichter
clc;
clear;
close all;

DATA_DESTINATION = '../data/';
PDF_DESTINATION = '../plots/';

% CSV Attributes
HEADERLENGTH    = 16;   % length of header in CSV datafiles
TIME            = 4;    % time vector position
VALUE           = 5;    % value vector position

% Plot parameters
LINEWIDTH       = 2;    % Line width for plots

gr62

%------------------------------------------------------------------------------
% 6.3.1 Einphasige Brückenschaltung - Ungesteuerter Betrieb

gr631

%------------------------------------------------------------------------------
% 6.3.2 Einphasige Brückenschaltung - Gesteuerter Betrieb

gr632

%------------------------------------------------------------------------------
% Kommutierung

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%------------------------------------------------------------------------------
% Dreiphasige Brückenschaltung - Ungesteuerter Betrieb

gr641

% Messung 13, GR mit Glättung induktiv, Lastposition 16 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0019

% Messung 14, GR mit Glättung induktiv, Lastposition 11 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0020

% Messung 15, GR mit Glättung induktiv, Lastposition 6 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0021

% Messung 16, GR mit Glättung induktiv, Lastposition 4 (2x27 Ohm Stellwiderstand)
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
