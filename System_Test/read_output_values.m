%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function reads values (signals) from output object returned from the simulink model Computer.slx.
% The signals are copied to standalone variables and they are assigned to the base workspace,
% so they are visible to other functions.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function read_output_values(output)
	program_counter = output.get('program_counter');     assignin('base', 'program_counter', program_counter);
	instruction =     output.get('instruction');         assignin('base', 'instruction',     instruction);
	stack_pointer =   output.get('stack_pointer');       assignin('base', 'stack_pointer',   stack_pointer);
	return_address =  output.get('return_address');      assignin('base', 'return_address',  return_address);
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
	gp_reg_08 = output.get('gp_reg_08');                 assignin('base', 'gp_reg_08', gp_reg_08);
	gp_reg_09 = output.get('gp_reg_09');                 assignin('base', 'gp_reg_09', gp_reg_09);
	gp_reg_10 = output.get('gp_reg_10');                 assignin('base', 'gp_reg_10', gp_reg_10);
	gp_reg_11 = output.get('gp_reg_11');                 assignin('base', 'gp_reg_11', gp_reg_11);
	gp_reg_12 = output.get('gp_reg_12');                 assignin('base', 'gp_reg_12', gp_reg_12);
	gp_reg_13 = output.get('gp_reg_13');                 assignin('base', 'gp_reg_13', gp_reg_13);
	sel_col =   output.get('sel_col');                   assignin('base', 'sel_col',   sel_col);
	sel_row =   output.get('sel_row');                   assignin('base', 'sel_row',   sel_row);

	ram_00 = output.get('ram_00');                       assignin('base', 'ram_00', ram_00);
	ram_01 = output.get('ram_01');                       assignin('base', 'ram_01', ram_01);
	ram_02 = output.get('ram_02');                       assignin('base', 'ram_02', ram_02);
	ram_03 = output.get('ram_03');                       assignin('base', 'ram_03', ram_03);
	ram_04 = output.get('ram_04');                       assignin('base', 'ram_04', ram_04);
	ram_05 = output.get('ram_05');                       assignin('base', 'ram_05', ram_05);
	ram_06 = output.get('ram_06');                       assignin('base', 'ram_06', ram_06);
	ram_07 = output.get('ram_07');                       assignin('base', 'ram_07', ram_07);
	ram_08 = output.get('ram_08');                       assignin('base', 'ram_08', ram_08);
	ram_09 = output.get('ram_09');                       assignin('base', 'ram_09', ram_09);
	ram_10 = output.get('ram_10');                       assignin('base', 'ram_10', ram_10);
	ram_11 = output.get('ram_11');                       assignin('base', 'ram_11', ram_11);
	ram_12 = output.get('ram_12');                       assignin('base', 'ram_12', ram_12);
	ram_13 = output.get('ram_13');                       assignin('base', 'ram_13', ram_13);
	ram_14 = output.get('ram_14');                       assignin('base', 'ram_14', ram_14);
	ram_15 = output.get('ram_15');                       assignin('base', 'ram_15', ram_15);
	ram_16 = output.get('ram_16');                       assignin('base', 'ram_16', ram_16);
	ram_17 = output.get('ram_17');                       assignin('base', 'ram_17', ram_17);
	ram_18 = output.get('ram_18');                       assignin('base', 'ram_18', ram_18);
	ram_19 = output.get('ram_19');                       assignin('base', 'ram_19', ram_19);
	ram_20 = output.get('ram_20');                       assignin('base', 'ram_20', ram_20);
	ram_21 = output.get('ram_21');                       assignin('base', 'ram_21', ram_21);
	ram_22 = output.get('ram_22');                       assignin('base', 'ram_22', ram_22);
	ram_23 = output.get('ram_23');                       assignin('base', 'ram_23', ram_23);
	ram_24 = output.get('ram_24');                       assignin('base', 'ram_24', ram_24);
	ram_25 = output.get('ram_25');                       assignin('base', 'ram_25', ram_25);
	ram_26 = output.get('ram_26');                       assignin('base', 'ram_26', ram_26);
	ram_27 = output.get('ram_27');                       assignin('base', 'ram_27', ram_27);
	ram_28 = output.get('ram_28');                       assignin('base', 'ram_28', ram_28);
	ram_29 = output.get('ram_29');                       assignin('base', 'ram_29', ram_29);
	ram_30 = output.get('ram_30');                       assignin('base', 'ram_30', ram_30);
	ram_31 = output.get('ram_31');                       assignin('base', 'ram_31', ram_31);

	vram_00 = output.get('vram_00');                     assignin('base', 'vram_00', vram_00);
	vram_01 = output.get('vram_01');                     assignin('base', 'vram_01', vram_01);
	vram_02 = output.get('vram_02');                     assignin('base', 'vram_02', vram_02);
	vram_03 = output.get('vram_03');                     assignin('base', 'vram_03', vram_03);
	vram_04 = output.get('vram_04');                     assignin('base', 'vram_04', vram_04);
	vram_05 = output.get('vram_05');                     assignin('base', 'vram_05', vram_05);
	vram_06 = output.get('vram_06');                     assignin('base', 'vram_06', vram_06);
	vram_07 = output.get('vram_07');                     assignin('base', 'vram_07', vram_07);
	vram_08 = output.get('vram_08');                     assignin('base', 'vram_08', vram_08);
	vram_09 = output.get('vram_09');                     assignin('base', 'vram_09', vram_09);
	vram_10 = output.get('vram_10');                     assignin('base', 'vram_10', vram_10);
	vram_11 = output.get('vram_11');                     assignin('base', 'vram_11', vram_11);
	vram_12 = output.get('vram_12');                     assignin('base', 'vram_12', vram_12);
	vram_13 = output.get('vram_13');                     assignin('base', 'vram_13', vram_13);
	vram_14 = output.get('vram_14');                     assignin('base', 'vram_14', vram_14);
	vram_15 = output.get('vram_15');                     assignin('base', 'vram_15', vram_15);
	vram_16 = output.get('vram_16');                     assignin('base', 'vram_16', vram_16);
	vram_17 = output.get('vram_17');                     assignin('base', 'vram_17', vram_17);
	vram_18 = output.get('vram_18');                     assignin('base', 'vram_18', vram_18);
	vram_19 = output.get('vram_19');                     assignin('base', 'vram_19', vram_19);
	vram_20 = output.get('vram_20');                     assignin('base', 'vram_20', vram_20);
	vram_21 = output.get('vram_21');                     assignin('base', 'vram_21', vram_21);
	vram_22 = output.get('vram_22');                     assignin('base', 'vram_22', vram_22);
	vram_23 = output.get('vram_23');                     assignin('base', 'vram_23', vram_23);
	vram_24 = output.get('vram_24');                     assignin('base', 'vram_24', vram_24);
	vram_25 = output.get('vram_25');                     assignin('base', 'vram_25', vram_25);
	vram_26 = output.get('vram_26');                     assignin('base', 'vram_26', vram_26);
	vram_27 = output.get('vram_27');                     assignin('base', 'vram_27', vram_27);
	vram_28 = output.get('vram_28');                     assignin('base', 'vram_28', vram_28);
	vram_29 = output.get('vram_29');                     assignin('base', 'vram_29', vram_29);
	vram_30 = output.get('vram_30');                     assignin('base', 'vram_30', vram_30);
	vram_31 = output.get('vram_31');                     assignin('base', 'vram_31', vram_31);

	const_00 = output.get('const_00');                   assignin('base', 'const_00', const_00);
	const_01 = output.get('const_01');                   assignin('base', 'const_01', const_01);
	const_02 = output.get('const_02');                   assignin('base', 'const_02', const_02);
	const_03 = output.get('const_03');                   assignin('base', 'const_03', const_03);
	const_04 = output.get('const_04');                   assignin('base', 'const_04', const_04);
	const_05 = output.get('const_05');                   assignin('base', 'const_05', const_05);
	const_06 = output.get('const_06');                   assignin('base', 'const_06', const_06);
	const_07 = output.get('const_07');                   assignin('base', 'const_07', const_07);
	const_08 = output.get('const_08');                   assignin('base', 'const_08', const_08);
	const_09 = output.get('const_09');                   assignin('base', 'const_09', const_09);
	const_10 = output.get('const_10');                   assignin('base', 'const_10', const_10);
	const_11 = output.get('const_11');                   assignin('base', 'const_11', const_11);
	const_12 = output.get('const_12');                   assignin('base', 'const_12', const_12);
	const_13 = output.get('const_13');                   assignin('base', 'const_13', const_13);
	const_14 = output.get('const_14');                   assignin('base', 'const_14', const_14);
	const_15 = output.get('const_15');                   assignin('base', 'const_15', const_15);
	const_16 = output.get('const_16');                   assignin('base', 'const_16', const_16);
	const_17 = output.get('const_17');                   assignin('base', 'const_17', const_17);
	const_18 = output.get('const_18');                   assignin('base', 'const_18', const_18);
	const_19 = output.get('const_19');                   assignin('base', 'const_19', const_19);
	const_20 = output.get('const_20');                   assignin('base', 'const_20', const_20);
	const_21 = output.get('const_21');                   assignin('base', 'const_21', const_21);
	const_22 = output.get('const_22');                   assignin('base', 'const_22', const_22);
	const_23 = output.get('const_23');                   assignin('base', 'const_23', const_23);
	const_24 = output.get('const_24');                   assignin('base', 'const_24', const_24);
	const_25 = output.get('const_25');                   assignin('base', 'const_25', const_25);
	const_26 = output.get('const_26');                   assignin('base', 'const_26', const_26);
	const_27 = output.get('const_27');                   assignin('base', 'const_27', const_27);
	const_28 = output.get('const_28');                   assignin('base', 'const_28', const_28);
	const_29 = output.get('const_29');                   assignin('base', 'const_29', const_29);
	const_30 = output.get('const_30');                   assignin('base', 'const_30', const_30);
	const_31 = output.get('const_31');                   assignin('base', 'const_31', const_31);
end
