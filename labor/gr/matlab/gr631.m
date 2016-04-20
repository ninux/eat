%------------------------------------------------------------------------------
% 6.3.1 Einphasige Brückenschaltung - Ungesteuerter Betrieb

% Needed variables to be prepared: 
%   DATA_DESTINATION    Destination of csv data
%   HEADERLENGTH        Length of csv header
%   TIME                Time column in csv
%   VALUE               Value column in csv
%   PDF_DESTINATION     Destination for pdf output files
%   LINEWIDTH           Line width for plots

AXIS_FACTOR = 1.05;
MIN_CURRENT = 0;
MAX_CURRENT = 20;
MIN_VOLTAGE = 0;
MAX_VOLTAGE = 300;

% Messung 1, GR mit Glättung induktiv, Lastposition 16 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0001
FOLDER = 'ALL0001';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0001CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0001CH3.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
figure(1);
title('B2 mit L-Glaettung');

subplot(2, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(2, 1, 2);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_01.pdf'));
  
% Messung 2, GR mit Glättung induktiv, Lastposition 11 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0002
FOLDER = 'ALL0002';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0002CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0002CH3.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
figure(2);
title('B2 mit L-Glaettung');

subplot(2, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(2, 1, 2);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_02.pdf'));

% Messung 3, GR mit Glättung induktiv, Lastposition 6 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0003
FOLDER = 'ALL0003';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0003CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0003CH3.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
figure(3);
title('B2 mit L-Glaettung');

subplot(2, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(2, 1, 2);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_03.pdf'));

% Messung 4, GR ohne Glättung, Lastposition 16 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0004
FOLDER = 'ALL0004';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0004CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0004CH3.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
figure(4);
title('B2 ohne Glaettung');

subplot(2, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(2, 1, 2);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_04.pdf'));

% Messung 5, GR ohne Glättung, Lastposition 11 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0005
FOLDER = 'ALL0005';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0005CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0005CH3.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
figure(5);
title('B2 ohne Glaettung');

subplot(2, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(2, 1, 2);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_05.pdf'));

% Messung 6, GR ohne Glättung, Lastposition 6 (27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Laststrom gemessen mit LEM-Wandler
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   Ordner: ALL0007 (evtl. ALL0006)
FOLDER = 'ALL0007';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0007CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0007CH3.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
figure(6);
title('B2 ohne Glaettung');

subplot(2, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(2, 1, 2);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_06.pdf'));

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
