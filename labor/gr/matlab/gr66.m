AXIS_FACTOR = 1.05;
MIN_CURRENT = 6;
MAX_CURRENT = 9;
MIN_VOLT_1 = -400;
MAX_VOLT_1 = 400;
MIN_VOLT_2 = -400;
MAX_VOLT_2 = 400;

% Messung Wechselrichterbetrieb
%   CH1 : DC-Strom
%   CH2 : -
%   CH3 : DC-Sapnnung WR1
%   CH4 : DC-Spannung WR2
%   Ordner: ALL0029
FOLDER = 'ALL0029';

% load channel data
m_01_ch_1 = dlmread([DATA_DESTINATION FOLDER '/F0029CH1.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_3 = dlmread([DATA_DESTINATION FOLDER '/F0029CH3.CSV'], ',', HEADERLENGTH, 0);
m_01_ch_4 = dlmread([DATA_DESTINATION FOLDER '/F0029CH4.CSV'], ',', HEADERLENGTH, 0);

% prepare data correction
mi    = m_01_ch_1(2,TIME) - m_01_ch_1(1,TIME);  % measurement interval
le    = m_01_ch_1(length(m_01_ch_1),TIME);      % last element value
time  = [m_01_ch_1(1,TIME):mi:le];              % correct time

% load data vectors
time_current   = m_01_ch_1(:,TIME);
current        = m_01_ch_1(:,VALUE);
time_voltage_1 = m_01_ch_3(:,TIME);
voltage_1      = m_01_ch_3(:,VALUE);
time_voltage_2 = m_01_ch_4(:,TIME);
voltage_2      = m_01_ch_4(:,VALUE);

% interpolate corrupt data
current  = interp1(time_current, current, time, 'spline');
voltage_1= interp1(time_voltage_1, voltage_1, time, 'spline');
voltage_2= interp1(time_voltage_2, voltage_2, time, 'spline');
figure(23);
title('Wechselrichter');

subplot(3, 1, 1);
plot(time*1E3, current, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_CURRENT MAX_CURRENT]);
title('Laststrom [A]');
xlabel('Zeit [ms]');
ylabel('Strom [A]');
grid on;

subplot(3, 1, 2);
plot(time*1E3, voltage_1, 'r', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_1 MAX_VOLT_1]);
title('DC Spannung Gleichrichter 1 [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

subplot(3, 1, 3);
plot(time*1E3, voltage_2, 'b', 'LineWidth', LINEWIDTH);
axis([time(1)*1E3 time(end)*1E3 MIN_VOLT_2 MAX_VOLT_2]);
title('DC Spannung Gleichrichter 2 [V]');
xlabel('Zeit [ms]');
ylabel('Spannung [V]');
grid on;

print('-dpdf', strcat(PDF_DESTINATION, '66_01.pdf'));
