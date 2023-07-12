function [compiledData, compiledCode] = Assembler(fileAsm)
    clc

    % global ADDRESS_ROM_START;  ADDRESS_ROM_START = 0;
    % global ROM_SIZE;           ROM_SIZE = 32;
    % global ADDRESS_RAM_START;  ADDRESS_RAM_START = 32;
    % global RAM_SIZE;           RAM_SIZE = 32;
    % global STACK_SIZE;         STACK_SIZE = 8;

    % global g_section_const_exists;    g_section_const_exists = false;
    % global g_section_data_exists;     g_section_data_exists = false;
    % global g_section_text_exists;     g_section_text_exists = false;

    % global valid_datatypes;     valid_datatypes =    {'STR', 'UINT8', 'INT8', 'UINT16', 'INT16'};
    % global valid_registers;     valid_registers =    {'r0', 'r1', 'r2', 'r3', 'r4', 'r5', 'r6', 'r7'};
    % global valid_instructions;  valid_instructions = {'NOT', 'XOR', 'OR', 'AND', 'LOADL', 'LOADU', 'CMP', 'RET', 'POP', 'PUSH', 'SHIFT', ...
    %                                                 'ADD', 'NOT_USED', 'STOREL', 'STOREU', 'STORE', 'LOAD', 'MOV', 'ADDI', 'MOVU', ...
    %                                                 'LOADI', 'MOVL', 'SHIFTI', 'NOT_USED', 'STOREI', 'CMPI', 'JLT', 'JPE', 'CALL', 'JMP'};

    % Read source file
    % fileID = fopen(fileAsm, 'r');
    % source = removeComments(char(fread(fileID)));
    % fclose(fileID);

    % checkIfSectionsExist(source);
    % [section_const, section_data, section_text] = parseSectionsToLines(source);

    % if (true == g_section_const_exists)
    %   checkConstSection(section_const);
    %   % code.const = parseConstSection(section_const);
    % end

    % if (true == g_section_data_exists)
    %   checkDataSection(section_data);
    %   code.data = parseDataSection(section_data);
    % end

    % No need to check if the section .TEXT exists. It must always exist.
    % checkTextSection(section_text);
    % code.text = parseTextSection(section_text);


    % getWord(section_data, 1, 1)
    % fprintf(source);
    % printSection(section_const);
    % fprintf('\n');
    % printSection(section_data);
    fprintf('\n');
    % printSection(section_text);
end


% function checkConstSection(codeline)
%   global ROM_SIZE;
%   total = 0;

%   % Loop through all lines in the .CONST section.
%   for (i = 1 : size(codeline, 2))
%       word = codeline{i};
%       datatype = char(codeline{i}(1));

%       dataLen = checkDatatype(char(word(1)));
%       checkIdentifier(char(word(2)));
%       arrayLen = getArrayLen(char(word(2)));

%       % Length of data in the (data) ROM.
%       total = total + dataLen*arrayLen;

%       % The array length must be equal to the number of constants on a particular line.
%       % Example: UINT8 ARRAY[4] 0x1 0x2 0x3 0x4
%       if (arrayLen ~= (size(word, 2) - 2))
%           fprintf('Currently processed line: '); printLine(word);
%           error('### COMPILATION ERROR: Incorrect array length!! ###')
%       end

%       % Loop through all constants in a particular line.
%       for (j = 3 : size(word, 2))
%           value = checkValue(char(word(j)))
%           checkDatatypeRange(value, datatype);
%       end
%   end
    
%   if (0 > (ROM_SIZE - total))
%       fprintf('Currently processed line: '); printLine(word);
%       error('### COMPILATION ERROR: Not enough ROM memory for data!! ###')
%   end
% end


% function checkDatatypeRange(value, datatype)
%   switch (datatype)
%       case 'UINT8'
%           if ((value < 0) || (value > 255))
%               fprintf('Currently processed line: '); printLine(word);
%               error('### COMPILATION ERROR: A constant out of range of UINT8 type!! Range of UINT8 type is <0, +255>. ###')
%           end

%       case 'INT8'
%           if ((value < -128) || (value > 127))
%               fprintf('Currently processed line: '); printLine(word);
%               error('### COMPILATION ERROR: A constant out of range of INT8 type!! Range of INT8 type is <-128, +127>. ###')
%           end

%       case 'UINT16'
%           if ((value < 0) || (value > 65535))
%               fprintf('Currently processed line: '); printLine(word);
%               error('### COMPILATION ERROR: A constant out of range of UINT16 type!! Range of UINT16 type is <0, +65535>. ###')
%           end

%       case 'INT16'
%           if ((value < -32768) || (value > 32767))
%               fprintf('Currently processed line: '); printLine(word);
%               error('### COMPILATION ERROR: A constant out of range of INT16 type!! Range of INT16 type is <-32768, +32767>. ###')
%           end

