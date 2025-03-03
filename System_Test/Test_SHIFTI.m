%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction SHIFTI system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_SHIFTI ')
result = false;

Compile ROM_Test_SHIFTI
Flash CODE ROM_Test_SHIFTI_Code 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', gStepCount);
read_output_values(output);

if ((0xC00E == gp_reg_00) && ...
    (0x8000 == gp_reg_01) && ...
    (0x7003 == gp_reg_02) && ...
    (0x0001 == gp_reg_03) && ...
    (0xE007 == gp_reg_04))
   result = true;
end
% if (0xC00E == gp_reg_00)
%    result = true;
% end

if ((true == gDebug) || (false == result))
    print_output_values();
end

if (true == result)
    fprintf('Passed\n', result)
else
    fprintf('Failed\n', result)
end

