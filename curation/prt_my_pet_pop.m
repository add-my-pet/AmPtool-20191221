%% prt_my_pet_pop
% Creates my_pet_pop.html in specified directory

%%
function prt_my_pet_pop(species, T, f, destinationFolder)
% created 2019/07/08 Bas Kooijman

%% Syntax
% <../prt_my_pet_pop.m *prt_my_pet_pop*> (species, T, f, destinationFolder) 

%% Description
% Writes my_pet_pop.html with a list implied model properties for selected species at population level. 
% The parameters of species are obtained either from allStat.mat, or by metaData, metaPar and par, which are output structures of
% <http://www.debtheory.org/wiki/index.php?title=Mydata_file *mydata_my_pet*>,
% <http://www.debtheory.org/wiki/index.php?title=Pars_init_file *pars_init_my_pet*>
% and <http://www.debtheory.org/wiki/index.php?title=Pars_init_file *pars_init_my_pet*> 
% respectively, as part of the parameter estimation process.
%
% Input:
%
% * species: character-string with name of entry or cellstring with structures: {metaData, metaPar, par}
% * T: optional scalar with temperature in Kelvin (default: T_typical if metaData is specified or 20 C is character string is specified)
% * f: optional scalar scaled functional response (default: 1)
% * destinationFolder: optional string with destination folder the output html-file (default: current folder) 
%
% Output:
%
% * no Malab output, but a html-file is written with report-table and opened automatically in the system browser
%
%% Remarks
% If species is specified by string (rather than by data), its parameters are obtained from allStat.mat. 
% 
% The search boxes in the top-line of the report can be used to symbols, units, descriptions, but also (on the top-right) to make selections from the statictics.
% nan means "not a number": the model for that species does not have that field.
%
%% Example of use
%
% * If results_My_Pet.mat exists in current directory (where "My_Pet" is replaced by the name of some species, but don't replace "my_pet"):
%   load('results_My_Pet.mat'); prt_report_my_pet({par, metaPar, txtPar, metaData}, [], T, f, destinationFolder)
% * prt_my_pet_pop('Rana_temporaria')
% * prt_my_pet_pop('Rana_temporaria', C2K(22))
% * prt_my_pet_pop('Rana_temporaria', [], 0.9)
% * prt_my_pet_pop('Rana_temporaria', [], '0.5')

% get parameters (separate from get parameters because of 2 possible routes for getting pars)
n_fVal = 3; % 3 values for f
if iscell(species) %  use metaData, metaPar and par to specify (one or more) focusSpecies
  par = species{1}; metaPar = species{2}; txtPar = species{3}; metaData = species{4}; species = metaData.species; 
  datePrintNm = ['date: ',datestr(date, 'yyyy/mm/dd')];
  n_fVal = 3; % 3 f- values: min, f and max
  if ~exist('f', 'var') || isempty(f)
    n_fVal = 2; % 2 f- values: min and max
    f = 1;
  end
else  % use allStat.mat as parameter source 
  [par, metaPar, txtPar, metaData] = allStat2par(species); 
  allStatInfo = dir(which('allStat.mat')); datePrintNm = strsplit(allStatInfo.date, ' '); 
  datePrintNm = ['allStat version: ', datestr(datePrintNm(1), 'yyyy/mm/dd')];
  if ~exist('f', 'var') || isempty(f)
    n_fVal = 2; % 2 f- values: min and max
    f = 1;
  end
end

model = metaPar.model;

if ~exist('T','var') || isempty(T)
  T = metaData.T_typical;
end

% path+filename of output file
if exist('destinationFolder','var')
  fileName = [destinationFolder, species, '_pop.html'];
else
  fileName = [species, '_pop', '.html'];
end
 
% species: get statistics
[stat, txtStat] = popStatistics_st(model, par, T, f);
if isfield(stat, 'h_B0b')
  h_B0b = stat.h_B0b; stat = rmfield(stat, 'h_B0b');
else
  h_B0b = 0;
end
if isfield(stat, 'h_Bbp')
  h_Bbp = stat.h_Bbp; stat = rmfield(stat, 'h_Bbp');
else
  h_Bbp = 0;
end
if isfield(stat, 'h_Bpi')
  h_Bpi = stat.h_Bpi; stat = rmfield(stat, 'h_Bpi');
else
  h_Bpi = 0;
end
stat = rmfield(stat, {'T'}); 
fldsStat = fieldnames(stat); % fieldnames of all statistics

% write table
oid = fopen(fileName, 'w+'); % open file for writing, delete existing content

fprintf(oid, '<!DOCTYPE html>\n');
fprintf(oid, '<HTML>\n');
fprintf(oid, '<HEAD>\n');
fprintf(oid,['  <TITLE>', species, ' pop</TITLE>\n']);
fprintf(oid, '  <style>\n');

fprintf(oid, '    #InputSymbol {\n');
fprintf(oid, '      width: 10%%; /* Width of search field */\n');
fprintf(oid, '      font-size: 14px; /* Increase font-size */\n');
fprintf(oid, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(oid, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(oid, '    }\n\n');

fprintf(oid, '    #InputUnits {\n');
fprintf(oid, '      width: 10%%; /* Width of search field */\n');
fprintf(oid, '      font-size: 14px; /* Increase font-size */\n');
fprintf(oid, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(oid, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(oid, '    }\n\n');

fprintf(oid, '    #InputLabel {\n');
fprintf(oid, '      width: 10%%; /* Width of search field */\n');
fprintf(oid, '      font-size: 14px; /* Increase font-size */\n');
fprintf(oid, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(oid, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(oid, '    }\n\n');

fprintf(oid, '    #InputShort {\n');
fprintf(oid, '      width: 15%%; /* Width of toggle field */\n');
fprintf(oid, '      font-size: 14px; /* Increase font-size */\n');
fprintf(oid, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(oid, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(oid, '    }\n\n');

fprintf(oid, '    #head0 {\n');
fprintf(oid, '      background-color: #FFE7C6\n');                          % pink header background
fprintf(oid, '    }\n\n');
fprintf(oid, '    #head1 {\n');
fprintf(oid, '      background-color: #FFE7C6\n');                          % pink header background
fprintf(oid, '    }\n\n');

fprintf(oid, '    #Table {\n');
fprintf(oid, '      border-style: solid hidden solid hidden;\n');           % border top & bottom only
fprintf(oid, '    }\n\n');

fprintf(oid, '    tr:nth-child(even){background-color: #f2f2f2}\n');        % grey on even rows
fprintf(oid, '    td:nth-child(odd){border-left: solid 1px black}\n\n');    % lines between species

fprintf(oid, '  </style>\n\n');

fprintf(oid, '</HEAD>\n\n');
fprintf(oid, '<BODY>\n\n');

% title
fprintf(oid,'    <h2 align="center">%s: Implied population properties</h2>\n', species);
fprintf(oid,'    <h3 align="center">at T = %g &deg;C with background hazards for embryo, juv, adult: %g, %g, %g 1/d</h3>\n', K2C(T), h_B0b, h_Bbp, h_Bpi);
			
% search boxes above the table
fprintf(oid, '      <div>\n');
fprintf(oid, '        <input type="text" id="InputSymbol" onkeyup="FunctionSymbol()" placeholder="Search for symbol ..">\n');
fprintf(oid, '        <input type="text" id="InputUnits"  onkeyup="FunctionUnits()"  placeholder="Search for units ..">\n');
fprintf(oid, '        <input type="text" id="InputLabel"  onkeyup="FunctionLabel()"  placeholder="Search for label ..">\n');
fprintf(oid, '        <input type="text" id="InputShort"  onkeyup="FunctionShort()"  placeholder="Short/Medium" title="Type S or M">\n');
fprintf(oid, '      </div>\n\n');

% open table
fprintf(oid, '      <TABLE id="Table">\n');
if n_fVal == 2

% table head:
fprintf(oid,'         <TR id="head0"> <TH  colspan="2">model %s</TH> <TH colspan="2">f_min</TH> <TH colspan="2">f_max</TH> <TH>%s</TH></TR>\n', model, datePrintNm);
fprintf(oid, '        <TR id="head1"> <TH>symbol</TH> <TH>units</TH> <TH>thin false</TH> <TH>thin true</TH> <TH>thin false</TH> <TH>thin true</TH> <TH>description</TH></TR>\n\n');

% table body
for i = 1:length(fldsStat)
fprintf(oid, '        <TR id="%s"> <TD>%s</TD> <TD>%s</TD>\n', fldsStat{i}, fldsStat{i}, txtStat.units.(fldsStat{i}));
fprintf(oid, '        <TD>%g</TD> <TD>%g</TD> <TD>%g</TD> <TD>%g</TD>  <TD>%s</TD>\n', ...
    stat.(fldsStat{i}).f0.thin0, stat.(fldsStat{i}).f0.thin1, stat.(fldsStat{i}).f1.thin0, stat.(fldsStat{i}).f1.thin1, txtStat.label.(fldsStat{i}));
fprintf(oid, '        </TR>\n');
end 

else % n_fVal = 3
    
% table head:
fprintf(oid, '        <TR id="head0"> <TH  colspan="2">model %s</TH> <TH colspan="2">f_min</TH> <TH colspan="2">f</TH> <TH colspan="2">f_max</TH> <TH>%s</TH></TR>\n', model, datePrintNm);
fprintf(oid, '        <TR id="head1"> <TH>symbol</TH> <TH>units</TH> <TH>thin false</TH> <TH>thin true</TH> <TH>thin false</TH> <TH>thin true</TH> <TH>thin false</TH> <TH>thin true</TH> <TH>description</TH></TR>\n\n');

% table body
for i = 1:length(fldsStat)
fprintf(oid, '        <TR id="%s"> <TD>%s</TD> <TD>%s</TD>\n', fldsStat{i}, fldsStat{i}, txtStat.units.(fldsStat{i}));
fprintf(oid, '        <TD>%g</TD> <TD>%g</TD> <TD>%g</TD> <TD>%g</TD>  <TD>%g</TD> <TD>%g</TD>  <TD>%s</TD>\n', ...
    stat.(fldsStat{i}).f0.thin0, stat.(fldsStat{i}).f0.thin1, stat.(fldsStat{i}).f.thin0, stat.(fldsStat{i}).f.thin1, stat.(fldsStat{i}).f1.thin0, stat.(fldsStat{i}).f1.thin1, txtStat.label.(fldsStat{i}));
fprintf(oid, '        </TR>\n');
end 

% close table
fprintf(oid, '      </TABLE>\n\n');

end

% search/selection facilities
% symbol
fprintf(oid, '      <script>\n');
fprintf(oid, '        function FunctionSymbol() {\n');
fprintf(oid, '          // Declare variables\n');
fprintf(oid, '          var input, filter, table, tr, td, i;\n');
fprintf(oid, '          input = document.getElementById("InputSymbol");\n');
fprintf(oid, '          filter = input.value.toUpperCase();\n');
fprintf(oid, '          table = document.getElementById("Table");\n');
fprintf(oid, '          tr = table.getElementsByTagName("tr");\n\n');
%
fprintf(oid, '          // Loop through all table rows, and hide those who don''t match the search query\n');
fprintf(oid, '          for (i = 0; i < tr.length; i++) {\n');
fprintf(oid, '          td = tr[i].getElementsByTagName("td")[0];\n');
fprintf(oid, '          if (td) {\n');
fprintf(oid, '            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(oid, '              tr[i].style.display = "";\n');
fprintf(oid, '            } else {\n');
fprintf(oid, '              tr[i].style.display = "none";\n');
fprintf(oid, '              }\n');
fprintf(oid, '            }\n');
fprintf(oid, '          }\n');
fprintf(oid, '        }\n\n');
% units
fprintf(oid, '        function FunctionUnits() {\n');
fprintf(oid, '          // Declare variables\n');
fprintf(oid, '          var input, filter, table, tr, td, i;\n');
fprintf(oid, '          input = document.getElementById("InputUnits");\n');
fprintf(oid, '          filter = input.value.toUpperCase();\n');
fprintf(oid, '          table = document.getElementById("Table");\n');
fprintf(oid, '          tr = table.getElementsByTagName("tr");\n\n');
%
fprintf(oid, '          // Loop through all table rows, and hide those who don''t match the search query\n');
fprintf(oid, '          for (i = 0; i < tr.length; i++) {\n');
fprintf(oid, '          td = tr[i].getElementsByTagName("td")[1];\n');
fprintf(oid, '          if (td) {\n');
fprintf(oid, '            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(oid, '              tr[i].style.display = "";\n');
fprintf(oid, '            } else {\n');
fprintf(oid, '              tr[i].style.display = "none";\n');
fprintf(oid, '              }\n');
fprintf(oid, '            }\n');
fprintf(oid, '          }\n');
fprintf(oid, '        }\n\n');
% label (= description)
fprintf(oid, '        function FunctionLabel() {\n');
fprintf(oid, '          // Declare variables\n');
fprintf(oid, '          var input, filter, table, tr, td, i;\n');
fprintf(oid, '          input = document.getElementById("InputLabel");\n');
fprintf(oid, '          filter = input.value.toUpperCase();\n');
fprintf(oid, '          table = document.getElementById("Table");\n');
fprintf(oid, '          tr = table.getElementsByTagName("tr");\n\n');
%
fprintf(oid, '          // Loop through all table rows, and hide those who don''t match the search query\n');
fprintf(oid, '          for (i = 0; i < tr.length; i++) {\n');
fprintf(oid, '          td = tr[i].getElementsByTagName("td")[%g];\n', 6 + 2 * (n_fVal == 3));
fprintf(oid, '          if (td) {\n');
fprintf(oid, '            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(oid, '              tr[i].style.display = "";\n');
fprintf(oid, '            } else {\n');
fprintf(oid, '              tr[i].style.display = "none";\n');
fprintf(oid, '              }\n');
fprintf(oid, '            }\n');
fprintf(oid, '          }\n');
fprintf(oid, '        }\n\n');
% selection for short/medium/long/pars
fprintf(oid, '        function FunctionShort() {\n');
fprintf(oid, '          // Declare variables\n');
fprintf(oid, '          var input, filter, table, tr, td, i;\n');
fprintf(oid, '          input = document.getElementById("InputShort");\n');
fprintf(oid, '          filter = input.value.toUpperCase();\n');
fprintf(oid, '          table = document.getElementById("Table");\n');
fprintf(oid, '          tr = table.getElementsByTagName("tr");\n\n');
%
fprintf(oid, '          // Loop through all table rows, and show some from the long list\n');
% filter S: popular short selection of some statistics
fprintf(oid, '          if (filter == "S") {\n');
fprintf(oid, '            for (i = 0; i < tr.length; i++) {\n');
fprintf(oid, '              td = tr[i].getElementsByTagName("td")[0];\n');
fprintf(oid, '              if (td) {\n');
fprintf(oid, '                if (\n');
fprintf(oid, '                    td.innerHTML == "f" ||\n');
fprintf(oid, '                    td.innerHTML == "r" ||\n');
fprintf(oid, '                    td.innerHTML == "EWw" \n');
fprintf(oid, '                  ) {\n');
fprintf(oid, '                  tr[i].style.display = "";\n');
fprintf(oid, '                } else {\n');
fprintf(oid, '                  tr[i].style.display = "none";\n');
fprintf(oid, '                }\n');
fprintf(oid, '              }\n');
fprintf(oid, '            }\n');
% filter M: median selection
fprintf(oid, '          } else if (filter == "M") {\n');
fprintf(oid, '            for (i = 0; i < tr.length; i++) {\n');
fprintf(oid, '              td = tr[i].getElementsByTagName("td")[0];\n');
fprintf(oid, '              if (td) {\n');
fprintf(oid, '                if (\n');
fprintf(oid, '                    td.innerHTML == "f" ||\n');
fprintf(oid, '                    td.innerHTML == "r" ||\n');
fprintf(oid, '                    td.innerHTML == "S_p" ||\n');
fprintf(oid, '                    td.innerHTML == "EWw" \n');
fprintf(oid, '                  ) {\n');
fprintf(oid, '                  tr[i].style.display = "";\n');
fprintf(oid, '                } else {\n');
fprintf(oid, '                  tr[i].style.display = "none";\n');
fprintf(oid, '                }\n');
fprintf(oid, '              }\n');
fprintf(oid, '            }\n');
fprintf(oid, '          } else {\n'); % complete list
fprintf(oid, '            for (i = 0; i < tr.length; i++) {\n');
fprintf(oid, '              tr[i].style.display = "";\n');
fprintf(oid, '            }\n');
fprintf(oid, '          }\n');
fprintf(oid, '        }\n');
fprintf(oid, '      </script>\n');

fprintf(oid, '</BODY>\n');
fprintf(oid, '</HTML>\n');

fclose(oid);

web(fileName,'-browser') % open html in systems browser
%web(fileName)

