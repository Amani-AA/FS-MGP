
function gc_content=GcContent(seq)


ba=basecount(seq);
gc_content=(ba.C +ba.G)/(ba.A+ba.G+ba.C+ba.T);

end%function