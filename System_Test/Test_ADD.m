%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction ADD system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_ADD ')
result = false;

Compile ROM_Test_ADD
Flash CODE ROM_Test_ADD_Code 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', gStepCount);
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
