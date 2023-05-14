label = ...
{
	'LABEL'
};
for (idx = 1:size(label))
	eval([char(label(idx)),'  = bitor(c.LABEL_SRC_PREFIX,  idx);']);
	eval([char(label(idx)),'_ = bitor(c.LABEL_DEST_PREFIX, idx);']);
end
c.LBL_CNT = idx;


SourceCode = ...
[
				MOVL		r0			hAA			... % Assign test value.
				MOVU		r0			hBB			...
													...
				MOV			r1			r0			... % Expected value: r1 == 0xBBAA
													...
	LABEL_		JMP			LABEL					...
];

