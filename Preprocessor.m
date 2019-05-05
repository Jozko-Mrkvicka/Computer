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

    i = 1;
    j = 1;
    num_of_bytes = size(program, 2);
    while (i <= num_of_bytes)
        instr_byte_1 = program(1, i);

        if (INSTR_FORMAT_0 == bitand(instr_byte_1, INSTR_FORMAT_MASK))
            i = i + 1;
            instr_byte_1 = 0;
            instr_byte_0 = 0;
        end


        % Format 2.1: FF|OO|DD|SS IIIIIIII
        if (INSTR_FORMAT_1 == bitand(instr_byte_1, INSTR_FORMAT_MASK))
            i = i + 1;
            op1 = program(1, i);
            instr_byte_1 = bitor(instr_byte_1, bitshift(op1, 2));

            i = i + 1;
            op2 = program(1, i);
            instr_byte_1 = bitor(instr_byte_1, bitshift(op2, 0));

            i = i + 1;
            op3 = program(1, i);
            instr_byte_0 = op3;
        end


        % Format 2.2: FF|OOO|DDD IIIIIIII
        if (INSTR_FORMAT_2 == bitand(instr_byte_1, INSTR_FORMAT_MASK))
            i = i + 1;
            op1 = program(1, i);
            instr_byte_1 = bitor(instr_byte_1, bitshift(op1, 0));

            i = i + 1;
            op2 = program(1, i);
            instr_byte_0 = op2;

        end


        % Format 2.3: FF|OOOO|RR RR|DDD|SSS
        if (INSTR_FORMAT_3 == bitand(instr_byte_1, INSTR_FORMAT_MASK))
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
