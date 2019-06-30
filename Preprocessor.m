function compiledCode = Preprocessor(program)
    % clc
    fprintf('########################\n');
    fprintf('# Assembler Preprocessor\n');
    fprintf('########################\n');

    INSTR_FORMAT_MASK = bin2dec('1100 0000');

    INSTR_FORMAT_0 = bin2dec('0000 0000');
    INSTR_FORMAT_1 = bin2dec('0100 0000');
    INSTR_FORMAT_2 = bin2dec('1000 0000');
    INSTR_FORMAT_3 = bin2dec('1100 0000');

    LABEL_DEST_PREFIX = bin2dec('11111111 10000000');
    LABEL_SRC_PREFIX  = bin2dec('11111111 01000000');
    LABEL_PREFIX_MASK = bin2dec('11111111 11000000');
    LABEL_MASK        = bin2dec('00000000 00111111');

    i = 1;
    j = 1;

    % address = 0;
    lable_idx = 0;
    num_of_bytes = size(program, 2);
    while (i <= num_of_bytes)
        label = program(1, i);

        if (LABEL_DEST_PREFIX == bitand(label, LABEL_PREFIX_MASK));
            idx = bitand(label, LABEL_MASK);
            lable_address(idx) = j - 1;
            i = i + 1;
        end


        opcode = program(1, i);

        % Format 0: Not used yet
        if (INSTR_FORMAT_0 == bitand(opcode, INSTR_FORMAT_MASK))
            i = i + 1;
            instr_byte_1 = 0;
            instr_byte_0 = 0;
        end


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Format 1: FF|OO|DD|SS IIIIIIII
        %
        % Example:  opcode | op1 | op2 | op3
        %          --------+-----+----+------
        %              JPE | r0  | r1 | LOOP
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if (INSTR_FORMAT_1 == bitand(opcode, INSTR_FORMAT_MASK))
            i = i + 1;
            op1 = program(1, i);
            instr_byte_1 = bitor(opcode, bitshift(op1, 2));

            i = i + 1;
            op2 = program(1, i);
            instr_byte_1 = bitor(instr_byte_1, bitshift(op2, 0));

            i = i + 1;
            op3 = program(1, i);
            if (LABEL_SRC_PREFIX == bitand(op3, LABEL_PREFIX_MASK))
                idx = bitand(op3, LABEL_MASK);
                op3 = lable_address(idx);
            end

            instr_byte_0 = op3;
        end


        % Format 2: FF|OOO|DDD IIIIIIII
        if (INSTR_FORMAT_2 == bitand(opcode, INSTR_FORMAT_MASK))
            i = i + 1;
            op1 = program(1, i);
            instr_byte_1 = bitor(opcode, bitshift(op1, 0));

            i = i + 1;
            op2 = program(1, i);
            instr_byte_0 = op2;

        end


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Format 3: FF|OOOO|RR RR|DDD|SSS
        %
        % Example:     | op1 | op2 
        %          ----+-----+----
        %          ADD | r0  | r1
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if (INSTR_FORMAT_3 == bitand(opcode, INSTR_FORMAT_MASK))
            instr_byte_1 = opcode;
            instr_byte_0 = 0;

            i = i + 1;
            op1 = program(1, i);
            instr_byte_0 = bitor(instr_byte_0, bitshift(op1, 3));

            i = i + 1;
            op2 = program(1, i);
            instr_byte_0 = bitor(instr_byte_0, bitshift(op2, 0));
        end

        i = i + 1;

        compiledCode(1, j) = instr_byte_1;
        j = j + 1;

        compiledCode(1, j) = instr_byte_0;
        j = j + 1;
    end
end