%       % case 'STR'
%           % if (value < 0) || (value > 65535)
%           %   fprintf('Currently processed line: '); printLine(word);
%           %   error('### COMPILATION ERROR: A constant out of range of UINT8 type!! Range of UINT8 type is <0, +255>. ###')
%           % end
%   end
% end


% function [data] = parseDataSection(codeline)
%   global ADDRESS_RAM_START;

%   address = 0;
%   for (i = 1 : size(codeline, 2))
%       temp = char(codeline{i}(2));
%       temp = regexp(temp, '^(\w+)(\[\d+\]|\[0x[0-9a-fA-F]+\])?$', 'tokens');

%       dataLen = checkDatatype(char(codeline{i}(1)));
%       arrayLen = getArrayLen(char(codeline{i}(2)));
%       address = address + dataLen*arrayLen;

%       data(i).name =    temp{1}(1);                       % Variable name (data identifier).
%       data(i).dtype =   codeline{i}(1);                   % Datatype.
%       data(i).len =     dataLen*arrayLen;                 % Length of data in bytes.
%       data(i).address = ADDRESS_RAM_START + address - 1;  % Address of a variable in RAM counted from absolute address 0x00.
%   end
% end


% % Input parameter: Array of lines (stored in cells). Each line contains array of words (stored in cells).
% function checkDataSection(codeline)
%   global RAM_SIZE;
%   global STACK_SIZE;
%   total = 0;

%   % Loop through all lines in the .DATA section.
%   for (i = 1 : size(codeline, 2))
%       word = codeline{i};

%       if (2 ~= size(word, 2))
%           fprintf('Currently processed line: '); printLine(word);
%           error('### COMPILATION ERROR: Every line in section .DATA must contain two words: type and identifier!! ###')
%       end

%       dataLen = checkDatatype(char(word(1)));
%       checkIdentifier(char(word(2)));
%       arrayLen = getArrayLen(char(word(2)));

%       % Length of data in RAM.
%       total = total + dataLen*arrayLen;
%   end
    
%   if (0 > (RAM_SIZE - (STACK_SIZE + total)))
%       error('### COMPILATION ERROR: Not enough RAM memory for data!! ###')
%   end
% end


% % Function will check if a data identifier represents an array. If yes then the length of the array
% % will be returned, otherwise zero.
% function [arrayLen] = getArrayLen(identifier)
%   % Example: 'some_name', 'some_name[5]' or 'some_name[0x2F]'.
%   foundStr = regexp(identifier, '^\w+((\[\d+\]|\[0x[0-9a-fA-F]+\])?)$', 'tokens');
%   foundStr = char(foundStr{1});
    
%   % Check if identifier represents an array.
%   if (0 < size(foundStr))
%       array = regexp(foundStr, '^\[(0x)?([0-9a-fA-F]+)\]$', 'tokens');

%       isHex =    char(array{1}(1));
%       arrayLen = char(array{1}(2));

%       if (0 < size(isHex))
%           arrayLen = hex2dec(arrayLen);
%       else
%           arrayLen = str2num(arrayLen);
%       end

%       if (0 == arrayLen)
%           error('### COMPILATION ERROR: Array length must be greater than zero!! ###')
%       end
%   else
%       arrayLen = 1;
%   end
% end


% Note: Input parameter is plain string.
% function [dataLen] = checkDatatype(str)
%   global valid_datatypes;
%   dataLen = 1;

%   if (0 == ismember(str, valid_datatypes))
%       fprintf('Currently processed line: "%s"\n', str);
%       error('### COMPILATION ERROR: Incorrect datatype!! ###');
%   end

%   if (strcmp(str, 'UINT16') || strcmp(str, 'INT16'))
%       dataLen = 2;
%   end

%   if (strcmp(str, 'UINT8') || strcmp(str, 'INT8') || strcmp(str, 'STR'))
%       dataLen = 1;
%   end
% end


% Note: Input parameter is plain string.
% function checkIdentifier(str)
%   global valid_datatypes;
%   global valid_registers;
%   global valid_instructions;

%   % Example: 'some_name', 'some_name[5]' or 'some_name[0x2F]'.
%   foundStr = regexp(str, '^(\w+)(\[\d+\]|\[0x[0-9a-fA-F]+\])?$', 'tokens');
%   if (0 < size(foundStr))
%       identifier = char(foundStr{1}(1));
%   else
%       fprintf('Currently processed identifier: "%s"\n', str);
%       error('### COMPILATION ERROR: Incorrect data identifier!! ###');
%   end

%   if ((0 < ismember(identifier, valid_datatypes)) || ...
%       (0 < ismember(identifier, valid_registers)) || ...
%       (0 < ismember(identifier, valid_instructions)))
%       fprintf('Currently processed identifier: "%s"\n', str);
%       error('### COMPILATION ERROR: A keyword must not be used as a data identifier!! ###');
%   end

%   identifier = char(regexp(identifier, '^\d'));
%   if (0 < identifier)
%       fprintf('Currently processed identifier: "%s"\n', str);
%       error('### COMPILATION ERROR: Name of identifier must not begin with a digit!! ###');
%   end
% end


