%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This mfile prints output values which were read from the simulink model Computer.slx. 
% The following code is intentionally not encaptulated in any function for easier access
% to global variables.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('\n')
fprintf('+------------------------------+\n')
fprintf('|       Control Registers      |\n')
fprintf('+-------------------+----------+\n')
fprintf('|  PROGRAM_COUNTER  |  0x%04X  |\n', program_counter)
fprintf('|  INSTRUCTION      |  0x%04X  |\n', instruction)
fprintf('|  STATUS_REGISTER  |  0x%04X  |\n', status_register)
fprintf('+-------------------+----------+\n')
fprintf('|  General Purpose Registers   |\n')
fprintf('+-------------------+----------+\n')
fprintf('|  GP_REG_00        |  0x%04X  |\n', gp_reg_00)
fprintf('|  GP_REG_01        |  0x%04X  |\n', gp_reg_01)
fprintf('|  GP_REG_02        |  0x%04X  |\n', gp_reg_02)
fprintf('|  GP_REG_03        |  0x%04X  |\n', gp_reg_03)
fprintf('|  GP_REG_04        |  0x%04X  |\n', gp_reg_04)
fprintf('|  GP_REG_05        |  0x%04X  |\n', gp_reg_05)
fprintf('|  GP_REG_06        |  0x%04X  |\n', gp_reg_06)
fprintf('|  GP_REG_07        |  0x%04X  |\n', gp_reg_07)
fprintf('+-------------------+----------+\n')

fprintf('\n')
