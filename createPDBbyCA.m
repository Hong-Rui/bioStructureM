function createPDBbyCA( ca,name )
%CREATPDBBYCA Summary of this function goes here
%   Detailed explanation goes here
% 13 - 16        Atom            Atom name 
% atom name start at 14 normally.
   fid=fopen(name,'w');
   if ~iscell(ca)
        for i=1:length(ca)
        resno=regexp(ca(i).resno,'[0-9]*','match');
        insertion=regexpi(ca(i).resno,'[A-Z]','match');
        if isempty(insertion)
            insertion{1}='';
        end
        fprintf(fid,'%-6s%5i %-4s%1s%3s %1s%4s%1s   %8.3f%8.3f%8.3f%6.2f%6.2f      %4s%2s%2s\n',ca(i).record,...
																					ca(i).atomno,...
																					ca(i).atmname,...
																					ca(i).alternate,...
																					ca(i).resname,...
																					ca(i).subunit,...
																					resno{1},...
                                                                                    insertion{1},...
																					ca(i).coord(1),...
																					ca(i).coord(2),...
																					ca(i).coord(3),...
																					ca(i).occupancy,...
																					ca(i).bval,...
																					ca(i).segment,...
																					ca(i).elementSymbol,...
																					ca(i).charge);
        end 
   else
       for i=1:length(ca)
           fprintf(fid,'MODEL       %2i\n',i);
           model=ca{i};
           for j=1:length(model)
                resno=regexp(model(i).resno,'[0-9]*','match');
                insertion=regexpi(model(i).resno,'[A-Z]','match');
                if isempty(insertion)
                    insertion{1}='';
                end
                fprintf(fid,'%-6s%5i %-4s%1s%3s %1s%4s%1s   %8.3f%8.3f%8.3f%6.2f%6.2f      %4s%2s%2s\n', model(i).record,...
                                                                                                        model(i).atomno,...
                                                                                                        model(i).atmname,...
                                                                                                        model(i).alternate,...
                                                                                                        model(i).resname,...
                                                                                                        model(i).subunit,...
                                                                                                        resno{1},...
                                                                                                        insertion{1},...
                                                                                                        model(i).coord(1),...
                                                                                                        model(i).coord(2),...
                                                                                                        model(i).coord(3),...
                                                                                                        model(i).occupancy,...
                                                                                                        model(i).bval,...
                                                                                                        model(i).segment,...
                                                                                                        model(i).elementSymbol,...
                                                                                                        model(i).charge);
           end
           fprintf(fid,'ENDMDL');
       end
       fprintf(fid,'\n');
   end
   fprintf(fid,'END');
fclose(fid);
end

