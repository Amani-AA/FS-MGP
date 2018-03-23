function out=isStop(codon)

out=strcmp('TAA',char(codon)) | strcmp('TAG',char(codon)) | strcmp('TGA',char(codon));
  