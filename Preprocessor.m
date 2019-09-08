function compiledCode = Preprocessor(program, c)
    fprintf('+------------------------------------------------------------------+\n');
    fprintf('|                      Assembler Preprocessor                      |\n');
    fprintf('+---------+-------------+-----+-----+------------------------------+\n');
    fprintf('| ADDRESS | INSTRUCTION | MSB | LSB |              CODE            |\n');
    fprintf('+---------+-------------+-----+-----+------------------------------+\n');

    [label_address_array] = find_all_destination_labels(program, c);

    % The counter "i" counts number of values in a source code (labels, instructions, operands ... all together).
    i = 1;
    % The counter "j" counts number of bytes in a compiled code (each instruction has two bytes).
    j = 1;
    while (i <= size(program, 2))
        % Read first value on particular line of a processed source code.
        value = program(1, i);

        % If the value is a destination label then skip it.
        if (c.LABEL_DEST_PREFIX == bitand(value, c.LABEL_PREFIX_MASK));
            i = i + 1;

            % Read next value on particular line of a processed source code.
            value = program(1, i);
        end
        i = i + 1;

        % Compile an instruction accoring to its format.
        switch (bitand(value, c.INSTR_FORMAT_MASK))
            case c.INSTR_FORMAT_0
                [instr_msb, instr_lsb, i] = compile_instr_format_0(program, value, label_address_array, i, j, c);

            case c.INSTR_FORMAT_1
                [instr_msb, instr_lsb, i] = compile_instr_format_1(program, value, label_address_array, i, j, c);

            case c.INSTR_FORMAT_2
                [instr_msb, instr_lsb, i] = compile_instr_format_2(program, value, i);

            case c.INSTR_FORMAT_3
                [instr_msb, instr_lsb, i] = compile_instr_format_3(program, value, i, c);

            otherwise
                % Error
        end

        compiledCode(1, j) = bitor(uint16(bitshift(instr_msb, 8)), uint16(instr_lsb));
        print_source_code(compiledCode, instr_msb, instr_lsb, j, c);

        j = j + 1;
    end

    fprintf('+---------+-------------+-----+-----+------------------------------+\n');
end


function [label_address_array] = find_all_destination_labels(src_code, c)
    % Init all labels to 0xFFFFFFFFFFFFFFFF
    for (i = 1:c.LBL_CNT)
        label_address_array(i) = hex2dec('FFFFFFFFFFFFFFFF');
    end

    % The counter "i" counts number of values in a source code (labels, instructions, operands ... all together).
    i = 1;
    % The counter "j" counts number of bytes in a compiled code (each instruction has two bytes).
    j = 1;
    % Go through the program and save all addresses of destination labels.
    while (i <= size(src_code, 2))
        value = src_code(1, i);

        % Check that on a label position is destionation label, not source label.
        if (c.LABEL_SRC_PREFIX == bitand(value, c.LABEL_PREFIX_MASK))
            error('### PREPROCESSOR ERROR: A label with a source prefix is placed on position of a destination prefix (Address = %03d)!! ###\n', j)
        end

        % Check if the first value on a line is destination label (for example LABEL_).
        % If yes then save the address of the particular line (address of destination label).
        if (c.LABEL_DEST_PREFIX == bitand(value, c.LABEL_PREFIX_MASK))
            idx = bitand(value, c.LABEL_MASK);

            if (label_address_array(idx) ~= hex2dec('FFFFFFFFFFFFFFFF'))
                error('### PREPROCESSOR ERROR: Multiple destination labels with the same address!! ###')
            end

            % "j - 1" because matlab arrays are indexed from one but address space is indexed from zero.
            label_address_array(idx) = j - 1;
            i = i + 1;
            value = src_code(1, i);
        end

        switch (bitand(value, c.INSTR_FORMAT_MASK))
            case c.INSTR_FORMAT_0
                i = i + 1;

            case c.INSTR_FORMAT_1
                i = i + 2;

            case c.INSTR_FORMAT_2
                i = i + 2;

            case c.INSTR_FORMAT_3
                if ((c.PUSH == value) || (c.POP == value) || (c.GCH == value))
                    i = i + 1;
                elseif (c.RET == value)
                    % Do nothing.
                else
                    i = i + 2;
                end

            otherwise
                % Error.
        end

        % Shift to next value (first one on next line).
        i = i + 1;

        % Shift to next line/next instruction.
        j = j + 1;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% This format is not used yet.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_0(src_code, opcode, label_address_array, i, j, c)
    op = src_code(1, i);

    % Check that on the operand position is source label, not destionation label.
    if (c.LABEL_DEST_PREFIX == bitand(op, c.LABEL_PREFIX_MASK))
        error('### PREPROCESSOR ERROR: A label with a destination prefix is placed on position of a source prefix (Address = %03d)!! ###\n', j - 1)
    end

    if (c.LABEL_SRC_PREFIX == bitand(op, c.LABEL_PREFIX_MASK))
        idx = bitand(op, c.LABEL_MASK);
        op = label_address_array(idx);
    end

    instr_msb = bitor(opcode, bitshift(op, -8));
    instr_lsb = bitand(op, c.BYTE_MASK);

    i = i + 1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OO|DDD|S SS|IIIIII
