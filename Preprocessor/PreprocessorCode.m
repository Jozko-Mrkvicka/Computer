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

    % Initialize whole instruction ROM memory with zeros. Zeros will be interpreted as JMP m(0x0000).
    % compiledSourceCode(1 : c.ROM_SIZE) = uint16(0);

% [compiledData] = compile_const_data(sourceData, c);

% Check if there are any labels in the code (it means if variable c.LBL_CNT does exist).
% if (1 == isfield(c, 'LBL_CNT'))
%     [label_address_array] = find_all_destination_labels(sourceCode, start_addr, c);
% else
%     label_address_array = 0;
% end

    if (0 < labelCount)
        [label_address_array] = find_all_destination_labels(sourceCode, start_addr, labelCount, c);
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
        if (c.LABEL_DEST_PREFIX == bitand(value, c.LABEL_PREFIX_MASK))
            i = i + 1;

            % Read next value on particular line of a processed source code.
            value = sourceCode(1, i);
        end
        i = i + 1;

        % Compile an instruction according to its format.
        switch (bitand(value, c.INSTR_FORMAT_MASK))
            case c.INSTR_FORMAT_0
                [instr_msb, instr_lsb, i] = compile_instr_format_0(sourceCode, value, label_address_array, i, j, c);

            case c.INSTR_FORMAT_1
                [instr_msb, instr_lsb, i] = compile_instr_format_1(sourceCode, value, label_address_array, i, j, c);

            case c.INSTR_FORMAT_2
                [instr_msb, instr_lsb, i] = compile_instr_format_2(sourceCode, value, i, j);

            case c.INSTR_FORMAT_3
                [instr_msb, instr_lsb, i] = compile_instr_format_3(sourceCode, value, i, c);

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

        compiledSourceCode(1, j) = bitor(bitshift(uint16(uint8_instr_msb), 8), uint16(uint8_instr_lsb));
        if (true == gDebug)
            print_source_code(compiledSourceCode, instr_msb, instr_lsb, uint8_instr_msb, uint8_instr_lsb, j, c);
        end

        j = j + 1;
    end

    % Check that compiled code will fit into ROM memory.
    if (size(compiledSourceCode, 2) > c.ROM_SIZE)
        error('###\nPREPROCESSOR ERROR: Binary image is bigger than available size of ROM memory!!\nAvailable ROM memory: %d (words)\nActual image size:    %d (words)\n###', c.ROM_SIZE, size(compiledSourceCode, 2))
    end

    if (true == gDebug)
        fprintf('+---------+-------------+------+------+------------------------------+\n');
    end

    % TODO: Fix or delete.
    % compiledSourceCode = convert_uint16_to_struct(compiledSourceCode);
    % compiledData = convert_uint16_to_struct(compiledData);
end


% % TODO: Fix or delete.
% function [compiledData] = compile_const_data(data, c)

%     % Initialize whole constant data ROM memory with zeros.
%     compiledData(1:c.CONST_DATA_SIZE) = uint8(0);

%     % The counter "i" counts number of values in source code (datatype keywords, constant keywords and values itself ... all together). 
%     i = 1;

%     % The counter "j" counts number of bytes in a compiled code.
%     j = 1;

%     % Copy data to the constant data ROM memory.
%     while (i <= size(data, 2))

%         % Read first value, it must be a datatype.
%         datatype = data{i};

%         % Move index to next value (data identifier which holds address of constant data).
%         i = i + 1;

%         % Move to data MSB byte.
%         i = i + 1;

%         switch (datatype)
%             % case c.U16
%             %     if (c.CONST_DATA_SIZE < j)
%             %         error('### PREPROCESSOR ERROR: Not enough memory for constant data!! ###')
%             %     end

%             %     if ((0 <= data{i}) && (65535 >= data{i}))
%             %         compiledData(j) = data{i};
%             %     else
%             %         error('### PREPROCESSOR ERROR: A constant does not fit into the range of the U16 type!! Range of U16 type is <0, +65535>. ###')
%             %     end

%             %     % Skip already read data and move index to next constant.
%             %     i = i + 1;
%             %     j = j + 1;


%             % case c.S16
%             %     if (c.CONST_DATA_SIZE < j)
%             %         error('### PREPROCESSOR ERROR: Not enough memory for constant data!! ###')
%             %     end

%             %     % <-32768 .. -1>
%             %     if ((-32768 <= data{i}) && (-1 >= data{i}))
%             %         temp = int16(data{i});
%             %         compiledData(j) = uint16(intmax('uint16')) - uint16(bitcmp(temp));

