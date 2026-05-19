% Laboratorio 2 - Código 3
% Validación con función integral() de MATLAB

Bprima = @(t) (30 * exp(-0.1*t)) ./ (1 + 3*exp(-0.1*t)).^2;
primitiva = @(t) 100 ./ (1 + 3*exp(-0.1*t));

a = 0;
b = 20;

% Valor exacto analítico
exacto = primitiva(b) - primitiva(a);

% Cuadratura adaptativa de MATLAB
matlab_integral = integral(Bprima, a, b);

% Error respecto al valor exacto
err = abs(exacto - matlab_integral);

fprintf('Valor exacto:        %.10f\n', exacto);
fprintf('integral() MATLAB:   %.10f\n', matlab_integral);
fprintf('Error absoluto:      %.2e\n', err);