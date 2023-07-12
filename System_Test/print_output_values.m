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
fprintf('|  STACK_POINTER    |  0x%04X  |\n', stack_pointer)
fprintf('|  RETURN_ADDRESS   |  0x%04X  |\n', return_address)
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

% fprintf('+-------------------------------------------------------------+\n')
% fprintf('|                     Random Access Memory                    |\n')
% fprintf('+-------------------+----------+');                                    fprintf('-------------------+----------+\n')
% fprintf('|    Memory Cell    |  Value   |');                                    fprintf('    Memory Cell    |  Value   |\n')
% fprintf('+-------------------+----------+');                                    fprintf('-------------------+----------+\n')
% fprintf('|      RAM_00       |  0x%04X  |', ram_00);                            fprintf('      VRAM_00      |  0x%04X  |\n', vram_00)
% fprintf('|      RAM_01       |  0x%04X  |', ram_01);                            fprintf('      VRAM_01      |  0x%04X  |\n', vram_01)
% fprintf('|      RAM_02       |  0x%04X  |', ram_02);                            fprintf('      VRAM_02      |  0x%04X  |\n', vram_02)
% fprintf('|      RAM_03       |  0x%04X  |', ram_03);                            fprintf('      VRAM_03      |  0x%04X  |\n', vram_03)
% fprintf('|      RAM_04       |  0x%04X  |', ram_04);                            fprintf('      VRAM_04      |  0x%04X  |\n', vram_04)
% fprintf('|      RAM_05       |  0x%04X  |', ram_05);                            fprintf('      VRAM_05      |  0x%04X  |\n', vram_05)
% fprintf('|      RAM_06       |  0x%04X  |', ram_06);                            fprintf('      VRAM_06      |  0x%04X  |\n', vram_06)
% fprintf('|      RAM_07       |  0x%04X  |', ram_07);                            fprintf('      VRAM_07      |  0x%04X  |\n', vram_07)
% fprintf('|      RAM_08       |  0x%04X  |', ram_08);                            fprintf('      VRAM_08      |  0x%04X  |\n', vram_08)
% fprintf('|      RAM_09       |  0x%04X  |', ram_09);                            fprintf('      VRAM_09      |  0x%04X  |\n', vram_09)
% fprintf('|      RAM_10       |  0x%04X  |', ram_10);                            fprintf('      VRAM_10      |  0x%04X  |\n', vram_10)
% fprintf('|      RAM_11       |  0x%04X  |', ram_11);                            fprintf('      VRAM_11      |  0x%04X  |\n', vram_11)
% fprintf('|      RAM_12       |  0x%04X  |', ram_12);                            fprintf('      VRAM_12      |  0x%04X  |\n', vram_12)
% fprintf('|      RAM_13       |  0x%04X  |', ram_13);                            fprintf('      VRAM_13      |  0x%04X  |\n', vram_13)
% fprintf('|      RAM_14       |  0x%04X  |', ram_14);                            fprintf('      VRAM_14      |  0x%04X  |\n', vram_14)
% fprintf('|      RAM_15       |  0x%04X  |', ram_15);                            fprintf('      VRAM_15      |  0x%04X  |\n', vram_15)
% fprintf('|      RAM_16       |  0x%04X  |', ram_16);                            fprintf('      VRAM_16      |  0x%04X  |\n', vram_16)
% fprintf('|      RAM_17       |  0x%04X  |', ram_17);                            fprintf('      VRAM_17      |  0x%04X  |\n', vram_17)
% fprintf('|      RAM_18       |  0x%04X  |', ram_18);                            fprintf('      VRAM_18      |  0x%04X  |\n', vram_18)
% fprintf('|      RAM_19       |  0x%04X  |', ram_19);                            fprintf('      VRAM_19      |  0x%04X  |\n', vram_19)
% fprintf('|      RAM_20       |  0x%04X  |', ram_20);                            fprintf('      VRAM_20      |  0x%04X  |\n', vram_20)
% fprintf('|      RAM_21       |  0x%04X  |', ram_21);                            fprintf('      VRAM_21      |  0x%04X  |\n', vram_21)
% fprintf('|      RAM_22       |  0x%04X  |', ram_22);                            fprintf('      VRAM_22      |  0x%04X  |\n', vram_22)
% fprintf('|      RAM_23       |  0x%04X  |', ram_23);                            fprintf('      VRAM_23      |  0x%04X  |\n', vram_23)
% fprintf('|      RAM_24       |  0x%04X  |', ram_24);                            fprintf('      VRAM_24      |  0x%04X  |\n', vram_24)
% fprintf('|      RAM_25       |  0x%04X  |', ram_25);                            fprintf('      VRAM_25      |  0x%04X  |\n', vram_25)
% fprintf('|      RAM_26       |  0x%04X  |', ram_26);                            fprintf('      VRAM_26      |  0x%04X  |\n', vram_26)
% fprintf('|      RAM_27       |  0x%04X  |', ram_27);                            fprintf('      VRAM_27      |  0x%04X  |\n', vram_27)
% fprintf('|      RAM_28       |  0x%04X  |', ram_28);                            fprintf('      VRAM_28      |  0x%04X  |\n', vram_28)
% fprintf('|      RAM_29       |  0x%04X  |', ram_29);                            fprintf('      VRAM_29      |  0x%04X  |\n', vram_29)
% fprintf('|      RAM_30       |  0x%04X  |', ram_30);                            fprintf('      VRAM_30      |  0x%04X  |\n', vram_30)
% fprintf('|      RAM_31       |  0x%04X  |', ram_31);                            fprintf('      VRAM_31      |  0x%04X  |\n', vram_31)
% fprintf('+-------------------+----------+');                                    fprintf('-------------------+----------+\n')