%             %     % <0 .. +32767>
%             %     elseif ((0 <= data{i}) && (32767 >= data{i}))
%             %         compiledData(j) = uint16(data{i});

%             %     % <+32768 .. +65535>, values in this range will be interpreted as negative.
%             %     elseif ((32768 <= data{i}) && (65535 >= data{i}))
%             %         temp = int16(data{i} - 65536);
%             %         compiledData(j) = uint16(intmax('uint16')) - uint16(bitcmp(temp));

%             %     else
%             %         error('### PREPROCESSOR ERROR: A constant does not fit into the range of the S16 type!! Range of S16 type is <-32768, +32767>. ###')
%             %     end

%             %     % Skip already read data and move index to next constant.
%             %     i = i + 1;
%             %     j = j + 1;

%             % TODO: Fix or delete.
%           case c.U8
%               if ((0 <= data(i)) && (255 >= data(i)))
%                   compiledData(j) = uint8(data(i));
%                 else
%                   error('### PREPROCESSOR ERROR: A constant does not fit into the range of the U8 type!! Range of U8 type is <0, +255>. ###')
%                 end

%               % Skip already read data and move index to next constant.
%               i = i + 1;
%               j = j + 1;

%             % TODO: Fix or delete.
%     %       case c.S8
%                 % if ((0 <= data(i)) && (127 >= data(i)))      % If value is in range <0, +127> then store it directly.
%                 %   compiledData(j) = data(i);

%                 % elseif (-128 <= data(i)) && (0 > data(i))    % If value is in range <-128, -1> then store two`s complement of the value.
%                 %   temp = int16(data(i));
%                 %   compiledData(j) = uint16(intmax('uint16')) - uint16(bitcmp(temp));

%                 % elseif (128 <= data(i)) && (255 >= data(i))  % If value is in range <+128, +255> then store two`s complement of the value.
%                 %   temp = int16(-data(i));
%                 %   temp = int16(intmax('uint8')) - int16(bitcmp(temp));
%                 %   temp = -temp;
%                 %   compiledData(j) = uint16(intmax('uint16')) - uint16(bitcmp(temp));

%                 % else
%                 %   error('### PREPROCESSOR ERROR: A constant does not fit into the range of the S8 type!! Range of S8 type is <-128, +127>. ###')

%                 % end

%                 % Skip already read data and move index to next constant.
%                 % i = i + 1;
%                 % j = j + 1;


%      %        case c.CHR
%      %            str = uint16(data{i});

%      %            % If length of a string is odd then add zero at the end to terminate it properly and also to make it even.
%      %            if (1 == mod(size(str, 2), 2))
%      %                str(size(str, 2) + 1) = 0;
%      %            % If length of a string is already even then add two zeros at the end to terminate it properly.
%      %            else
%      %                str(size(str, 2) + 2) = 0;
%      %            end

%      %            idx = 1;
%      %            while (size(str, 2) >= idx)
%      %                if (c.CONST_DATA_SIZE < j)
%      %                    error('### PREPROCESSOR ERROR: Not enough memory for constant data!! ###')
%      %                end

%      %                temp1 = str(idx);
%      %                idx = idx + 1;

%      %                temp2 = str(idx);
%      %                idx = idx + 1;

%      %                temp1 = uint16(bitshift(temp1, 8));
%      %                compiledData(j) = uint16(bitor(temp1, temp2));

%      %                j = j + 1;

%      %                % TODO: Fix or delete.
%      %                % dec2hex(compiledData, 4)
%      % %                size(str, 2)
%      %            end

%                 i = i + 1;


%             otherwise
%                 error('### PREPROCESSOR ERROR: Incorrect datatype!! ###')
%         end
%     end

% end


