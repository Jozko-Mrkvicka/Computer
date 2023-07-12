%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction CMP system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_CMP_6 ')

result = false;
Flash ROM_Test_CMP_6

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

% Expected result for signed data:   r0 < r1
% Expected result for unsigned data: r0 > r1
if ((0 == status_register_equal) && ...
    (1 == status_register_lessthansigned) && ...
    (0 == status_register_lessthanunsigned))
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