fprintf('\n')

% fprintf('+------------------------------+\n')
% fprintf('|         Constant Data        |\n')
% fprintf('+-------------------+----------+\n');        
% fprintf('|    Memory Cell    |  Value   |\n');        
% fprintf('+-------------------+----------+\n');        
% fprintf('|      Const_00     |  0x%04X  |\n', const_00);
% fprintf('|      Const_01     |  0x%04X  |\n', const_01);
% fprintf('|      Const_02     |  0x%04X  |\n', const_02);
% fprintf('|      Const_03     |  0x%04X  |\n', const_03);
% fprintf('|      Const_04     |  0x%04X  |\n', const_04);
% fprintf('|      Const_05     |  0x%04X  |\n', const_05);
% fprintf('|      Const_06     |  0x%04X  |\n', const_06);
% fprintf('|      Const_07     |  0x%04X  |\n', const_07);
% fprintf('|      Const_08     |  0x%04X  |\n', const_08);
% fprintf('|      Const_09     |  0x%04X  |\n', const_09);
% fprintf('|      Const_10     |  0x%04X  |\n', const_10);
% fprintf('|      Const_11     |  0x%04X  |\n', const_11);
% fprintf('|      Const_12     |  0x%04X  |\n', const_12);
% fprintf('|      Const_13     |  0x%04X  |\n', const_13);
% fprintf('|      Const_14     |  0x%04X  |\n', const_14);
% fprintf('|      Const_15     |  0x%04X  |\n', const_15);
% fprintf('|      Const_16     |  0x%04X  |\n', const_16);
% fprintf('|      Const_17     |  0x%04X  |\n', const_17);
% fprintf('|      Const_18     |  0x%04X  |\n', const_18);
% fprintf('|      Const_19     |  0x%04X  |\n', const_19);
% fprintf('|      Const_20     |  0x%04X  |\n', const_20);
% fprintf('|      Const_21     |  0x%04X  |\n', const_21);
% fprintf('|      Const_22     |  0x%04X  |\n', const_22);
% fprintf('|      Const_23     |  0x%04X  |\n', const_23);
% fprintf('|      Const_24     |  0x%04X  |\n', const_24);
% fprintf('|      Const_25     |  0x%04X  |\n', const_25);
% fprintf('|      Const_26     |  0x%04X  |\n', const_26);
% fprintf('|      Const_27     |  0x%04X  |\n', const_27);
% fprintf('|      Const_28     |  0x%04X  |\n', const_28);
% fprintf('|      Const_29     |  0x%04X  |\n', const_29);
% fprintf('|      Const_30     |  0x%04X  |\n', const_30);
% fprintf('|      Const_31     |  0x%04X  |\n', const_31);
% fprintf('+-------------------+----------+\n');

