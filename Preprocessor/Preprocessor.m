function compiledCode = Preprocessor(program, c)
    fprintf('+--------------------------------------------------------------------+\n');
    fprintf('|                       Assembler Preprocessor                       |\n');
    fprintf('+---------+-------------+------+------+------------------------------+\n');
    fprintf('| ADDRESS | INSTRUCTION | MSB  | LSB  |             CODE             |\n');
    fprintf('+---------+-------------+------+------+------------------------------+\n');

    % Initialize whole ROM memory with zeros. Zeros will be interpreted as JMP m(0x0000).
    compiledCode(1:c.ROM_SIZE) = uint16(0);

    % Check if there are any labels in the code (it means if variable c.LBL_CNT does exist).
    if (1 == isfield(c, 'LBL_CNT'))
        [label_address_array] = find_all_destination_labels(program, c);
    else
        label_address_array = 0;
    end

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
                [instr_msb, instr_lsb, i] = compile_instr_format_2(program, value, i, j);

            case c.INSTR_FORMAT_3
                [instr_msb, instr_lsb, i] = compile_instr_format_3(program, value, i, c);

            otherwise
                % Error
        end

        % Convert variable of double type to uint8 type.
        temp = int16(instr_msb);
        temp = typecast(temp, 'uint8');
        uint8_instr_msb = temp(1);

        % Convert variable of double type to uint8 type.
        temp = int16(instr_lsb);
        temp = typecast(temp, 'uint8');
        uint8_instr_lsb = temp(1);

        compiledCode(1, j) = bitor(bitshift(uint16(uint8_instr_msb), 8), uint16(uint8_instr_lsb));
        print_source_code(compiledCode, instr_msb, instr_lsb, uint8_instr_msb, uint8_instr_lsb, j, c);

        j = j + 1;
    end

    % Check that compiled code will fit into ROM memory.
    if (size(compiledCode, 2) > c.ROM_SIZE)
      error('###\nPREPROCESSOR ERROR: Binary image is bigger than available size of ROM memory!!\nAvailable ROM memory: %d\nActual image size:    %d\n###', c.ROM_SIZE_MAX, c.WORD_SIZE*size(compiledCode, 2))
    end

    fprintf('+---------+-------------+------+------+------------------------------+\n');

    compiledCode = convert_uint16_to_struct(compiledCode);
end


function [label_address_array] = find_all_destination_labels(src_code, c)
    % Init all labels to 0xFFFFFFFFFFFFFFFF
    for (i = 1:c.LBL_CNT)
        label_address_array(i) = hex2dec('FFFFFFFFFFFFFFFF');
    end

    % The counter "i" counts number of values in a source code (labels, instructions, operands ... all together).
    i = 1;
    % The counter "j" counts number of bytes in a compiled code (each instruction has two bytes).
    j = c.ROM_START;
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
            idx = bitand(value, c.LABEL_VALUE_MASK);

            if (label_address_array(idx) ~= hex2dec('FFFFFFFFFFFFFFFF'))
                error('### PREPROCESSOR ERROR: Multiple destination labels with the same address!! ###')
            end

            % Save current address to the label array.
            label_address_array(idx) = j;
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
                if ((c.PUSH == value) || (c.POP == value)) %|| (c.NOT_USED == value))
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|CCCC  CCCCCCCC
%
% Example:  opcode | op1 | op2 
%          --------+-----+-------
%              JMP | N/A | LABEL  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_0(src_code, opcode, label_address_array, i, j, c)
    operand = src_code(1, i);

    % Check that on the operand position is source label, not destionation label.
    if (c.LABEL_DEST_PREFIX == bitand(operand, c.LABEL_PREFIX_MASK, 'int64'))
        error('### PREPROCESSOR ERROR: A label with a destination prefix is placed on position of a source prefix (Address = %03d)!! ###\n', j - 1)
    end

    % If operand is correct (source) label then replace the label with actual address the label is pointing to.
    if (c.LABEL_SRC_PREFIX == bitand(operand, c.LABEL_PREFIX_MASK, 'int64'))
        idx = bitand(operand, c.LABEL_VALUE_MASK);
        operand = label_address_array(idx);

    % The operand is neither destination nor source label. It means it is immediate value (direct address).
    else
        % Check that the operand (direct address) is in appropriate range.
        if ((operand < 0) || (operand > bin2dec('00001111 11111111')))
            error('### PREPROCESSOR ERROR: Value of immediate operand is out of range. Supported range is 0 .. 4095, actual value is %d (Address = %03d)!! ###\n', operand, j - 1)
        end
    end

    instr_msb = bitor(opcode, bitshift(operand, -8));
    instr_lsb = bitand(operand, c.BYTE_MASK);

    i = i + 1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OO|SSSS   CCCCCCCC
