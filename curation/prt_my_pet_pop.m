%% prt_my_pet_pop
% Creates my_pet_pop.html in specified directory

%%
function prt_my_pet_pop(species, T, f, h_B, destinationFolder, AmP)
% created 2019/07/08 Bas Kooijman

%% Syntax
% <../prt_my_pet_pop.m *prt_my_pet_pop*> (species, T, f, destinationFolder) 

%% Description
% Writes my_pet_pop.html with a list implied population properties for selected species. 
% This function just composes the thml page; all statistics are computed in popStatistics_st.
% The parameters of species are obtained either from allStat.mat (and the gender-code from allEco.mat), or from a cell-string {par, metaPar, metaData, gender-code}.
% The first 3 cells are output structures of <http://www.debtheory.org/wiki/index.php?title=Mydata_file *mydata_my_pet*> and
% <http://www.debtheory.org/wiki/index.php?title=Pars_init_file *pars_init_my_pet*>, as part of the parameter estimation process.
% Structure metadata is required to get species-name and T_typical, metaPar to get model.
% The last cell is a character string with the gender-code as specified on the AmPeco.html page ('D' for dioecy, 'H' for hermaphrodite). If omitted, 'D' is assumed.
% If dioecy applies, the sex-ratio is assumed to be 1:1 and fertilisation is assumed to be sure.
% The energy cost for male-production is taken into account by halving kap_R.
% Male-specific parameters, i.e. z_m and E_Hpm, affect reported statistics. 
% If 3rd input is a character string, it should specify a fraction for f in the interval (f_min, 1)
% If specified background hazards in 4th input are too high, no positive specific growth rate exists and errors can occur.
%
% Input:
%
% * species: character-string with name of entry or cellstring with structures: {par, metaPar, metaData, gender}
% * T: optional scalar with temperature in Kelvin (default: T_typical if metaData is specified or 20 C is character string is specified)
% * f: optional scalar scaled functional response (default: 1) or character string representing a fraction
% * h_B: optional vector with background hazards of length equal to the number of stages (depending on the model) 
% * destinationFolder: optional string with destination folder the output html-file (default: current folder) 
% * AmP: optional boolean (default false), if true then output my_pet_pop.html follows markup of the AmP collection
%
% Output:
%
% * no Malab output, but a html-file is written with report-table and opens automatically in the system browser
%
%% Remarks
% If species is specified by string (rather than by data), its parameters are obtained from allStat.mat and the gender code is read from allEco.mat.
% 
% The search boxes in the top-line of the report can be used to select symbols, units, descriptions, but also (on the top-right) to make selections from the statictics.
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

if exist('T', 'var') && ~isempty(T)
  if ischar(T) || T < 150
    fprintf('Warning: you probably tried to specify the third input, forgetting the second one\n')
    return
  end
end

if ~exist('AmP', 'var')
  AmP = 0;
end

% get parameters (2 possible routes for getting pars)
n_fVal = 3; % 3 values for f
if iscell(species) 
  par = species{1}; metaPar = species{2}; metaData = species{3}; 
  if length(species) == 3
    gender = 'D';
  else
    gender = species{4}; 
  end
  species = metaData.species;
  datePrintNm = ['date: ',datestr(date, 'yyyy/mm/dd')];
  n_fVal = 3; % 3 f- values: min, f and max
  if ~exist('f', 'var') || isempty(f)
    n_fVal = 2; % 2 f- values: min and max
    f = 1;
  end
else  % use allStat.mat as parameter source 
  gender = read_eco({species}, 'gender'); gender = gender{1}; gender = gender{1};
  [par, metaPar, txtPar, metaData] = allStat2par(species); 
  allStatInfo = dir(which('allStat.mat')); datePrintNm = strsplit(allStatInfo.date, ' '); 
  datePrintNm = ['allStat version: ', datestr(datePrintNm(1), 'yyyy/mm/dd')];
  if ~exist('f', 'var') || isempty(f)
    n_fVal = 2; % 2 f- values: min and max
    f = 1;
  end
end

par.gender = gender;
if any(ismember({'z_m','E_Hpm'},fieldnames(par)))
  male = 1; % male and females parameters differ
else
  male = 0; % male and females parameters are the same
end

model = metaPar.model;
if ~any(strcmp(model,{'std','stx'})) 
  return
