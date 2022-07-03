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
	global code;

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

	global format_3;  format_3 = {'NOT', 'XOR', 'OR', 'AND', 'LOADL', 'LOADU', 'CMP', 'RET', 'POP', 'PUSH', 'SHIFT', 'ADD', 'NOT_USED', 'STOREL', 'STOREU', 'STORE', 'LOAD', 'MOV'};
	global format_2;  format_2 = {'ADDI', 'MOVU', 'LOADI', 'MOVL'};
	global format_1;  format_1 = {'SHIFTI', 'NOT_USED', 'STOREI', 'CMPI'};
	global format_0;  format_0 = {'JLT', 'JPE', 'CALL', 'JMP'};


	source = getSourceCodeFromFile(fileAsm);
	[section_const, section_data, section_text] = parseSourceCodeToSections(source);

	if (true == isSectionInSourceCode(source, '\.CONST'))
		code.const = parseConstSection(section_const);
		for (i = 1 : size(code.const, 2))
			% code.const(i)
		end
	end

	if (true == isSectionInSourceCode(source, '\.DATA'))
		code.data = parseDataSection(section_data);
		for (i = 1 : size(code.data, 2))
			% code.data(i)
		end
	end

	if (false == isIdentifierUnique())
		error('### COMPILATION ERROR: The constant and variable identifiers must be unique!! ###');
	end

	% No need to check if the section .TEXT exists. It must always exist.
	code.text = parseTextSection(section_text);
	for (i = 1 : size(code.text, 2))
		code.text(i);
	end

	if (false == isSrcLabelMatchingDestLable())
		error('### COMPILATION ERROR: Mismatch between source and destination labels!! ###');
	end

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


function [const] = parseConstSection(section_const)
	global ADDRESS_ROM_START;
	global ROM_SIZE;
	address = 0;

	codeline = parseSectionToLines(section_const);

	% Loop through all lines in the .CONST section.
	for (i = 1 : size(codeline, 2))
		word = strsplit(codeline{i}, '[,\s]', 'DelimiterType', 'RegularExpression');
		if (false == isLineInConstSectionValid(word))
			error('### COMPILATION ERROR: Invalid .CONST section!! ###');
		end

		datatype = word{1};

		% Whole name including square bracket and array size. For example "name[5]".
	 	wholeName = word{2};

	 	% Only name of variable without array size. For example "name".
	 	name = regexp(char(word{2}), '^(\w+)(\[\d+\]|\[0x[0-9A-F]+\]|\[[01]+b\])?$', 'tokens');

	 	datatypeSize = getDatatypeSize(char(datatype));
		arrayLen = getArrayLen(char(wholeName));

		const(i).name =    name{1}{1};                   % Variable name (data identifier).
		const(i).dtype =   datatype;                     % Datatype.
	 	const(i).address = ADDRESS_ROM_START + address;  % Address of a variable in RAM counted from absolute address 0x00.

		% If constant is a string ...
		if (strcmp('STR', datatype))
			string = regexp(word{3}, '^"(.+)"$', 'tokens');
			string = char(string{1});
			
			for (j = 1 : size(string, 2))
				const(i).value(j) = string(j);
			end

			% A string must be terminated by the NULL character.
			const(i).value(j + 1) = 0;
			const(i).len = size(string, 2) + 1;
			address = address + size(string, 2) + 1;

		% If constant is a number ...
		else
			% Loop through all constants on particular line.
			for (j = 1 : arrayLen)
				const(i).value(j) = convertStrToNum(word{j + 2});
			end

			% Length of data in bytes.
			const(i).len = datatypeSize*arrayLen;

		 	address = address + datatypeSize*arrayLen;
		end
	end
	
	if (0 > (ROM_SIZE - address))
		error('### COMPILATION ERROR: Not enough ROM memory for data!! ###')
	end
end


