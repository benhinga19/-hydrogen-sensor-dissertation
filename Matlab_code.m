% ---------- SERIAL SETUP ----------
clear;
clc;

ports = serialportlist("available");

port = ports(contains(ports, "usbmodem"));

s = serialport(port(1), 115200);

configureTerminator(s, "LF");
flush(s);

% ---------- DATA STORAGE ----------
time = [];
voltage = [];

% ---------- FILE SETUP (NEW) ----------
filename = "mq8_data.csv";
fid = fopen(filename, 'w');

% Write header (for Excel)
fprintf(fid, "Time_s,Voltage_V\n");

% ---------- FIGURE SETUP ----------
figure;
h = plot(NaN, NaN, 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('MQ-8 Live Output');
grid on;

ylim([0 5]);
xlim([0 10]);

hold on;

debugMode = false;

disp("Streaming data... Close figure window to stop.");

% ---------- MAIN LOOP ----------
while ishandle(h)
    
    if s.NumBytesAvailable > 0
        
        line = readline(s);
        data = str2double(split(strtrim(line), ","));
        
        if length(data) == 2 && all(~isnan(data))
            
            t = data(1);
            v = data(2);
            
            time(end+1) = t;
            voltage(end+1) = v;
            
            % Save to CSV (NEW)
            fprintf(fid, "%.3f,%.5f\n", t, v);
            
            % Update plot
            set(h, 'XData', time, 'YData', voltage);
            
            if t > 10
                xlim([t-10 t]);
            end
            
            if debugMode
                fprintf("t = %f s, V = %.4f V\n", t, v);
            end
            
            drawnow limitrate
        end
    end
end

% ---------- CLEANUP ----------
fclose(fid);      % Close file
clear s           % Close serial
disp("Serial connection closed.");
