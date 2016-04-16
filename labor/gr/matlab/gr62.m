% 6.2
f = 50; % Frequenz [Hz]

% Messung der Induktivität AC
il = [ 5  10];  % [A]
ul = [87 172];  % [V]

% Messung der Induktivität DC
idc = [5    10];                % [A]
udc = [0.86  1.72];             % [V]

rl = udc./idc;                  % [Ohm]
zl = ul./il;                    % [Ohm]
xl = sqrt(zl.^2 - rl.^2);       % [Ohm]
L = xl./(2.*pi.*f);             % [H]  

% Ausgabe der Ergebnisse
disp(['Ohmscher Widerstand:     ' num2str(rl)]);
disp(['Impedanz:                ' num2str(zl)]);
disp(['Blindwiderstand:         ' num2str(xl)]);
disp(['Induktivitaet:           ' num2str(L)]);