function [data] = parseDataSection(section_data)
	global ADDRESS_RAM_START;
	global RAM_SIZE;
	global STACK_SIZE;
	address = 0;

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
	 	name = regexp(char(temp{2}), '^(\w+)(\[\d+\]|\[0x[0-9A-F]+\]|\[[01]+b\])?$', 'tokens');

	 	datatypeSize = getDatatypeSize(char(datatype));
		arrayLen = getArrayLen(char(wholeName));

		data(i).name =    name{1}{1};                   % Variable name (data identifier).
		data(i).dtype =   datatype;                     % Datatype.
	 	data(i).len =     datatypeSize*arrayLen;        % Length of data in bytes.
	 	data(i).address = ADDRESS_RAM_START + address;  % Address of a variable in RAM counted from absolute address 0x00.

	 	address = address + datatypeSize*arrayLen;
	end

	if (0 > (RAM_SIZE - (STACK_SIZE + address)))
		error('### COMPILATION ERROR: Not enough RAM memory for data!! ###')
	end
end


function [textSection] = parseTextSection(section_text)
	codeline = parseSectionToLines(section_text);

	% Loop through all lines in the .TEXT section.
	for (i = 1 : size(codeline, 2))
		word = strsplit(codeline{i}, '[,\s]', 'DelimiterType', 'RegularExpression');

		fprintf('%s\n', codeline{i});
		% numOfWords = size(word, 2);
		% for (j = 1 : numOfWords)
		% 	if (4 > numOfWords)
		% 		fprintf('\t\t');
		% 	end
		% 	fprintf('%10s', word{j});
		% end
		% fprintf('\n');

		if (false == isLineInTextSectionValid(word))
			error('### COMPILATION ERROR: Invalid .TEXT section!! ###');
		end

		% isTextSectionValid()

	end

	textSection = codeline;
end


function [codeline] = parseSectionToLines(str)
	% Remove a section keyword.
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
function [valid] = isLineInConstSectionValid(codeline)
	valid = true;

	if (3 > size(codeline, 2))
		valid = false;
	end

	if (true == valid)
		valid = isValidDatatype(char(codeline{1}));
	end

	if (true == valid)
		valid = isValidIdentifier(char(codeline{2}));
	end

	% The array length must be equal to the number of constants on a particular line.
	% Example: UINT8 ARRAY[4] 0x1 0x2 0x3 0x4
	if (getArrayLen(char(codeline{2})) ~= (size(codeline, 2) - 2))
		valid = false;
	end

	% If constant is a string ...
	if (strcmp('STR', char(codeline{1})))
		if (3 ~= size(char(codeline)))
			valid = false;
		end

		if (true == valid) 
			valid = isValidStrConst(char(codeline{3}));
		end

	% If constant is a number ...
	else
		% Loop through all constants on particular line.
		if (true == valid)
			for (i = 3 : size(codeline, 2))
				valid = isValidNumConst(char(codeline{i}));
				if (false == valid) break; end

				value = convertStrToNum(char(codeline{i}));
				valid = isValueInValidRange(char(codeline{1}), value);
				if (false == valid) break; end
			end
		end
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


% Type of input param is a list.
function [valid] = isLineInTextSectionValid(codeline)
	global format_0;
	global format_1;
	global format_2;
	global format_3;
	valid = true;

	% If there is only one word on a line then it must be either the RET instruction or a destination label.
	if (1 == size(codeline, 2))
		if ((false == isValidInstruction(char(codeline{1}))) && (false == isValidDestLabel(char(codeline{1}))))
			error('### COMPILATION ERROR: Invalid destination label!! ###');
		end

	% Otherwise it must be an instruction.
	else
		% If first word on a line is a label then skip it.
		if (true == isValidDestLabel(char(codeline{1})))
			codelineWithoutLable = codeline(2 : size(codeline, 2));
		else
			codelineWithoutLable = codeline;
		end

		valid = isValidInstruction(codelineWithoutLable{1});
		if (true == valid)
			if (0 ~= ismember(codelineWithoutLable{1}, format_0))
				valid = isValidInstructionFormat0(codelineWithoutLable);
			end

			if (0 ~= ismember(codelineWithoutLable{1}, format_1))
				valid = isValidInstructionFormat1(codelineWithoutLable);
			end

			if (0 ~= ismember(codelineWithoutLable{1}, format_2))
				valid = isValidInstructionFormat2(codelineWithoutLable);
			end

			if (0 ~= ismember(codelineWithoutLable{1}, format_3))
				valid = isValidInstructionFormat3(codelineWithoutLable);
			end
		else
			error('### COMPILATION ERROR: Invalid instruction!! ###');
		end
	end
end


function [matching] = isSrcLabelMatchingDestLable()
	matching = true;
end