%
% Example 1:  opcode | op1  | op2
%            --------+------+-----
%              LOADI |  r0  | m(5) 
% 
% Example 2:  opcode | op1  | op2                         opcode | op1 | op2
%            --------+------+-----  will be compiled to  --------+-----+-----
%             STOREI | m(5) | r0                          STOREI | r0  | m(5) 
%
% The reason for this swap of operands is that we want to have destination
% operand always on left side (for unification of all data transfer instructions).
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_1(src_code, opcode, label_address_array, i, j, c)
    % Read first operand.
    op1 = src_code(1, i);
    i = i + 1;
    
    % Read second operand.
    op2 = src_code(1, i);
    i = i + 1;


    if (c.STOREI == opcode)
        % Check that first operand is in appropriate range.
        if ((op1 < -128) || (op1 > 255))
            error('### PREPROCESSOR ERROR: Value of immediate operand is out of range. Supported range is <-128, +127> for signed data and <0, 255> for unsigned data. Actual value is %d!! (Address = %03d) ###\n', op1, j - 1)
        end

        instr_msb = bitor(opcode, op2);
        instr_lsb = op1;
    else
        % Check that second operand is in appropriate range.
        if (c.SHIFT == opcode)
            if ((op2 < -15) || (op2 > 15))
                error('### PREPROCESSOR ERROR: Value of immediate operand is out of range. Supported range is <-15, +15>. Actual value is %d!! (Address = %03d) ###\n', op2, j - 1)
            end
        else
            if ((op2 < -128) || (op2 > 255))
                error('### PREPROCESSOR ERROR: Value of immediate operand is out of range. Supported range is <-128, +127> for signed data and <0, 255> for unsigned data. Actual value is %d!! (Address = %03d) ###\n', op2, j - 1)
            end
        end

        instr_msb = bitor(opcode, op1);
        instr_lsb = op2;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD   CCCCCCCC
%
% Example:  opcode | op1 | op2 
%          --------+-----+-----
%             ADDI | r0  | 25  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_2(src_code, opcode, i, j)
    op1 = src_code(1, i);
    instr_msb = bitor(opcode, op1);
    i = i + 1;
    
    op2 = src_code(1, i);
    instr_lsb = op2;
    i = i + 1;

    % Check that second operand is in appropriate range.
    if ((op2 < -128) || (op2 > 255))
        error('### PREPROCESSOR ERROR: Value of immediate operand is out of range. Supported range is <-128, +127> for signed data and <0, 255> for unsigned data. Actual value is %d!! (Address = %03d) ###\n', op2, j - 1)
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR   DDDD|SSSS
%
% Example:  opcode | op1 | op2 
%           -------+-----+----
%              ADD | r0  | r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_3(src_code, opcode, i, c)
    instr_msb = opcode;
    instr_lsb = 0;

    op1 = 0;
    op2 = 0;

    if (c.PUSH == opcode)
        op2 = src_code(1, i);
        instr_lsb = op2;
        i = i + 1;

    elseif ((c.POP == opcode) || ...
            (c.NOT == opcode))
            % (c.NOT_USED == opcode) || ...
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


