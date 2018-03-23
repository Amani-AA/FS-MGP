function monoCodons = monoCodon(seq)

if ~iscell(seq)
    if ~ischar(seq)
        seq = char(seq);
    end
    monoCodons = struct2array(codoncount(seq,'Ambiguous','prorate'));
    monoCodons = monoCodons ./sum(monoCodons);
else
    monoCodons = zeros(length(seq),64);
    for i=1:length(seq)
        if ~ischar(seq{i})
            s = char(seq{i});
        else
            s = seq{i};
        end
        codons = struct2array(codoncount(s,'Ambiguous','prorate'));
        codons = codons ./sum(codons);
        monoCodons(i,:) = codons;
    end
end