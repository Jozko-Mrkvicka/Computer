%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function reads values (signals) from output object returned from the simulink model Computer.slx.
% The signals are copied to standalone variables and they are assigned to the base workspace,
% so they are visible to other functions.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function read_output_values(output)
    program_counter = output.get('program_counter');     assignin('base', 'program_counter', program_counter);
    instruction =     output.get('instruction');         assignin('base', 'instruction',     instruction);
    status_register = output.get('status_register');     assignin('base', 'status_register', status_register);

    % Extract less then (unsigned) bit from status register.
    status_register_masked = bitand(status_register, bin2dec('1000 0000 0000 0000'));
    status_register_lessthanunsigned = bitshift(status_register_masked, -15);
    assignin('base', 'status_register_lessthanunsigned', status_register_lessthanunsigned);

    % Extract less then (signed) bit from status register.
    status_register_masked = bitand(status_register, bin2dec('0100 0000 0000 0000'));
    status_register_lessthansigned = bitshift(status_register_masked, -14);
    assignin('base', 'status_register_lessthansigned', status_register_lessthansigned);

    % Extract equality bit from status register.
    status_register_masked = bitand(status_register, bin2dec('0010 0000 0000 0000'));
    status_register_equal = bitshift(status_register_masked, -13);
    assignin('base', 'status_register_equal', status_register_equal);

    gp_reg_00 = output.get('gp_reg_00');                 assignin('base', 'gp_reg_00', gp_reg_00);
    gp_reg_01 = output.get('gp_reg_01');                 assignin('base', 'gp_reg_01', gp_reg_01);
    gp_reg_02 = output.get('gp_reg_02');                 assignin('base', 'gp_reg_02', gp_reg_02);
    gp_reg_03 = output.get('gp_reg_03');                 assignin('base', 'gp_reg_03', gp_reg_03);
    gp_reg_04 = output.get('gp_reg_04');                 assignin('base', 'gp_reg_04', gp_reg_04);
    gp_reg_05 = output.get('gp_reg_05');                 assignin('base', 'gp_reg_05', gp_reg_05);
    gp_reg_06 = output.get('gp_reg_06');                 assignin('base', 'gp_reg_06', gp_reg_06);
    gp_reg_07 = output.get('gp_reg_07');                 assignin('base', 'gp_reg_07', gp_reg_07);

    DataBus_256_511 = output.get('DataBus_256_511');     assignin('base', 'DataBus_256_511', DataBus_256_511);
    DataBus_512_767 = output.get('DataBus_512_767');     assignin('base', 'DataBus_512_767', DataBus_512_767);

    % const_00 = output.get('const_00');                   assignin('base', 'const_00', const_00);
    % const_01 = output.get('const_01');                   assignin('base', 'const_01', const_01);
    % const_02 = output.get('const_02');                   assignin('base', 'const_02', const_02);
    % const_03 = output.get('const_03');                   assignin('base', 'const_03', const_03);
    % const_04 = output.get('const_04');                   assignin('base', 'const_04', const_04);
    % const_05 = output.get('const_05');                   assignin('base', 'const_05', const_05);
    % const_06 = output.get('const_06');                   assignin('base', 'const_06', const_06);
    % const_07 = output.get('const_07');                   assignin('base', 'const_07', const_07);
    % const_08 = output.get('const_08');                   assignin('base', 'const_08', const_08);
    % const_09 = output.get('const_09');                   assignin('base', 'const_09', const_09);
    % const_10 = output.get('const_10');                   assignin('base', 'const_10', const_10);
    % const_11 = output.get('const_11');                   assignin('base', 'const_11', const_11);
    % const_12 = output.get('const_12');                   assignin('base', 'const_12', const_12);
    % const_13 = output.get('const_13');                   assignin('base', 'const_13', const_13);
    % const_14 = output.get('const_14');                   assignin('base', 'const_14', const_14);
    % const_15 = output.get('const_15');                   assignin('base', 'const_15', const_15);
    % const_16 = output.get('const_16');                   assignin('base', 'const_16', const_16);
    % const_17 = output.get('const_17');                   assignin('base', 'const_17', const_17);
    % const_18 = output.get('const_18');                   assignin('base', 'const_18', const_18);
    % const_19 = output.get('const_19');                   assignin('base', 'const_19', const_19);
    % const_20 = output.get('const_20');                   assignin('base', 'const_20', const_20);
    % const_21 = output.get('const_21');                   assignin('base', 'const_21', const_21);
    % const_22 = output.get('const_22');                   assignin('base', 'const_22', const_22);
    % const_23 = output.get('const_23');                   assignin('base', 'const_23', const_23);
    % const_24 = output.get('const_24');                   assignin('base', 'const_24', const_24);
    % const_25 = output.get('const_25');                   assignin('base', 'const_25', const_25);
    % const_26 = output.get('const_26');                   assignin('base', 'const_26', const_26);
    % const_27 = output.get('const_27');                   assignin('base', 'const_27', const_27);
    % const_28 = output.get('const_28');                   assignin('base', 'const_28', const_28);
    % const_29 = output.get('const_29');                   assignin('base', 'const_29', const_29);
    % const_30 = output.get('const_30');                   assignin('base', 'const_30', const_30);
    % const_31 = output.get('const_31');                   assignin('base', 'const_31', const_31);
end
