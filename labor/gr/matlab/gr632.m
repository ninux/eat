%------------------------------------------------------------------------------
% Einphasige Brückenschaltung - Gesteuerter Betrieb

AXIS_FACTOR = 1.05;
MIN_CURRENT = 0;
MAX_CURRENT = 20;
MIN_GATE    = -0.5;
MAX_GATE    = 0.5;
MIN_VOLTAGE = -325;
MAX_VOLTAGE = 325;
MIN_VOLT_IN = -325;
MAX_VOLT_IN = 325;

% Messung 7, GR mit Glättung induktiv, Last = 6A, alpha ca. 0°
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0008
FOLDER = 'ALL0008';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0008CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0008CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0008CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0008CH4.CSV'], ',', HEADERLENGTH, 0);

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
figure(7);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, -gate, 'r', 'LineWidth', LINEWIDTH);
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

print('-dpdf', strcat(PDF_DESTINATION, '632_01.pdf'));

% Messung 8, GR mit Glättung induktiv, Last = 6A, alpha ca. ???° (gerade kein Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0010
FOLDER = 'ALL0010';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0010CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0010CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0010CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0010CH4.CSV'], ',', HEADERLENGTH, 0);

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
figure(8);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, -gate, 'r', 'LineWidth', LINEWIDTH);
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

print('-dpdf', strcat(PDF_DESTINATION, '632_02.pdf'));

% Messung 9, GR mit Glättung induktiv, Last = 6A, alpha ca. ???° (Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0012
FOLDER = 'ALL0012';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0012CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0012CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0012CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0012CH4.CSV'], ',', HEADERLENGTH, 0);

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
figure(9);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, -gate, 'r', 'LineWidth', LINEWIDTH);
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

print('-dpdf', strcat(PDF_DESTINATION, '632_03.pdf'));

% Messung 10, GR mit Glättung induktiv, Last = 6A, alpha ca. ???° (Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0014
FOLDER = 'ALL0014';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0014CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0014CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0014CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0014CH4.CSV'], ',', HEADERLENGTH, 0);

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
figure(10);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, -gate, 'r', 'LineWidth', LINEWIDTH);
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

print('-dpdf', strcat(PDF_DESTINATION, '632_04.pdf'));


% Messung 11, GR mit Glättung induktiv, Last = 6A, alpha ca. 90° (Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0015
FOLDER = 'ALL0015';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0015CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0015CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0015CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0015CH4.CSV'], ',', HEADERLENGTH, 0);

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
figure(11);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, -gate, 'r', 'LineWidth', LINEWIDTH);
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

print('-dpdf', strcat(PDF_DESTINATION, '632_05.pdf'));

% Messung 12, GR mit Glättung induktiv, Last = 6A, alpha ca. ???° (Lücken)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    Zündstrom Thyristor gemessen mit Stromzange
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    Phasenspannung gemessen mit Differentialsonde
%   Ordner: ALL0017
FOLDER = 'ALL0017';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0017CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_2 = dlmread([DATA_DESTINATION FOLDER '/F0017CH2.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0017CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0017CH4.CSV'], ',', HEADERLENGTH, 0);

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
figure(12);
title('B2 gesteuert mit L-Glaettung');

subplot(4, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(4, 1, 2);
plot(time*1E3, -gate, 'r', 'LineWidth', LINEWIDTH);
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

print('-dpdf', strcat(PDF_DESTINATION, '632_06.pdf'));

%------------------------------------------------------------------------------
% Kommutierung

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

