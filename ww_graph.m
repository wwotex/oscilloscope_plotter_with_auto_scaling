
format long

% Define file paths
file_path_vgs = 'CH1_turn_on.csv';
file_path_vds = 'CH2_turn_on.csv';

% Read data from CSV files
data_vgs = csvread(file_path_vgs, 1, 0);
data_vds = csvread(file_path_vds, 1, 0);

% Define x-axis and y-axis limits
x_min = -50e-6;
x_max = 400e-6;
y_min = -6;
y_max = 35;

% Scale time and voltage data
% [scaled_data_vgs, prefix_vgs] = scale_data(data_vgs(:,2), y_min, y_max);
% [scaled_data_vds, prefix_vds] = scale_data(data_vds(:,2), y_min, y_max);
[scaled_time_vgs, prefix_time_vgs] = scale_data(data_vgs(:,1), x_min, x_max);
[scaled_time_vds, prefix_time_vds] = scale_data(data_vds(:,1), x_min, x_max);

% Scale time and voltage data
[scaled_data_vgs, prefix_vgs] = scale_data(data_vgs(:,2));
[scaled_data_vds, prefix_vds] = scale_data(data_vds(:,2));
% [scaled_time_vgs, prefix_time_vgs] = scale_data(data_vgs(:,1));
% [scaled_time_vds, prefix_time_vds] = scale_data(data_vds(:,1));

% Plot data on a single graph with minor gridlines
figure;
hold on;
plot(scaled_time_vgs, scaled_data_vgs, 'b-', 'LineWidth', 1);
plot(scaled_time_vds, scaled_data_vds, 'r-', 'LineWidth', 1);
grid minor;
xlabel(['$\textsf{Time (' prefix_time_vgs 's)}$'], 'Interpreter', 'latex');
ylabel(['$\textsf{Voltage (' prefix_vgs 'V)}$'], 'Interpreter', 'latex');
% title('Vgs and Vds vs. Time');
legend('Vgs', 'Vds');

% Set x-axis and y-axis limits
xlim([scale_data(x_min, x_min, x_max), scale_data(x_max, x_min, x_max)]);
% ylim([scale_data(y_min, y_min, y_max), scale_data(y_max, y_min, y_max)]);
