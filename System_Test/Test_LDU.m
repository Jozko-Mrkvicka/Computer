%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction LDU system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_LDU ')
result = false;

Compile ROM_Test_LDU
Flash(ROM_Test_LDU, 0x0000)

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((0xAA00 == gp_reg_02) && ...
    (0xAAFF == gp_reg_03))
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
