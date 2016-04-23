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

%------------------------------------------------------------------------------
% Dreiphasige Brückenschaltung - Gesteuerter Betrieb

gr642

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

gr66

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