function [uniqueID] = isIdentifierUnique()
	global code;
	uniqueID = true;

	% Compare identifiers in .CONST section against identifiers in .CONST section.
	for (i = 1 : size(code.const, 2) - 1)
		for (j = i + 1 : size(code.const, 2))
			if (true == strcmp(code.const(i).name, code.const(j).name))
				uniqueID = false;
				return;
			end
		end
	end

	% Compare identifiers in .CONST section against identifiers in .DATA section.
	for (i = 1 : size(code.const, 2))
		for (j = 1 : size(code.data, 2))
			if (true == strcmp(code.const(i).name, code.data(j).name))
				uniqueID = false;
				return;
			end
		end
	end

	% Compare identifiers in .DATA section against identifiers in .DATA section.
	for (i = 1 : size(code.data, 2) - 1)
		for (j = i + 1 : size(code.data, 2))
			if (true == strcmp(code.data(i).name, code.data(j).name))
				uniqueID = false;
				return;
			end
		end
	end	
end


% Type of input param is a list.
function [valid] = isValidInstructionFormat0(codeline)
	valid = true;

	if (2 ~= size(codeline, 2))
		valid = false;
		error('### COMPILATION ERROR: Instruction must contain one operand!! ###');
	end

	if (false == isValidSrcLabel(char(codeline{2})))
		valid = false;
		error('### COMPILATION ERROR: Invalid source label!! ###');
	end
end


% Type of input param is a list.
function [valid] = isValidInstructionFormat1(codeline)
	global valid_registers;
	valid = true;

	if ('NOT_USED' == char(codeline{1}))
		valid = false;
	elseif (3 ~= size(codeline, 2))
		valid = false;
	else
		instruction = codeline{1};
		operand_1 =   codeline{2};
		operand_2 =   codeline{3};
	end

	if ((true == valid) && ('SHIFTI' == char(instruction)))
		if (0 == ismember(operand_1, valid_registers))
			valid = false;
		end

		if (false == isValidNumConst(char(operand_2)))
			valid = false;
		else
			operand_2_val = convertStrToNum(char(operand_2))
			if ((operand_2_val < -15) || (operand_2_val > 15))
				valid = false;
			end
		end

	% Order of operands in assembly source code and in compiled
	% binary code is vice versa. The reason is to unify all data
	% transfer instructions so they have destination operand
	% on left side.
	elseif ((true == valid) && ('STOREI' == char(instruction)))
		if (false == isValidNumConst(char(operand_1)))
			valid = false;
		end

		if (false == isValueInValidRange('UINT8', char(operand_1)))
			valid = false;
		end

		if (0 == ismember(operand_2, valid_registers))
			valid = false;
		end

	elseif ((true == valid) && ('CMPI' == char(instruction)))
		if (0 == ismember(operand_1, valid_registers))
			valid = false;
		end
	
		if (false == isValidNumConst(char(operand_2)))
			valid = false;
		else
			operand_2_val = convertStrToNum(char(operand_2))
			if (false == isValueInValidRange('UINT8', operand_2_val))
				valid = false;
			end
		end
	end
end


% Type of input param is a list.
function [valid] = isValidInstructionFormat2(codeline)
	global valid_registers;
	valid = true;

	% Instructions have two operands.
	if (3 ~= size(codeline, 2))
		valid = false;
	else
		instruction = codeline{1};
		operand_1 =   codeline{2};
		operand_2 =   codeline{3};
	end

	if ((true == valid) && (0 == ismember(operand_1, valid_registers)))
		valid = false;
	end

	if ((true == valid) && (('ADDI' == char(instruction)) || ('MOVL' == char(instruction))))
		if (false == isValidNumConst(char(operand_2)))
			valid = false;
		else
			operand_2_val = convertStrToNum(char(operand_2));
			if (false == isValueInValidRange('INT8', operand_2_val))
				valid = false;
			end
		end

	% All other instructions.
	elseif (true == valid)
		if (false == isValidNumConst(char(operand_2)))
			valid = false;
		else	
			operand_2_val = convertStrToNum(char(operand_2));
			if (false == isValueInValidRange('UINT8', operand_2_val))
				valid = false;
			end
		end
	end
end