function [label_address_array] = find_all_destination_labels(src_code, start_addr, labelCount, c)
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
        if (c.LABEL_SRC_PREFIX == bitand(value, c.LABEL_PREFIX_MASK))
            error('### PREPROCESSOR ERROR: A label with a source prefix is placed on position of a destination prefix (Address = %03d)!! ###\n', j)
        end

        % Check if the first value on line is destination label (for example LABEL_).
        % If yes then save the address of the particular line (address of destination label).
        if (c.LABEL_DEST_PREFIX == bitand(value, c.LABEL_PREFIX_MASK))
            idx = bitand(value, c.LABEL_VALUE_MASK);

            if (label_address_array(idx) ~= 0xFFFFFFFFFFFFFFFF)
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
                % Add here all instructions with single operand.
                if ((c.PUSH == value) || (c.POP == value) || (c.NOT == value) || (c.SGMT == value))
                    i = i + 1;

                % Add here all instructions with no operands.
                elseif (c.RET == value)
                    % Do nothing.

                % Add here all instructions with two operands.
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

    % Check that there is a source label on the operand position, not a destionation label.
    if (c.LABEL_DEST_PREFIX == bitand(operand, c.LABEL_PREFIX_MASK))
        error('### PREPROCESSOR ERROR: A label with a destination prefix is placed on position of a source prefix (Address = %03d)!! ###\n', j - 1)
    end

    % If operand is correct (source) label then replace the label with actual address the label is pointing to.
    if (c.LABEL_SRC_PREFIX == bitand(operand, c.LABEL_PREFIX_MASK))
        idx = bitand(operand, c.LABEL_VALUE_MASK);
        operand = uint16(label_address_array(idx));

    % The operand is neither destination nor source label. It means it is immediate value (direct address).
    else
        % Check that the operand (direct address) is in appropriate range.
        if ((operand < 0) || (operand > 0b0000111111111111u16))
            error('### PREPROCESSOR ERROR: Value of immediate operand is out of range. Supported range is 0 .. 4095, actual value is %d (Address = %03d)!! ###\n', operand, j - 1)
        end
    end

    instr_msb = bitor(int8(opcode), int8((bitshift(operand, -8))));
    instr_lsb = bitand(uint8(operand), uint8(c.BYTE_MASK));

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
function [instr_msb, instr_lsb, i] = compile_instr_format_1(src_code, opcode, label_address_array, i, j, c)
    op1 = 0;
    op2 = 0;

    if ((c.STLI == opcode) || (c.STUI == opcode))
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

    elseif (c.SGMT == opcode)
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
        if (c.SHIFTI == opcode)
            % op2 is unsigned (uint16) and I just haven`t found a way how to convert it to signed (int8), therefore I check range in unsigned arithmetic.
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


function print_source_code(compiledSourceCode, instr_msb, instr_lsb, uint8_instr_msb, uint8_instr_lsb, j, c)
    fprintf('|   %03d:  |    0x%04X   | 0x%02X | 0x%02X |', j - 1, compiledSourceCode(1, j), uint8_instr_msb, uint8_instr_lsb)

    switch (bitand(uint8(instr_msb), uint8(c.INSTR_FORMAT_MASK)))
        case c.INSTR_FORMAT_0
            string1 = bitor(bitshift(bitand(uint8(c.FORMAT_0_OPERAND_1_MASK), uint8(instr_msb)), 8), instr_lsb);
            switch (bitor(int8(bitand(int8(instr_msb), int8(c.FORMAT_0_OPCODE_MASK))), int8(c.INSTR_FORMAT_0)))
                case c.CALL,  fprintf('   CALL    m(%04d)            |', string1)
                case c.JMP,   fprintf('   JMP     m(%04d)            |', string1)
                case c.JPE,   fprintf('   JPE     m(%04d)            |', string1)
                case c.JLT,   fprintf('   JLT     m(%04d)            |', string1)
            end

        case c.INSTR_FORMAT_1
            switch (bitor(bitand(instr_msb, c.FORMAT_1_OPCODE_MASK), c.INSTR_FORMAT_1))
                case c.CMPI,   fprintf('   CMPI    r%d      %-4d       |', bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK), instr_lsb)
                case c.STLI,   fprintf('   STLI    m(%03d)  r%d         |', instr_lsb, bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK))
                case c.STUI,   fprintf('   STUI    m(%03d)  r%d         |', instr_lsb, bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK))
                case c.SHIFTI, fprintf('   SHIFTI  r%d      %-4d       |', bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK), instr_lsb)
                case c.SGMT,   fprintf('   SGMT    %03d                |', instr_lsb)
            end

        case c.INSTR_FORMAT_2
            string1 = bitand(instr_msb, c.FORMAT_2_OPERAND_1_MASK);
            string2 = instr_lsb;
            switch (bitor(bitand(instr_msb, c.FORMAT_2_OPCODE_MASK), c.INSTR_FORMAT_2))
                case c.ADDI,  fprintf('   ADDI    r%d      %-4d       |',  string1, string2)
                case c.LDLI,  fprintf('   LDLI    r%d      m(%03d)     |', string1, string2)
                case c.LDUI,  fprintf('   LDUI    r%d      m(%03d)     |', string1, string2)
                case c.MOVU,  fprintf('   MOVU    r%d      %-4d       |',  bitand(instr_msb, c.FORMAT_1_OPERAND_1_MASK), string2)
                case c.MOVL,  fprintf('   MOVL    r%d      %-4d       |',  string1, string2)
            end

        case c.INSTR_FORMAT_3
            string1 = bitshift(bitand(instr_lsb, c.FORMAT_3_OPERAND_1_MASK), -4);
            string2 = bitand(instr_lsb, c.FORMAT_3_OPERAND_2_MASK);
            switch (bitor(bitand(instr_msb, c.FORMAT_3_OPCODE_MASK), c.INSTR_FORMAT_3))
                case c.NOT,    fprintf('   NOT     r%d                 |',  string1)
                case c.XOR,    fprintf('   XOR     r%d      r%d         |', string1, string2)
                case c.OR,     fprintf('   OR      r%d      r%d         |', string1, string2)
                case c.AND,    fprintf('   AND     r%d      r%d         |', string1, string2)
                case c.LDL,    fprintf('   LDL     r%d      m(r%d)      |', string1, string2)
                case c.LDU,    fprintf('   LDU     r%d      m(r%d)      |', string1, string2)
                case c.CMP,    fprintf('   CMP     r%d      r%d         |', string1, string2)
                case c.RET,    fprintf('   RET                        |\n')
                case c.POP,    fprintf('   POP     r%d                 |',  string1)
                case c.PUSH,   fprintf('   PUSH    r%d                 |',  string2)
                case c.SHIFT,  fprintf('   SHIFT   r%d      r%d         |', string1, string2)
                case c.ADD,    fprintf('   ADD     r%d      r%d         |', string1, string2)
                % case c.NOT_USED,  fprintf('   NOT_USED     r%d      r%d        |',  string1, string2)
                case c.STL,    fprintf('   STL     m(r%d)   r%d         |', string1, string2)
                case c.STU,    fprintf('   STU     m(r%d)   r%d         |', string1, string2)
                % case c.NOT_USED,   fprintf('   NOT_USED    r%d      m(r%d)      |', string1, string2)
                case c.MOV,    fprintf('   MOV     r%d      r%d        |',  string1, string2)
            end
    end

    fprintf('\n')
end


% TODO: Fix or delete.
% Convert ROM code represented by uint16 numbers to the structure type which can be consumed
% by simulink data bus.
% function [RomCode_struct] = convert_uint16_to_struct(RomCode_uint16)
%     for (i = 1 : size(RomCode_uint16, 2))
%         temp = uint16(RomCode_uint16(i));

%         % signal1 is MSB, signal16 is LSB
%         temp_struct.signal1  = bitshift(bitand(temp, bin2dec('1000 0000  0000 0000')), -15);
%         temp_struct.signal2  = bitshift(bitand(temp, bin2dec('0100 0000  0000 0000')), -14);
%         temp_struct.signal3  = bitshift(bitand(temp, bin2dec('0010 0000  0000 0000')), -13);
%         temp_struct.signal4  = bitshift(bitand(temp, bin2dec('0001 0000  0000 0000')), -12);
%         temp_struct.signal5  = bitshift(bitand(temp, bin2dec('0000 1000  0000 0000')), -11);
%         temp_struct.signal6  = bitshift(bitand(temp, bin2dec('0000 0100  0000 0000')), -10);
%         temp_struct.signal7  = bitshift(bitand(temp, bin2dec('0000 0010  0000 0000')), -9);
%         temp_struct.signal8  = bitshift(bitand(temp, bin2dec('0000 0001  0000 0000')), -8);
%         temp_struct.signal9  = bitshift(bitand(temp, bin2dec('0000 0000  1000 0000')), -7);
%         temp_struct.signal10 = bitshift(bitand(temp, bin2dec('0000 0000  0100 0000')), -6);
%         temp_struct.signal11 = bitshift(bitand(temp, bin2dec('0000 0000  0010 0000')), -5);
%         temp_struct.signal12 = bitshift(bitand(temp, bin2dec('0000 0000  0001 0000')), -4);
%         temp_struct.signal13 = bitshift(bitand(temp, bin2dec('0000 0000  0000 1000')), -3);
%         temp_struct.signal14 = bitshift(bitand(temp, bin2dec('0000 0000  0000 0100')), -2);
%         temp_struct.signal15 = bitshift(bitand(temp, bin2dec('0000 0000  0000 0010')), -1);
%         temp_struct.signal16 = bitshift(bitand(temp, bin2dec('0000 0000  0000 0001')),  0);

%         RomCode_struct(i) = temp_struct;
%     end
% end