%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Timer interrupt system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gStepCount
global gDebug
debug = true;

fprintf('Test_IRQ_Timer ')
Compile ROM_Test_IRQ_Timer_Main
Compile ROM_Test_IRQ_Timer_Handler
clear RomCode
Flash CODE ROM_Test_IRQ_Timer_Main_Code    0x0000  % Address = c.ROM_START = 0x0000;
Flash CODE ROM_Test_IRQ_Timer_Handler_Code 0x01FF  % Address = c.IRQ_ADDR_TIMER = 0x01FF;

fprintf('Executing... ')
result = false;
pause('on');
output = sim('Computer.slx', 'StopTime', '100');
read_output_values(output);

if (0x0005 == gp_reg_05) &&    ...
   (0xFFFF == gp_reg_01) &&    ...
   (0x000E == program_counter)
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
