%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_Flash ')
result = false;

Compile ROM_Test_Flash_Main
Compile ROM_Test_Flash_Function
Burn(ROM_Test_Flash_Main,     0x0000)
Burn(ROM_Test_Flash_Function, 0x00FF)

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if (0xABBA == gp_reg_00) && ...
   (0xBEEF == gp_reg_01)
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
