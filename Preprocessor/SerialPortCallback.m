function SerialPortCallback(hSerialPort, ~)
    UartDataRx = uint8(read(hSerialPort, 1, "uint8"));
    UartDataRx_Active = true;
    assignin('base', 'UartDataRx', UartDataRx);
    assignin('base', 'UartDataRx_Active', UartDataRx_Active);
    set_param(gcs, 'SimulationCommand', 'update');
end
