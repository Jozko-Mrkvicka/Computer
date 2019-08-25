function compiledCode = Preprocessor(program, const)
    % clc
    fprintf('########################\n');
    fprintf('# Assembler Preprocessor\n');
    fprintf('########################\n');

    label_address_array = hex2dec('FFFFFFFF') * ones(1, const.LBL_CNT);

    % address = 0;
    label_idx = 0;

    % Length of source code (labels, instructions, operands ... all together)
    num_of_values = size(program, 2);

    % The counter "i" counts number of values in a source code (labels, instructions, operands ... all together).
    i = 1;
    % The counter "j" counts number of bytes in a compiled code (each instruction has two bytes).
    j = 1;
    % Go through the program and save all addresses of destination labels.
    while (i <= num_of_values)
        value = program(1, i);

        % Check that on the label position is a destionation label, not a source label.
        if (const.LABEL_SRC_PREFIX == bitand(value, const.LABEL_PREFIX_MASK))
            % todo: treba vypisat podrobnosti
            error('### ERROR: A label with a source prefix is placed on position of a destination prefix!!! ###')
        end

        % Check if the first value on a line is a destination label (for example LABEL_).
        % If yes then save the address of the particular line (address of destination label).
        if (const.LABEL_DEST_PREFIX == bitand(value, const.LABEL_PREFIX_MASK))
            idx = bitand(value, const.LABEL_MASK);

            % todo: treba vypisat podrobnosti
            if (label_address_array(idx) ~= hex2dec('FFFFFFFF'))
                error('### ERROR: Multiple destination labels with the same address!!! ###')
            end

            % (j - 1) => pretoze polia v matlabe su indexovane od 1 a adresovy priestor ktory pouzivam indexujem od 0
            label_address_array(idx) = j - 1;
            i = i + 1;
            value = program(1, i);
        end

        switch (bitand(value, const.INSTR_FORMAT_MASK))
            case const.INSTR_FORMAT_0
                % Not implemented

            case const.INSTR_FORMAT_1
                i = i + 3;

            case const.INSTR_FORMAT_2
                i = i + 2;

            case const.INSTR_FORMAT_3
                i = i + 2;

            otherwise
                % Error
        end

        i = i + 1;

        % posun na dalsi riadok (dalsiu instrukciu)
        j = j + 2;
    end


    % The counter "i" counts number of values in a source code (labels, instructions, operands ... all together).
    i = 1;
    % The counter "j" counts number of bytes in a compiled code (each instruction has two bytes).
    j = 1;
    while (i <= num_of_values)
        % Read first value on particular line of a processed source code.
        value = program(1, i);

        % If the value is a destination label then skip it.
        if (const.LABEL_DEST_PREFIX == bitand(value, const.LABEL_PREFIX_MASK));
            i = i + 1;

            % Read next value on particular line of a processed source code.
            value = program(1, i);
        end
        i = i + 1;

        % Compile an instruction accoring to its format.
        switch (bitand(value, const.INSTR_FORMAT_MASK))
            case const.INSTR_FORMAT_0
                [instr_byte_1, instr_byte_0, i] = compile_instr_format_2(i);

            case const.INSTR_FORMAT_1
                [instr_byte_1, instr_byte_0, i] = compile_instr_format_1(program, value, label_address_array, i, j, const);

            case const.INSTR_FORMAT_2
                [instr_byte_1, instr_byte_0, i] = compile_instr_format_2(program, value, label_address_array, i, j, const);

            case const.INSTR_FORMAT_3
                [instr_byte_1, instr_byte_0, i] = compile_instr_format_3(program, value, i);

            otherwise
                % Error
        end

        compiledCode(1, j) = instr_byte_1;
        j = j + 1;

        compiledCode(1, j) = instr_byte_0;
        j = j + 1;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|RRRRRR RRRRRRRR
%
% This format is not used yet.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [compiled_instr_byte_1, compiled_instr_byte_0, i] = compile_instr_format_0(i)
    compiled_instr_byte_1 = 0;
    compiled_instr_byte_0 = 0;
    i = i + 1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OO|DDD|S SS|IIIIII
