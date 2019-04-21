function out = Preprocessor(program)
    clc
    fprintf('##########################\n');
    fprintf('# Assembler Preprocessor 2\n');
    fprintf('##########################\n');
    
    % print unprocessed data (matrix)
    input_data = program

        num_of_lines = size(program, 1);
    
    for (i = 1:num_of_lines)

		% MRC   r0    51    	

		[op1, op2, error_code] = select_type_of_operands(program(i, 2), program(i, 3), error_code, i);

        % erase prefix from operand 1
        program(i, 2) = bitand(program(i, 2), bin2dec('00 1111 1111'));
        % erase prefix from operand 2
        program(i, 3) = bitand(program(i, 3), bin2dec('00 1111 1111'));

		if (op1 == 'r')
			program(i, 1) = bitor(program(i, 1), bitshift(program(i, 2), 2));
		end 

		if (op2 == 'r')
			program(i, 1) = bitor(program(i, 1), bitshift(program(i, 3), 0));
		end 

		program(i, 2) = program(i, 3);
		program(i, 3) = 0;

    end

end