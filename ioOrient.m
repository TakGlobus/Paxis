function ioOrient(Orient, ofile)
  c = num2cell(Orient);
  disp(c);
  towrite = cellfun(@num2str, c, 'UniformOutput', false);
  %xlswrite(ofile, towrite);
  %csvwrite(ofile, towrite);
  fid = fopen('test.csv','wt');
  if fid>0
     for k=1:size(towrite,1)
         fprintf(fid,'%s,%s,%s,%s,\n',towrite{k,:});
     end
     fclose(fid);
  end
