%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction STUI system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_STUI ')
result = false;

Compile ROM_Test_STUI
Flash CODE ROM_Test_STUI_Code 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', gStepCount);
read_output_values(output);

if (0xBB == data_bus_ram(5 + 1))
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
