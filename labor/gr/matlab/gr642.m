%------------------------------------------------------------------------------
% Dreiphasige Brückenschaltung - Gesteuerter Betrieb

AXIS_FACTOR = 1.05;
MIN_CURRENT = 6;
MAX_CURRENT = 10;
MIN_GATE    = 0;
MAX_GATE    = 1.5;
MIN_VOLTAGE = -325;
MAX_VOLTAGE = 325;
MIN_VOLT_IN = -325;
MAX_VOLT_IN = 325;

% Messung 7, GR mit Glättung induktiv, Last = 8A, alpha ca. 0°
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0023
FOLDER = 'ALL0023';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0023CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0023CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0023CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0023CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_gate     = m_01_ch_2(:,TIME);
gate          = m_01_ch_2(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);
time_volt_in  = m_01_ch_4(:,TIME);
volt_in       = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
gate     = interp1(time_gate,    gate,    time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
volt_in  = interp1(time_volt_in, volt_in, time, 'spline');
figure(17);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, gate, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_GATE MAX_GATE]);
title('Zuendstrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 3);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(4, 1, 4);
plot(time*1E3, volt_in, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_IN MAX_VOLT_IN]);
title('Phasenspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '642_01.pdf'));

% Messung 14, GR mit Glättung induktiv, Last = 8A, alpha ca. 90° (gerade kein Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0024
FOLDER = 'ALL0024';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0024CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0024CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0024CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0024CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_gate     = m_01_ch_2(:,TIME);
gate          = m_01_ch_2(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);
time_volt_in  = m_01_ch_4(:,TIME);
volt_in       = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
gate     = interp1(time_gate,    gate,    time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
volt_in  = interp1(time_volt_in, volt_in, time, 'spline');
figure(18);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, gate, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_GATE MAX_GATE]);
title('Zuendstrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 3);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(4, 1, 4);
plot(time*1E3, volt_in, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_IN MAX_VOLT_IN]);
title('Phasenspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '642_02.pdf'));

% Messung 15, GR mit Glättung induktiv, Last = 8A, alpha ca. 60°
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0025
FOLDER = 'ALL0025';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0025CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0025CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0025CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0025CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_gate     = m_01_ch_2(:,TIME);
gate          = m_01_ch_2(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);
time_volt_in  = m_01_ch_4(:,TIME);
volt_in       = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
gate     = interp1(time_gate,    gate,    time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
volt_in  = interp1(time_volt_in, volt_in, time, 'spline');
figure(19);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, gate, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_GATE MAX_GATE]);
title('Zuendstrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 3);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(4, 1, 4);
plot(time*1E3, volt_in, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_IN MAX_VOLT_IN]);
title('Phasenspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '642_03.pdf'));

% Messung 16, GR mit Glättung induktiv, Last = 8A, alpha ca. 210?° (Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0026
FOLDER = 'ALL0026';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0026CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0026CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0026CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0026CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_gate     = m_01_ch_2(:,TIME);
gate          = m_01_ch_2(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);
time_volt_in  = m_01_ch_4(:,TIME);
volt_in       = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
gate     = interp1(time_gate,    gate,    time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
volt_in  = interp1(time_volt_in, volt_in, time, 'spline');
figure(20);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, gate, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_GATE MAX_GATE]);
title('Zuendstrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 3);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(4, 1, 4);
plot(time*1E3, volt_in, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_IN MAX_VOLT_IN]);
title('Phasenspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '642_04.pdf'));

% Messung 17, GR mit Glättung induktiv, Last = 8A, alpha ca. °
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0027
FOLDER = 'ALL0027';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0027CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0027CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0027CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0027CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_gate     = m_01_ch_2(:,TIME);
gate          = m_01_ch_2(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);
time_volt_in  = m_01_ch_4(:,TIME);
volt_in       = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
gate     = interp1(time_gate,    gate,    time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
volt_in  = interp1(time_volt_in, volt_in, time, 'spline');
figure(21);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, gate, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_GATE MAX_GATE]);
title('Zuendstrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 3);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(4, 1, 4);
plot(time*1E3, volt_in, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_IN MAX_VOLT_IN]);
title('Phasenspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '642_05.pdf'));

% Messung 18, GR mit Glättung induktiv, Last = 8A, alpha ca. 10?°
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0028
FOLDER = 'ALL0028';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0028CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0028CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0028CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0028CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_gate     = m_01_ch_2(:,TIME);
gate          = m_01_ch_2(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);
time_volt_in  = m_01_ch_4(:,TIME);
volt_in       = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
gate     = interp1(time_gate,    gate,    time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
volt_in  = interp1(time_volt_in, volt_in, time, 'spline');
figure(22);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, gate, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_GATE MAX_GATE]);
title('Zuendstrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 3);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(4, 1, 4);
plot(time*1E3, volt_in, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_IN MAX_VOLT_IN]);
title('Phasenspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '642_06.pdf'));

%------------------------------------------------------------------------------
% Kommutierung

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