%
% Example:  opcode | op1 | op2 | op3
%          --------+-----+-----+------
%              JPE | r0  | r1  | LOOP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_1(src_code, opcode, label_address_array, i, j, c)
    % instr_msb = 0;
    % instr_lsb = 0;

    % op1 = src_code(1, i);
    % instr_msb = bitor(opcode, op1);
    % i = i + 1;

    % op2 = src_code(1, i);
    % instr_msb = bitor(instr_msb, bitshift(op2, -2));
    % instr_lsb = bitor(instr_lsb, bitshift(op2, 6));
    % instr_lsb = bitand(instr_lsb, c.BYTE_MASK);  % tento riadok je tu mozno zbytocny
    % i = i + 1;

    % op3 = src_code(1, i);
    % % Check that on the operand position is source label, not destionation label.
    % if (c.LABEL_DEST_PREFIX == bitand(op3, c.LABEL_PREFIX_MASK))
    %     error('### PREPROCESSOR ERROR: A label with a destination prefix is placed on position of a source prefix (Address = %03d)!! ###\n', j - 1)
    % end

    % if (c.LABEL_SRC_PREFIX == bitand(op3, c.LABEL_PREFIX_MASK))
    %     idx = bitand(op3, c.LABEL_MASK);

    %     % This is the relative addressing mode.
    %     op3 = label_address_array(idx) - j;

    %     % % Dopredu (k vyssim adresam) sa da skakat o 64 bytov (o 32 instrukcii).
    %     % % Dozadu (k nizsim adresam) sa da skakat len o 62 bytov (o 31 instrukcii).
    %     % (+ 2) tam je pretoze v dobe skoku je PC posunuty uz na dalsiu instrukciu
    %     % if (abs(op3) > (62 + 2))
    %         % todo: treba vypisat podrobnosti - odkial, kam
    %     %     error('### ERROR: Jump too long!!! ###')
    %     % end

    %     op3 = typecast(int8(op3), 'uint8');
    % end

    % op3 = bitand(op3, bin2dec('0011 1111'));
    % instr_lsb = bitor(instr_lsb, op3);
    % i = i + 1;

    op1 = src_code(1, i);
    instr_msb = bitor(opcode, op1);
    i = i + 1;
    
    op2 = src_code(1, i);
    instr_lsb = op2;
    i = i + 1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% Example:  opcode | op1(reg) | op2(imm) 
%          --------+----------+-----
%             ADDI | r0       | 25  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_2(src_code, opcode, i)
    op1 = src_code(1, i);
    instr_msb = bitor(opcode, op1);
    i = i + 1;
    
    op2 = src_code(1, i);
    instr_lsb = op2;
    i = i + 1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% Example:  opcode | op1 | op2 
%           -------+-----+----
%              ADD | r0  | r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_3(src_code, opcode, i, c)
    instr_msb = opcode;
    instr_lsb = 0;

    op1 = 0;
    op2 = 0;

    if (c.PUSH == opcode)
        op2 = src_code(1, i);
        instr_lsb = op2;
        i = i + 1;

    elseif ((c.POP == opcode) || (c.GCH == opcode))
        op1 = src_code(1, i);
        instr_lsb = bitshift(op1, 4);
        i = i + 1;

    elseif (c.RET == opcode)
        % Do nothing
    else
        op1 = src_code(1, i);
        instr_lsb = bitshift(op1, 4);
        i = i + 1;

        op2 = src_code(1, i);
        instr_lsb = bitor(instr_lsb, op2);
        i = i + 1;
    end
    
end


