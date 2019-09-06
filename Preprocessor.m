function compiledCode = Preprocessor(program, c)
    % clc

    % Init all labels to 0xFFFFFFFFFFFFFFFF
    for (i = 1:c.LBL_CNT)
        label_address_array(i) = hex2dec('FFFFFFFFFFFFFFFF');
    end

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
        if (c.LABEL_SRC_PREFIX == bitand(value, c.LABEL_PREFIX_MASK))
            % todo: treba vypisat podrobnosti
            % i
            % j
            % dec2bin(value)
            % dec2bin(c.LABEL_SRC_PREFIX)
            % dec2bin(c.LABEL_PREFIX_MASK)
            error('### ERROR: A label with a source prefix is placed on position of a destination prefix!!! ###')
        end

        % Check if the first value on a line is a destination label (for example LABEL_).
        % If yes then save the address of the particular line (address of destination label).
        if (c.LABEL_DEST_PREFIX == bitand(value, c.LABEL_PREFIX_MASK))
            idx = bitand(value, c.LABEL_MASK);

            % todo: treba vypisat podrobnosti
            if (label_address_array(idx) ~= hex2dec('FFFFFFFFFFFFFFFF'))
                error('### ERROR: Multiple destination labels with the same address!!! ###')
            end

            % (j - 1) => pretoze polia v matlabe su indexovane od 1 a adresovy priestor ktory pouzivam indexujem od 0
            % j
            % index = idx
            label_address_array(idx) = j - 1;
            fprintf('LABEL ADDRESS = %d\n', label_address_array(idx))
            i = i + 1;
            value = program(1, i);
        end

        switch (bitand(value, c.INSTR_FORMAT_MASK))
            case c.INSTR_FORMAT_0
                i = i + 1;

            case c.INSTR_FORMAT_1
                i = i + 3;

            case c.INSTR_FORMAT_2
                % TODO: dostat tu dajakym sposobom konstanty z Instructions.m
                % CALL = bin2dec('00 01 0000');
                % JMP  = bin2dec('00 00 0000');
                % if ((CALL ~= value) && (JMP ~= value))
                    i = i + 2;
                % else
                %     i = i + 1;
                % end

            case c.INSTR_FORMAT_3
                i = i + 2;

            otherwise
                % Error
        end

        i = i + 1;

        % posun na dalsi riadok (dalsiu instrukciu)
        j = j + 1;
    end


    % The counter "i" counts number of values in a source code (labels, instructions, operands ... all together).
    i = 1;
    % The counter "j" counts number of bytes in a compiled code (each instruction has two bytes).
    j = 1;
    while (i <= num_of_values)
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
                [instr_msb, instr_lsb, i] = compile_instr_format_3(program, value, i);

            otherwise
                % Error
        end



        compiledCode(1, j) = bitor(uint16(bitshift(instr_msb, 8)), uint16(instr_lsb));
        
        fprintf(' %03d:  | %5d  |  %3d  %3d\n', j - 1, compiledCode(1, j), instr_msb, instr_lsb)
        
        j = j + 1;



        % compiledCode(1, j) = instr_msb;
        % j = j + 1;

        % compiledCode(1, j) = instr_lsb;
        % j = j + 1;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% This format is not used yet.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_0(src_code, opcode, label_address_array, i, j, c)
    % instr_msb = 0;
    % instr_lsb = 0;

    % TODO: dostat tu dajakym sposobom konstanty z Instructions.m
    CALL = bin2dec('00 01 0000');
    JMP  = bin2dec('00 00 0000');

    op = src_code(1, i);

    % Check that on the operand position is source label, not destionation label.
    if (c.LABEL_DEST_PREFIX == bitand(op, c.LABEL_PREFIX_MASK))
        % todo: treba vypisat podrobnosti - odkial, kam
        error('### ERROR: A label with a destination prefix is placed on position of a source prefix!!! ###')
    end

    if (c.LABEL_SRC_PREFIX == bitand(op, c.LABEL_PREFIX_MASK))
        idx = bitand(op, c.LABEL_MASK);

        % Ak sa vykonava instrukcia CALL tak pouzij absolutne adresovanie.
        if (CALL == opcode)
            % This is the absolute addressing mode.
            op = label_address_array(idx)
        
        % Pre vsetky ostatne skoky pouzij relative adresovanie.
        else    
            % op = (label_address_array(idx) - (j - 1)) - 2;
            op = (label_address_array(idx) - (j - 1)) - 1;
            % if (op2 > 128)
            %     % todo: treba vypisat podrobnosti - odkial, kam
            %     error('### ERROR: jump too long!!! ###')
            % end

            op = typecast(int16(op), 'uint16');
        end
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
    instr_msb = 0;
    instr_lsb = 0;

    op1 = src_code(1, i);
    instr_msb = bitor(opcode, bitshift(op1, 1));
    i = i + 1;

    op2 = src_code(1, i);
    instr_msb = bitor(instr_msb, bitshift(op2, -2));
    instr_lsb = bitor(instr_lsb, bitshift(op2, 6));
    instr_lsb = bitand(instr_lsb, c.BYTE_MASK);  % tento riadok je tu mozno zbytocny
    i = i + 1;

    op3 = src_code(1, i);
    % Check that on the operand position is source label, not destionation label.
    if (c.LABEL_DEST_PREFIX == bitand(op3, c.LABEL_PREFIX_MASK))
        % todo: treba vypisat podrobnosti
        error('### ERROR: A label with a destination prefix is placed on position of a source prefix!!! ###')
    end

    if (c.LABEL_SRC_PREFIX == bitand(op3, c.LABEL_PREFIX_MASK))
        idx = bitand(op3, c.LABEL_MASK);

        % This is the relative addressing mode.
        % (j - 1) => pretoze polia v matlabe su indexovane od 1 a adresovy priestor ktory pouzivam indexujem od 0
        % (- 2)  => pretoze ked pripocitavam relativnu adresu ku PC, tak je PC uz posunute o dva bajty na dalsiu instrukciu. Preto sa musim o dva bajty vratit naspat.
        % op3 = (label_address_array(idx) - (j - 1)) - 2
        % LABEL = label_address_array(idx)
        % ADDRESS = j
        op3 = label_address_array(idx) - (j);

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
        % op3 = bitshift(op3, -1);

        % if (label_address_array(idx) >= (j - 1))
        %     op3 = label_address_array(idx) - (j - 1);
        % else
        %     op3 = (j - 1) - label_address_array(idx);
        % end
    end

    op3 = bitand(op3, bin2dec('0011 1111'));
    instr_lsb = bitor(instr_lsb, op3);
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
% Format 3: FF|OOOO|RR RR|DDD|SSS
%
% Example:  opcode | op1 | op2 
%           -------+-----+----
%              ADD | r0  | r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [instr_msb, instr_lsb, i] = compile_instr_format_3(src_code, opcode, i)
    instr_msb = opcode;
    instr_lsb = 0;

    op1 = src_code(1, i);
    instr_lsb = bitor(instr_lsb, bitshift(op1, 3));
    i = i + 1;

    op2 = src_code(1, i);
    instr_lsb = bitor(instr_lsb, bitshift(op2, 0));
    i = i + 1;
