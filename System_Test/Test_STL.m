%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction STL system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_STL ')
result = false;

Compile ROM_Test_STL
Flash(ROM_Test_STL, 0x0000)

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((0x11 == data_bus_ram(  0 + 1)) && ...
    (0x33 == data_bus_ram(255 + 1)) && ...
    (0x55 == data_bus_ram(256 + 1)) && ...
    (0x77 == data_bus_ram(511 + 1)))
   result = true;
end

if ((true == gDebug) || (false == result))
    print_output_values();
end

if (true == result)
    fprintf('Passed\n', result)
else
    fprintf('Failed\n', result)
end
