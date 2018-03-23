function monoAAs = monoAA(seq)

if ~iscell(seq)
    if ~ischar(seq)
        seq = char(seq);
    end
    seq=nt2aa(seq, 'ACGTOnly',false,'AlternativeStartCodons',false);
    monoAAs = struct2array(aacount(seq,'Ambiguous','prorate'));
    monoAAs = monoAAs ./sum(monoAAs);
else
    monoAAs = zeros(length(seq),20);
    for i=1:length(seq)
        if ~ischar(seq{i})
            s = char(seq{i});
        else
            s = seq{i};
        end
        s=nt2aa(s, 'ACGTOnly',false,'AlternativeStartCodons',false);
        monoAA = struct2array(aacount(s,'Ambiguous','prorate'));
        monoAA = monoAA ./sum(monoAA);
        monoAAs(i,:) = monoAA;
    end
end