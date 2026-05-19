% Laboratorio 2 - Código 2
% Trapecio y Simpson con 3 a 10 subintervalos

Bprima = @(t) (30 * exp(-0.1*t)) ./ (1 + 3*exp(-0.1*t)).^2;
primitiva = @(t) 100 ./ (1 + 3*exp(-0.1*t));

a = 0;
b = 20;
exacto = primitiva(b) - primitiva(a);

fprintf('%-6s %-14s %-12s %-12s %-12s\n', ...
    'n', 'Trapecio', 'Err Trap', 'Simpson', 'Err Simp');

for n = 3:10
    h = (b - a) / n;
    t = a:h:b;
    y = Bprima(t);

    % Trapecio (siempre válido)
    trap = h/2 * (y(1) + 2*sum(y(2:end-1)) + y(end));
    err_trap = abs(exacto - trap);

    % Simpson (solo válido si n es par)
    if mod(n, 2) == 0
        simp = h/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
        err_simp = abs(exacto - simp);
        simp_str = sprintf('%.6f', simp);
        err_str  = sprintf('%.6f', err_simp);
    else
        simp_str = '---';
        err_str  = '---';
    end

    fprintf('%-6d %-14.6f %-12.6f %-12s %-12s\n', ...
        n, trap, err_trap, simp_str, err_str);
end

% ---- GRÁFICO ----
n_vals = 3:10;
trap_vals = zeros(1, length(n_vals));
simp_vals = nan(1, length(n_vals));

for i = 1:length(n_vals)
    n = n_vals(i);
    h = (b - a) / n;
    t = a:h:b;
    y = Bprima(t);
    trap_vals(i) = h/2 * (y(1) + 2*sum(y(2:end-1)) + y(end));
    if mod(n, 2) == 0
        simp_vals(i) = h/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
    end
end

figure;
hold on;
plot(n_vals, trap_vals, 'b-o', 'LineWidth', 1.8, 'MarkerFaceColor', 'b', ...
     'DisplayName', 'Trapecio');
plot(n_vals, simp_vals, 'r-s', 'LineWidth', 1.8, 'MarkerFaceColor', 'r', ...
     'DisplayName', 'Simpson');
yline(exacto, 'k--', 'LineWidth', 1.5, 'DisplayName', 'Valor exacto');
xlabel('Numero de subintervalos (n)');
ylabel('Aproximacion de la integral');
title('Convergencia de Trapecio y Simpson (n = 3 a 10)');
legend('Location', 'southeast');
grid on;
hold off;