% Note: Input parameter is plain string.
% function [value] = checkValue(str)
%   isHex = regexp(str, '^(0x).*$', 'tokens');

%   if (0 < size(isHex))
%       foundStr = regexp(str, '^0x([0-9a-fA-F]+)$', 'tokens');
%       value = char(foundStr{1}(1));

%       if (0 < size(value))
%           value = hex2dec(value);
%       else
%           fprintf('Currently processed value: "%s"\n', str);
%           error('### COMPILATION ERROR: Incorrect value!! ###');
%       end
%   else
%       foundStr = regexp(str, '^([0-9]+)$', 'tokens');
%       value = char(foundStr{1}(1));

%       if (0 < size(value))
%           value = str2num(value);
%       else
%           fprintf('Currently processed value: "%s"\n', str);
%           error('### COMPILATION ERROR: Incorrect value!! ###');
%       end
%   end
% end


function [word] = getWord(section, codeline, word)
    word = section{codeline}{word};
end


function [word] = getLine(section, codeline)
    word = section{codeline};
end


function printSection(section)
    for (i = 1 : size(section, 2))
        codeline = getLine(section, i);
        for (j = 1 : size(codeline, 2))
            fprintf('%-10s', getWord(section, i, j))
        end
        fprintf('\n');
    end
end


function printLine(codeline)
    for (i = 1 : size(codeline, 2))
        fprintf('%-10s', char(codeline{i}))
    end
    fprintf('\n');
end


% % Parse source code to particular standalone sections. Then parse sections to list of lines.
% % Finally parse lines to list of words.
% % Source -> .CONST + .DATA + .TEXT
% function [section_const, section_data, section_text] = parseSectionsToLines(source)
%   global g_section_const_exists;
%   global g_section_data_exists;
%   global g_section_text_exists;

%   % Parse the .CONST section.
%   if (true == g_section_const_exists)
%       section_const = regexp(source, '\.CONST.*?((?=\.DATA)|(?=\.TEXT)|$)', 'match');
%       section_const = section_const{1};
%       section_const = parseLines(section_const);
%       section_const = parseWords(section_const);
%   end

%   % Parse the .DATA section.
%   if (true == g_section_data_exists)
%       section_data = regexp(source, '\.DATA.*?((?=\.CONST)|(?=\.TEXT)|$)', 'match');
%       section_data = section_data{1};
%       section_data = parseLines(section_data);
%       section_data = parseWords(section_data);
%   end

%   % Parse the .TEXT section.
%   if (true == g_section_text_exists)
%       section_text = regexp(source, '\.TEXT.*?((?=\.DATA)|(?=\.CONST)|$)', 'match');
%       section_text = section_text{1};
%       section_text = parseLines(section_text);
%       section_text = parseWords(section_text);
%   end
% end


function [word] = parseWords(codeline)
    for (i = 1 : size(codeline, 2))
        word{i} = strsplit(codeline{i}, '[,\s]', 'DelimiterType','RegularExpression');
    end
end


% % This function splits a section to lines.
% function [codeline] = parseLines(source)
%   % Remove the section keyword.
%   source = regexprep(source, '(\.CONST\r)|(\.DATA\r)|(\.TEXT\r)', '');

%   % Remove empty characters at the end of a string.
%   source = regexprep(source, '\s*$', '');

%   % Split section into lines.
%   codeline = strsplit(source, '\r');

%   % Remove leading white characters.
%   for (i = 1 : size(codeline, 2))
%       codeline(i) = regexprep(codeline(i), '^\s*', '');
%   end
% end


% % Check existence of code sections. Only the .TEXT section is mandatory.
% function checkIfSectionsExist(source)
%   global g_section_const_exists;
%   global g_section_data_exists;
%   global g_section_text_exists;

%   if (1 == size(regexp(source, '\.CONST', 'start'), 2))
%       g_section_const_exists = true;
%   end

%   if (1 == size(regexp(source, '\.DATA', 'start'), 2))
%       g_section_data_exists = true;
%   end

%   if (1 == size(regexp(source, '\.TEXT', 'start'), 2))
%       g_section_text_exists = true;
%   else
%       error('### COMPILATION ERROR: Section .TEXT does not exist!! ###')
%   end
% end


% function [source] = removeComments(source)
%   % Convert column vector to row vector.
%   source = source.';

%   % Delete all new line characters. There will still remain carriage return characters.
%   source = regexprep(source, '\n', '');

%   % Delete all comments (strings beginning with semicolon and ending with end of line character).
%   source = regexprep(source, '\s*;.*?\r', '\r');

%   % Delete all white space characters at the beginning of a file.
%   source = regexprep(source, '\s*$', '');
    
%   % Delete all white space characters at the end of a file.
%   source = regexprep(source, '^\s*', '');

%   % Delete all white space characters at the end of a line.
%   source = regexprep(source, '(\s*(?=\r))', '');
% end

