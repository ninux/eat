%------------------------------------------------------------------------------
% Dreiphasige Brückenschaltung - Ungesteuerter Betrieb

MIN_CURRENT = 0;
MAX_CURRENT = 15;
MIN_VOLTAGE = 0;
MAX_VOLTAGE = 425;
MIN_VOLT_IN = -400;
MAX_VOLT_IN = 400;

% Messung 13, GR mit Glättung induktiv, Lastposition 16 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0019
FOLDER = 'ALL0019';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0019CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0019CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0019CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);
time_volt_in  = m_01_ch_4(:,TIME);
volt_in       = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
volt_in  = interp1(time_volt_in, volt_in, time, 'spline');
figure(13);
title('B6 gesteuert mit L-Glaettung');

subplot(3, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(3, 1, 2);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(3, 1, 3);
plot(time*1E3, volt_in, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_IN MAX_VOLT_IN]);
title('Phasenspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '641_01.pdf'));

% Messung 14, GR mit Glättung induktiv, Lastposition 11 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0020
FOLDER = 'ALL0020';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0020CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0020CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0020CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);
time_volt_in  = m_01_ch_4(:,TIME);
volt_in       = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
volt_in  = interp1(time_volt_in, volt_in, time, 'spline');
figure(14);
title('B6 gesteuert mit L-Glaettung');

subplot(3, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(3, 1, 2);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(3, 1, 3);
plot(time*1E3, volt_in, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_IN MAX_VOLT_IN]);
title('Phasenspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '641_02.pdf'));

% Messung 15, GR mit Glättung induktiv, Lastposition 6 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0021
FOLDER = 'ALL0021';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0021CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0021CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0021CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);
time_volt_in  = m_01_ch_4(:,TIME);
volt_in       = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
volt_in  = interp1(time_volt_in, volt_in, time, 'spline');
figure(15);
title('B6 gesteuert mit L-Glaettung');

subplot(3, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(3, 1, 2);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(3, 1, 3);
plot(time*1E3, volt_in, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_IN MAX_VOLT_IN]);
title('Phasenspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '641_03.pdf'));

% Messung 16, GR mit Glättung induktiv, Lastposition 4 (2x27 Ohm Stellwiderstand)
%   CH1:    Laststrom gemessen mit Stromzange 
%   CH2:    -
%   CH3:    DC-Spannung gemessen mit Differentialsonde
%   CH4:    L1-L2 Spannung gemessen mit Differentialsonde
%   Ordner: ALL0022
FOLDER = 'ALL0022';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0022CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0022CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0022CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current  = m_01_ch_1(:,TIME);
current       = m_01_ch_1(:,VALUE);
time_voltage  = m_01_ch_3(:,TIME);
voltage       = m_01_ch_3(:,VALUE);
time_volt_in  = m_01_ch_4(:,TIME);
volt_in       = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
voltage  = interp1(time_voltage, voltage, time, 'spline');
volt_in  = interp1(time_volt_in, volt_in, time, 'spline');
figure(16);
title('B6 gesteuert mit L-Glaettung');

subplot(3, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(3, 1, 2);
plot(time*1E3, voltage, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLTAGE MAX_VOLTAGE]);
title('Ausgangsspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(3, 1, 3);
plot(time*1E3, volt_in, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_IN MAX_VOLT_IN]);
title('Phasenspannung [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '641_04.pdf'));
