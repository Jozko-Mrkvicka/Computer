function [compiledSourceCode] = PreprocessorCode(sourceCode, labelCount)
    global gDebug
    Definitions
    Instructions

    % Check also Run_System_Tests.m for "gDebug"
    % gDebug = true;
    gDebug = false;

    start_addr = 0x0000;

    if (true == gDebug)
        fprintf('\n');
        fprintf('+--------------------------------------------------------------------+\n');
        fprintf('|                       Assembler Preprocessor                       |\n');
        fprintf('+---------+-------------+------+------+------------------------------+\n');
        fprintf('| ADDRESS | INSTRUCTION | MSB  | LSB  |             CODE             |\n');
        fprintf('+---------+-------------+------+------+------------------------------+\n');
    end

    if (0 < labelCount)
        [label_address_array] = find_all_destination_labels(sourceCode, start_addr, labelCount);
    else
        label_address_array = 0;
    end

    % The counter "i" counts number of values in a source code (labels, instructions, operands ... all together).
    i = 1;
    % The counter "j" counts number of words/instructions/lines in a compiled code (each instruction has two bytes).
    j = start_addr + 1;
    while (i <= size(sourceCode, 2))
        % Read first value on particular line of a processed source code.
        value = sourceCode(1, i);

        % If the value is a destination label then skip it.
        if (LABEL_DEST_PREFIX == bitand(value, LABEL_PREFIX_MASK))
            i = i + 1;

            % Read next value on particular line of a processed source code.
            value = sourceCode(1, i);
        end
        i = i + 1;

        % Compile an instruction according to its format.
        switch (bitand(value, INSTR_FORMAT_MASK))
            case INSTR_FORMAT_0;  [instr_msb, instr_lsb, i] = compile_instr_format_0(sourceCode, value, label_address_array, i, j);
            case INSTR_FORMAT_1;  [instr_msb, instr_lsb, i] = compile_instr_format_1(sourceCode, value, label_address_array, i, j);
            case INSTR_FORMAT_2;  [instr_msb, instr_lsb, i] = compile_instr_format_2(sourceCode, value, i, j);
            case INSTR_FORMAT_3;  [instr_msb, instr_lsb, i] = compile_instr_format_3(sourceCode, value, i);
            otherwise
                error('### PREPROCESSOR ERROR: Unknown instruction format!! (line number %d) ###', j);
        end

        % Convert variable of double type to uint8 type.
        temp = int16(instr_msb);
        temp = typecast(temp, 'uint8');
        uint8_instr_msb = temp(1);

        % Convert variable of double type to uint8 type.
        temp = int16(instr_lsb);
        temp = typecast(temp, 'uint8');
        uint8_instr_lsb = temp(1);

        compiledSourceCode(1, j) = bitor(bitshift(uint16(uint8_instr_msb), 8), uint16(uint8_instr_lsb));
        if (true == gDebug)
            print_source_code(compiledSourceCode, instr_msb, instr_lsb, uint8_instr_msb, uint8_instr_lsb, j);
        end

        j = j + 1;
    end

    % Check that compiled code will fit into ROM memory.
    if (size(compiledSourceCode, 2) > ROM_SIZE)
        error('###\nPREPROCESSOR ERROR: Binary image is bigger than available size of ROM memory!!\nAvailable ROM memory: %d (words)\nActual image size:    %d (words)\n###', ROM_SIZE, size(compiledSourceCode, 2))
    end

    if (true == gDebug)
        fprintf('+---------+-------------+------+------+------------------------------+\n');
    end
end


