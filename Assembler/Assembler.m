function [compiledData, compiledCode] = Assembler(fileAsm)
	clc
	global g_section_const_exists; 	g_section_const_exists = false;
	global g_section_data_exists; 	g_section_data_exists = false;
	global g_section_text_exists; 	g_section_text_exists = false;

	global valid_datatypes; valid_datatypes = {'STR', 'UINT8', 'INT8', 'UINT16', 'INT16'};

	valid_keyword = ...
	{
		... Registers
		'r0', 'r1', 'r2', 'r3', 'r4', 'r5', 'r6', 'r7', ...
		...
		... Instructions
		'NOT', 'XOR', 'OR', 'AND', 'LOADL', 'LOADU', 'CMP', 'RET', 'POP', 'PUSH', 'SHIFT', ...
		'ADD', 'NOT_USED', 'STOREL', 'STOREU', 'STORE', 'LOAD', 'MOV', 'ADDI', 'MOVU', ...
		'LOADI', 'MOVL', 'SHIFTI', 'NOT_USED', 'STOREI', 'CMPI', 'JLT', 'JPE', 'CALL', 'JMP'
	};

	% Read source file
	fileID = fopen(fileAsm, 'r');
	source = removeComments(char(fread(fileID)));
	fclose(fileID);

	checkIfSectionsExist(source);
	[section_const, section_data, section_text] = parseSectionsToLines(source);
	checkDataSection(section_data);


	% getWord(section_data, 1, 1)
	% fprintf(source);
	% printSection(section_const);
 	% fprintf('\n');
	% printSection(section_data);
	% fprintf('\n');
	% printSection(section_text);
end


function [word] = getWord(section, codeline, word)
	word = section{codeline}{word};
end


% Input parameter: Array of lines (stored in cells). Each line contains array of words (stored in cells).
function checkDataSection(codeline)
	global valid_datatypes;

	% Loop through all lines in the data section.
	for (i = 1 : size(codeline, 2))
		word = codeline{i};

		if (2 ~= size(word, 2))
			fprintf('Currently processed line: "%s"\n', char(word))
			error('### COMPILATION ERROR: Every line in section .DATA must contain only two words: data type and data identifier!! ###')
		end

		checkDatatype(char(word(1)));
		checkIdentifier(char(word(2)));
	end
end


% Note: Input parameter is plain string.
function [arrayLen] = checkIdentifier(str)
	% Example: 'some_name', 'some_name[5]' or 'some_name[0x2F]'.
	foundStr = regexp(str, '^(\w+)((\[\d+\]|\[0x[0-9a-fA-F]+\])?)$', 'tokens');
	if (0 < size(foundStr))
		identifier = char(foundStr{1}(1));
		array      = char(foundStr{1}(2));
	else
		fprintf('Currently processed line: "%s"\n', str);
		error('### COMPILATION ERROR: Incorrect data identifier!! ###');
	end

	identifier = char(regexp(identifier, '^\d'));
	if (0 < identifier)
		fprintf('Currently processed line: "%s"\n', str);
		error('### COMPILATION ERROR: Name of identifier must not begin with a digit!! ###');
	end

	% Check if identifier represents array.
	if (0 < size(array))
		array = regexp(array, '^\[(0x)?([0-9a-fA-F]+)\]$', 'tokens');
		isHex =    char(array{1}(1));
		arrayLen = char(array{1}(2));

		if (0 < size(isHex))
			arrayLen = hex2dec(arrayLen);
		else
			arrayLen = str2num(arrayLen);
		end
	else
		arrayLen = 0;
	end
end


% Note: Input parameter is plain string.
function checkDatatype(str)
	global valid_datatypes;
	if (0 == ismember(str, valid_datatypes))
		fprintf('Currently processed line: "%s"\n', str);
		error('### COMPILATION ERROR: Incorrect datatype!! ###');
	end
end


function printSection(section)
	for (i = 1 : size(section, 2))
		fprintf('%s\n', section{i});
	end
end


% Parse source code to particular standalone sections. Then parse sections to list of lines.
% Finally parse lines to list of words.
% Source -> .CONST + .DATA + .TEXT
function [section_const, section_data, section_text] = parseSectionsToLines(source)
	global g_section_const_exists;
	global g_section_data_exists;
	global g_section_text_exists;

	% Parse the .CONST section.
	if (true == g_section_const_exists)
		section_const = regexp(source, '\.CONST.*?((?=\.DATA)|(?=\.TEXT)|$)', 'match');
		section_const = section_const{1};
		section_const = parseLines(section_const);
		section_const = parseWords(section_const);
	end

	% Parse the .DATA section.
	if (true == g_section_data_exists)
		section_data = regexp(source, '\.DATA.*?((?=\.CONST)|(?=\.TEXT)|$)', 'match');
		section_data = section_data{1};
		section_data = parseLines(section_data);
		section_data = parseWords(section_data);
	end

	% Parse the .TEXT section.
	if (true == g_section_text_exists)
		section_text = regexp(source, '\.TEXT.*?((?=\.DATA)|(?=\.CONST)|$)', 'match');
		section_text = section_text{1};
		section_text = parseLines(section_text);
		section_text = parseWords(section_text);
	end
end


function [word] = parseWords(codeline)
	for (i = 1 : size(codeline, 2))
		word{i} = strsplit(codeline{i});
	end
end


% This function splits a section to lines.
function [codeline] = parseLines(source)
	% Remove the section keyword.
	source = regexprep(source, '(\.CONST\r)|(\.DATA\r)|(\.TEXT\r)', '');

	% Remove empty characters at the end of a string.
	source = regexprep(source, '\W*$', '');

	% Split section into lines.
	codeline = strsplit(source, '\r');

	% Remove leading white characters.
	for (i = 1 : size(codeline, 2))
		codeline(i) = regexprep(codeline(i), '^\s*', '');
	end
end


% Check existence of code sections. Only the .TEXT section is mandatory.
function checkIfSectionsExist(source)
	global g_section_const_exists;
	global g_section_data_exists;
	global g_section_text_exists;

	if (1 == size(regexp(source, '\.CONST', 'start'), 2))
		g_section_const_exists = true;
	end

	if (1 == size(regexp(source, '\.DATA', 'start'), 2))
		g_section_data_exists = true;
	end

	if (1 == size(regexp(source, '\.TEXT', 'start'), 2))
		g_section_text_exists = true;
	else
		error('### COMPILATION ERROR: Section .TEXT does not exist!! ###')
	end
end


function [source] = removeComments(source)
	% Convert column vector to row vector.
	source = source.';

	% Delete all new line characters. There will still remain carriage return characters.
	source = regexprep(source, '\n', '');

	% Delete all comments (strings beginning with semicolon and ending with end of line character).
	source = regexprep(source, '\s*;.*?\r', '\r');

	% Delete all white space characters at the beginning of a file.
	source = regexprep(source, '\s*$', '');
	
	% Delete all white space characters at the end of a file.
	source = regexprep(source, '^\s*', '');

	% Delete all white space characters at the end of a line.
	source = regexprep(source, '(\s*(?=\r))', '');
end