%
% Example:  opcode | op1 | op2 | op3
%          --------+-----+-----+------
%              JPE | r0  | r1  | LOOP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [compiled_instr_byte_1, compiled_instr_byte_0, i] = compile_instr_format_1(src_code, opcode, label_address_array, i, j, const)
    compiled_instr_byte_1 = 0;
    compiled_instr_byte_0 = 0;

    op1 = src_code(1, i);
    compiled_instr_byte_1 = bitor(opcode, bitshift(op1, 1));
    i = i + 1;

    op2 = src_code(1, i);
    compiled_instr_byte_1 = bitor(compiled_instr_byte_1, bitshift(op2, -2));
    compiled_instr_byte_0 = bitor(compiled_instr_byte_0, bitshift(op2, 6));
    compiled_instr_byte_0 = bitand(compiled_instr_byte_0, const.BYTE_MASK);
    i = i + 1;

    op3 = src_code(1, i);
    % Check that on the operand position is source label, not destionation label.
    if (const.LABEL_DEST_PREFIX == bitand(op3, const.LABEL_PREFIX_MASK))
        % todo: treba vypisat podrobnosti
        error('### ERROR: A label with a destination prefix is placed on position of a source prefix!!! ###')
    end

    if (const.LABEL_SRC_PREFIX == bitand(op3, const.LABEL_PREFIX_MASK))
        idx = bitand(op3, const.LABEL_MASK);
        % This is the absolute addressing mode.
        % op3 = label_address_array(idx);
        
        % This is the relative addressing mode.
        % (j - 1) => pretoze polia v matlabe su indexovane od 1 a adresovy priestor ktory pouzivam indexujem od 0
        % (- 2)  => pretoze ked pripocitavam relativnu adresu ku PC, tak je PC uz posunute o dva bajty na dalsiu instrukciu. Preto sa musim o dva bajty vratit naspat.
        op3 = (label_address_array(idx) - (j - 1)) - 2;

        % % Dopredu (k vyssim adresam) sa da skakat o 64 bytov (o 32 instrukcii).
        % % Dozadu (k nizsim adresam) sa da skakat len o 62 bytov (o 31 instrukcii).
        % (+ 2) tam je pretoze v dobe skoku je PC posunuty uz na dalsiu instrukciu
        if (abs(op3) > (62 + 2))
            % todo: treba vypisat podrobnosti - odkial, kam
            error('### ERROR: Jump too long!!! ###')
        end

        % op3 = dec2bin(typecast(int8(op3), 'uint8'), 8);
        op3 = typecast(int8(op3), 'uint8');

        % delene 2 -> dostanem hodnotu vo wordoch (v pocte instrukcii), nie v bytoch
        % setrim miesto v instrukcii JPE -> zvacsujem rozsah skoku dvakrat
        op3 = bitshift(op3, -1);

        op3 = bitand(op3, bin2dec('0011 1111'));

        % if (label_address_array(idx) >= (j - 1))
        %     op3 = label_address_array(idx) - (j - 1);
        % else
        %     op3 = (j - 1) - label_address_array(idx);
        % end
    end
    compiled_instr_byte_0 = bitor(compiled_instr_byte_0, op3);
    i = i + 1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% Example:  opcode | op1(reg) | op2(imm) 
%          --------+----------+-----
%             ADDI | r0       | 25  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [compiled_instr_byte_1, compiled_instr_byte_0, i] = compile_instr_format_2(src_code, opcode, label_address_array, i, j, const)
    op1 = src_code(1, i);
    compiled_instr_byte_1 = bitor(opcode, bitshift(op1, 0));
    i = i + 1;

    op2 = src_code(1, i);
    % Check that on the operand position is source label, not destionation label.
    if (const.LABEL_DEST_PREFIX == bitand(op2, const.LABEL_PREFIX_MASK))
        % todo: treba vypisat podrobnosti - odkial, kam
        error('### ERROR: A label with a destination prefix is placed on position of a source prefix!!! ###')
    end

    if (const.LABEL_SRC_PREFIX == bitand(op2, const.LABEL_PREFIX_MASK))
        idx = bitand(op2, const.LABEL_MASK);
        op2 = (label_address_array(idx) - (j - 1)) - 2;

        % if (op2 > 128)
        %     % todo: treba vypisat podrobnosti - odkial, kam
        %     error('### ERROR: jump too long!!! ###')
        % end

        op2 = typecast(int8(op2), 'uint8');
    end

    compiled_instr_byte_0 = op2;
    i = i + 1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR RR|DDD|SSS
%
% Example:  opcode | op1 | op2 
%           -------+-----+----
%              ADD | r0  | r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [compiled_instr_byte_1, compiled_instr_byte_0, i] = compile_instr_format_3(src_code, opcode, i)
    compiled_instr_byte_1 = opcode;
    compiled_instr_byte_0 = 0;

    op1 = src_code(1, i);
    compiled_instr_byte_0 = bitor(compiled_instr_byte_0, bitshift(op1, 3));
    i = i + 1;

    op2 = src_code(1, i);
    compiled_instr_byte_0 = bitor(compiled_instr_byte_0, bitshift(op2, 0));
    i = i + 1;
end