function [label_address_array] = find_all_destination_labels(src_code, start_addr, labelCount)
    Definitions
    Instructions

    % Init all labels to 0xFFFFFFFFFFFFFFFF
    for (i = 1 : labelCount)
        label_address_array(i) = 0xFFFFFFFFFFFFFFFF;
    end

    % The counter "i" counts number of values in a source code (labels, instructions, operands ... all together).
    i = 1;
    % The counter "j" counts number of bytes in a compiled code (each instruction has two bytes).
    j = start_addr;
    % Go through the program and save all addresses of destination labels.
    while (i <= size(src_code, 2))
        value = src_code(1, i);

        % Check that there is a destination label on the label position, not a source label.
        if (LABEL_SRC_PREFIX == bitand(value, LABEL_PREFIX_MASK))
            error('### PREPROCESSOR ERROR: A label with a source prefix is placed on position of a destination prefix (Address = %03d)!! ###\n', j)
        end

        % Check if the first value on line is destination label (for example LABEL_).
        % If yes then save the address of the particular line (address of destination label).
        if (LABEL_DEST_PREFIX == bitand(value, LABEL_PREFIX_MASK))
            idx = bitand(value, LABEL_VALUE_MASK);

            if (label_address_array(idx) ~= 0xFFFFFFFFFFFFFFFF)
                error('### PREPROCESSOR ERROR: Multiple destination labels with the same address!! ###')
            end

            % Save current address to the label array.
            label_address_array(idx) = j;
            i = i + 1;
            value = src_code(1, i);
        end

        switch (bitand(value, INSTR_FORMAT_MASK))
            case INSTR_FORMAT_0
                i = i + 1;

            case INSTR_FORMAT_1
                i = i + 2;

            case INSTR_FORMAT_2
                i = i + 2;

            case INSTR_FORMAT_3
                % Add here all instructions with single operand.
                if ((PUSH == value) || (POP == value) || (NOT == value) || (SGMT == value))
                    i = i + 1;

                % Add here all instructions with no operands.
                elseif (RET == value)
                    % Do nothing.

                % Add here all instructions with two operands.
                else
                    i = i + 2;
                end

            otherwise
                error('### PREPROCESSOR ERROR: Unknown instruction format!! (line number %d) ###', 2*j);
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
function [instr_msb, instr_lsb, i] = compile_instr_format_0(src_code, opcode, label_address_array, i, j)
    Definitions

    operand = src_code(1, i);

    % Check that there is a source label on the operand position, not a destionation label.
    if (LABEL_DEST_PREFIX == bitand(operand, LABEL_PREFIX_MASK))
        error('### PREPROCESSOR ERROR: A label with a destination prefix is placed on position of a source prefix (Address = %03d)!! ###\n', j - 1)
    end

    % If operand is correct (source) label then replace the label with actual address the label is pointing to.
    if (LABEL_SRC_PREFIX == bitand(operand, LABEL_PREFIX_MASK))
        idx = bitand(operand, LABEL_VALUE_MASK);
        operand = uint16(label_address_array(idx));

    % The operand is neither destination nor source label. It means it is immediate value (direct address).
    else
        % Check that the operand (direct address) is in appropriate range.
        if ((operand < 0) || (operand > 0b0000111111111111u16))
            error('### PREPROCESSOR ERROR: Value of immediate operand is out of range. Supported range is 0 .. 4095, actual value is %d (Address = %03d)!! ###\n', operand, j - 1)
        end
    end

    instr_msb = bitor(int8(opcode), int8((bitshift(operand, -8))));
    instr_lsb = bitand(uint8(operand), uint8(BYTE_MASK));

    i = i + 1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OOO|SSS   CCCCCCCC
