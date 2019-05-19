%% sort_get_link_eco
% sorts cases in functions get_link and get_eco, according to select

%%
function sort_get_link_eco
% created 2019/03/28 by Bas Kooijman

%% Syntax
% <sort_get_link_eco *sort_get_link_eco*>

%% Description
% sorts casea in functions get_link and get_eco, according to select, overwriting the existinf functions

%% Remarks
% checks the equality of cases and entries; no overwrite while failing

WD = pwd; % store current path
path = which('get_link'); ind = strfind(path,'\');
cd(path(1:ind(end)));

entries = select; % species names in sequence that they have to be

sort_entries(entries, 'get_link.m')
sort_entries(entries, 'get_eco.m')

% return to WD
cd(WD)

end 
function sort_entries(entries, fnNm)

body = fileread(fnNm);

% split the text of fnNm in head, tail and structure txt
ind = [strfind(body,' case '), strfind(body,' otherwise')]; n_ind = length(ind) - 1;
head = body(1:ind(1)-1); tail = body(ind(end):end);
for i = 1:n_ind
  case_i = body(ind(i):ind(i+1)-1); 
  nm_i = strfind(case_i,''''); 
  if isempty(nm_i)
    fprintf('Warning from sort_entries: case is not properly specified \n');
    case_i
    return
  end
  nm_i = case_i(nm_i(1)+1:nm_i(2)-1);
  txt.(nm_i) = case_i;
end
nm = fieldnames(txt); % species-names as they occur in fnNm

% check for differences in species names
diff = setdiff(entries, nm);
if ~isempty(diff)
  fprintf(['Warning from sort_get_link_eco: present in select, but not in ', fnNm, '\n']);
  diff
  return
end
diff = setdiff(nm, entries);
if ~isempty(diff)
  fprintf(['Warning from sort_get_link_eco: present in ', fnNm, ', but not in select\n']);
  diff
  return
end

% write file
fid = fopen(fnNm,'w+');
fprintf(fid, '%s', head);
for i = 1:n_ind
  fprintf(fid, '%s', txt.(entries{i}));
end
fprintf(fid, '%s', tail);
fclose(fid);
end