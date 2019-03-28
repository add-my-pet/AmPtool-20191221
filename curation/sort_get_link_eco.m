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

entries = select; 

%% get_link

body = fileread('get_link.m');
ind = strfind(body,' case '); ind = [ind, strfind(body,'    otherwise')]; n_ind = length(ind) - 1;
head = body(1:ind(1)-1); tail = body(ind(end):end);
for i = 1:n_ind
  case_i = body(ind(i):ind(i+1)); nm_i = strfind(case_i,''''); nm_i = case_i(nm_i(1)+1:nm_i(2)-1);
  txt.(nm_i) = case_i;
end
nm = fieldnames(txt);

diff = setdiff(entries, nm);
if ~isempty(diff)
  fprintf('warning from sort_get_link_eco: present in select, but not in get_link\n');
  diff
  return
end
diff = setdiff(nm, entries);
if ~isempty(diff)
  fprintf('warning from sort_get_link_eco: present in get_link, but not in select\n');
  diff
  return
end

fid = fopen('get_link.m','w+');
fprintf(fid, '%s', head);
for i = 1:n_ind
  fprintf(fid, '%s', txt.(entries{i}));
end
fprintf(fid, '%s', tail);
fclose(fid);

%% get_eco

body = fileread('get_eco.m');
ind = strfind(body,' case '); ind = [ind, strfind(body,'    otherwise')]; n_ind = length(ind) - 1;
head = body(1:ind(1)-1); tail = body(ind(end):end);
for i = 1:n_ind
  case_i = body(ind(i):ind(i+1)); nm_i = strfind(case_i,''''); nm_i = case_i(nm_i(1)+1:nm_i(2)-1);
  txt.(nm_i) = case_i;
end
nm = fieldnames(txt);

diff = setdiff(entries, nm);
if ~isempty(diff)
  fprintf('warning from sort_get_link_eco: present in select, but not in get_eco\n');
  diff
  return
end
diff = setdiff(nm, entries);
if ~isempty(diff)
  fprintf('warning from sort_get_link_eco: present in get_eco, but not in select\n');
  diff
  return
end

fid = fopen('get_eco.m','w+');
fprintf(fid, '%s', head);
for i = 1:n_ind
  fprintf(fid, '%s', txt.(entries{i}));
end
fprintf(fid, '%s', tail);
fclose(fid);

%% return to WD

cd(WD)