%
% Example 1:  opcode | op1  | op2
%            --------+------+-----
%               LDLI |  r0  | m(5) 
% 
% Example 2:  opcode | op1  | op2                         opcode | op1 | op2
%            --------+------+-----  will be compiled to  --------+-----+-----
%               STLI | m(5) | r0                            STLI | r0  | m(5) 
%
% The reason for this swap of operands is that we want to have destination
% operand always on left side (for unification of all data transfer instructions).
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_1(src_code, opcode, label_address_array, i, j)
    Instructions

    op1 = 0;
    op2 = 0;

    if ((STLI == opcode) || (STUI == opcode))
        % Read first operand.
        op1 = src_code(1, i);
        i = i + 1;

        % Read second operand.
        op2 = src_code(1, i);
        i = i + 1;

        % Check that first operand is in appropriate range.
        if ((op1 < -128) || (op1 > 255))
            error('### PREPROCESSOR ERROR: Value of immediate operand is out of range. Supported range is <-128, +127> for signed data and <0, 255> for unsigned data. Actual value is %d!! (Address = %03d) ###\n', op1, j - 1)
        end

        instr_msb = bitor(opcode, op2);
        instr_lsb = op1;

    elseif (SGMT == opcode)
        % Read only second operand.
        op2 = src_code(1, i);
        i = i + 1;
        instr_msb = opcode;
        instr_lsb = op2;

    else
        % Read first operand.
        op1 = src_code(1, i);
        i = i + 1;

        % Read second operand.
        op2 = src_code(1, i);
        i = i + 1;

        % Check that second operand is in appropriate range.
        if (SHIFTI == opcode)
            % op2 is unsigned (uint16) and I just haven`t found a way how to convert it to signed (int8), therefore I check range in unsigned arithmeti
            % Check that op2 is in range <-15, +15>.
            if not(((op2 >= 0) && (op2 <= 15)) || ((op2 >= 241) || (op2 <= 255)))
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
% Format 2: FF|OOO|DDD   CCCCCCCC
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

    % TODO: Update and uncomment.
    % Check that second operand is in appropriate range.
    % if ((op2 < -128) || (op2 > 255))
    %   error('### PREPROCESSOR ERROR: Value of immediate operand is out of range. Supported range is <-128, +127> for signed data and <0, 255> for unsigned data. Actual value is %d!! (Address = %03d) ###\n', op2, j - 1)
    % end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR   R|DDD|R|SSS
%
% Example:  opcode | op1 | op2 
%           -------+-----+----
%              ADD | r0  | r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_3(src_code, opcode, i)
    Instructions

    instr_msb = opcode;
    instr_lsb = 0;

    op1 = 0;
    op2 = 0;

    if (PUSH == opcode)
        op2 = src_code(1, i);
        instr_lsb = op2;
        i = i + 1;

    elseif ((POP == opcode) || ...
            (NOT == opcode))
            % (NOT_USED == opcode) || ...
        op1 = src_code(1, i);
        instr_lsb = bitshift(op1, 4);
        i = i + 1;

    elseif (RET == opcode)
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


function print_source_code(compiledSourceCode, instr_msb, instr_lsb, uint8_instr_msb, uint8_instr_lsb, j)
    Definitions
    Instructions
    
    fprintf('|   %03d:  |    0x%04X   | 0x%02X | 0x%02X |', j - 1, compiledSourceCode(1, j), uint8_instr_msb, uint8_instr_lsb)

    switch (bitand(uint8(instr_msb), uint8(INSTR_FORMAT_MASK)))
        case INSTR_FORMAT_0
            string1 = bitor(bitshift(bitand(uint8(FORMAT_0_OPERAND_1_MASK), uint8(instr_msb)), 8), instr_lsb);
            switch (bitor(int8(bitand(int8(instr_msb), int8(FORMAT_0_OPCODE_MASK))), int8(INSTR_FORMAT_0)))
                case CALL,  fprintf('   CALL    m(%04d)            |', string1)
                case JMP,   fprintf('   JMP     m(%04d)            |', string1)
                case JPE,   fprintf('   JPE     m(%04d)            |', string1)
                case JLT,   fprintf('   JLT     m(%04d)            |', string1)
            end

        case INSTR_FORMAT_1
            switch (bitor(bitand(instr_msb, FORMAT_1_OPCODE_MASK), INSTR_FORMAT_1))
                case CMPI,   fprintf('   CMPI    r%d      %-4d       |', bitand(instr_msb, FORMAT_1_OPERAND_1_MASK), instr_lsb)
                case STLI,   fprintf('   STLI    m(%03d)  r%d         |', instr_lsb, bitand(instr_msb, FORMAT_1_OPERAND_1_MASK))
                case STUI,   fprintf('   STUI    m(%03d)  r%d         |', instr_lsb, bitand(instr_msb, FORMAT_1_OPERAND_1_MASK))
                case SHIFTI, fprintf('   SHIFTI  r%d      %-4d       |', bitand(instr_msb, FORMAT_1_OPERAND_1_MASK), instr_lsb)
                case SGMT,   fprintf('   SGMT    %03d                |', instr_lsb)
            end

        case INSTR_FORMAT_2
            string1 = bitand(instr_msb, FORMAT_2_OPERAND_1_MASK);
            string2 = instr_lsb;
            switch (bitor(bitand(instr_msb, FORMAT_2_OPCODE_MASK), INSTR_FORMAT_2))
                case ADDI,  fprintf('   ADDI    r%d      %-4d       |',  string1, string2)
                case LDLI,  fprintf('   LDLI    r%d      m(%03d)     |', string1, string2)
                case LDUI,  fprintf('   LDUI    r%d      m(%03d)     |', string1, string2)
                case MOVU,  fprintf('   MOVU    r%d      %-4d       |',  bitand(instr_msb, FORMAT_1_OPERAND_1_MASK), string2)
                case MOVL,  fprintf('   MOVL    r%d      %-4d       |',  string1, string2)
            end

        case INSTR_FORMAT_3
            string1 = bitshift(bitand(instr_lsb, FORMAT_3_OPERAND_1_MASK), -4);
            string2 = bitand(instr_lsb, FORMAT_3_OPERAND_2_MASK);
            switch (bitor(bitand(instr_msb, FORMAT_3_OPCODE_MASK), INSTR_FORMAT_3))
                case NOT,    fprintf('   NOT     r%d                 |',  string1)
                case XOR,    fprintf('   XOR     r%d      r%d         |', string1, string2)
                case OR,     fprintf('   OR      r%d      r%d         |', string1, string2)
                case AND,    fprintf('   AND     r%d      r%d         |', string1, string2)
                case LDL,    fprintf('   LDL     r%d      m(r%d)      |', string1, string2)
                case LDU,    fprintf('   LDU     r%d      m(r%d)      |', string1, string2)
                case CMP,    fprintf('   CMP     r%d      r%d         |', string1, string2)
                case RET,    fprintf('   RET                        |\n')
                case POP,    fprintf('   POP     r%d                 |',  string1)
                case PUSH,   fprintf('   PUSH    r%d                 |',  string2)
                case SHIFT,  fprintf('   SHIFT   r%d      r%d         |', string1, string2)
                case ADD,    fprintf('   ADD     r%d      r%d         |', string1, string2)
                % case NOT_USED,  fprintf('   NOT_USED     r%d      r%d        |',  string1, string2)
                case STL,    fprintf('   STL     m(r%d)   r%d         |', string1, string2)
                case STU,    fprintf('   STU     m(r%d)   r%d         |', string1, string2)
                % case NOT_USED,   fprintf('   NOT_USED    r%d      m(r%d)      |', string1, string2)
                case MOV,    fprintf('   MOV     r%d      r%d        |',  string1, string2)
            end
    end

    fprintf('\n')
end