else % add hazards to par-structure before calling popStatistics_st
  switch model
  case {'std','stx'}
    if ~exist('h_B','var') || isempty(h_B)
      par.h_B0b = 0; par.h_Bbp = 0; par.h_Bpi = 0; 
    else
      par.h_B0b = h_B(1); par.h_Bbp = h_B(2); par.h_Bpi = h_B(3);       
    end
  end
end

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
[stat, txtStat, Hfig_surv, Hfig_stab] = popStatistics_st(model, par, T, f);
stat = rmfield(stat, {'T', 'c_T'}); 
fldsStat = fieldnames(stat); % fieldnames of all statistics

% write table
oid = fopen(fileName, 'w+'); % open file for writing, delete existing content

fprintf(oid, '<!DOCTYPE html>\n');
fprintf(oid, '<HTML>\n');
fprintf(oid, '<HEAD>\n');
fprintf(oid, '  <TITLE>%s pop</TITLE>\n', species);

if AmP
fprintf(oid, '  <link rel="stylesheet" type="text/css" href="../../sys/style.css"> \n');
fprintf(oid, '  <script src="../../sys/dropdown.js"></script>\n');
fprintf(oid, '  <script src="../../sys/w3data.js"></script>\n');
end

fprintf(oid, '  <style>\n');

