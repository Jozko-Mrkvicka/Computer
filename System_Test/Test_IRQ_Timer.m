%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Timer interrupt system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
debug = true;

fprintf('Test_IRQ_Timer ')
Compile ROM_Test_IRQ_Timer_Main
Compile ROM_Test_IRQ_Timer_Handler
clear RomCode
Flash(ROM_Test_IRQ_Timer_Main,    c.ROM_START)
Flash(ROM_Test_IRQ_Timer_Handler, c.IRQ_ADDR_TIMER)

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
