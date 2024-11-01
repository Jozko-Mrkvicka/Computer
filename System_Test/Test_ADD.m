%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction ADD system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_ADD ')
result = false;

Compile ROM_Test_ADD
Flash(ROM_Test_ADD, 0x0000)

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((0xFFFF == gp_reg_00) && ...
    (0x8000 == gp_reg_01) && ...
    (0x7FFF == gp_reg_03))
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
