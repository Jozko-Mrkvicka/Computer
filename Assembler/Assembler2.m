function [compiledData, compiledCode] = Assembler(fileAsm)
	clc

	global ADDRESS_ROM_START;  ADDRESS_ROM_START = 0;
	global ROM_SIZE;           ROM_SIZE = 32;
	global ADDRESS_RAM_START;  ADDRESS_RAM_START = 32;
	global RAM_SIZE;           RAM_SIZE = 32;
	global STACK_SIZE;         STACK_SIZE = 8;

	global section_const;
	global section_data;
	global section_text;

	global valid_datatypes;     valid_datatypes =    {'STR', 'UINT8', 'INT8', 'UINT16', 'INT16'};
	global valid_registers;     valid_registers =    {'r0', 'r1', 'r2', 'r3', 'r4', 'r5', 'r6', 'r7'};
	global valid_instructions;  valid_instructions = ...
	{ ...
		'NOT', 'XOR', 'OR', 'AND', 'LOADL', 'LOADU', 'CMP', 'RET', 'POP', 'PUSH', 'SHIFT', ...
		'ADD', 'NOT_USED', 'STOREL', 'STOREU', 'STORE', 'LOAD', 'MOV', 'ADDI', 'MOVU', ...
		'LOADI', 'MOVL', 'SHIFTI', 'NOT_USED', 'STOREI', 'CMPI', 'JLT', 'JPE', 'CALL', 'JMP' ...
	};

	% The following physical buttons don`t have character representation: 'BACKSPACE', 'ENTER', 'UP', 'DOWN', 'LEFT' and 'RIGHT'.
	global valid_characters;    valid_characters = ...
	{ ...
		'1', '2', '3', '4', '5', '6', '7', '8', '9', '0', ...
		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ...
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ...
		'?', '!', '(', ')', '<', '>', '#', '%', '"', '/', '\', '*', '=', '-',  ':', ';', '.', ',', ' ', '+', '-',  ...
	};


	source = getSourceCodeFromFile(fileAsm);
	[section_const, section_data, section_text] = parseSourceCodeToSections(source);
	
	% if (true == isSectionInSourceCode(source, '\.CONST'))
	% 	code.const = parseConstSection(section_const);
	% end

	if (true == isSectionInSourceCode(source, '\.DATA'))
		code.data = parseDataSection(section_data);

		% Debug
		for (i = 1 : 6)
			code.data(i)
		end
	end

	% No need to check if the section .TEXT exists. It must always exist.
	% code.text = parseTextSection(section_text);
end


% Parse source code to particular standalone sections. Then parse sections to list of lines.
% Finally parse lines to list of words.
% Source -> .CONST + .DATA + .TEXT
function [section_const, section_data, section_text] = parseSourceCodeToSections(str)
	section_const = '';
	section_data = '';

	% Parse the .CONST section.
	if (true == isSectionInSourceCode(str, '\.CONST'))
		section_const = regexp(str, '\.CONST.*?((?=\.DATA)|(?=\.TEXT)|$)', 'match');
		section_const = section_const{1};
	end

	% Parse the .DATA section.
	if (true == isSectionInSourceCode(str, '\.DATA'))
		section_data = regexp(str, '\.DATA.*?((?=\.CONST)|(?=\.TEXT)|$)', 'match');
		section_data = section_data{1};
	end

	% Parse the .TEXT section.
	if (true == isSectionInSourceCode(str, '\.TEXT'))
		section_text = regexp(str, '\.TEXT.*?((?=\.DATA)|(?=\.CONST)|$)', 'match');
		section_text = section_text{1};
	else
		error('### COMPILATION ERROR: The .TEXT section is missing!! ###');
	end
end


function [data] = parseDataSection(section_data)
	global ADDRESS_RAM_START;
	global RAM_SIZE;
	global STACK_SIZE;
	address = 0;
	total = 0;

	codeline = parseSectionToLines(section_data);

	% Loop through all lines in the .DATA section.
	for (i = 1 : size(codeline, 2))
		temp = strsplit(codeline{i}, '[,\s]', 'DelimiterType', 'RegularExpression');
		if (false == isLineInDataSectionValid(temp))
			error('### COMPILATION ERROR: Invalid .DATA section!! ###');
		end

		datatype = temp{1};

		% Whole name including square bracket and array size. For example "name[5]".
	 	wholeName = temp{2};

	 	% Only name of variable without array size. For example "name".
	 	name = regexp(char(temp{2}), '^(\w+)(\[\d+\]|\[0x[0-9a-fA-F]+\])?$', 'tokens');

	 	datatypeSize = getDatatypeSize(char(datatype));
		arrayLen = getArrayLen(char(wholeName));

		% Length of data in RAM.
		total = total + datatypeSize*arrayLen;

		data(i).name =    name{1}{1};                   % Variable name (data identifier).
		data(i).dtype =   datatype;                     % Datatype.
	 	data(i).len =     datatypeSize*arrayLen;        % Length of data in bytes.
	 	data(i).address = ADDRESS_RAM_START + address;  % Address of a variable in RAM counted from absolute address 0x00.

	 	address = address + datatypeSize*arrayLen;
	end

	if (0 > (RAM_SIZE - (STACK_SIZE + total)))
		error('### COMPILATION ERROR: Not enough RAM memory for data!! ###')
	end
end


function [codeline] = parseSectionToLines(str)
	% Remove the section keyword.
	str = regexprep(str, '(\.CONST\r)|(\.DATA\r)|(\.TEXT\r)', '');

	% Remove empty characters at the end of a string.
	str = regexprep(str, '\s*$', '');

	% Split section into lines.
	codeline = strsplit(str, '\r');

	% Remove leading white characters.
	for (i = 1 : size(codeline, 2))
		codeline(i) = regexprep(codeline(i), '^\s*', '');
	end
end


% Possible inputs: '\.CONST', '\.DATA', '\.TEXT'.
function [exists] = isSectionInSourceCode(str, section)
	exists = false;

	if (1 == size(regexp(str, section, 'start'), 2))
		exists = true;
	end
end


% Type of input param is a list.
function [valid] = isLineInDataSectionValid(codeline)
	valid = true;

	if (2 ~= size(codeline, 2))
		valid = false;
	end

	if (true == valid)
		valid = isValidDatatype(char(codeline{1}));
	end

	if (true == valid)
		valid = isValidIdentifier(char(codeline{2}));
	end
end


function [valid] = isValidIdentifier(str)
	global valid_datatypes;
	global valid_registers;
	global valid_instructions;
	valid = true;

	% A data identifier can contain only alphanumerical characters and the underscore character!
	% Example: 'some_string', 'some_string[5]' or 'some_string[0x2F]'.
	foundStr = regexp(str, '^(\w+)(\[\d+\]|\[0x[0-9a-fA-F]+\])?$', 'tokens');

	if (0 == size(foundStr))
		valid = false;
	else
		identifier =         foundStr{1}(1);
		identifierStr = char(foundStr{1}(1));
		arrayStr =      char(foundStr{1}(2));

		if (0 == size(identifierStr))
			valid = false;
		end

		% A keyword must not be used as a data identifier!
		if ((0 < ismember(identifier, valid_datatypes)) || ...
		    (0 < ismember(identifier, valid_registers)) || ...
		    (0 < ismember(identifier, valid_instructions)))
			valid = false;
		end

		% Name of identifier must not begin with a digit!
		if (0 < char(regexp(identifierStr, '^\d')))
			valid = false;
		end

		% If identifier represents an array ...
		if (0 < size(arrayStr))
			% Parse array lenght.
			foundStr = regexp(arrayStr, '^\[(.+)\]$', 'tokens');
			arrayLen = char(foundStr{1}(1));

			if (true == isValidNumConst(arrayLen))
				arrayLen = convertStrToNum(arrayLen);

				% Array length must be greater than zero.
				if (1 > arrayLen)
					valid = false;
				end
			else
				valid = false;
			end
		end
	end
end


function [valid] = isValidDatatype(str)
	global valid_datatypes;

	valid = true;
	if (0 == ismember(str, valid_datatypes))
		valid = false;
	end
end


function [valid] = isValueInValidRange(datatype, value)
	valid = true;

	switch (datatype)
		case 'UINT8';  if ((value <      0) || (value >   255))  valid = false;  end
		case 'INT8';   if ((value <   -128) || (value >   127))  valid = false;  end
		case 'UINT16'; if ((value <      0) || (value > 65535))  valid = false;  end
		case 'INT16';  if ((value < -32768) || (value > 32767))  valid = false;  end
	end
end


function [valid] = isValidRegister(str)
	global valid_registers;

	valid = true;
	if (0 == ismember(str, valid_registers))
		valid = false;
	end
end


function [valid] = isValidInstruction(str)
	global valid_instructions;

	valid = true;
	if (0 == ismember(str, valid_instructions))
		valid = false;
	end
end


% Is string a valid numerical constant?
function [valid] = isValidNumConst(str)
	valid = true;
	foundStr = regexp(str, '^(0x)?(.+)$', 'tokens');

	if (0 == size(foundStr))
		valid = false;
	else
		isHex =  char(foundStr{1}(1));
		number = char(foundStr{1}(2));

		if ((0 < size(isHex, 2)))
			foundStr = regexp(number, '^([0-9A-Fa-f]+)$', 'tokens');
		else
			foundStr = regexp(number, '^([-+]?\d+)$', 'tokens');
		end

		if (0 == size(foundStr))
			valid = false;
		end
	end
end


function [valid] = isValidLabel(str)
	global valid_datatypes;
	global valid_registers;
	global valid_instructions;
	valid = true;

	% A data identifier can contain only alphanumerical characters, the underscore character
	% and it must end with the colon character!
	foundStr = regexp(str, '^(\w+:)$', 'tokens');

	if (0 == size(foundStr))
		valid = false;
	else
		identifier =         foundStr{1}(1);
		identifierStr = char(foundStr{1}(1));

		% A keyword must not be used as a data identifier!
		if ((0 < ismember(identifier, valid_datatypes)) || ...
		    (0 < ismember(identifier, valid_registers)) || ...
		    (0 < ismember(identifier, valid_instructions)))
			valid = false;
		end

		% Name of identifier must not begin with a digit!
		if (0 < char(regexp(identifierStr, '^\d')))
			valid = false;
		end
	end
end


function [valid] = isValidStrConst(str)
	global valid_characters;
	valid = true;

	foundStr = regexp(str, '^"(.+)"$', 'tokens');

	if (0 == size(foundStr))
		valid = false;
	else
		character = char(foundStr{1}(1));
		for (i = 1 : size(character, 2))
			if (0 == ismember(character(i), valid_characters))
				valid = false;
			end
		end
	end
end


function [source] = getSourceCodeFromFile(file)
	fileID = fopen(file, 'r');
	source = char(fread(fileID));

	% Convert column vector to row vector.
	source = source.';

	source = removeComments(source);
	fclose(fileID);
end


function [datatypeSize] = getDatatypeSize(str)
	datatypeSize = 0;

	if (strcmp(str, 'UINT16') || strcmp(str, 'INT16'))
		datatypeSize = 2;
	end

	if (strcmp(str, 'UINT8') || strcmp(str, 'INT8') || strcmp(str, 'STR'))
		datatypeSize = 1;
	end
end


% Function will check if a data identifier represents an array. If yes then the length of the array
% will be returned, otherwise zero.
function [arrayLen] = getArrayLen(identifier)
	% Example: 'some_name', 'some_name[5]' or 'some_name[0x2F]'.
	foundStr = regexp(identifier, '^\w+((\[\d+\]|\[0x[0-9a-fA-F]+\])?)$', 'tokens');
	foundStr = char(foundStr{1});
	
	% Check if identifier represents an array.
	if (0 < size(foundStr))
		array = regexp(foundStr, '^\[(0x)?([0-9a-fA-F]+)\]$', 'tokens');

		isHex =    char(array{1}(1));
		arrayLen = char(array{1}(2));

		if (0 < size(isHex))
			arrayLen = hex2dec(arrayLen);
		else
			arrayLen = str2num(arrayLen);
		end

		if (0 == arrayLen)
			error('### COMPILATION ERROR: Array length must be greater than zero!! ###')
		end
	else
		arrayLen = 1;
	end
end


% Convert a string input to a numerical constant.
% Note: This function assumes that the syntax of the input string has been already checked.
function [value] = convertStrToNum(str)
	foundStr = regexp(str, '^(0x)?([-+]?[0-9a-fA-F]+)$', 'tokens');

	isHex = char(foundStr{1}(1));
	value = char(foundStr{1}(2));

	if (0 < size(isHex))
		value = hex2dec(value);
	else
		value = str2num(value);
	end
end


function [source] = removeComments(str)
	% Delete all comments (strings beginning with semicolon and ending with the end of line character).
	% Character '?' in the regex means: "Lazy expression: match as few characters as necessary".
	str = regexprep(str, '\s*;.*?\r', '\r');

	% Delete all new line characters. There will still remain carriage return characters.
	str = regexprep(str, '\n', '');

	% Delete all white space characters at the end of a line.
	str = regexprep(str, '(\s*(?=\r))', '');
	
	% Delete all white space characters at the beginning of a file.
	str = regexprep(str, '^\s*', '');

	% Delete all white space characters at the end of a file.
	source = regexprep(str, '\s*$', '');
end

