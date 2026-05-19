% Laboratorio 2 - Código 1
% Valor exacto y aproximaciones con 2 subintervalos

% Función B'(t)
Bprima = @(t) (30 * exp(-0.1*t)) ./ (1 + 3*exp(-0.1*t)).^2;

a = 0;
b = 20;
n = 2;
h = (b - a) / n;
t = a:h:b;

% Valor exacto (primitiva analítica)
primitiva = @(t) 100 ./ (1 + 3*exp(-0.1*t));
exacto = primitiva(b) - primitiva(a);

% Regla del Trapecio
trapecio = h/2 * (Bprima(t(1)) + 2*Bprima(t(2)) + Bprima(t(end)));

% Regla de Simpson
simpson = h/3 * (Bprima(t(1)) + 4*Bprima(t(2)) + Bprima(t(end)));

% Resultados
fprintf('Valor exacto:     %.6f\n', exacto);
fprintf('Trapecio (n=2):   %.6f\n', trapecio);
fprintf('Error trapecio:   %.6f\n', abs(exacto - trapecio));
fprintf('Simpson (n=2):    %.6f\n', simpson);
fprintf('Error Simpson:    %.6f\n', abs(exacto - simpson));

% ---- GRÁFICO ----
t_fino = linspace(a, b, 500);

figure;

% --- Subplot 1: Trapecio ---
subplot(1,2,1);
hold on;

% Área del trapecio (relleno)
t_trap = [t(1), t(2), t(3)];
y_trap = Bprima(t_trap);
fill([t_trap(1) t_trap(2) t_trap(2) t_trap(1)], ...
     [0 0 y_trap(2) y_trap(1)], 'c', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
fill([t_trap(2) t_trap(3) t_trap(3) t_trap(2)], ...
     [0 0 y_trap(3) y_trap(2)], 'c', 'FaceAlpha', 0.3, 'EdgeColor', 'none');

% Líneas del trapecio
plot([t_trap(1) t_trap(2)], [y_trap(1) y_trap(2)], 'b--', 'LineWidth', 1.5);
plot([t_trap(2) t_trap(3)], [y_trap(2) y_trap(3)], 'b--', 'LineWidth', 1.5);
for i = 1:3
    plot([t_trap(i) t_trap(i)], [0 y_trap(i)], 'b:', 'LineWidth', 1);
end

% Curva real
plot(t_fino, Bprima(t_fino), 'r-', 'LineWidth', 2);
plot(t_trap, y_trap, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);

xlabel('t (horas)');
ylabel("B'(t)");
title('Regla del Trapecio (n=2)');
legend("Área aprox.", "Aprox. lineal", "B'(t) exacta", 'Nodos', ...
       'Location', 'northeast');
grid on;
hold off;

% --- Subplot 2: Simpson ---
subplot(1,2,2);
hold on;

% Parábola de Simpson entre t(1) y t(3)
t_simp = linspace(t(1), t(3), 200);
% Interpolación polinómica de grado 2 por los 3 puntos
p = polyfit(t, Bprima(t), 2);
y_parab = polyval(p, t_simp);

% Área bajo la parábola (relleno)
fill([t_simp, fliplr(t_simp)], [y_parab, zeros(1,length(t_simp))], ...
     'm', 'FaceAlpha', 0.3, 'EdgeColor', 'none');

% Parábola ajustada
plot(t_simp, y_parab, 'm--', 'LineWidth', 1.5);

% Líneas verticales en nodos
for i = 1:3
    plot([t(i) t(i)], [0 Bprima(t(i))], 'm:', 'LineWidth', 1);
end

% Curva real
plot(t_fino, Bprima(t_fino), 'r-', 'LineWidth', 2);
plot(t, Bprima(t), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);

xlabel('t (horas)');
ylabel("B'(t)");
title('Regla de Simpson (n=2)');
legend("Área aprox.", "Parábola ajustada", "B'(t) exacta", 'Nodos', ...
       'Location', 'northeast');
grid on;
hold off;

sgtitle('Aproximación numérica de \int_0^{20} B''(t) dt con n=2 subintervalos');