end




function print_instr_name(instr_msb, c)
    % fprintf('|    %03d:    |', i - 1);

    switch (bitand(instr_msb, c.INSTR_FORMAT_MASK))
    %   case c.INSTR_FORMAT_0

      case c.INSTR_FORMAT_1
          switch (bitor(bitand(instr_msb, c.FORMAT_1_OPCODE_MASK), c.INSTR_FORMAT_1))
    %           case SPX
    %               fprintf('   SPX     r%d    r%d   %3d   ', bitshift(bitand(RomCode(i), c.FORMAT_1_OPERAND_1_MASK), -1),  ...
    %                                                   bitor(bitshift(bitand(RomCode(i), c.FORMAT_1_OPERAND_2_MASK), 2), bitshift(RomCode(i + 1), -6)),  ...
    %                                                   bitand(RomCode(i + 1), c.FORMAT_1_OPERAND_3_MASK))
    %           case JNE
    %               fprintf('   JNE     r%d    r%d   %3d   ', bitshift(bitand(RomCode(i), c.FORMAT_1_OPERAND_1_MASK), -1),  ...
    %                                                   bitor(bitshift(bitand(RomCode(i), c.FORMAT_1_OPERAND_2_MASK), 2), bitshift(RomCode(i + 1), -6)),  ...
    %                                                   bitand(RomCode(i + 1), c.FORMAT_1_OPERAND_3_MASK))
    %           case JPE
    %               fprintf('   JPE     r%d    r%d   %3d   ', bitshift(bitand(RomCode(i), c.FORMAT_1_OPERAND_1_MASK), -1),  ...
    %                                                   bitor(bitshift(bitand(RomCode(i), c.FORMAT_1_OPERAND_2_MASK), 2), bitshift(RomCode(i + 1), -6)),  ...
    %                                                   bitand(RomCode(i + 1), c.FORMAT_1_OPERAND_3_MASK))
          end

    %   case c.INSTR_FORMAT_2
    %       switch (bitor(bitand(RomCode(i), c.FORMAT_2_OPCODE_MASK), c.INSTR_FORMAT_2))
    %           case CALL
    %               fprintf('   CALL   %3d               ', RomCode(i + 1))
    %           case JMP
    %               fprintf('   JMP    %3d               ', RomCode(i + 1))
    %           case ADDI
    %               fprintf('   ADDI    r%d   %3d         ', bitand(RomCode(i), c.FORMAT_2_OPERAND_MASK), RomCode(i + 1))
    %           case TIR
    %               fprintf('   TIR     r%d   %3d         ', bitand(RomCode(i), c.FORMAT_2_OPERAND_MASK), RomCode(i + 1))
    %           case MMRI
    %               fprintf('   MMRI    r%d   %3d         ', bitand(RomCode(i), c.FORMAT_2_OPERAND_MASK), RomCode(i + 1))
    %           case MRMI
    %               fprintf('   MRMI    r%d   %3d         ', bitand(RomCode(i), c.FORMAT_2_OPERAND_MASK), RomCode(i + 1))
    %           case MRC
    %               fprintf('   MRC     r%d   %3d         ', bitand(RomCode(i), c.FORMAT_2_OPERAND_MASK), RomCode(i + 1))
    %       end

    %   case c.INSTR_FORMAT_3
    %       switch (bitor(bitand(RomCode(i), c.FORMAT_3_OPCODE_MASK), c.INSTR_FORMAT_3))
    %           case PUSH
    %               fprintf('   PUSH    r%d               ', bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_2_MASK))
    %           case RET
    %               fprintf('   RET                      ')
    %           case POP
    %               fprintf('   POP     r%d               ', bitshift(bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_1_MASK), -3))
    %           case GCH
    %               fprintf('   GCH     r%d    r%d         ', bitshift(bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_1_MASK), -3), bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_2_MASK))
    %           case ADD
    %               fprintf('   ADD     r%d    r%d        ', bitshift(bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_1_MASK), -3), bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_2_MASK))
    %           case GPX
    %               fprintf('   GPX     r%d    r%d        ', bitshift(bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_1_MASK), -3), bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_2_MASK))
    %           case TRR
    %               fprintf('   TRR     r%d    r%d        ', bitshift(bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_1_MASK), -3), bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_2_MASK))
    %           case TMR
    %               fprintf('   TMR     r%d    r%d        ', bitshift(bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_1_MASK), -3), bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_2_MASK))
    %           case MMR
    %               fprintf('   MMR     r%d    r%d         ', bitshift(bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_1_MASK), -3), bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_2_MASK))
    %           case MRM
    %               fprintf('   MRM     r%d    r%d         ', bitshift(bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_1_MASK), -3), bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_2_MASK))
    %           case MRR
    %               fprintf('   MRR     r%d    r%d        ', bitshift(bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_1_MASK), -3), bitand(RomCode(i + 1), c.FORMAT_3_OPERAND_2_MASK))
    %       end
    end

    % fprintf('   |    %3d       |\n', RomCode(i))
end