function print_source_code(compiledCode, instr_msb, instr_lsb, uint8_instr_msb, uint8_instr_lsb, j, c)
    fprintf('|   %03d:  |    0x%04X   | 0x%02X | 0x%02X |', c.ROM_START + j - 1, compiledCode(1, j), uint8_instr_msb, uint8_instr_lsb)

    switch (bitand(instr_msb, c.INSTR_FORMAT_MASK))
        case c.INSTR_FORMAT_0
            switch (bitor(bitand(instr_msb, c.FORMAT_0_OPCODE_MASK), c.INSTR_FORMAT_0))
                case c.CALL
                    fprintf('   CALL    m(%04d)            |', bitor(bitshift(bitand(c.FORMAT_0_OPERAND_1_MASK, instr_msb), 8), instr_lsb))

                case c.JMP
                    fprintf('   JMP     m(%04d)            |', bitor(bitshift(bitand(c.FORMAT_0_OPERAND_1_MASK, instr_msb), 8), instr_lsb))

                case c.JPE
                    fprintf('   JPE     m(%04d)            |', bitor(bitshift(bitand(c.FORMAT_0_OPERAND_1_MASK, instr_msb), 8), instr_lsb))

                case c.JNE
                    fprintf('   JNE     m(%04d)            |', bitor(bitshift(bitand(c.FORMAT_0_OPERAND_1_MASK, instr_msb), 8), instr_lsb))
            end
        case c.INSTR_FORMAT_1
            switch (bitor(bitand(instr_msb, c.FORMAT_1_OPCODE_MASK), c.INSTR_FORMAT_1))
                case c.CMPI
                    fprintf('   CMPI    r%d      %-4d       |', bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK), instr_lsb)

                % case c.TIR

                case c.STOREI
                    fprintf('   STOREI  m(%03d)  r%d         |', instr_lsb, bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK))

                case c.SHIFT
                    fprintf('   SHIFT   r%d      %-4d       |', bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK), instr_lsb)
            end

        case c.INSTR_FORMAT_2
            switch (bitor(bitand(instr_msb, c.FORMAT_2_OPCODE_MASK), c.INSTR_FORMAT_2))
                case c.ADDI
                    fprintf('   ADDI    r%d      %-4d       |', bitand(instr_msb, c.FORMAT_2_OPERAND_1_MASK), instr_lsb)

                case c.LOADI
                    fprintf('   LOADI   r%d      m(%03d)     |', bitand(instr_msb, c.FORMAT_2_OPERAND_1_MASK), instr_lsb)

                case c.MOVU
                    fprintf('   MOVU    r%d      %-4d       |', bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK), instr_lsb)

                case c.MOVL
                    fprintf('   MOVL    r%d      %-4d       |', bitand(instr_msb, c.FORMAT_2_OPERAND_1_MASK), instr_lsb)
            end

        case c.INSTR_FORMAT_3
            switch (bitor(bitand(instr_msb, c.FORMAT_3_OPCODE_MASK), c.INSTR_FORMAT_3))
                case c.NOT
                    fprintf('   NOT     r%d                 |',  bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4))

                case c.XOR
                    fprintf('   XOR     r%d      r%d         |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.OR
                    fprintf('   OR      r%d      r%d         |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.AND
                    fprintf('   AND     r%d      r%d         |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.SPX0
                    fprintf('   SPX0    r%d      r%d         |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.SPX1
                    fprintf('   SPX1    r%d      r%d         |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.CMP
                    fprintf('   CMP     r%d      r%d         |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.RET
                    fprintf('   RET                        |\n')

                case c.POP
                    fprintf('   POP     r%d                 |',  bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4))

                case c.PUSH
                    fprintf('   PUSH    r%d                 |', bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                % case c.NOT_USED
                %     fprintf('   NOT_USED     r%d                 |',  bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4))

                case c.ADD
                    fprintf('   ADD     r%d      r%d         |',  bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.GPX
                    fprintf('   GPX     r%d      r%d        |',  bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.TRR
                    fprintf('   TRR     r%d      r%d        |',  bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.TMR
                    fprintf('   TMR     r%d      r%d        |',  bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.STORE
                    fprintf('   STORE   m(r%d)   r%d         |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.LOAD
                    fprintf('   LOAD    r%d      m(r%d)      |', bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))

                case c.MOV
                    fprintf('   MOV     r%d      r%d        |',  bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4), bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK))
            end
    end

    fprintf('\n')
end


% Convert ROM code represented by uint16 numbers to the structure type which can be consumed
% by simulink data bus.
function [RomCode_struct] = convert_uint16_to_struct(RomCode_uint16)
    for (i = 1 : size(RomCode_uint16, 2))
        temp = uint16(RomCode_uint16(i));

        % signal1 is MSB, signal16 is LSB
        temp_struct.signal1  = bitshift(bitand(temp, bin2dec('1000 0000  0000 0000')), -15);
        temp_struct.signal2  = bitshift(bitand(temp, bin2dec('0100 0000  0000 0000')), -14);
        temp_struct.signal3  = bitshift(bitand(temp, bin2dec('0010 0000  0000 0000')), -13);
        temp_struct.signal4  = bitshift(bitand(temp, bin2dec('0001 0000  0000 0000')), -12);
        temp_struct.signal5  = bitshift(bitand(temp, bin2dec('0000 1000  0000 0000')), -11);
        temp_struct.signal6  = bitshift(bitand(temp, bin2dec('0000 0100  0000 0000')), -10);
        temp_struct.signal7  = bitshift(bitand(temp, bin2dec('0000 0010  0000 0000')), -9);
        temp_struct.signal8  = bitshift(bitand(temp, bin2dec('0000 0001  0000 0000')), -8);
        temp_struct.signal9  = bitshift(bitand(temp, bin2dec('0000 0000  1000 0000')), -7);
        temp_struct.signal10 = bitshift(bitand(temp, bin2dec('0000 0000  0100 0000')), -6);
        temp_struct.signal11 = bitshift(bitand(temp, bin2dec('0000 0000  0010 0000')), -5);
        temp_struct.signal12 = bitshift(bitand(temp, bin2dec('0000 0000  0001 0000')), -4);
        temp_struct.signal13 = bitshift(bitand(temp, bin2dec('0000 0000  0000 1000')), -3);
        temp_struct.signal14 = bitshift(bitand(temp, bin2dec('0000 0000  0000 0100')), -2);
        temp_struct.signal15 = bitshift(bitand(temp, bin2dec('0000 0000  0000 0010')), -1);
        temp_struct.signal16 = bitshift(bitand(temp, bin2dec('0000 0000  0000 0001')),  0);

        RomCode_struct(i) = temp_struct;
    end
end