%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction JPE system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_JPE ')
result = false;

Compile ROM_Test_JPE
Flash CODE ROM_Test_JPE_Code 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', gStepCount);
read_output_values(output);

if (0x1111 == gp_reg_00)
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

