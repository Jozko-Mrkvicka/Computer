%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction CMP system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_CMP_5 ')
result = false;

Compile ROM_Test_CMP_5
Flash CODE ROM_Test_CMP_5_Code 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', gStepCount);
read_output_values(output);

% Expected result for signed data:   r1 > r0
% Expected result for unsigned data: r1 < r0
if ((0 == status_register_equal) && ...
    (0 == status_register_lessthansigned) && ...
    (1 == status_register_lessthanunsigned))
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