function print_source_code(compiledCode, instr_msb, instr_lsb, j, c)
    fprintf('|   %03d:  |    %5d    | %3d | %3d |', j - 1, compiledCode(1, j), instr_msb, instr_lsb)

    switch (bitand(instr_msb, c.INSTR_FORMAT_MASK))
        case c.INSTR_FORMAT_0
            switch (bitor(bitand(instr_msb, c.FORMAT_0_OPCODE_MASK), c.INSTR_FORMAT_0))
                case c.CALL
                    fprintf('   CALL   %3d                 |', bitor(bitshift(bitand(c.FORMAT_0_OPERAND_MASK, instr_msb), 8), instr_lsb))
                case c.JMP
                    fprintf('   JMP    %3d                 |', bitor(bitshift(bitand(c.FORMAT_0_OPERAND_MASK, instr_msb), 8), instr_lsb))
            end
        case c.INSTR_FORMAT_1
            switch (bitor(bitand(instr_msb, c.FORMAT_1_OPCODE_MASK), c.INSTR_FORMAT_1))
                % case c.SPX
                %     fprintf('   SPX     r%d     r%d    %3d   |', bitshift(bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK), -1),  ...
                %                                                  bitor(bitshift(bitand(instr_msb, c.FORMAT_1_OPERAND_2_MASK), 2), bitshift(instr_lsb, -6)),  ...
                %                                                  bitand(instr_lsb, c.FORMAT_1_OPERAND_3_MASK))
                % case c.JNE
                %     fprintf('   JNE     r%d     r%d    %3d   |', bitshift(bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK), -1),  ...
                %                                                  bitor(bitshift(bitand(instr_msb, c.FORMAT_1_OPERAND_2_MASK), 2), bitshift(instr_lsb, -6)),  ...
                %                                                  bitand(instr_lsb, c.FORMAT_1_OPERAND_3_MASK))
                % case c.JPE
                %     fprintf('   JPE     r%d     r%d    %3d   |', bitshift(bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK), -1),  ...
                %                                                  bitor(bitshift(bitand(instr_msb, c.FORMAT_1_OPERAND_2_MASK), 2), bitshift(instr_lsb, -6)),  ...
                %                                                  bitand(instr_lsb, c.FORMAT_1_OPERAND_3_MASK))
            end

        case c.INSTR_FORMAT_2
            switch (bitor(bitand(instr_msb, c.FORMAT_2_OPCODE_MASK), c.INSTR_FORMAT_2))
                case c.ADDI
                    fprintf('   ADDI    r%d    %3d          |', bitand(instr_msb, c.FORMAT_2_OPERAND_MASK), instr_lsb)
                case c.TIR
                    fprintf('   TIR     r%d    %3d          |', bitand(instr_msb, c.FORMAT_2_OPERAND_MASK), instr_lsb)
                case c.MMRI
                    fprintf('   MMRI    r%d    %3d          |', bitand(instr_msb, c.FORMAT_2_OPERAND_MASK), instr_lsb)
                case c.MRMI
                    fprintf('   MRMI    r%d    %3d          |', bitand(instr_msb, c.FORMAT_2_OPERAND_MASK), instr_lsb)
                case c.MRC
                    fprintf('   MRC     r%d    %3d          |', bitand(instr_msb, c.FORMAT_2_OPERAND_MASK), instr_lsb)
            end

        case c.INSTR_FORMAT_3
            switch (bitor(bitand(instr_msb, c.FORMAT_3_OPCODE_MASK), c.INSTR_FORMAT_3))
                case c.PUSH
                    fprintf('   PUSH    r%d                 |', bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))
                case c.RET
                    fprintf('   RET                        |\n')
                case c.POP
                    fprintf('   POP     r%d                 |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -3))
                case c.GCH
                    fprintf('   GCH     r%d     r%d          |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -3), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))
                case c.ADD
                    fprintf('   ADD     r%d    r%d          |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -3), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))
                case c.GPX
                    fprintf('   GPX     r%d    r%d          |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -3), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))
                case c.TRR
                    fprintf('   TRR     r%d    r%d          |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -3), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))
                case c.TMR
                    fprintf('   TMR     r%d    r%d          |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -3), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))
                case c.MMR
                    fprintf('   MMR     r%d     r%d          |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -3), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))
                case c.MRM
                    fprintf('   MRM     r%d     r%d          |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -3), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))
                case c.MRR
                    fprintf('   MRR     r%d    r%d          |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -3), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))
            end
    end

    fprintf('\n')
end

