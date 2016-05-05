%------------------------------------------------------------------------------
% 6.3.1 Einphasige Brückenschaltung - Ungesteuerter Betrieb

% Needed variables to be prepared: 
%   DATA_DESTINATION    Destination of csv data
%   HEADERLENGTH        Length of csv header
%   TIME                Time column in csv
%   VALUE               Value column in csv
%   PDF_DESTINATION     Destination for pdf output files
%   LINEWIDTH           Line width for plots

AXIS_FACTOR   = 1.05;
MIN_CURRENT   = 0;
MAX_CURRENT   = 20;
MIN_VOLTAGE   = 0;
MAX_VOLTAGE   = 300;
BASE_PERIOD   = 1/50;    % 1/50Hz
FFT_LOG_Y_MIN = 1E-3;
FFT_LOG_Y_MAX = 1E2;

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

% store average values
t_end         = floor((time_current(end)-time_current(1))/BASE_PERIOD)*BASE_PERIOD + time_current(1);
current_avg_i = [mean(current(1:t_end/mi))];
voltage_avg_i = [mean(voltage(1:t_end/mi))];

% plots
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

% FFT
f = [0:1/(t_end-time_current(1)):1/mi/2];
current_fft_i = abs(fft(current(1:(t_end-time_current)/mi)));

figure(101)
semilogy(f(1:100), (current_fft_i(1:100))*2/numel(current_fft_i), 'b', 'LineWidth', LINEWIDTH);
ylim([FFT_LOG_Y_MIN FFT_LOG_Y_MAX]);
title('Frequenzanalyse Ausgangsstrom');
xlabel('Frequenz [Hz]');
ylabel('Strom [A]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_01_fft.pdf'));
  
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

% store average values
t_end         = floor((time_current(end)-time_current(1))/BASE_PERIOD)*BASE_PERIOD + time_current(1);
current_avg_i = [current_avg_i mean(current(1:t_end/mi))];
voltage_avg_i = [voltage_avg_i mean(voltage(1:t_end/mi))];

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

% FFT
f = [0:1/(t_end-time_current(1)):1/mi/2];
current_fft_i = abs(fft(current(1:(t_end-time_current)/mi)));

figure(102)
semilogy(f(1:100), (current_fft_i(1:100))*2/numel(current_fft_i), 'b', 'LineWidth', LINEWIDTH);
ylim([FFT_LOG_Y_MIN FFT_LOG_Y_MAX]);
title('Frequenzanalyse Ausgangsstrom');
xlabel('Frequenz [Hz]');
ylabel('Strom [A]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_02_fft.pdf'));

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

% store average values
t_end         = floor((time_current(end)-time_current(1))/BASE_PERIOD)*BASE_PERIOD + time_current(1);
current_avg_i = [current_avg_i mean(current(1:t_end/mi))];
voltage_avg_i = [voltage_avg_i mean(voltage(1:t_end/mi))];

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

% FFT
f = [0:1/(t_end-time_current(1)):1/mi/2];
current_fft_i = abs(fft(current(1:(t_end-time_current)/mi)));

figure(103)
semilogy(f(1:100), (current_fft_i(1:100))*2/numel(current_fft_i), 'b', 'LineWidth', LINEWIDTH);
ylim([FFT_LOG_Y_MIN FFT_LOG_Y_MAX]);
title('Frequenzanalyse Ausgangsstrom');
xlabel('Frequenz [Hz]');
ylabel('Strom [A]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_03_fft.pdf'));

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

% store average values
t_end         = floor((time_current(end)-time_current(1))/BASE_PERIOD)*BASE_PERIOD + time_current(1);
current_avg   = [mean(current(1:t_end/mi))];
voltage_avg   = [mean(voltage(1:t_end/mi))];

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

% FFT
f = [0:1/(t_end-time_current(1)):1/mi/2];
current_fft = abs(fft(current(1:(t_end-time_current)/mi)));

figure(104)
semilogy(f(1:100), (current_fft(1:100))*2/numel(current_fft), 'b', 'LineWidth', LINEWIDTH);
ylim([FFT_LOG_Y_MIN FFT_LOG_Y_MAX]);
title('Frequenzanalyse Ausgangsstrom');
xlabel('Frequenz [Hz]');
ylabel('Strom [A]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_04_fft.pdf'));

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

% store average values
t_end         = floor((time_current(end)-time_current(1))/BASE_PERIOD)*BASE_PERIOD + time_current(1);
current_avg   = [current_avg mean(current(1:t_end/mi))];
voltage_avg   = [voltage_avg mean(voltage(1:t_end/mi))];

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

% FFT
f = [0:1/(t_end-time_current(1)):1/mi/2];
current_fft = abs(fft(current(1:(t_end-time_current)/mi)));

figure(105)
semilogy(f(1:100), (current_fft(1:100))*2/numel(current_fft), 'b', 'LineWidth', LINEWIDTH);
ylim([FFT_LOG_Y_MIN FFT_LOG_Y_MAX]);
title('Frequenzanalyse Ausgangsstrom');
xlabel('Frequenz [Hz]');
ylabel('Strom [A]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_05_fft.pdf'));

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

% store average values
t_end         = floor((time_current(end)-time_current(1))/BASE_PERIOD)*BASE_PERIOD + time_current(1);
current_avg   = [current_avg mean(current(1:t_end/mi))];
voltage_avg   = [voltage_avg mean(voltage(1:t_end/mi))];

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

% FFT
f = [0:1/(t_end-time_current(1)):1/mi/2];
current_fft = abs(fft(current(1:(t_end-time_current)/mi)));

figure(106)
semilogy(f(1:100), (current_fft(1:100))*2/numel(current_fft), 'b', 'LineWidth', LINEWIDTH);
ylim([FFT_LOG_Y_MIN FFT_LOG_Y_MAX]);
title('Frequenzanalyse Ausgangsstrom');
xlabel('Frequenz [Hz]');
ylabel('Strom [A]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_06_fft.pdf'));

%------------------------------------------------------------------------------
% Gleichspannungsmittelwert vs. Laststrommittelwert
figure(7);

plot(current_avg_i, voltage_avg_i, 'b--o', current_avg, voltage_avg, 'r--o', 'LineWidth', LINEWIDTH/2);
legend('mit L-Glaettung', 'ohne Glaettung');
title('Gleichspannung vs. Laststrom');
xlabel('Lastmittel [A]');
ylabel('Spannungsmittel [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '631_avg.pdf'));
