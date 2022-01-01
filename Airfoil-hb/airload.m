function airload(filename)
% process the values in a file produced by airfoil.
% Assumes Xupper, CPupper, Xlower, CPlower, em, cl and cdv
% exist as globals. Values are returned into these variables.
% It assumes that 
% "Upper surface CP values" starts a table of values which is
% ended by "Lower surface CP values", which also starts another
% table ended by a blank line.
% Also assumes that em, cl and cdv are set at the start of a line.
%
% Sample usage: 
%   global Xupper CPupper Xlower CPlower em cl cdv
%   holgar Autorun.BRF.invis 


global Xupper CPupper Xlower CPlower em cl cdv
if nargin < 1,
  warning('You need to provide a filename');
  return
end


fid=fopen(filename);
if fid == -1,
  warning('File does not exist');
  return
end

while 1
   line = fgetl(fid);
   if ~ischar(line),
     break
   end
   if strncmp('EM =',dblnk(line),4),
      strs=sscanf(line,'%s', 3);
      em=strs(4:end);
   end 
   if strncmp('CL =',dblnk(line),4),
      strs=sscanf(line,'%s', 3);
      cl=strs(4:end);
   end 
   if strncmp('CDV =',dblnk(line),5),
      strs=sscanf(line,'%s', 3);
      cdv=strs(5:end);
   end 
   
   if strcmp('Upper surface CP values',dblnk(line)),
      line = fgetl(fid);
      Xupper=[];
      CPupper=[];
      while 1
         line=fgetl(fid);
         if strcmp('Lower surface CP values',dblnk(line)),
            break
         end
         strs=sscanf(line,'%f %f');
         Xupper=[Xupper; strs(1)];
         CPupper=[CPupper; strs(2)];
      end
      Xlower=[];
      CPlower=[];
      line=fgetl(fid);
      while 1
         line=fgetl(fid);
         if ~isstr(line),
	   break
	 end
         if strcmp('',line),
	   break
	 
	 end
	 if length(line) <2,
	     break
	 end
         [strs,count]=sscanf(line,'%f %f');
         if (count == 2),
            Xlower=[Xlower; strs(1)];
            CPlower=[CPlower; strs(2)];
         end
      end 

   end 
end
fclose(fid);