fprintf(oid, '    #InputSymbol {\n');
fprintf(oid, '      background-image: url(''../../img/searchicon.png'');\n');
fprintf(oid, '      background-position: 2px -10px;\n');
fprintf(oid, '      background-repeat: no-repeat;\n');
fprintf(oid, '      width: 15%%; /* Width of search field */\n');
fprintf(oid, '      font-size: 14px; /* Increase font-size */\n');
fprintf(oid, '      padding: 5px 10px 7px 40px;\n');
fprintf(oid, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(oid, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(oid, '    }\n\n');

fprintf(oid, '    #InputUnits {\n');
fprintf(oid, '      background-image: url(''../../img/searchicon.png'');\n');
fprintf(oid, '      background-position: 2px -10px;\n');
fprintf(oid, '      background-repeat: no-repeat;\n');
fprintf(oid, '      width: 15%%; /* Width of search field */\n');
fprintf(oid, '      font-size: 14px; /* Increase font-size */\n');
fprintf(oid, '      padding: 5px 10px 7px 40px;\n');
fprintf(oid, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(oid, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(oid, '    }\n\n');

fprintf(oid, '    #InputLabel {\n');
fprintf(oid, '      background-image: url(''../../img/searchicon.png'');\n');
fprintf(oid, '      background-position: 2px -10px;\n');
fprintf(oid, '      background-repeat: no-repeat;\n');
fprintf(oid, '      width: 15%%; /* Width of search field */\n');
fprintf(oid, '      font-size: 14px; /* Increase font-size */\n');
fprintf(oid, '      padding: 5px 10px 7px 40px;\n');
fprintf(oid, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(oid, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(oid, '    }\n\n');

fprintf(oid, '    #InputShort {\n');
fprintf(oid, '      background-image: url(''../../img/searchicon.png'');\n');
fprintf(oid, '      background-position: 2px -10px;\n');
fprintf(oid, '      background-repeat: no-repeat;\n');
fprintf(oid, '      width: 15%%; /* Width of search field */\n');
fprintf(oid, '      font-size: 14px; /* Increase font-size */\n');
fprintf(oid, '      padding: 5px 10px 7px 40px;\n');
fprintf(oid, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(oid, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(oid, '    }\n\n');

fprintf(oid, '    #head0 {\n');
fprintf(oid, '      background-color: #FFE7C6\n');                          % pink header background
fprintf(oid, '    }\n\n');
fprintf(oid, '    #head1 {\n');
fprintf(oid, '      background-color: #FFE7C6\n');                          % pink header background
fprintf(oid, '    }\n\n');
fprintf(oid, '    #head2 {\n');
fprintf(oid, '      background-color: #FFE7C6\n');                          % pink header background
fprintf(oid, '    }\n\n');

fprintf(oid, '    #caption {\n');
fprintf(oid, '      width: 450px\n');                                       % caption-width equal to figure-width
fprintf(oid, '    }\n\n');

fprintf(oid, '    div.fig {\n');
fprintf(oid, '      width: 50%%;\n');
fprintf(oid, '      float: left;\n');
fprintf(oid, '    }\n\n');

fprintf(oid, '    #Table {\n');
fprintf(oid, '      border-style: solid hidden solid hidden;\n');           % border top & bottom only
fprintf(oid, '    }\n\n');

fprintf(oid, '    tr:nth-child(even){background-color: #f2f2f2}\n');        % grey on even rows
fprintf(oid, '    td:nth-child(odd){border-left: solid 1px black}\n\n');    % lines between species

fprintf(oid, '  </style>\n\n');

fprintf(oid, '</HEAD>\n\n');
fprintf(oid, '<BODY>\n\n');

if AmP
fprintf(oid, '<div w3-include-html="../../sys/wallpaper_entry.html"></div>\n');
fprintf(oid, '<div w3-include-html="../../sys/toolbar_entry.html"></div>\n');
fprintf(oid, '<div id="top2" w3-include-html="%s_toolbar.html\n"></div>', species);
fprintf(oid, '<script>w3IncludeHTML();</script>\n\n');

fprintf(oid, '<div id = "main">\n');
fprintf(oid, '  <div id = "main-wrapper">\n');
fprintf(oid, '    <div id="contentFull">\n');

end

% title
fprintf(oid,'    <h1 align="center">%s: Implied population properties</h1>\n', species);
fprintf(oid,'    <h3 align="center">at T = %g &deg;C with background hazards for embryo, juv, adult: %g, %g, %g 1/d</h3>\n', K2C(T), par.h_B0b, par.h_Bbp, par.h_Bpi);
			
% search boxes above the table
fprintf(oid, '      <div>\n');
fprintf(oid, '        <input type="text" id="InputSymbol" onkeyup="FunctionSymbol()" placeholder="Search for symbol ..">\n');
fprintf(oid, '        <input type="text" id="InputUnits"  onkeyup="FunctionUnits()"  placeholder="Search for units ..">\n');
fprintf(oid, '        <input type="text" id="InputLabel"  onkeyup="FunctionLabel()"  placeholder="Search for label ..">\n');
fprintf(oid, '        <input type="text" id="InputShort"  onkeyup="FunctionShort()"  placeholder="Short/Medium" title="Type S or M">\n');
fprintf(oid, '      </div>\n\n');

% open table
fprintf(oid, '      <TABLE id="Table">\n');

if n_fVal == 2 && male == 0 % 2 values for scaled functional response, males the same as females
% table head:
fprintf(oid, '        <TR id="head0"> <TH  colspan="2">model %s</TH> <TH colspan="2">f_min</TH> <TH colspan="2">f_max</TH> <TH>%s</TH></TR>\n', model, datePrintNm);
fprintf(oid,['        <TR id="head1"> <TH>symbol</TH> <TH>units</TH> ', repmat('<TH>thin false</TH><TH>thin true</TH> ', 1, 2), '<TH>description</TH></TR>\n\n']);

% table body
for i = 1:length(fldsStat)
fprintf(oid, '        <TR id="%s"> <TD>%s</TD> <TD>%s</TD>\n', fldsStat{i}, fldsStat{i}, txtStat.units.(fldsStat{i}));
fprintf(oid, '          <TD>%g</TD> <TD>%g</TD> <TD>%g</TD> <TD>%g</TD>  <TD>%s</TD>\n', ...
    stat.(fldsStat{i}).f0.thin0.f, stat.(fldsStat{i}).f0.thin1.f, ...
    stat.(fldsStat{i}).f1.thin0.f, stat.(fldsStat{i}).f1.thin1.f, ...
    txtStat.label.(fldsStat{i}));
fprintf(oid, '        </TR>\n');
end 

elseif n_fVal == 3 && male == 0 % 3 values for scaled functional response, males the same as females
% table head:
fprintf(oid,'        <TR id="head0"> <TH  colspan="2">model %s</TH> <TH colspan="2">f_min</TH><TH colspan="2">f</TH> <TH colspan="2">f_max</TH> <TH>%s</TH></TR>\n', model, datePrintNm);
fprintf(oid,['        <TR id="head1"> <TH>symbol</TH> <TH>units</TH> ', repmat('<TH>thin false</TH><TH>thin true</TH>', 1, 3), '<TH>description</TH></TR>\n\n']);

% table body
for i = 1:length(fldsStat)
fprintf(oid, '        <TR id="%s"> <TD>%s</TD> <TD>%s</TD>\n', fldsStat{i}, fldsStat{i}, txtStat.units.(fldsStat{i}));
fprintf(oid, '          <TD>%g</TD> <TD>%g</TD> <TD>%g</TD> <TD>%g</TD>  <TD>%g</TD> <TD>%g</TD>  <TD>%s</TD>\n', ...
    stat.(fldsStat{i}).f0.thin0.f, stat.(fldsStat{i}).f0.thin1.f, ...
    stat.(fldsStat{i}).f.thin0.f,  stat.(fldsStat{i}).f.thin1.f, ...
    stat.(fldsStat{i}).f1.thin0.f, stat.(fldsStat{i}).f1.thin1.f, ...
    txtStat.label.(fldsStat{i}));
fprintf(oid, '        </TR>\n');
end 

elseif n_fVal == 2 && male == 1 % 2 values for scaled functional response, males different from females
% table head:
fprintf(oid, '        <TR id="head0"> <TH  colspan="2">model %s</TH> <TH colspan="4">f_min</TH> <TH colspan="4">f_max</TH> <TH>%s</TH></TR>\n', model, datePrintNm);
fprintf(oid,['        <TR id="head1"> <TH>symbol</TH> <TH>units</TH> ', repmat('<TH colspan="2">thin false</TH><TH colspan="2">thin true</TH> ', 1, 2), '<TH>description</TH></TR>\n']);
fprintf(oid,['        <TR id="head2"> <TH></TH> <TH></TH>  ', repmat('<TH>female</TH><TH>male</TH> ', 1, 4), '<TH></TH></TR>\n\n']);

% table body
for i = 1:length(fldsStat)
fprintf(oid, '        <TR id="%s"> <TD>%s</TD> <TD>%s</TD>\n', fldsStat{i}, fldsStat{i}, txtStat.units.(fldsStat{i}));
fprintf(oid, '          <TD>%g</TD> <TD>%g</TD> <TD>%g</TD> <TD>%g</TD>  <TD>%g</TD> <TD>%g</TD> <TD>%g</TD> <TD>%g</TD>  <TD>%s</TD>\n', ...
    stat.(fldsStat{i}).f0.thin0.f, stat.(fldsStat{i}).f0.thin0.m, stat.(fldsStat{i}).f0.thin1.f, stat.(fldsStat{i}).f0.thin1.m, ...
    stat.(fldsStat{i}).f1.thin0.f, stat.(fldsStat{i}).f1.thin0.m, stat.(fldsStat{i}).f1.thin1.f, stat.(fldsStat{i}).f1.thin1.m, ...
    txtStat.label.(fldsStat{i}));
fprintf(oid, '        </TR>\n');
end 

else %  n_fVal == 3 && male == 1 % 3 values for scaled functional response, males different from females
% table head:
fprintf(oid, '        <TR id="head0"> <TH  colspan="2">model %s</TH> <TH colspan="4">f_min</TH> <TH colspan="4">f</TH> <TH colspan="4">f_max</TH> <TH>%s</TH></TR>\n', model, datePrintNm);
fprintf(oid,['        <TR id="head1"> <TH>symbol</TH> <TH>units</TH> ', repmat('<TH colspan="2">thin false</TH><TH colspan="2">thin true</TH>  ', 1, 3), '<TH>description</TH></TR>\n']);
fprintf(oid,['        <TR id="head2"> <TH></TH> <TH></TH>  ', repmat('<TH>female</TH><TH>male</TH> ', 1, 6), '<TH></TH></TR>\n\n']);

% table body
for i = 1:length(fldsStat)
fprintf(oid, '        <TR id="%s"> <TD>%s</TD> <TD>%s</TD>\n', fldsStat{i}, fldsStat{i}, txtStat.units.(fldsStat{i}));
fprintf(oid,['          ', repmat('<TD>%g</TD> ', 1, 12), '  <TD>%s</TD>\n'], ...
    stat.(fldsStat{i}).f0.thin0.f, stat.(fldsStat{i}).f0.thin0.m, stat.(fldsStat{i}).f0.thin1.f, stat.(fldsStat{i}).f0.thin1.m, ...
    stat.(fldsStat{i}).f.thin0.f,  stat.(fldsStat{i}).f.thin0.m,  stat.(fldsStat{i}).f.thin1.f,  stat.(fldsStat{i}).f.thin1.m, ...
    stat.(fldsStat{i}).f1.thin0.f, stat.(fldsStat{i}).f1.thin0.m, stat.(fldsStat{i}).f1.thin1.f, stat.(fldsStat{i}).f1.thin1.m, ...
    txtStat.label.(fldsStat{i}));
fprintf(oid, '        </TR>\n');
end 

end

% close table
fprintf(oid, '      </TABLE>\n\n');

% save figure, produced by popStatistics_st
saveas (Hfig_surv,[species, '_pop_01.png']);
saveas (Hfig_stab,[species, '_pop_02.png']);
close all

% graphics
fprintf(oid, '      <div class="fig">\n'); % survival probability
fprintf(oid, '        <img src="%s_pop_01.png" width="450px"> \n', species);
fprintf(oid, '        <div id="caption">\n');
fprintf(oid, '          Ln survival probability as function of age, \n');
fprintf(oid, '          with (dashed) and without (solid) thinning at max (red) and min (blue) scaled functional response for females.\n');
fprintf(oid, '        </div>\n');
fprintf(oid, '      </div>\n\n');

fprintf(oid, '      <div class="fig">\n'); % stable age distribution
fprintf(oid, '        <img src="%s_pop_02.png" width="450px"> \n', species);
fprintf(oid, '        <div id="caption">\n');
fprintf(oid, '          Ln survivor function of the stable age distribution as function of age, \n');
fprintf(oid, '          with (dashed) and without (solid) thinning at max (red) and min (blue) scaled functional response for females.\n');
fprintf(oid, '        </div>\n');
fprintf(oid, '      </div>\n\n');

% remarks
fprintf(oid, '      <div>\n');
fprintf(oid, '        <h2>Remarks</h2>\n');
fprintf(oid, '        <ul>\n');
if ~isempty(strfind(gender, 'D'))
  if male
    fprintf(oid, '          <li>Gender-code %s applies. Sex ratio is assumed to be 1:1. Parameters of male and female differ.</li>\n', gender);
  else
    fprintf(oid, '          <li>Gender-code %s applies. Sex ratio is assumed to be 1:1. Parameters of male and female are the same.</li>\n', gender);
  end
else
fprintf(oid, '          <li>Concerns population of females only</li>\n');
end
fprintf(oid, '          <li>Buffer handling rule: release each egg as soon as reproduction buffer allows</li>\n');
fprintf(oid, '          <li>Weights of adults do not include reproduction buffer</li>\n');
fprintf(oid, '        </ul>\n');
fprintf(oid, '      </div>\n');

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
fprintf(oid, '                    td.innerHTML == "t2" ||\n');
fprintf(oid, '                    td.innerHTML == "EWw_bi" ||\n');
fprintf(oid, '                    td.innerHTML == "EJ_X" \n');
fprintf(oid, '                  ) {\n');
fprintf(oid, '                  tr[i].style.display = "";\n');
fprintf(oid, '                } else {\n');
fprintf(oid, '                  tr[i].style.display = "none";\n');
fprintf(oid, '                }\n');
fprintf(oid, '              }\n');
fprintf(oid, '            }\n');
% filter M: medium selection
fprintf(oid, '          } else if (filter == "M") {\n');
fprintf(oid, '            for (i = 0; i < tr.length; i++) {\n');
fprintf(oid, '              td = tr[i].getElementsByTagName("td")[0];\n');
fprintf(oid, '              if (td) {\n');
fprintf(oid, '                if (\n');
fprintf(oid, '                    td.innerHTML == "f" ||\n');
fprintf(oid, '                    td.innerHTML == "r" ||\n');
fprintf(oid, '                    td.innerHTML == "t2" ||\n');
fprintf(oid, '                    td.innerHTML == "S_p" ||\n');
fprintf(oid, '                    td.innerHTML == "theta_jp" ||\n');
fprintf(oid, '                    td.innerHTML == "del_ea" ||\n');
fprintf(oid, '                    td.innerHTML == "ER" ||\n');
fprintf(oid, '                    td.innerHTML == "EWw_bi" ||\n');
fprintf(oid, '                    td.innerHTML == "EJ_X" \n');
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

if AmP
fprintf(oid, '    </div> <!-- end of content -->\n\n');

fprintf(oid, '    <div w3-include-html="../../sys/footer_amp.html"></div>\n');
fprintf(oid, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(oid, '  </div> <!-- end of main wrapper -->\n');
fprintf(oid, '</div> <!-- end of main -->\n');
end

fprintf(oid, '</BODY>\n');
fprintf(oid, '</HTML>\n');

fclose(oid);

if ~AmP
  web(fileName,'-browser') % open html in systems browser: web(fileName)
end