% Type of input param is a list.
function [valid] = isValidInstructionFormat3(codeline)
	global valid_registers;
	valid = true;

	instruction = codeline{1};

	if (strcmp(char(instruction), 'RET'))
		% Instruction RET does not have any operands.
		if (1 ~= size(codeline, 2))
			valid = false;
			error('### COMPILATION ERROR: Instruction must not have any operands!! ###');
		end

	elseif (strcmp(char(instruction), 'NOT') || strcmp(char(instruction), 'POP') || strcmp(char(instruction), 'PUSH'))
		% Instructions have only one operand.
		if (2 ~= size(codeline, 2))
			valid = false;
			error('### COMPILATION ERROR: Instruction must contain one operand!! ###');
		end

		% Operand must be a register.
		if ((true == valid) && (0 == ismember(codeline{2}, valid_registers)))
			valid = false;
			error('### COMPILATION ERROR: Operand must be a register!! ###');
		end

	% All other instructions.
	else
		% Instructions have two operands.
		if (3 ~= size(codeline, 2))
			valid = false;
			error('### COMPILATION ERROR: Instruction must contain two operands!! ###');
		end

		% First operand must be a register.
		if ((true == valid) && (0 == ismember(codeline{2}, valid_registers)))
			valid = false;
			error('### COMPILATION ERROR: First operand must be a register!! ###');
		end

		% Second operand must be a register.
		if ((true == valid) && (0 == ismember(codeline{3}, valid_registers)))
			valid = false;
			error('### COMPILATION ERROR: Second operand must be a register!! ###');
		end
	end
end


function [valid] = isValidIdentifier(str)
	global valid_datatypes;
	global valid_registers;
	global valid_instructions;
	valid = true;

	% A data identifier can contain only alphanumerical characters and the underscore character!
	% Example: 'some_string', 'some_string[5]' or 'some_string[0x2F]'.
	foundStr = regexp(str, '^(\w+)(\[\d+\]|\[0x[0-9A-F]+\]|\[[01]+b\])?$', 'tokens');

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
	foundStr = regexp(str, '^(0x)?([-+]?[0-9A-F]+)(b)?$', 'tokens');

	if (0 == size(foundStr))
		valid = false;
	else
		isHex =  char(foundStr{1}(1));
		number = char(foundStr{1}(2));
		isBin =  char(foundStr{1}(3));

		if ((0 < size(isHex, 2)))

			% Hex constant must not have 'b' at the end.
			if ((0 ~= size(isBin, 2)))
				valid = false;
			end
			foundStr = regexp(number, '^([0-9A-F]+)$', 'tokens');

		elseif ((0 < size(isBin, 2)))
			foundStr = regexp(number, '^([01]+)$', 'tokens');

		else
			foundStr = regexp(number, '^([-+]?\d+)$', 'tokens');
		end

		if (0 == size(foundStr))
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


function [valid] = isValidSrcLabel(str)
	global valid_datatypes;
	global valid_registers;
	global valid_instructions;
	valid = true;

	% A source label identifier can contain only alphanumerical characters, the underscore character.
	foundStr = regexp(str, '^(\w+)$', 'tokens');

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

	if (false == valid)
		error('### COMPILATION ERROR: Invalid source label!! ###');
	end
end


function [valid] = isValidDestLabel(str)
	global valid_datatypes;
	global valid_registers;
	global valid_instructions;
	valid = true;

	% A destination label identifier can contain only alphanumerical characters, the underscore character
	% and it must end with the colon character!
	foundStr = regexp(str, '^(\w+):$', 'tokens');

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
function [arrayLen] = getArrayLen(str)
	% Example: 'some_name', 'some_name[5]', 'some_name[10b]' or 'some_name[0x2F]'.
	foundStr = regexp(str, '^\w+((\[\d+\]|\[0x[0-9A-F]+\]|\[[01]+b\])?)$', 'tokens');
	foundStr = char(foundStr{1});

	% Check if identifier represents an array.
	if (0 < size(foundStr))
		foundStr = regexp(foundStr, '\[(.+)\]', 'tokens');
		foundStr = char(foundStr{1});
		arrayLen = convertStrToNum(foundStr);

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
	foundStr = regexp(str, '^(0x)?([-+]?[0-9A-F]+)(b)?$', 'tokens');

	isHex = char(foundStr{1}(1));
	value = char(foundStr{1}(2));
	isBin = char(foundStr{1}(3));

	if (0 < size(isHex))
		value = hex2dec(value);

	elseif (0 < size(isBin))
		value = bin2dec(value);

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

