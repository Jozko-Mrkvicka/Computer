%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The BYTE datatype system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_DataType_Byte ')
result = false;

Compile ROM_Test_DataType_Byte
Flash CODE  ROM_Test_DataType_Byte_Code  0x0000
Flash CONST ROM_Test_DataType_Byte_Const 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '700');
read_output_values(output);

if ( 128 == data_bus_ram(1)) && ...
   ( 255 == data_bus_ram(2)) && ...
   (   1 == data_bus_ram(3)) && ...
   ( 127 == data_bus_ram(4)) && ...
   ( 128 == data_bus_ram(5)) && ...
   ( 255 == data_bus_ram(6))    ...
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
